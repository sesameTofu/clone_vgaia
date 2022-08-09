import 'package:flutter_mobile/domain/model/portfolio/customer_portfolio_model.dart';
import 'package:flutter_mobile/domain/model/portfolio/find_portfolio.dart';
import 'package:flutter_mobile/domain/model/portfolio/get_portfolio_asset.dart';
import 'package:flutter_mobile/domain/model/portfolio/get_portfolio_investment.dart';
import 'package:flutter_mobile/domain/model/portfolio/inquiry_model.dart';
import 'package:flutter_mobile/domain/model/portfolio/portfolio_assets.dart';
import 'package:flutter_mobile/domain/model/portfolio/portfolio_investment.dart';

abstract class PortfolioRepository {
  Future<List<PortfolioAssets>> getPortfolioAsset(
      {required GetPortfolioAssetRequest request});

  Future<List<PortfolioInvestment>> getPortfolioInvestment(
      {required GetPortfolioInvestmentRequest request});

  Future<List<CustomerPortfolio>> findPortfolio(
      {required FindPortfolio request});

  Future<InquiryModel> inquiryAccountCashSec({required String subAccoNo});
}
