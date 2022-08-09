import 'package:flutter_mobile/core/market_item_view_model.dart';
import 'package:flutter_mobile/core/model/match_model.dart';
import 'package:flutter_mobile/core/model/match_price_model.dart';
import 'package:flutter_mobile/core/model/match_volume.dart';
import 'package:flutter_mobile/core/model/stock_price.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pb.dart';

abstract class StockRepository {
  Future<void> setStocksWithOpenApp(List<MrktSecInfoItem> listSecInfo);

  void setMarketInitDataItem(MarketInitDataItem? marketInitDataItem);

  // Lấy giá khi search
  Future<Map<Field, dynamic>?> getStockInfor({required String secCd});

  Future<List<MatchModel>> findSecIntraday(String secCd);

  Future<MatchPriceModel> findWatchList(String secCd);

  Future<List<MatchVolume>> findTimeSale(String secCd, {int tn});

  MarketItemViewModel? getMarketItemViewModel(Index? index);

  Future<StockPrice> getStockPrice({required String symbol});
}
