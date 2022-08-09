import 'package:flutter_mobile/core/client/notify_ui.dart';
import 'package:flutter_mobile/core/data/market_repository_impl.dart';
import 'package:flutter_mobile/core/domain/reponsitory/market_repository.dart';
import 'package:flutter_mobile/core/interface/market_update_data.dart';
import 'package:flutter_mobile/core/model/market_model.dart';
import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/data/source/socket/socket_manager.dart';

class MarketClient {
  MarketClient(this._marketUpDataInterface, this._notifyUI);
  final NotifyUI _notifyUI;

  final MarketUpdateDataInterface _marketUpDataInterface;

  final MarketRepository _repository = MarketRepositoryImp();
  late RxNotify<Map<Field, dynamic>> ticketSub;
  final Map<API_STOCK_VIEW_MODEL, bool> mapCallApi =
      <API_STOCK_VIEW_MODEL, bool>{
    API_STOCK_VIEW_MODEL.STOCK_INFOR: false,
    API_STOCK_VIEW_MODEL.MATCH_DATA: false,
    API_STOCK_VIEW_MODEL.TIME_SALE: false
  };

  Future<void> getMarketInfomation(
      int marketCd, MarketModel? stockInfo, bool isRefeshData) async {
    if ((isRefeshData ||
            !(stockInfo?.dataWithApi ?? false) ||
            _notifyUI.isMissDataSocket) &&
        !mapCallApi[API_STOCK_VIEW_MODEL.STOCK_INFOR]!) {
      mapCallApi[API_STOCK_VIEW_MODEL.STOCK_INFOR] = true;
      final Map<Field, dynamic>? mapRepose =
          await _repository.getMarketInfor(marketCd.toString());
      _marketUpDataInterface.updateStockInfo(mapRepose ?? <Field, dynamic>{});
      mapCallApi[API_STOCK_VIEW_MODEL.STOCK_INFOR] = false;
    }
  }

  void subcribleRealTimeData(String marketCd) {
    ticketSub = SocketManager().addObserverMarketChanged(marketCd);
    ticketSub.addListener(() {
      _marketUpDataInterface.updateSocketData(ticketSub.value);
    });
  }

  void unSubcribleRealTimeData(String marketCd) {
    ticketSub.removeListener(() {});
    SocketManager().addObserverMarketChanged(marketCd);
  }
}
