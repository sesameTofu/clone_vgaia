import 'package:flutter_mobile/controller/account_manager.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/utils/functs.dart';

class AccountUseCase {
  // Get data subaccount list
  void getSubAccountList(
      {required Function onSuccess, required Function onFailure}) {
    try {
      final List<String> listAcc =
          AccountManager().getSubAccoList(EntrustBusinessCode.all);
      if (isNotNullOrEmpty(listAcc)) {
        onSuccess(listAcc);
      }
    } catch (err) {
      onFailure(err);
    }
  }

  // get Account default
  Select<String> getDefaultAccounList(List<Select<String>> listAcc) {
    if (isNullOrEmpty(AccountManager().getSubAccoutDefault())) {
      return listAcc.first;
    }
    final List<Select<String>> listAccountDefault = listAcc
        .where((Select<String> element) =>
            element.value == AccountManager().getSubAccoutDefault())
        .toList();
    if (listAccountDefault.isNotEmpty) {
      return listAccountDefault.first;
    }
    return listAcc.first;
  }
}
