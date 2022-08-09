import 'dart:async';

import 'package:flutter_mobile/core/model/match_model.dart';
import 'package:flutter_mobile/core/model/match_price_model.dart';
import 'package:flutter_mobile/core/model/match_volume.dart';
import 'package:flutter_mobile/core/model/stock_info_model.dart';
import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/global/app_const.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_theme.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/localization_service.dart';
import 'package:rxdart/rxdart.dart';

class BaseStockItem {
  final Map<Field, Timer?> _timers = <Field, Timer?>{};
  StockItemViewModel? itemViewModel;
  final RxNotify<StockInfoModel?> stockInfor = RxNotify<StockInfoModel?>(null);
  set setStockItemViewModel(StockItemViewModel value) => itemViewModel = value;

  StreamSubscription<Map<Field, dynamic>>? streamSubscription;

  void intBindData(
      {bool isRefeshData = false,
      bool getChartData = false,
      bool getChartPrice = false,
      bool canGetFullInfor = true,
      bool isGetStockPrice = false}) {
    _secCdSubject.value = itemViewModel?.stockItem.secID ?? '';
    _subSecCdVISubject.value = itemViewModel?.stockItem.sName ?? '';
    _subSecCdENSubject.value = itemViewModel?.stockItem.sName ?? '';
    _updateDataCallApi(canGetFullInfor
        ? itemViewModel?.getStockInfomation(
            isRefeshData: isRefeshData, isGetStockPrice: isGetStockPrice)
        : itemViewModel?.stockInfor);

    if (getChartData) {
      _updateChartData(
          itemViewModel?.getMatchData(isRefeshData: isRefeshData) ??
              <MatchModel>[]);
      _updateTimeSale(itemViewModel?.getTimeSale(isRefeshData: isRefeshData) ??
          <MatchVolume>[]);
    }
    if (getChartPrice) {
      _updateChartPriceData(
          itemViewModel?.getMatchPriceData(isRefeshData: isRefeshData));
    }
    if (streamSubscription != null) {
      streamSubscription?.cancel();
    }
    streamSubscription = itemViewModel?.stockSubription.stream
        .listen((Map<Field, dynamic> event) {
      _updateDataSocket(event, canGetFullInfor);
    });

    listerBuySellQtty();
    listerListBuySellQtty();
  }

  void clearData() {
    _clearData();
    streamSubscription?.cancel();
  }

