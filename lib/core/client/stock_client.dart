import 'package:flutter_mobile/core/client/notify_ui.dart';
import 'package:flutter_mobile/core/data/stock_repository_impl.dart';
import 'package:flutter_mobile/core/domain/reponsitory/stock_repository.dart';
import 'package:flutter_mobile/core/interface/stock_update_data.dart';
import 'package:flutter_mobile/core/market_item_view_model.dart';
import 'package:flutter_mobile/core/model/match_model.dart';
import 'package:flutter_mobile/core/model/match_price_model.dart';
import 'package:flutter_mobile/core/model/match_volume.dart';
import 'package:flutter_mobile/core/model/stock_info_model.dart';
import 'package:flutter_mobile/core/model/stock_price.dart';
import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/data/source/socket/socket_manager.dart';

class StockClient {
  StockClient(this._stockDataInterface, this._notifyUI);
  final NotifyUI _notifyUI;

  final StockUpdateDataInterface _stockDataInterface;

  final StockRepository _repository = StockRepositoryImpl();
  RxNotify<Map<Field, dynamic>>? ticketSub;
  final Map<API_STOCK_VIEW_MODEL, RxNotify<bool>> mapCallApi =
      <API_STOCK_VIEW_MODEL, RxNotify<bool>>{
    API_STOCK_VIEW_MODEL.STOCK_INFOR: false.objective,
    API_STOCK_VIEW_MODEL.MATCH_DATA: false.objective,
    API_STOCK_VIEW_MODEL.MATCH_PRICE_DATA: false.objective,
    API_STOCK_VIEW_MODEL.TIME_SALE: false.objective
  };

  Future<void> getStockInfomation(String stockId, StockInfoModel? stockInfo,
      bool isRefeshData, bool isGetStockPrice) async {
    if ((isGetStockPrice ||
            isRefeshData ||
            !(stockInfo?.dataWithApi ?? false) ||
            _notifyUI.isMissDataSocket) &&
        !mapCallApi[API_STOCK_VIEW_MODEL.STOCK_INFOR]!.value) {
      mapCallApi[API_STOCK_VIEW_MODEL.STOCK_INFOR]?.value = true;
      final Map<Field, dynamic>? mapRepose =
          await _repository.getStockInfor(secCd: stockId);
      _stockDataInterface.updateStockInfo(mapRepose ?? <Field, dynamic>{});
      mapCallApi[API_STOCK_VIEW_MODEL.STOCK_INFOR]?.value = false;
    }
  }

  Future<StockPrice?> getStockPrice(
      {required String symbol, required bool getStockPrice}) async {
    try {
      if (getStockPrice) {
        return await _repository.getStockPrice(symbol: symbol);
      }
    } catch (eee) {
      return null;
    }
    return null;
  }

  Future<void> getMatchData(
    String stockId,
  ) async {
    if (!mapCallApi[API_STOCK_VIEW_MODEL.MATCH_DATA]!.value) {
      mapCallApi[API_STOCK_VIEW_MODEL.MATCH_DATA]?.value = true;

      final List<MatchModel> matchDataModel =
          await _repository.findSecIntraday(stockId);
      mapCallApi[API_STOCK_VIEW_MODEL.MATCH_DATA]?.value = false;

      _stockDataInterface.updateMatchData(matchDataModel);
    }
  }

  Future<void> getMatchPriceModel(String stockId,
      MatchPriceModel _matchDataModel, bool isRefeshData) async {
    if ((isRefeshData ||
            !(_matchDataModel.dataWithApi ?? false) ||
            !_notifyUI.isMissDataSocket) &&
        !mapCallApi[API_STOCK_VIEW_MODEL.MATCH_PRICE_DATA]!.value) {
      mapCallApi[API_STOCK_VIEW_MODEL.MATCH_PRICE_DATA]?.value = true;

      final MatchPriceModel matchDataModel =
          await _repository.findWatchList(stockId);
      mapCallApi[API_STOCK_VIEW_MODEL.MATCH_PRICE_DATA]?.value = false;

      _stockDataInterface.updateMatchPriceData(matchDataModel);
    }
  }

  Future<void> getTimeSale(String stockId, {int time = 0}) async {
    if (!mapCallApi[API_STOCK_VIEW_MODEL.TIME_SALE]!.value) {
      mapCallApi[API_STOCK_VIEW_MODEL.TIME_SALE]?.value = true;

      final List<MatchVolume> listTimeSale =
          await _repository.findTimeSale(stockId, tn: time);
      mapCallApi[API_STOCK_VIEW_MODEL.TIME_SALE]?.value = false;

      _stockDataInterface.updateTimeSale(listTimeSale);
    }
  }

  void subcribleRealTimeData(String secCd) {
    if (ticketSub == null) {
      ticketSub = SocketManager().addObserverStockChanged(secCd);
      ticketSub?.addListener(() {
        _stockDataInterface.updateSocketData(ticketSub!.value);
      });
    }
  }

  void unSubcribleRealTimeData(String secCd) {
    ticketSub?.removeListener(() {});
    ticketSub = null;
    SocketManager().removeObserverForStockChanged(secCd);
  }

  MarketItemViewModel? getMarketViewModel(Index index) =>
      _repository.getMarketItemViewModel(index);
}
