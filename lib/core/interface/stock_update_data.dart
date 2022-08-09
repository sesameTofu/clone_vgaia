import 'package:flutter_mobile/core/model/match_model.dart';
import 'package:flutter_mobile/core/model/match_price_model.dart';
import 'package:flutter_mobile/core/model/match_volume.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';

abstract class StockUpdateDataInterface {
  void updateMatchData(List<MatchModel> value) {}
  void updateTimeSale(List<MatchVolume> value) {}
  void updateMatchPriceData(MatchPriceModel value) {}
  void updateStockInfo(Map<Field, dynamic> value) {}
  void updateSocketData(Map<Field, dynamic> value) {}
}