  void _updateDataSocket(Map<Field, dynamic> event, bool canGetFullInfor) {
    if (canGetFullInfor && event[Field.STOCK_WITH_API_NOT_DETAIL] == true) {
      return;
    }
    if (event.containsKey(Field.STOCK_WITH_API_DETAIL)) {
      stockInfor.value = itemViewModel?.stockInfor;
    }

    for (final MapEntry<Field, dynamic> mapDataNew in event.entries) {
      for (final StockChange<dynamic> valueStockChane
          in listValueStockChangeFull) {
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
    }
  }

  void changePrice(num price) {
    _updateChangedProperty(Field.MATCH_PRICE, matchPrice, price);
    _matchPriceSubject.add(price + matchPrice);
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

  void _updateDataCallApi(StockInfoModel? stockInfo) {
    if (stockInfo != null) {
      stockInfor.value = stockInfo;
      _basicPriceSubject.value = stockInfo.basicPrice ?? 0;
      _ceilingPriceSubject.value = stockInfo.ceilingPrice ?? 0;
      _floorPriceSubject.value = stockInfo.floorPrice ?? 0;
      _matchPriceSubject.value = stockInfo.matchPrice ?? 0;
      _totalTradeQttySubject.value = stockInfo.totalQty ?? 0;
      _changePercentSubject.value = stockInfo.changePercent ?? 0;
      _changePercentNotDaySubject.value = stockInfo.changePercentNotDay ?? 0;
      _changeHighLowSubject.value = stockInfo.changeHighLow ?? 0;
      _changePointSubject.value = stockInfo.changePoint ?? 0;
      _bQtty1Subject.value = stockInfo.best1BidQty ?? 0;
      _bPrice1Subject.value = stockInfo.best1BidPrice ?? 0;
      _bPriceString1Subject.value = stockInfo.best1BidPriceStr ?? '';
      _bQtty2Subject.value = stockInfo.best2BidQty ?? 0;
      _bPrice2Subject.value = stockInfo.best2BidPrice ?? 0;
      _bQtty3Subject.value = stockInfo.best3BidQty ?? 0;
      _bPrice3Subject.value = stockInfo.best3BidPrice ?? 0;
      _sQtty1Subject.value = stockInfo.best1OfferQty ?? 0;
      _sPriceString1Subject.value = stockInfo.best1OfferPriceStr ?? '';

      _sPrice1Subject.value = stockInfo.best1OfferPrice ?? 0;
      _sQtty2Subject.value = stockInfo.best2OfferQty ?? 0;
      _sPrice2Subject.value = stockInfo.best2OfferPrice ?? 0;
      _sQtty3Subject.value = stockInfo.best3OfferQty ?? 0;
      _sPrice3Subject.value = stockInfo.best3OfferPrice ?? 0;

      _openPriceSubject.value = stockInfo.openPrice ?? 0;
      _closePriceSubject.value = stockInfo.closePrice ?? 0;
      _avgPriceSubject.value = stockInfo.avgPrice ?? 0;
      _lowestPriceSubject.value = stockInfo.lowestPrice ?? 0;
      _highestPriceSubject.value = stockInfo.highestPrice ?? 0;
      _buyForeignSubject.value = stockInfo.buyForeignQty ?? 0;
      _sellForeignSubject.value = stockInfo.sellForeignQty ?? 0;
      _netForeignQtySubject.value = stockInfo.netForeignQty ?? 0;
      _netForeignAmtSubject.value = stockInfo.netForeignAmt ?? 0;
      _sellForeignAmtSubject.value = stockInfo.sellForeignAmt ?? 0;
      _buyForeignAmtSubject.value = stockInfo.buyForeignAmt ?? 0;
      _currentRoomSubject.value = stockInfo.currentRoom ?? 0;

      _bookValueSubject.value = stockInfo.bookValue ?? 0;
      _turnOverRateSubject.value = stockInfo.turnoverRate ?? 0;
      _rangeSubject.value = stockInfo.range ?? 0;
      _listedQtySubject.value = stockInfo.listedQty ?? 0;
      _espubject.value = stockInfo.esp ?? 0;
      _peSubject.value = stockInfo.pe ?? 0;
      _psSubject.value = stockInfo.ps ?? 0;
      _pbSubject.value = stockInfo.pb ?? 0;
      _w52HightSubject.value = stockInfo.w52Hight ?? 0;
      _w52LowSubject.value = stockInfo.w52Low ?? 0;
      _colorCodeSubject.value = stockInfo.colorCode ?? 0;
      _marketStatusSessionWithIndex.value =
          stockInfo.marketStatusSessionWithIndex;
      _basePriceSubject.value = stockInfo.basePrice ?? 0;
      _baseSecCdDataSubject.value = stockInfo.baseSecCdData ?? '-';
      _issuerDataSubject.value = stockInfo.issuerData ?? '-';
      _lastTradeDateSubject.value = stockInfo.lastTradeDate ?? 0;
      _execPriceSubject.value = stockInfo.execPrice ?? 0;
      _totalAmtSubject.value = stockInfo.totalAmt ?? 0;
      _execRatioSubject.value = stockInfo.execRatio ?? '-';
    }
    // data từ Api
  }

  void _clearData() {
    itemViewModel = null;
    stockInfor.value = null;
    _secCdSubject.value = '';
    _basicPriceSubject.value = 0;
    _ceilingPriceSubject.value = 0;
    _floorPriceSubject.value = 0;
    _matchPriceSubject.value = 0;
    _totalTradeQttySubject.value = 0;
    _changePercentSubject.value = 0;
    _changePercentNotDaySubject.value = 0;
    _changeHighLowSubject.value = 0;
    _changePointSubject.value = 0;
    _bQtty1Subject.value = 0;
    _bPrice1Subject.value = 0;
    _bPriceString1Subject.value = '';
    _sPriceString1Subject.value = '';
    _bQtty2Subject.value = 0;
    _bPrice2Subject.value = 0;
    _bQtty3Subject.value = 0;
    _bPrice3Subject.value = 0;
    _sQtty1Subject.value = 0;
    _sPrice1Subject.value = 0;
    _sQtty2Subject.value = 0;
    _sPrice2Subject.value = 0;
    _sQtty3Subject.value = 0;
    _sPrice3Subject.value = 0;
    _subSecCdVISubject.value = '';
    _subSecCdENSubject.value = '';

    _openPriceSubject.value = 0;
    _avgPriceSubject.value = 0;
    _lowestPriceSubject.value = 0;
    _highestPriceSubject.value = 0;
    _buyForeignSubject.value = 0;
    _sellForeignSubject.value = 0;
    _netForeignQtySubject.value = 0;
    _netForeignAmtSubject.value = 0;
    _sellForeignAmtSubject.value = 0;
    _buyForeignAmtSubject.value = 0;
    _currentRoomSubject.value = 0;

    _bookValueSubject.value = 0;
    _turnOverRateSubject.value = 0;
    _rangeSubject.value = 0;
    _listedQtySubject.value = 0;
    _espubject.value = 0;
    _peSubject.value = 0;
    _psSubject.value = 0;
    _pbSubject.value = 0;
    _w52HightSubject.value = 0;
    _w52LowSubject.value = 0;
    _colorCodeSubject.value = 0;
    _basePriceSubject.value = 0;
    _baseSecCdDataSubject.value = '-';
    _issuerDataSubject.value = '-';
    _lastTradeDateSubject.value = 0;
    _execPriceSubject.value = 0;
    _totalAmtSubject.value = 0;
    _execRatioSubject.value = '-';

    _marketStatusSessionWithIndex.value = null;

    // data từ Api
  }

  void _updateChartData(List<MatchModel> matchData) {
    _matchDataSubject.value = matchData;
  }

  void _updateTimeSale(List<MatchVolume> matchData) {
    _timeSaleSubject.value = matchData;
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

  /// Sec Cd
  final BehaviorSubject<String> _secCdSubject =
      BehaviorSubject<String>.seeded('');

  Stream<String> get secCdStream => _secCdSubject.stream;

  final BehaviorSubject<String> _subSecCdVISubject =
      BehaviorSubject<String>.seeded('');

  Stream<String> get subSecCdVIStream => _subSecCdVISubject.stream;

  final BehaviorSubject<String> _subSecCdENSubject =
      BehaviorSubject<String>.seeded('');

  Stream<String> get subSecCdENStream => _subSecCdENSubject.stream;

  /// Basic Price
  final BehaviorSubject<num> _basicPriceSubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get basicPriceStream => _basicPriceSubject.stream;

  /// Ceiling Price
  final BehaviorSubject<num> _ceilingPriceSubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get ceilingPriceStream => _ceilingPriceSubject.stream;

  /// Floor Price
  final BehaviorSubject<num> _floorPriceSubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get floorPriceSubjectStream => _floorPriceSubject.stream;

  /// Last Price
  final BehaviorSubject<num> _matchPriceSubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get matchPriceStream => _matchPriceSubject.stream;

  Sink<num> get matchPriceSink => _matchPriceSubject.sink;

  /// Change Point
  final BehaviorSubject<num> _changePointSubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get changePointStream => _changePointSubject.stream;

  /// Change Percent
  final BehaviorSubject<num> _changePercentSubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get changePercentStream => _changePercentSubject.stream;

  // Change Percent Not Day
  final BehaviorSubject<num> _changePercentNotDaySubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get changePercentNotDayStream =>
      _changePercentNotDaySubject.stream;

  // Change High low
  final BehaviorSubject<num> _changeHighLowSubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get changeHighLowStream => _changeHighLowSubject.stream;

  /// Last Qty
  final BehaviorSubject<num> _lastQtySubject = BehaviorSubject<num>.seeded(0);

  Stream<num> get lastQtyStream => _lastQtySubject.stream;

  /// Total Qty
  final BehaviorSubject<num> _totalTradeQttySubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get totalTradeQttyStream => _totalTradeQttySubject.stream;

  /// Highest Price
  final BehaviorSubject<num> _highestPriceSubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get highestPriceStream => _highestPriceSubject.stream;

  /// Lowest Price
  final BehaviorSubject<num> _lowestPriceSubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get lowestPriceStream => _lowestPriceSubject.stream;

  /// Avg Price
  final BehaviorSubject<num> _avgPriceSubject = BehaviorSubject<num>.seeded(0);

  Stream<num> get avgPriceStream => _avgPriceSubject.stream;

  /// Total Amt
  final BehaviorSubject<num> _totalAmtSubject = BehaviorSubject<num>.seeded(0);

  Stream<num> get totalAmtStream => _totalAmtSubject.stream;

  /// Best1 Bid Price
  final BehaviorSubject<num> _bPrice1Subject = BehaviorSubject<num>.seeded(0);

  Stream<num> get bPrice1Stream => _bPrice1Subject.stream;

  /// Best1 Bid Qty
  final BehaviorSubject<num> _bQtty1Subject = BehaviorSubject<num>.seeded(0);

  Stream<num> get bQtty1Stream => _bQtty1Subject.stream;

  /// Best2 Bid Price
  final BehaviorSubject<num> _bPrice2Subject = BehaviorSubject<num>.seeded(0);

  Stream<num> get bPrice2Stream => _bPrice2Subject.stream;

  /// Best2 Bid Qty
  final BehaviorSubject<num> _bQtty2Subject = BehaviorSubject<num>.seeded(0);

  Stream<num> get bQtty2Stream => _bQtty2Subject.stream;

  /// Best3 Bid Price
  final BehaviorSubject<num> _bPrice3Subject = BehaviorSubject<num>.seeded(0);

  Stream<num> get bPrice3Stream => _bPrice3Subject.stream;

  /// Best3 Bid Qty
  final BehaviorSubject<num> _bQtty3Subject = BehaviorSubject<num>.seeded(0);

  Stream<num> get bQtty3Stream => _bQtty3Subject.stream;

  /// Best1 Ask Price
  final BehaviorSubject<num> _sPrice1Subject = BehaviorSubject<num>.seeded(0);

  Stream<num> get sPrice1Stream => _sPrice1Subject.stream;

  /// Best1 Ask Qty
  final BehaviorSubject<num> _sQtty1Subject = BehaviorSubject<num>.seeded(0);

  Stream<num> get sQtty1Stream => _sQtty1Subject.stream;

  /// Best2 Ask Price
  final BehaviorSubject<num> _sPrice2Subject = BehaviorSubject<num>.seeded(0);

  Stream<num> get sPrice2Stream => _sPrice2Subject.stream;

  /// Best2 Ask Qty
  final BehaviorSubject<num> _sQtty2Subject = BehaviorSubject<num>.seeded(0);

  Stream<num> get sQtty2Stream => _sQtty2Subject.stream;

  /// Best3 Ask Price
  final BehaviorSubject<num> _sPrice3Subject = BehaviorSubject<num>.seeded(0);

  Stream<num> get sPrice3Stream => _sPrice3Subject.stream;

  /// Best3 Ask Qty
  final BehaviorSubject<num> _sQtty3Subject = BehaviorSubject<num>.seeded(0);

  Stream<num> get sQtty3Stream => _sQtty3Subject.stream;

//
  final BehaviorSubject<num> _buyForeignSubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get buyForeignStream => _buyForeignSubject.stream;

//
  final BehaviorSubject<num> _sellForeignSubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get sellForeignStream => _sellForeignSubject.stream;
//
  final BehaviorSubject<num> _netForeignQtySubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get netForeignQtyStream => _netForeignQtySubject.stream;
//
  final BehaviorSubject<num> _netForeignAmtSubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get netForeignAmtStream => _netForeignAmtSubject.stream;
//
  final BehaviorSubject<num> _sellForeignAmtSubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get sellForeignAmtStream => _sellForeignAmtSubject.stream;
//
  final BehaviorSubject<num> _buyForeignAmtSubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get buyForeignAmtStream => _buyForeignAmtSubject.stream;

//
  final BehaviorSubject<num> _currentRoomSubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get currentRoomStream => _currentRoomSubject.stream;

//
  final BehaviorSubject<num> _totalTradeValueSubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get totalTradeValueStream => _totalTradeValueSubject.stream;

//
  final BehaviorSubject<num> _openPriceSubject = BehaviorSubject<num>.seeded(0);

  Stream<num> get openPriceStream => _openPriceSubject.stream;

  final BehaviorSubject<num> _closePriceSubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get closePriceStream => _closePriceSubject.stream;

// //
//   final BehaviorSubject<MatchDataModel> _chartsSubject =
//       BehaviorSubject<MatchDataModel>.seeded(
//           MatchDataModel(listMatchQuantity: <MatchModel>[]));
//   Stream<MatchDataModel> get chartsStream => _chartsSubject.stream;
//

  final BehaviorSubject<List<MatchModel>> _matchDataSubject =
      BehaviorSubject<List<MatchModel>>.seeded(<MatchModel>[]);

  Stream<List<MatchModel>> get matchDataSteam => _matchDataSubject.stream;

  final BehaviorSubject<List<MatchVolume>> _timeSaleSubject =
      BehaviorSubject<List<MatchVolume>>.seeded(<MatchVolume>[]);

  Stream<List<MatchVolume>> get timeSaleSteam => _timeSaleSubject.stream;

  // Vốn hoá
  final BehaviorSubject<num> _marketCapSubject = BehaviorSubject<num>.seeded(0);

  Stream<num> get marketCapStream => _marketCapSubject.stream;

  // % giao dich
  final BehaviorSubject<num> _tradePercentSubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get tradePercentStream => _tradePercentSubject.stream;

  final BehaviorSubject<MatchPriceModel> _matchPriceDataSubject =
      BehaviorSubject<MatchPriceModel>.seeded(
          MatchPriceModel(match: <MatchModel>[]));
  Stream<MatchPriceModel> get matchPriceDataStream =>
      _matchPriceDataSubject.stream;

//
  final BehaviorSubject<String> _bPriceString1Subject =
      BehaviorSubject<String>.seeded('');

  Stream<String> get bPriceString1Stream => _bPriceString1Subject.stream;

//
  final BehaviorSubject<String> _sPriceString1Subject =
      BehaviorSubject<String>.seeded('');

  Stream<String> get sPriceString1Stream => _sPriceString1Subject.stream;

//
  final BehaviorSubject<num> _matchQttySubject = BehaviorSubject<num>.seeded(0);

  Stream<num> get matchQttyStream => _matchQttySubject.stream;

//
  final BehaviorSubject<String> _sideSubject =
      BehaviorSubject<String>.seeded('');

//
  final BehaviorSubject<num> _totalBuyQttySubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get totalBuyQttyStream => _totalBuyQttySubject.stream;
//
  final BehaviorSubject<num> _totalSellQttySubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get totalSellQttyStream => _totalSellQttySubject.stream;

  // Von hoa
  final BehaviorSubject<num> _bookValueSubject = BehaviorSubject<num>.seeded(0);

  Stream<num> get bookValueStream => _bookValueSubject.stream;

  // % giao dich
  final BehaviorSubject<num> _turnOverRateSubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get turnOverStream => _turnOverRateSubject.stream;

  // % Chenh lech
  final BehaviorSubject<num> _rangeSubject = BehaviorSubject<num>.seeded(0);

  Stream<num> get rangeStream => _rangeSubject.stream;

  // KL luu hanh
  final BehaviorSubject<num> _listedQtySubject = BehaviorSubject<num>.seeded(0);

  Stream<num> get listedQtyStream => _listedQtySubject.stream;

  // % esp
  final BehaviorSubject<num> _espubject = BehaviorSubject<num>.seeded(0);

  Stream<num> get espStream => _espubject.stream;

  // % pe
  final BehaviorSubject<num> _peSubject = BehaviorSubject<num>.seeded(0);

  Stream<num> get peStream => _peSubject.stream;

  // % ps
  final BehaviorSubject<num> _psSubject = BehaviorSubject<num>.seeded(0);

  Stream<num> get psStream => _psSubject.stream;

  // % pb
  final BehaviorSubject<num> _pbSubject = BehaviorSubject<num>.seeded(0);

  Stream<num> get pbStream => _pbSubject.stream;

  // % w52
  final BehaviorSubject<num> _w52LowSubject = BehaviorSubject<num>.seeded(0);

  Stream<num> get w52LowStream => _w52LowSubject.stream;
  // % w52
  final BehaviorSubject<num> _w52HightSubject = BehaviorSubject<num>.seeded(0);

  Stream<num> get w52HightStream => _w52HightSubject.stream;

  // % w52
  final BehaviorSubject<num> _colorCodeSubject = BehaviorSubject<num>.seeded(0);

  Stream<num> get colorCodeStream => _colorCodeSubject.stream;

  // % w52
  final BehaviorSubject<MarketStatusSessionWithIndex?>
      _marketStatusSessionWithIndex =
      BehaviorSubject<MarketStatusSessionWithIndex?>.seeded(null);

  Stream<MarketStatusSessionWithIndex?> get marketStatusSessionWithStream =>
      _marketStatusSessionWithIndex.stream;

  // GIÁ CKCS
  final BehaviorSubject<num> _basePriceSubject = BehaviorSubject<num>.seeded(0);

  Stream<num> get basePriceStream => _basePriceSubject.stream;

  // MÃ CKCS
  final BehaviorSubject<String> _baseSecCdDataSubject =
      BehaviorSubject<String>.seeded('-');

  Stream<String> get baseSecCdDataStream => _baseSecCdDataSubject.stream;

  // TCPH
  final BehaviorSubject<String> _issuerDataSubject =
      BehaviorSubject<String>.seeded('-');

  Stream<String> get issuerDataStream => _issuerDataSubject.stream;

  // NGÀY GD CUỐI
  final BehaviorSubject<num> _lastTradeDateSubject =
      BehaviorSubject<num>.seeded(0);

  Stream<num> get lastTradeDateStream => _lastTradeDateSubject.stream;

  // GIÁ THỰC HIỆN
  final BehaviorSubject<num> _execPriceSubject = BehaviorSubject<num>.seeded(0);

  Stream<num> get execPriceStream => _execPriceSubject.stream;

  // TL CHUYỂN ĐỔI
  final BehaviorSubject<String> _execRatioSubject =
      BehaviorSubject<String>.seeded('');

  Stream<String> get execRatioStream => _execRatioSubject.stream;

  String get tag => '${_secCdSubject.value}-PlaceOrder';

  Stream<String> get sideStream => _sideSubject.stream;

  String get secCd => _secCdSubject.value;

  // MatchDataModel get chart => _chartsSubject.value;
  MatchPriceModel get chartPrice => _matchPriceDataSubject.value;

  num get matchPrice => _matchPriceSubject.value;

  num get changePercent => _changePercentSubject.value;

  num get changePercentNotDay => _changePercentNotDaySubject.value;

  num get changeHighLow => _changeHighLowSubject.value;

  num get changePoint => _changePointSubject.value;

  num get totalTradeQtty => _totalTradeQttySubject.value * 10;

  num get basicPrice => _basicPriceSubject.value;

  String get subTicker =>
      LocalizationService.locale.languageCode == AppConst.langVI
          ? _subSecCdVISubject.value
          : _subSecCdENSubject.value;

  num get ceilingPrice => _ceilingPriceSubject.value;

  num get floorPrice => _floorPriceSubject.value;

  Color get lastColor => getLastColor(matchPrice);

  num get avgPrice => _avgPriceSubject.value;

  num get highestPrice => _highestPriceSubject.value;

  num get lowestPrice => _lowestPriceSubject.value;

  num get bPrice1 => _bPrice1Subject.value;

  num get bQtty1 => _bQtty1Subject.value * 10;

  num get sPrice1 => _sPrice1Subject.value;

  num get sQtty1 => _sQtty1Subject.value * 10;

  num get bPrice2 => _bPrice2Subject.value;

  num get bQtty2 => _bQtty2Subject.value * 10;

  num get sPrice2 => _sPrice2Subject.value;

  num get sQtty2 => _sQtty2Subject.value * 10;

  num get bPrice3 => _bPrice3Subject.value;

  num get bQtty3 => _bQtty3Subject.value * 10;

  num get sPrice3 => _sPrice3Subject.value;

  num get sQtty3 => _sQtty3Subject.value * 10;

  num get buyForeign => _buyForeignSubject.value * 10;

  num get currentRoom => _currentRoomSubject.value;

  num get openPrice => _openPriceSubject.value;

  num get closePrice => _closePriceSubject.value;

  num get sellForeign => _sellForeignSubject.value * 10;

  num get netForeignQty => _netForeignQtySubject.value;

  num get netForeignAmt => _netForeignAmtSubject.value;

  num get sellForeignAmt => _sellForeignAmtSubject.value;

  num get buyForeignAmt => _buyForeignAmtSubject.value;

  num get totalTradeValue => _totalTradeValueSubject.value;

  String get bPriceString1 => _bPriceString1Subject.value;

  String get sPriceString1 => _sPriceString1Subject.value;

  String get subTickerEN => _subSecCdENSubject.value;

  num get totalBuyQtty => _totalBuyQttySubject.value;

  num get totalSellQtty => _totalSellQttySubject.value;

  num get turnOverRate => _turnOverRateSubject.value;

  num get bookValue => _bookValueSubject.value;

  num get range => _rangeSubject.value;

  num get listedQty => _listedQtySubject.value;

  num get esp => _espubject.value;

  num get pe => _peSubject.value;

  num get pb => _pbSubject.value;

  num get ps => _psSubject.value;

  num get w52Low => _w52LowSubject.value;

  num get w52Hight => _w52HightSubject.value;

  num get marketCap => _marketCapSubject.value;

  num get tradePercent => _tradePercentSubject.value;

  num get totalAmt => _totalAmtSubject.value;

  List<MatchModel> get matchData => _matchDataSubject.value;
  List<MatchVolume> get timeSale => _timeSaleSubject.value;

  // for CW
  num get basePrice => _basePriceSubject.value;
  String get baseSecCdData => _baseSecCdDataSubject.value;
  String get issuerData => _issuerDataSubject.value;
  String get lastTradeDate => _lastTradeDateSubject.value == 0 ||
          _lastTradeDateSubject.value.toString().length < 8
      ? '--/--/----'
      : _lastTradeDateSubject.value.toString().formatToDDMMYYYY();
  num get execPrice => _execPriceSubject.value;
  String get execRatio => _execRatioSubject.value;

  num get colorCode => _colorCodeSubject.value;

  MarketStatusSessionWithIndex get marketStatusSessionWithIndex =>
      _marketStatusSessionWithIndex.value ?? MarketStatusSessionWithIndex.NONE;

  Color getLastColor(num price) {
    if (price == 0 || price == basicPrice) {
      return baseColor.yellow50;
    }

    if (floorPrice != 0 && price <= floorPrice) {
      return baseColor.blue50;
    }

    if (ceilingPrice != 0 && price >= ceilingPrice) {
      return baseColor.violet50;
    }

    if (price > basicPrice) {
      return baseColor.green50;
    }

    if (price < basicPrice) {
      return baseColor.red50;
    }
    return baseColor.yellow50;
  }

// 0: bằng giá tham chiếu hoặc bằng 0, null
// 1: bằng giá trần
// 2: bằng giá sàn
// 3: lớn hơn giá tham chiếu
// 4: nhỏ hơn giá tham chiếu
  Color getColorWithCode() {
    // ignore: unnecessary_null_comparison
    if (ceilingPrice != null && ceilingPrice != 0) {
      return getLastColor(matchPrice);
    }
    switch (colorCode) {
      case 1:
        return baseColor.violet50;
      case 2:
        return baseColor.blue50;
      case 3:
        return baseColor.green50;
      case 4:
        return baseColor.red50;
      case 0:
      default:
        return baseColor.yellow50;
    }
  }

  final Map<Field, BehaviorSubject<StatusFiled>> mapSubjectChangeColor =
      <Field, BehaviorSubject<StatusFiled>>{
    Field.MATH_DATA: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.MATCH_PRICE: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.CHANGE_POINT: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.CHANGE_PERCENT: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.TOTAL_QTTY: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.BPRICE1: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.BPRICE2: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.BPRICE3: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.SPRICE1: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.SPRICE2: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.SPRICE3: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.BQTTY1: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.BQTTY2: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.BQTTY3: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.SQTTY1: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.SQTTY2: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.SQTTY3: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.AVG_PRICE: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.OPEN_PRICE: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.LOWEST_PRICE: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.HIGHEST_PRICE: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.BUY_FOREIGN_QTTY:
        BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.SELL_FOREIGN_QTTY:
        BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.CURRENT_ROOM: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.TOTAl_AMT: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
    Field.BASE_PRICE: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
  };

  late List<StockChange<dynamic>> listValueStockChange = <StockChange<dynamic>>[
    StockChange<num>(value: _totalTradeQttySubject, filed: Field.TOTAL_QTTY),
    StockChange<num>(value: _matchPriceSubject, filed: Field.MATCH_PRICE),
    //  StockChange<MatchDataModel>(value: _chartsSubject, filed: Field.MATH_DATA),
    StockChange<MatchPriceModel>(
        value: _matchPriceDataSubject, filed: Field.MATH_DATA_PRICE),
    StockChange<num>(value: _changePercentSubject, filed: Field.CHANGE_PERCENT),
    StockChange<num>(
        value: _changePercentNotDaySubject,
        filed: Field.CHANGE_PERCENT_NOT_DAY),
    StockChange<num>(
        value: _changeHighLowSubject, filed: Field.CHANGE_HIGH_LOW),
    StockChange<num>(value: _changePointSubject, filed: Field.CHANGE_POINT),
    StockChange<num>(value: _basicPriceSubject, filed: Field.BASIC_PRICE),
    StockChange<num>(value: _ceilingPriceSubject, filed: Field.CEILING_PIRCE),
    StockChange<num>(value: _floorPriceSubject, filed: Field.FLOOR_PRICE),
  ];

  late List<StockChange<dynamic>> listValueStockChangeFull =
      <StockChange<dynamic>>[
    ...listValueStockChange,
    StockChange<num>(value: _bPrice1Subject, filed: Field.BPRICE1),
    StockChange<String>(value: _bPriceString1Subject, filed: Field.BPRICE1STR),
    StockChange<num>(value: _bQtty1Subject, filed: Field.BQTTY1),
    StockChange<num>(value: _bPrice2Subject, filed: Field.BPRICE2),
    StockChange<num>(value: _bQtty2Subject, filed: Field.BQTTY2),
    StockChange<num>(value: _bPrice3Subject, filed: Field.BPRICE3),
    StockChange<num>(value: _bQtty3Subject, filed: Field.BQTTY3),
    StockChange<num>(value: _sPrice1Subject, filed: Field.SPRICE1),
    StockChange<String>(value: _sPriceString1Subject, filed: Field.SPRICE1STR),
    StockChange<num>(value: _sQtty1Subject, filed: Field.SQTTY1),
    StockChange<num>(value: _sPrice2Subject, filed: Field.SPRICE2),
    StockChange<num>(value: _sQtty2Subject, filed: Field.SQTTY2),
    StockChange<num>(value: _sPrice3Subject, filed: Field.SPRICE3),
    StockChange<num>(value: _sQtty3Subject, filed: Field.SQTTY3),
    StockChange<num>(value: _currentRoomSubject, filed: Field.CURRENT_ROOM),
    StockChange<num>(value: _highestPriceSubject, filed: Field.HIGHEST_PRICE),
    StockChange<num>(value: _lowestPriceSubject, filed: Field.LOWEST_PRICE),
    StockChange<num>(value: _openPriceSubject, filed: Field.OPEN_PRICE),
    StockChange<num>(value: _closePriceSubject, filed: Field.CLOSE_PRICE),
    StockChange<num>(value: _avgPriceSubject, filed: Field.AVG_PRICE),
    StockChange<num>(value: _bookValueSubject, filed: Field.BOOK_VALUE),
    StockChange<num>(value: _turnOverRateSubject, filed: Field.TURNOVER_RATE),
    StockChange<num>(value: _rangeSubject, filed: Field.RANGE),
    StockChange<num>(value: _listedQtySubject, filed: Field.LISTED_QTY),
    StockChange<num>(value: _espubject, filed: Field.EPS),
    StockChange<num>(value: _pbSubject, filed: Field.PB),
    StockChange<num>(value: _peSubject, filed: Field.PE),
    StockChange<num>(value: _psSubject, filed: Field.PS),
    StockChange<num>(value: _w52LowSubject, filed: Field.W52_LOW),
    StockChange<num>(value: _w52HightSubject, filed: Field.W52_HIGHT),
    StockChange<num>(value: _buyForeignSubject, filed: Field.BUY_FOREIGN_QTTY),
    StockChange<num>(
        value: _sellForeignSubject, filed: Field.SELL_FOREIGN_QTTY),
    StockChange<num>(
        value: _netForeignQtySubject, filed: Field.NET_FOREIGN_QTY),
    StockChange<num>(
        value: _netForeignAmtSubject, filed: Field.NET_FOREIGN_AMT),
    StockChange<num>(
        value: _sellForeignAmtSubject, filed: Field.SELL_FOREIGN_AMT),
    StockChange<num>(
        value: _buyForeignAmtSubject, filed: Field.BUY_FOREIGN_AMT),
    StockChange<num>(value: _marketCapSubject, filed: Field.MARKET_CAP),
    StockChange<List<MatchVolume>>(
        value: _timeSaleSubject, filed: Field.TIME_SALE),
    StockChange<List<MatchModel>>(
        value: _matchDataSubject, filed: Field.MATH_DATA),
    StockChange<num>(value: _tradePercentSubject, filed: Field.TRADE_PERCENT),
    StockChange<num>(value: _totalAmtSubject, filed: Field.TOTAl_AMT),
    StockChange<num>(value: _basePriceSubject, filed: Field.BASE_PRICE),
    StockChange<String>(
        value: _baseSecCdDataSubject, filed: Field.BASE_SECCD_DATA),
    StockChange<String>(value: _issuerDataSubject, filed: Field.ISSUER_DATA),
    StockChange<num>(
        value: _lastTradeDateSubject, filed: Field.LAST_TRADE_DATE),
    StockChange<num>(value: _execPriceSubject, filed: Field.EXEC_PRICE),
    StockChange<String>(value: _execRatioSubject, filed: Field.EXEC_RATIO),
    StockChange<num>(value: _colorCodeSubject, filed: Field.COLOR_CODE),
  ];

  void listerListBuySellQtty() {
    final List<BehaviorSubject<num>> list = <BehaviorSubject<num>>[
      _bQtty1Subject,
      _bQtty2Subject,
      _bQtty3Subject,
      _sQtty1Subject,
      _sQtty2Subject,
      _sQtty3Subject
    ];
    for (final BehaviorSubject<num> element in list) {
      element.listen((num value) {
        listerBuySellQtty();
      });
    }
  }

  void listerBuySellQtty() {
    _totalBuyQttySubject.value = bQtty1 + bQtty2 + bQtty3;
    _totalSellQttySubject.value = sQtty1 + sQtty2 + sQtty3;
  }

  void _updateChartPriceData(MatchPriceModel? matchPriceData) {
    if (matchPriceData != null) {
      _matchPriceDataSubject.value = matchPriceData;
    }
  }
}

mixin MarketStatusSessionWithIndexnum {}

class StockChange<T> {
  StockChange({
    required this.value,
    required this.filed,
  });

  final BehaviorSubject<T> value;
  final Field filed;
}
