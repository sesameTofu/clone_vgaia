import 'package:flutter_mobile/controller/account_manager.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/domain/usecase/account_use_case.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';

abstract class AccountMixi {
  final RxList<Select<String>> listSubAccount = <Select<String>>[].obs;
  final Rx<Select<String>> subAccount = Select<String>().obs;
  final AccountUseCase _accountUseCase = AccountUseCase();

  void initAccount({bool isAll = false}) {
    if (isAll) {
      listSubAccount
          .add(Select<String>(title: LocaleKeys.goline_All, value: 'ALL'));
    }
    _getListSubAccount(isAll: isAll);
    AccountManager().accountDefaultRx.listen((_) {
      _getListSubAccount();
    });
  }

// Lấy danh sách tiểu khoản
  void _getListSubAccount({bool isAll = false}) {
    listSubAccount.addAll(AccountManager()
        .getSubAccoList(EntrustBusinessCode.all)
        .map((String e) => Select<String>(title: e, value: e))
        .toList());

    selectAccount(
      _accountUseCase.getDefaultAccounList(
        listSubAccount,
      ),
      isFrist: true,
    );
  }

  void selectAccount(Select<String> first, {bool isFrist = false}) {
    if (subAccount.value == first) {
      return;
    }
    subAccount.value = first;
    accountChange(subAccount.value, isFrist: isFrist);
  }

  void accountChange(Select<String> subAccount, {bool isFrist = false});
}
