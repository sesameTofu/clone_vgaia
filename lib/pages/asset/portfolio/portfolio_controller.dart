import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/domain/model/place_order/buying_power_data.dart';
import 'package:flutter_mobile/domain/model/portfolio/inquiry_model.dart';
import 'package:flutter_mobile/domain/model/portfolio/sec_balance_display2.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/domain/usecase/place_order/place_order_use_case.dart';
import 'package:flutter_mobile/domain/usecase/portfolio_use_case.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_mobile/widgets/account/account_mixi_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PortfolioController extends BaseController with AccountMixi {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  final SlidableController slidableController = SlidableController();

  final RefreshController refreshController1 =
      RefreshController(initialRefresh: false);
  final PortfolioUseCase _portfolioUseCase = PortfolioUseCase();
  final PlaceOrderUseCase _placeOrderUseCase = PlaceOrderUseCase();
  final RxNotify<InquiryModel> inquiryModel = InquiryModel().objective;
  final RxNotify<BuyingPowerData> buyingPowerData = BuyingPowerData().objective;
  final RxListNotify<SecBalanceDisplay2> listSecBalanceDisplay2 =
      <SecBalanceDisplay2>[].objective;

  @override
  void onInit() {
    initAccount();
    super.onInit();
  }

  @override
  void accountChange(Select<String> subAccount, {bool isFrist = false}) {
    inquiryBuyingPower();
    inquiryAccountCashSec();
  }

  Future<void> inquiryBuyingPower() async {
    await _placeOrderUseCase.inquiryBuyingPower(
        subAccoNo: subAccount.value.value,
        onSuccess: (BuyingPowerData value) {
          buyingPowerData.value = value;
          refreshController.refreshCompleted();
        },
        onFailure: (dynamic error) {
          AppToast.showError(getError(error));
          refreshController.refreshCompleted();
        });
  }

  Future<void> inquiryAccountCashSec() async {
    await _portfolioUseCase.inquiryAccountCashSec(
        subAccoNo: subAccount.value.value,
        onSuccess: (InquiryModel value) {
          inquiryModel.value = value;
          listSecBalanceDisplay2.value =
              value.secBalanceData2 ?? <SecBalanceDisplay2>[];
          refreshController.refreshCompleted();
        },
        onFailure: (dynamic error) {
          AppToast.showError(getError(error));
          refreshController.refreshCompleted();
        });
  }
}
