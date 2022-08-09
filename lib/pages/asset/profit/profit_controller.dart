import 'package:flutter_mobile/controller/global_data_manager.dart';
import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/domain/model/portfolio/customer_portfolio_model.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/domain/usecase/portfolio_use_case.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_mobile/widgets/account/account_mixi_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProfitController extends BaseController with AccountMixi {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final PortfolioUseCase _portfolioUseCase = PortfolioUseCase();
  final RxListNotify<CustomerPortfolio> listCustomer =
      <CustomerPortfolio>[].objective;

  @override
  void onInit() {
    initAccount();
    super.onInit();
  }

  void getPortfolio() {
    _portfolioUseCase.findPortfolio(
        subAcc: subAccount.value.value,
        alloDate: GlobalDataManager().frontInitialModelMobile.tradeDate,
        onSuccess: (List<CustomerPortfolio> list) {
          listCustomer.value = list;
          refreshController.refreshCompleted();
        },
        onFailure: (dynamic error) {
          AppToast.showError(getError(error));
          refreshController.refreshCompleted();
        });
  }

  List<num> getInvestTotal(List<CustomerPortfolio> items) {
    if (isNullOrEmpty(items)) {
      return <double>[0.0, 0.0, 0.0];
    }
    num sum1 = 0;
    num sum2 = 0;
    num sum3 = 0;
    for (final CustomerPortfolio item in items) {
      sum1 += item.investmentAmt ?? 0.0;
      sum2 += item.calInvesmentAmtInDay;
      sum3 += item.calProfitAmtAcm;
    }
    return <num>[sum1, sum2, sum3];
  }

  @override
  void accountChange(Select<String> subAccount, {bool isFrist = false}) {
    getPortfolio();
  }
}
