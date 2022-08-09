import 'package:flutter_mobile/domain/model/account_infor/account_infor.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/domain/model/stock_transfer/stock_transfer_model.dart';
import 'package:flutter_mobile/domain/usecase/stock_transfer/stock_transfer_use_case.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_mobile/widgets/account/account_mixi_controller.dart';

class StockTransferController extends BaseController with AccountMixi {
  DateTime toDate = DateTime.now();
  DateTime fromDate = DateTime.now();
  final Rx<List<StockTransferModel>> listHistoryTransfer =
      Rx<List<StockTransferModel>>(<StockTransferModel>[]);
  final StockTransferUseCase _stockTransferUseCase = StockTransferUseCase();
  final RxBool isLoadingPage = false.obs;

  @override
  void onInit() {
    fromDate = DateTime.now().add(Duration(days: -toDate.day + 1));
    initAccount();
    getHistoryTransfer();
    super.onInit();
  }

  void changeDate(DateTime fromDate, DateTime toDate) {
    if (fromDate == this.fromDate && toDate == this.toDate) {
      return;
    }
    this.fromDate = fromDate;
    this.toDate = toDate;
    getHistoryTransfer();
  }

  Future<void> getHistoryTransfer() async {
    await _stockTransferUseCase.getHistoryTransfer(
      subAccoNoFrom: subAccount.value.value,
      fromDate: fromDate.formatyyyMMddFromNow,
      toDate: fromDate.formatyyyMMddFromNow,
      onSuccess: (List<StockTransferModel> data) {
        listHistoryTransfer.value = data;
      },
      onFailure: (dynamic error) {
        AppToast.showError(getError(error));
      },
    );
  }

  StockTransferStatus convertStatusToText(StockTransferModel model) {
    return model.status == 0
        ? StockTransferStatus.pending
        : model.status == 1
            ? StockTransferStatus.approved
            : StockTransferStatus.cancelled;
  }

  void onSelectAccount(Select<AccountInfor> account) {}

  @override
  void accountChange(Select<String> subAccount, {bool isFrist = false}) {}
}
