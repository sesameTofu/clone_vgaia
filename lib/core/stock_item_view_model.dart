import 'dart:async';

import 'package:flutter_mobile/core/client/notify_ui.dart';
import 'package:flutter_mobile/core/client/stock_client.dart';
import 'package:flutter_mobile/core/interface/event_stock_interface.dart';
import 'package:flutter_mobile/core/interface/notify_interface.dart';
import 'package:flutter_mobile/core/interface/stock_update_data.dart';
import 'package:flutter_mobile/core/market_item_view_model.dart';
import 'package:flutter_mobile/core/model/match_model.dart';
import 'package:flutter_mobile/core/model/match_price_model.dart';
import 'package:flutter_mobile/core/model/match_volume.dart';
import 'package:flutter_mobile/core/model/stock_info_model.dart';
import 'package:flutter_mobile/core/model/stock_item_model.dart';
import 'package:flutter_mobile/core/use_case/stock_use_case.dart';
import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';

class StockItemViewModel
    with StockUpdateDataInterface
    implements NotifiInterface, EventStockInterface {
  StockItemViewModel({required this.stockItem}) {
    _notify = NotifyUI(this, secCd: stockItem.secID);
    _apiClient = StockClient(this, _notify);
    _stockUseCase = StockUseCase();
  }
  StockItemModel stockItem;
  StockInfoModel? _stockInfo;
  StockInfoModel? get stockInfor => _stockInfo ?? getStockInfomation();
  MatchPriceModel _matchPriceModel = MatchPriceModel(match: <MatchModel>[]);

  List<MatchVolume> _timeSale = <MatchVolume>[];
  List<MatchModel> _listMatchQuantity = <MatchModel>[];

  late final StockClient _apiClient;
  late final NotifyUI _notify;
  late StockUseCase _stockUseCase;

  Map<API_STOCK_VIEW_MODEL, RxNotify<bool>> get mapLoadingApi =>
      _apiClient.mapCallApi;

  StreamController<Map<Field, dynamic>> get stockSubription {
    return _notify.notifyManager;
  }

/*
  1. stockinfo có thể null
  2. khi mình ko dùng StockItemViewModel => socket close, api ko call => StockInfo outdated
  3. Lấy thông tin mới nhât từ api
  4. update realtime từ socket
*/
/*
  CAll Api When:
  1. stockInfo null
  2. stockInfo has not been successfully obtained from the api
  3. stockInfo not subcrible -> data out dated, fetch data match new
*/
  StockInfoModel? getStockInfomation(
      {bool isRefeshData = false, bool isGetStockPrice = false}) {
    _apiClient.getStockInfomation(
        stockItem.secID!, _stockInfo, isRefeshData, isGetStockPrice);
    return _stockInfo;
  }

/*
  CAll Api When:
  1. matchData null
  2. matchData has not been successfully obtained from the api
  3. socket not subcrible -> data out dated, fetch datamatch new

*/
  List<MatchModel> getMatchData({bool isRefeshData = false}) {
    _apiClient.getMatchData(stockItem.secID!);
    return _listMatchQuantity;
  }

  MatchPriceModel? getMatchPriceData({bool isRefeshData = false}) {
    _apiClient.getMatchPriceModel(
        stockItem.secID!, _matchPriceModel, isRefeshData);
    return _matchPriceModel;
  }

  List<MatchVolume> getTimeSale({bool isRefeshData = false, int time = 0}) {
    _apiClient.getTimeSale(stockItem.secID!, time: time);
    return _timeSale;
  }

  MarketItemViewModel? getMarketViewModel() =>
      _apiClient.getMarketViewModel(stockItem.index!);

  @override
  void updateMatchData(List<MatchModel> value) {
    _listMatchQuantity = value;
    _notify.sendata(<Field, dynamic>{Field.MATH_DATA: value});
  }

  @override
  void updateTimeSale(List<MatchVolume> value) {
    _timeSale = value;
    _notify.sendata(<Field, dynamic>{Field.TIME_SALE: value});
  }

  @override
  void updateMatchPriceData(MatchPriceModel value) {
    _matchPriceModel = value..dataWithApi = true;
    _notify.sendata(<Field, dynamic>{Field.MATH_DATA_PRICE: _matchPriceModel});
  }

  @override
  void updateSocketData(Map<Field, dynamic> value) {
    _stockInfo = (_stockInfo ?? StockInfoModel())
        .copyWith(StockInfoModel.fromFiled(value));
    // update matchData
    final Map<Field, dynamic>? matchData = _stockUseCase.convertMatchSockData(
        value,
        stockInfo: _stockInfo,
        matchPriceModel: _matchPriceModel,
        listMatchQuantity: _listMatchQuantity,
        timeSale: _timeSale);
    if (matchData != null && value[Field.IS_LAST_SALE] == true) {
      if (matchData.containsKey(Field.MATH_DATA)) {
        _listMatchQuantity = matchData[Field.MATH_DATA];
      }

      if (matchData.containsKey(Field.MATH_DATA_PRICE) &&
          matchData[Field.MATH_DATA_PRICE] != null) {
        _matchPriceModel = matchData[Field.MATH_DATA_PRICE];
      }

      value.addAll(matchData);
    }
    // send broadcast
    _notify.sendata(value);
  }

  @override
  void updateStockInfo(Map<Field, dynamic> value, {bool fullInfor = true}) {
    if (value.values.isNotEmpty) {
      _stockInfo = (_stockInfo ?? StockInfoModel())
          .copyWith(StockInfoModel.fromFiled(value)..dataWithApi = fullInfor);
      _notify.sendata(<Field, dynamic>{
        Field.STOCK_WITH_API_DETAIL: fullInfor,
        Field.STOCK_WITH_API_NOT_DETAIL: !fullInfor,
        ...value
      });
    }
    /*
      1. apply data to stock infomation object
      2. return Real Time data
    */
  }

  void update(Map<Field, dynamic> value, {bool fullInfor = true}) {
    if (value.values.isNotEmpty) {
      // stockItem = stockItem.copyWith(StockItemModel.fromFiled(value));
      _stockInfo = (_stockInfo ?? StockInfoModel())
          .copyWith(StockInfoModel.fromFiled(value)..dataWithApi = fullInfor);
      _notify.sendata(<Field, dynamic>{
        Field.STOCK_WITH_API_DETAIL: fullInfor,
        Field.STOCK_WITH_API_NOT_DETAIL: !fullInfor,
        ...value
      });
    }
    /*
      1. apply data to stock infomation object
      2. return Real Time data
    */
  }

  // void updateListMatcPrice(List<MatchModel> value) {
  //   _matchDataModel = value..dataWithApi = true;
  //   _notify.sendata(<Field, dynamic>{Field.MATH_DATA: _matchDataModel});
  // }

  @override
  void haveSubcrible() {
    /*
      1. connect realtime socket
    */
    _apiClient.subcribleRealTimeData(stockItem.secID ?? '');
  }

  @override
  void noSubcrible() {
    _apiClient.unSubcribleRealTimeData(stockItem.secID ?? '');
    /* disconnect realtime socket*/
  }

  @override
  num getStepPrice({required num price}) {
    return 0.1;
  }

  @override
  bool searchMatching({required String key}) {
    final String keySeach = key.toUpperCase();
    return stockItem.secID!.startsWith(keySeach);

    // ||
    //     (stockItem.sName ?? '').toUpperCase().contains(keySeach) ||
    //     (stockItem.vName ?? '').toUpperCase().contains(keySeach) ||
    //     (stockItem.vName ?? '').toUpperCase().contains(keySeach);
    /*
      1. match secID
      2. match en name
      3. match Vi name
    */
  }
}
