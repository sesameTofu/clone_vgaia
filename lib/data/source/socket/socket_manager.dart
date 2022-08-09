// import 'dart:async';
import 'dart:async';
import 'dart:convert';
// import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_mobile/config/config.dart';
import 'package:flutter_mobile/controller/session_manager.dart';
import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/data/source/socket/soket_data_model.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pbgrpc.dart';
import 'package:flutter_mobile/global/app_common.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_log.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/debounce.dart';
import 'package:web_socket_channel/io.dart';

class SocketManager {
  factory SocketManager() {
    return _singleton;
  }

  SocketManager._internal();

  static final SocketManager _singleton = SocketManager._internal();
  final Debounce _debounce = Debounce(Duration(milliseconds: 400));

  final Map<String, RxNotify<Map<Field, dynamic>>> _tickerObservers =
      <String, RxNotify<Map<Field, dynamic>>>{};

  Map<String, RxNotify<Map<Field, dynamic>>> get tickerObservers =>
      _tickerObservers;

  final Map<String, RxNotify<Map<Field, dynamic>>> _marketObservers =
      <String, RxNotify<Map<Field, dynamic>>>{};

  Map<String, RxNotify<Map<Field, dynamic>>> get marketObservers =>
      _marketObservers;

  // final RxNotify<AccountsOrdersModel> _orderSocketResult =
  //     AccountsOrdersModel().objective;
  // RxNotify<AccountsOrdersModel> get orderSocketResult => _orderSocketResult;
  final RxNotify<SystemState_StatusCode> _stateSeverMarket =
      RxNotify<SystemState_StatusCode>(SystemState_StatusCode.NONE);
  RxNotify<SystemState_StatusCode> get stateSeverMarket => _stateSeverMarket;
  AppLog get log => AppLog.log;

  IOWebSocketChannel? _webSocketChannel;
  StreamSubscription<dynamic>? _streamSubscription;

  void connect() {
    // if (SessionManager().accessToken.isNotEmpty) {
    _webSocketChannel =
        IOWebSocketChannel.connect(Uri.parse(AppConfig.config.webSockerUrl));

    /// Emit token
    if (SessionManager().accessToken.isNotEmpty) {
      // final Map<String, dynamic> authenticate = <String, dynamic>{
      //   'eventName': 'authenticate',
      //   'args': SessionManager().accessToken,
      //   'channelTopic': 'order'
      // };
      // _webSocketChannel?.sink.add('4${jsonEncode(authenticate)}');
      // log.info(
      //     '[IOWebSocketChannel]: Emit token success ${'4${jsonEncode(authenticate)}'}');
    }
    _webSocketChannel?.sink
        .add('4{"eventName":"listenState","channelTopic":"systemState"}');
    _streamSubscription = _webSocketChannel?.stream.listen((dynamic event) {
      if (event is Uint8List) {
        _handlerDataMarket(event);
      } else {
        switch (AppCommon().mapStatus[event[0]]) {
          case StatusWebSocket.CONNECTED:
            log.info('[IOWebSocketChannel]: CONNECTED =>> $event');

            break;
          case StatusWebSocket.DISCONNECTED:
            break;
          case StatusWebSocket.INIT:
            break;
          case StatusWebSocket.ERROR:
            break;
          case StatusWebSocket.PING_PONG:
            log.info('[IOWebSocketChannel]: Ping Pong =>> $event');
            _webSocketChannel?.sink.add('3');
            break;
          case StatusWebSocket.EVENT:
            log.info('[IOWebSocketChannel]: Socket data $event');
            _handlerDataOrder(event as String? ?? '');
            break;
          case StatusWebSocket.EMIT_TOKEN_SUCCESS:
            break;
          case StatusWebSocket.RE_CONNECT:
            break;
          default:
            break;
        }
      }
    });
    _streamSubscription?.onError((_) {
      log.info('[IOWebSocketChannel]: Socket onError $_');
      _debounce(() {
        reInitSocket();
      });
    });
    // }
  }

  Future<void> disconnect() async {
    _streamSubscription?.cancel();
    _webSocketChannel?.sink.add('1');
    _webSocketChannel?.sink.close().then((_) {
      _webSocketChannel = null;
      log.info('[IOWebSocketChannel]: disconnect ');
    });
  }

