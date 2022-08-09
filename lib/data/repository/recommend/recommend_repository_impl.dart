import 'package:flutter_mobile/data/source/dio/api/rest_client_base.dart';
import 'package:flutter_mobile/data/source/dio/api_error.dart';
import 'package:flutter_mobile/data/source/dio/api_response.dart';
import 'package:flutter_mobile/data/source/dio/rest_client.dart';
import 'package:flutter_mobile/domain/model/recommend/recommend_buy.dart';
import 'package:flutter_mobile/domain/model/recommend/recommend_buy_param.dart';
import 'package:flutter_mobile/domain/model/recommend/recommend_sell.dart';
import 'package:flutter_mobile/domain/model/recommend/recommend_sell_param.dart';
import 'package:flutter_mobile/domain/repository/recommend/recommend_repository.dart';
import 'package:flutter_mobile/utils/functs.dart';

class RecommendRepositoryImpl extends RecommendRepository {
  final RestClient _client = RestClientBase();

  @override
  Future<List<RecommendBuy>> findFrontRecommendBuy(
      {required RecommendBuyParam param}) async {
    final ApiResponse response = await _client.post(
      'findFrontRecommendBuy',
      data: param.toMap(),
    );
    if (response.statusCode == 0) {
      if (isNull(response.data)) {
        return <RecommendBuy>[];
      }

      if (response.data is List) {
        final List<dynamic> dataList = response.data as List<dynamic>;
        return dataList
            .map((dynamic e) => RecommendBuy.fromMap(e as Map<String, dynamic>))
            .toList();
      }
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<List<RecommendSell>> findFrontRecommendSell(
      {required RecommendSellParam param}) async {
    final ApiResponse response = await _client.post(
      'findFrontRecommendSell',
      data: param.toMap(),
    );

    if (response.statusCode == 0) {
      if (isNull(response.data)) {
        return <RecommendSell>[];
      }

      if (response.data is List) {
        final List<dynamic> dataList = response.data as List<dynamic>;
        return dataList
            .map(
                (dynamic e) => RecommendSell.fromMap(e as Map<String, dynamic>))
            .toList();
      }
    }
    throw ApiError.fromResponse(response);
  }
}
