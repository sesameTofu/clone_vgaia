import 'package:flutter_mobile/data/source/dio/api/rest_client_base.dart';
import 'package:flutter_mobile/data/source/dio/api_error.dart';
import 'package:flutter_mobile/data/source/dio/api_response.dart';
import 'package:flutter_mobile/domain/model/portfolio/customer_portfolio_model.dart';
import 'package:flutter_mobile/domain/model/portfolio/find_portfolio.dart';
import 'package:flutter_mobile/domain/model/portfolio/get_portfolio_asset.dart';
import 'package:flutter_mobile/domain/model/portfolio/get_portfolio_investment.dart';
import 'package:flutter_mobile/domain/model/portfolio/inquiry_model.dart';
import 'package:flutter_mobile/domain/model/portfolio/portfolio_assets.dart';
import 'package:flutter_mobile/domain/model/portfolio/portfolio_investment.dart';
import 'package:flutter_mobile/domain/repository/portfolio_repository.dart';
import 'package:flutter_mobile/global/app_url.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final RestClientBase _client = RestClientBase();

  @override
  Future<List<CustomerPortfolio>> findPortfolio(
      {required FindPortfolio request}) async {
    final ApiResponse response =
        await _client.post(AppUrl.findPortfolio, data: request.toJson());
    if (response.statusCode == 0) {
      return (response.data as List<dynamic>)
          .map((dynamic e) =>
              CustomerPortfolio.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<List<PortfolioAssets>> getPortfolioAsset(
      {required GetPortfolioAssetRequest request}) async {
    final ApiResponse response =
        await _client.post(AppUrl.getPortfolioAsset, data: request.toJson());

    if (response.statusCode == 0) {
      return (response.data as List<dynamic>)
          .map((dynamic e) =>
              PortfolioAssets.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<List<PortfolioInvestment>> getPortfolioInvestment(
      {required GetPortfolioInvestmentRequest request}) async {
    final ApiResponse response = await _client
        .post(AppUrl.getPortfolioInvestment, data: request.toJson());

    if (response.statusCode == 0) {
      return (response.data as List<dynamic>)
          .map((dynamic e) =>
              PortfolioInvestment.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<InquiryModel> inquiryAccountCashSec(
      {required String subAccoNo}) async {
    final ApiResponse response = await _client
        .post(AppUrl.inquiryAccountCashSec, data: <String, dynamic>{
      'subAccNo': subAccoNo,
    });

    if (response.statusCode == 0) {
      return InquiryModel.fromJson(
          (response.data ?? <String, dynamic>{}) as Map<String, dynamic>);
    }
    throw ApiError.fromResponse(response);
  }
}
