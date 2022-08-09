import 'dart:async';
import 'package:flutter_mobile/base/base_controller.dart';
import 'package:flutter_mobile/core/market_item_view_model.dart';
import 'package:flutter_mobile/core/model/market_model.dart';
import 'package:flutter_mobile/core/model/match_data_index_model.dart';
import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/core_ui/base_stock_item.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_theme.dart';
import 'package:rxdart/rxdart.dart';

class BaseMarketItem {
  final Map<Field, Timer?> _timers = <Field, Timer?>{};
  MarketItemViewModel? marketViewModel;
  final RxNotify<MarketModel?> marketModel = RxNotify<MarketModel?>(null);
  set setMarketItemViewModel(MarketItemViewModel? value) {
    marketViewModel = value;

    intBindMarket();
  }

  StreamSubscription<Map<Field, dynamic>>? streamSubscription;

  void intBindMarket({bool isRefeshData = false}) {
    _updateMarketCallApi(
        marketViewModel?.getMarketInfomation(isRefeshData: isRefeshData));
    streamSubscription = marketViewModel?.marketSubription.stream
        .listen((Map<Field, dynamic> event) {
      _updateMarketSocket(event);
    });
  }

  void _updateMarketSocket(Map<Field, dynamic> event) {
    if (event.containsKey(Field.STOCK_WITH_API_DETAIL)) {
      marketModel.value = marketViewModel?.getMarketInfomation();
    }

    if (event.containsKey(Field.STOCK_WITH_API_DETAIL)) {
      marketModel.value = marketViewModel?.marketModel;
    }

    // ignore: avoid_function_literals_in_foreach_calls
    event.entries.forEach((MapEntry<Field, dynamic> mapDataNew) {
      for (final StockChange<dynamic> valueStockChane
          in listValueMarketChange) {
        if (mapDataNew.key == valueStockChane.filed) {
          if (!event.containsKey(Field.STOCK_WITH_API_DETAIL) &&
              _notifyChange(mapDataNew.value, valueStockChane.value.value)) {
            _updateChangedProperty(valueStockChane.filed,
                valueStockChane.value.value, mapDataNew.value);
          }
          if (event[valueStockChane.filed] != null) {
            valueStockChane.value.value = event[valueStockChane.filed];
          }

          break;
        }
      }
    });
  }

  bool _notifyChange(dynamic a, dynamic b) {
    if ((a is! num?) || (b is! num?)) {
      return false;
    }
    if (a == null || a == 0 || a == b) {
      return false;
    }

    return true;
  }

  void _updateMarketCallApi(MarketModel? marketInfomation) {
    _statusSubject.value = marketInfomation?.state ?? MarketStatusSession.NONE;
    _indexSubject.value = marketInfomation?.index ?? Index.NONE;
    _totalQttySubject.value = marketInfomation?.totalQty ?? 0;
    _totalAmtSubject.value = marketInfomation?.totalAmt ?? 0;
    _totalQttySubject.value = marketInfomation?.totalTrade ?? 0;
    _marketIndexSubject.value = marketInfomation?.marketIndex ?? 0;
    _changeIndexSubject.value = marketInfomation?.changeIndex ?? 0;
    _changeIndexPercentSubject.value =
        marketInfomation?.changeIndexPercent ?? 0;
    _colorCodeSubject.value = marketInfomation?.colorCode ?? 0;
    _chartsSubject.value =
        marketInfomation?.marketMatchData ?? <MatchDataIndexModel>[];
    // _changePointSubject.value = marketInfomation.chang
  }

  final BehaviorSubject<MarketStatusSession> _statusSubject =
      BehaviorSubject<MarketStatusSession>.seeded(MarketStatusSession.NONE);
  Stream<MarketStatusSession> get statusStream => _statusSubject.stream;

  final BehaviorSubject<Index> _indexSubject =
      BehaviorSubject<Index>.seeded(Index.NONE);

  num get totalQtty => _totalQttySubject.value;
  num get totalAmt => _totalAmtSubject.value;
  num get marketIndex => _marketIndexSubject.value;
  num get changeIndex => _changeIndexSubject.value;
  num get changeIndexPercent => _changeIndexPercentSubject.value;
  num get colorCode => _colorCodeSubject.value;

  List<MatchDataIndexModel> get chartList => _chartsSubject.value;

  /// Match index
  final BehaviorSubject<List<MatchDataIndexModel>> _chartsSubject =
      BehaviorSubject<List<MatchDataIndexModel>>.seeded(
          <MatchDataIndexModel>[]);

  Stream<List<MatchDataIndexModel>> get chartsStream => _chartsSubject.stream;

