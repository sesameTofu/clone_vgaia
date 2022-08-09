import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/domain/model/statement/statement_model.dart';
import 'package:flutter_mobile/domain/usecase/account_use_case.dart';
import 'package:flutter_mobile/domain/usecase/statement_use_case.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';

class StatmentController extends BaseController {
  final RxListNotify<Select<String>> listSubAccount =
      <Select<String>>[].objective;
  final RxNotify<Select<String>> subAccount = Select<String>().objective;
  DateTime fromDate = DateTime.now().add(Duration(days: -60));
  DateTime toDate = DateTime.now();
  final AccountUseCase _accountUseCase = AccountUseCase();
  final StatementUseCase _statementUseCase = StatementUseCase();
  final RxNotify<StatementModel> statement = StatementModel().objective;
  @override
  void onInit() {
    getListSubAccount();
    super.onInit();
  }

// Lấy danh sách tiểu khoản
  void getListSubAccount() {
    _accountUseCase.getSubAccountList(onSuccess: (List<String> listSub) {
      final List<Select<String>> list = <Select<String>>[];
      for (final String value in listSub) {
        list.add(Select<String>(title: value, value: value));
      }
      listSubAccount.value = list;
      selectAccount(_accountUseCase.getDefaultAccounList(listSubAccount.value));
    }, onFailure: (dynamic error) {
      AppToast.showError(getError(error));
    });
  }

  void selectAccount(Select<String> first) {
    if (subAccount.value == first) {
      return;
    }
    subAccount.value = first;
    getStatementReport();
  }

  Future<void> getStatementReport() async {
    showLoadingPage();

    await _statementUseCase.getStatementReport(
        fromDate: fromDate,
        toDate: toDate,
        subAccoNo: subAccount.value.value,
        onSuccess: (StatementModel valueStatement) {
          statement.value = valueStatement;
          hideLoadingPage();
        },
        onFailure: (dynamic error) {
          hideLoadingPage();

          statement.value = StatementModel();

          AppToast.showError(getError(error));
        });
  }

  void changeDate(
      {required DateTime valueFromDate, required DateTime valueToDate}) {
    if (valueFromDate == fromDate && toDate == valueToDate) {
      return;
    }
    fromDate = valueFromDate;
    toDate = valueToDate;
    getStatementReport();
  }
}
