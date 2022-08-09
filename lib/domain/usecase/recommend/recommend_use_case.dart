import 'package:flutter_mobile/data/repository/recommend/recommend_repository_impl.dart';
import 'package:flutter_mobile/domain/model/recommend/recommend_buy.dart';
import 'package:flutter_mobile/domain/model/recommend/recommend_buy_param.dart';
import 'package:flutter_mobile/domain/model/recommend/recommend_sell.dart';
import 'package:flutter_mobile/domain/model/recommend/recommend_sell_param.dart';
import 'package:flutter_mobile/domain/repository/recommend/recommend_repository.dart';

class RecommendUseCase {
  final RecommendRepository _repository = RecommendRepositoryImpl();

  Future<void> findFrontRecommendBuy({
    required RecommendBuyParam param,
    required Function(List<RecommendBuy> data) onSuccess,
    required Function onFailure,
  }) async {
    try {
      final List<RecommendBuy> data =
          await _repository.findFrontRecommendBuy(param: param);
      onSuccess(data);
    } catch (error) {
      onFailure(error);
    }
  }

  Future<void> findFrontRecommendSell({
    required RecommendSellParam param,
    required Function(List<RecommendSell> data) onSuccess,
    required Function onFailure,
  }) async {
    try {
      final List<RecommendSell> data =
          await _repository.findFrontRecommendSell(param: param);
      onSuccess(data);
    } catch (error) {
      onFailure(error);
    }
  }
}
