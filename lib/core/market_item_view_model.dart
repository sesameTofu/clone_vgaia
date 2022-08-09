import 'dart:async';

import 'package:flutter_mobile/core/client/market_client.dart';
import 'package:flutter_mobile/core/client/notify_ui.dart';
import 'package:flutter_mobile/core/interface/market_update_data.dart';
import 'package:flutter_mobile/core/interface/notify_interface.dart';
import 'package:flutter_mobile/core/model/market_model.dart';
import 'package:flutter_mobile/core/model/match_data_index_model.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/extensions/enum.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:rxdart/subjects.dart';

class MarketItemViewModel extends NotifiInterface
    with MarketUpdateDataInterface {
  MarketItemViewModel({required this.marketIndex}) {
    _notify = NotifyUI(this);
    // tam thoi comment
    _apiClient = MarketClient(this, _notify);
    marketSubription.stream.listen((Map<Field, dynamic> event) {
      if (event.containsKey(Field.MARKET_STATE)) {
        _marketStatusSessionSubject.add(event[Field.MARKET_STATE]);
      }
    });
  }
  MarketModel marketModel = MarketModel();
  final Index marketIndex;
  late NotifyUI _notify;
  late MarketClient _apiClient;
  StreamController<Map<Field, dynamic>> get marketSubription {
    return _notify.notifyManager;
  }

  final BehaviorSubject<MarketStatusSession> _marketStatusSessionSubject =
      BehaviorSubject<MarketStatusSession>.seeded(MarketStatusSession.NONE);

  Stream<MarketStatusSession> get marketStatusSessionStream =>
      _marketStatusSessionSubject.stream;

  MarketStatusSession get marketStatusSession =>
      _marketStatusSessionSubject.value;

  // bool checkSessionPlaceOrder({required String quickOrder}) {
  //   return (marketSession.session?.quickOrderList(index: marketSession.index) ??
  //           <String>[])
  //       .contains(quickOrder);
  // }
  //   MatchDataModel? getMatchData({bool isRefeshData = false}) {
  //   _apiClient.getMatchData('marketModel', _matchDataModel, isRefeshData);
  //   return _matchDataModel;
  // }
  MarketModel getMarketInfomation({bool isRefeshData = false}) {
    _apiClient.getMarketInfomation(
        marketIndex.marketCd(), marketModel, isRefeshData);
    return marketModel;
  }

  // bool isDifferent({required Index index}) {
  //   return marketSession.index == index;
  // }

  @override
  void haveSubcrible() {
    /*
      1. connect realtime socket
    */
    _apiClient.subcribleRealTimeData(marketIndex.marketCd().toString());
  }

  @override
  void noSubcrible() {
    _apiClient.unSubcribleRealTimeData('');

    /* disconnect realtime socket*/
  }

  @override
  void updateSocketData(Map<Field, dynamic> value) {
    if (value.containsKey(Field.MARKET_MARKET_INDEX)) {
      if (isNullOrEmpty(marketModel.marketMatchData)) {
        marketModel.marketMatchData = <MatchDataIndexModel>[
          MatchDataIndexModel(value[Field.MARKET_UPDATE_TIME] ?? DateTime.now(),
              value[Field.MARKET_MARKET_INDEX])
        ];
      } else {
        if (value[Field.MARKET_UPDATE_TIME].minute !=
            marketModel
                .marketMatchData?[marketModel.marketMatchData!.length - 1]
                .time
                .minute) {
          (marketModel.marketMatchData ?? <MatchDataIndexModel>[]).add(
              MatchDataIndexModel(value[Field.MARKET_UPDATE_TIME],
                  value[Field.MARKET_MARKET_INDEX]));
        }
      }
    }

    value.addEntries(<Field, dynamic>{
      Field.MARKET_MATH_DATA: marketModel.marketMatchData
    }.entries);
    _notify.sendata(value);
  }

  @override
  void updateStockInfo(Map<Field, dynamic> value) {
    if (value.containsKey(Field.MARKET_STATE)) {
      _marketStatusSessionSubject.add(value[Field.MARKET_STATE]);
    }

    marketModel = marketModel.copyWith(MarketModel.fromFiled(value));
    _notify.sendata(value);
  }
}
