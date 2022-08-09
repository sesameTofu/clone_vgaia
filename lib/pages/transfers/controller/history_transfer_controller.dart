import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/domain/model/money_transfer/find_tranfer_bank_history_param.dart';
import 'package:flutter_mobile/domain/model/money_transfer/find_transfer_local_param.dart';
import 'package:flutter_mobile/domain/model/money_transfer/transfer_bank.dart';
import 'package:flutter_mobile/domain/model/money_transfer/transfer_local_model.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/domain/usecase/account_use_case.dart';
import 'package:flutter_mobile/domain/usecase/money_transfer/money_transfer_use_case.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/transfers/transfers_controller.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HistoryTransferController extends BaseController {
  HistoryTransferController(this.controllerPage);

  late DateTime toDate;
  late DateTime fromDate;
  final TransferController controllerPage;

  final AccountUseCase _accountUseCase = AccountUseCase();

  final MoneyTransferUseCase _transferUseCase = MoneyTransferUseCase();

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  final RxListNotify<Select<String>> listSubAccount =
      <Select<String>>[].objective;

  Select<String>? subAccount = Select<String>();

  List<Select<TypeMoneyTransfer>> listTypeMoneyTransfer =
      <Select<TypeMoneyTransfer>>[];

  final RxNotify<Select<TypeMoneyTransfer>> typeTransfer =
      Select<TypeMoneyTransfer>().objective;

  final RxListNotify<TransferLocalModel> listDataInternalTransfer =
      <TransferLocalModel>[].objective;

  final RxListNotify<TransferBank> listDataBankTransfer =
      <TransferBank>[].objective;

  @override
  void onInit() {
    toDate = DateTime.now();
    fromDate = DateTime(toDate.year, toDate.month - 1, toDate.day);
    controllerPage.indexPage.addListener(() {
      if (controllerPage.indexPage.value == 1) {
        _getListSubAccount();
        _getTypeMoneyTransfer();
      }
    });

    super.onInit();
  }

  // Lấy danh sách tiểu khoản
  void _getListSubAccount() {
    _accountUseCase.getSubAccountList(
      onSuccess: (List<String> listSub) {
        final List<Select<String>> list = <Select<String>>[];
        for (final String value in listSub) {
          list.add(Select<String>(title: value, value: value));
        }
        listSubAccount.value = list;
        selectAccount(listSubAccount.value.tryGet(0));
      },
      onFailure: (dynamic error) {
        AppToast.showError(getError(error));
      },
    );
  }

  // chọn Tk chuyển
  void selectAccount(Select<String>? account) {
    if (account != subAccount) {
      subAccount = account;
      findData();
    }
  }

  // chọn DateTiem
  void changeDate(DateTime fromDate, DateTime toDate) {
    if (fromDate == this.fromDate && toDate == this.toDate) {
      return;
    }
    this.fromDate = fromDate;
    this.toDate = toDate;
    findData();
  }

  // list type chuyển khoản
  void _getTypeMoneyTransfer() {
    listTypeMoneyTransfer = TypeMoneyTransfer.values
        .map((TypeMoneyTransfer e) => Select<TypeMoneyTransfer>(
              title: e.title,
              value: e,
            ))
        .toList();
    typeTransfer.value = listTypeMoneyTransfer[0];
  }

  // chọn type chuyển khoản
  void selectTypeMoneyTransfer(Select<TypeMoneyTransfer> type) {
    if (type != typeTransfer.value) {
      typeTransfer.value = type;
      findData();
    }
  }

  // lấy DL lịch sử chuyển tiền
  void findData() {
    switch (typeTransfer.value.value) {
      case TypeMoneyTransfer.bankTransfer:
        _findTransferBankHistory();
        break;
      case TypeMoneyTransfer.internalTransfer:
        _findTransferLocal();
        break;
      default:
        break;
    }
  }

  Future<void> _findTransferLocal() async {
    await _transferUseCase.findTransferLocal(
      param: FindTransferLocalParam(
        fromSubAccoNo: subAccount?.value ?? '',
        status: -1,
        mFromDate: fromDate.formatTimeServer(),
        mToDate: toDate.formatTimeServer(),
      ),
      onSuccess: (List<TransferLocalModel> data) {
        listDataInternalTransfer.value = data;
        refreshController.refreshCompleted();
      },
      onFailure: (dynamic error) {
        AppToast.showError(getError(error));
        refreshController.refreshFailed();
      },
    );
  }

  Future<void> _findTransferBankHistory() async {
    await _transferUseCase.findTransferBankHistory(
      param: FindTransferBankParam(
        fromdate: fromDate.formatTimeServer(),
        toDate: toDate.formatTimeServer(),
        subAccoNoFrom: subAccount?.value ?? '',
        status: -1,
      ),
      onSuccess: (List<TransferBank> data) {
        listDataBankTransfer.value = data;
        refreshController.refreshCompleted();
      },
      onFailure: (dynamic error) {
        AppToast.showError(getError(error));
        refreshController.refreshFailed();
      },
    );
  }
}