  /// color code
  final BehaviorSubject<num> _colorCodeSubject = BehaviorSubject<num>.seeded(0);
  Stream<num> get colorCodeStream => _colorCodeSubject.stream;

  /// market index
  final BehaviorSubject<num> _marketIndexSubject =
      BehaviorSubject<num>.seeded(0);
  Stream<num> get marketIndexStream => _marketIndexSubject.stream;

  /// Change Index
  final BehaviorSubject<num> _changeIndexSubject =
      BehaviorSubject<num>.seeded(0);
  Stream<num> get changeIndexStream => _changeIndexSubject.stream;

  /// Change Index Percent
  final BehaviorSubject<num> _changeIndexPercentSubject =
      BehaviorSubject<num>.seeded(0);
  Stream<num> get changeIndexPercentStream => _changeIndexPercentSubject.stream;

  /// Total Qty
  final BehaviorSubject<num> _totalQttySubject = BehaviorSubject<num>.seeded(0);
  Stream<num> get totalQttyStream => _totalQttySubject.stream;

  /// Total Amt
  final BehaviorSubject<num> _totalAmtSubject = BehaviorSubject<num>.seeded(0);
  Stream<num> get totalAmtStream => _totalAmtSubject.stream;

  Stream<Index> get indexStream => _indexSubject.stream;

  MarketStatusSession get status => _statusSubject.value;

  Index get index => _indexSubject.value;
  final Map<Field, BehaviorSubject<StatusFiled>> mapSubjectChangeColor =
      <Field, BehaviorSubject<StatusFiled>>{
    Field.MARKET_MARKET_INDEX:
        BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.MARKET_CHANGE_INDEX:
        BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.MARKET_CHANGE_INDEX_PERCENT:
        BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.MARKET_TOTAL_QTTY:
        BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.MARKET_TOTAL_AMT:
        BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
  };
  late List<StockChange<dynamic>> listValueMarketChange =
      <StockChange<dynamic>>[
    StockChange<MarketStatusSession>(
        value: _statusSubject, filed: Field.MARKET_STATE),
    StockChange<Index>(value: _indexSubject, filed: Field.INDEX),
    StockChange<num>(value: _totalQttySubject, filed: Field.MARKET_TOTAL_QTTY),
    StockChange<num>(value: _totalAmtSubject, filed: Field.MARKET_TOTAL_AMT),
    StockChange<num>(
        value: _marketIndexSubject, filed: Field.MARKET_MARKET_INDEX),
    StockChange<num>(
        value: _changeIndexSubject, filed: Field.MARKET_CHANGE_INDEX),
    StockChange<num>(
        value: _changeIndexPercentSubject,
        filed: Field.MARKET_CHANGE_INDEX_PERCENT),
    StockChange<num>(value: _colorCodeSubject, filed: Field.COLOR_CODE),
    StockChange<List<MatchDataIndexModel>>(
        value: _chartsSubject, filed: Field.MARKET_MATH_DATA),
  ];

  Color getColorWithCode() {
    switch (colorCode) {
      case 2:
        return baseColor.green50;
      case 3:
        return baseColor.red50;
      case 0:
      default:
        return baseColor.yellow50;
    }
  }

  void changePrice(num price) {
    _updateChangedProperty(Field.MARKET_MARKET_INDEX, marketIndex, price);
    _marketIndexSubject.add(price + marketIndex);
  }

  Future<void> _updateChangedProperty(
      Field property, num? oldVal, num? newVal) async {
    if (oldVal == null || newVal == null) {
      return;
    }

    final StatusFiled changedProperties =
        newVal > oldVal ? StatusFiled.UP : StatusFiled.DOWN;

    if (mapSubjectChangeColor.containsKey(property)) {
      mapSubjectChangeColor[property]?.value = changedProperties;
    }

    _invalidateAndRestartTimer(property);
  }

  Future<void> _invalidateAndRestartTimer(Field property) async {
    Timer? timer = _timers[property];

    if (timer != null) {
      timer.cancel();
    }

    timer = Timer(Duration(milliseconds: 500), () {
      mapSubjectChangeColor[property]?.value = StatusFiled.NONE;
    });

    _timers[property] = timer;
  }

  void clearDataMarket() {
    _clearData();
    streamSubscription?.cancel();
  }

  void _clearData() {
    _statusSubject.value = MarketStatusSession.NONE;
    _indexSubject.value = Index.NONE;
    _totalQttySubject.value = 0;
    _totalAmtSubject.value = 0;
    _marketIndexSubject.value = 0;
    _changeIndexSubject.value = 0;
    _changeIndexPercentSubject.value = 0;
  }
}