  void reInitSocket() {
    disconnect();
    log.info('[IOWebSocketChannel]: reInitSocket ');

    connect();

    if (tickerObservers.isNotEmpty) {
      tickerObservers.forEach((String key, _) {
        _webSocketChannel?.sink.add(
            '4{"eventName":"register","channelTopic":"ticker","args":{"channel":"$key"}}');
      });
    }
    if (_marketObservers.isNotEmpty) {
      marketObservers.forEach((String key, _) {
        _webSocketChannel?.sink.add(
            '4{"eventName":"register","channelTopic":"index","args":{"channel":"$key"}}');
      });
    }
  }

  void _handlerDataOrder(String message) {
    try {
      message = message
          .substring(1, message.length)
          .replaceAll(String.fromCharCode(0x01), ':');
      final Map<String, dynamic> data = _convertList(message);

      assert(data.values.length >= 2);
      // if (data.containsKey('type') && data.containsKey('data')) {
      //   if (data['type'] == 'Order') {
      //     _orderSocketResult.value =
      //         AccountsOrdersModel.fromJsonSocket(data['data']);
      //   }
      // }
    } catch (exception) {
      debugPrint(exception.toString());
      // FirebaseCrashlytics.instance.log(exception.toString());
    }
  }

  Map<String, dynamic> _convertList(String message) {
    Map<String, dynamic> data = <String, dynamic>{};
    try {
      data = jsonDecode(message
          .replaceAll(r'\', '')
          .replaceAll(r'"{', '{')
          .replaceAll(r'"}"', '"}'));
      return data;
    } catch (er) {
      return data;
    }
  }

  void _handlerDataMarket(Uint8List event) {
    final Map<Field, dynamic> map = SocketDataModel().converData(event);
    if (map[Field.SEC_CD] != null) {
      _tickerObservers[map[Field.SEC_CD]]?.value = map;
    }
    if (map[Field.INDEX] != null && map[Field.INDEX] != Index.NONE) {
      _marketObservers[(map[Field.INDEX] as Index).marketCd().toString()]
          ?.value = map;
    }
    if (map[Field.STATE_SEVER] != null) {
      _stateSeverMarket.value = map[Field.STATE_SEVER];
    }
  }

  RxNotify<Map<Field, dynamic>> addObserverStockChanged(String secCd) {
    if (_tickerObservers.containsKey(secCd) &&
        _tickerObservers[secCd] != null) {
      return _tickerObservers[secCd]!;
    }
    _tickerObservers[secCd] = <Field, dynamic>{}.objective;
    log.info('subscribeTopic: $secCd');

    _webSocketChannel?.sink.add(
        '4{"eventName":"register","channelTopic":"ticker","args":{"channel":"$secCd"}}');
    return _tickerObservers[secCd]!;
  }

  void removeObserverForStockChanged(String secCd) {
    if (secCd.isEmpty) {
      return;
    }

    _tickerObservers.remove(secCd);
    log.info('UnsubscribeTopic: $secCd');
    _webSocketChannel?.sink.add(
        '4{"eventName":"unregister","channelTopic":"ticker","args":{"channel":"$secCd"}}');
  }

  void removeAllObserverForStockChanged() {
    _tickerObservers.clear();
  }

  RxNotify<Map<Field, dynamic>> addObserverMarketChanged(String marketCd) {
    if (_marketObservers.containsKey(marketCd) &&
        _marketObservers[marketCd] != null) {
      return _marketObservers[marketCd]!;
    }
    _marketObservers[marketCd] = <Field, dynamic>{}.objective;
    log.info('subscribeTopic: $marketCd');

    _webSocketChannel?.sink.add(
        '4{"eventName":"register","channelTopic":"index","args":{"channel":"$marketCd"}}');
    return _marketObservers[marketCd]!;
  }

  void removeObserverForMarketChanged(String secCd) {
    if (secCd.isEmpty) {
      return;
    }

    _marketObservers.remove(secCd);
    log.info('UnsubscribeTopic: $secCd');
    _webSocketChannel?.sink.add(
        '4{"eventName":"unregister","channelTopic":"index","args":{"channel":"$secCd"}}');
  }

  void removeAllObserverForMarketChanged() {
    _marketObservers.clear();
  }
}
