import 'package:flutter_mobile/domain/model/recommend/recommend_buy.dart';
import 'package:flutter_mobile/domain/model/recommend/recommend_buy_param.dart';
import 'package:flutter_mobile/domain/model/recommend/recommend_sell.dart';
import 'package:flutter_mobile/domain/model/recommend/recommend_sell_param.dart';

abstract class RecommendRepository {
  Future<List<RecommendBuy>> findFrontRecommendBuy(
      {required RecommendBuyParam param});

  Future<List<RecommendSell>> findFrontRecommendSell(
      {required RecommendSellParam param});
}
