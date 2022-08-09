import 'package:flutter_mobile/data/repository/portfolio_repository_impl.dart';
import 'package:flutter_mobile/domain/model/portfolio/customer_portfolio_model.dart';
import 'package:flutter_mobile/domain/model/portfolio/find_portfolio.dart';
import 'package:flutter_mobile/domain/model/portfolio/get_portfolio_asset.dart';
import 'package:flutter_mobile/domain/model/portfolio/get_portfolio_investment.dart';
import 'package:flutter_mobile/domain/model/portfolio/inquiry_model.dart';
import 'package:flutter_mobile/domain/model/portfolio/portfolio_assets.dart';
import 'package:flutter_mobile/domain/model/portfolio/portfolio_investment.dart';
import 'package:flutter_mobile/domain/repository/portfolio_repository.dart';
import 'package:flutter_mobile/utils/functs.dart';

class PortfolioUseCase {
  final PortfolioRepository _repository = PortfolioRepositoryImpl();
  Future<void> getPortfolioAsset(
      {required String subAccoCd,
      required String subAccoNo,
      required String fromDate,
      required String toDate,
      required Function onSuccess,
      required Function onFailure}) async {
    try {
      final List<PortfolioAssets> list = await _repository.getPortfolioAsset(
          request: GetPortfolioAssetRequest(
              subAccoCd: subAccoCd,
              subAccoNo: subAccoNo,
              fromDate: fromDate,
              toDate: toDate));
      onSuccess(list);
    } catch (error) {
      onFailure(error);
    }
  }

  Future<void> getPortfolioInvestment(
      {required String subAccoCd,
      required String subAccoNo,
      required String fromDate,
      required String toDate,
      required String secCd,
      required Function onSuccess,
      required Function onFailure}) async {
    try {
      final List<PortfolioInvestment> list =
          await _repository.getPortfolioInvestment(
              request: GetPortfolioInvestmentRequest(
                  subAccoCd: subAccoCd,
                  subAccoNo: subAccoNo,
                  fromDate: fromDate,
                  toDate: toDate,
                  secCd: secCd));
      onSuccess(list);
    } catch (error) {
      onFailure(error);
    }
  }

  Future<void> findPortfolio(
      {required String? subAcc,
      required String? alloDate,
      String? secCd,
      required Function onSuccess,
      required Function onFailure}) async {
    try {
      final List<CustomerPortfolio> list = await _repository.findPortfolio(
          request: FindPortfolio(
              subAccoNo: subAcc, alloDate: alloDate, secCd: secCd));
      onSuccess(list);
    } catch (error) {
      onFailure(error);
    }
  }

  Future<void> inquiryAccountCashSec(
      {required String? subAccoNo,
      required Function onSuccess,
      required Function onFailure}) async {
    try {
      if (isNullOrEmpty(subAccoNo)) {
        return;
      }
      final InquiryModel list =
          await _repository.inquiryAccountCashSec(subAccoNo: subAccoNo!);
      onSuccess(list);
    } catch (error) {
      onFailure(error);
    }
  }
}
