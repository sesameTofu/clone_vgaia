import 'dart:convert';

import 'package:flutter_mobile/domain/model/local/user_local_model.dart';
import 'package:flutter_mobile/domain/repository/local/local_user_repository.dart';
import 'package:flutter_mobile/global/app_const.dart';
import 'package:flutter_mobile/utils/functs.dart';

class LocalUserRepositoryIml extends LocalUserRepository {
  @override
  List<UserLocalModel> getListAccount() {
    final bool isData = storage.hasData(AppConst.keyLocalAccount);
    List<UserLocalModel> data = <UserLocalModel>[];
    if (!isData) {
      return data;
    }

    final String? accountString =
        storage.read<String>(AppConst.keyLocalAccount);

    if (isNullOrEmpty(accountString)) {
      return data;
    }

    data = (jsonDecode(accountString!) as List<dynamic>)
        .map((dynamic e) => UserLocalModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return data;
  }

  @override
  Future<bool> saveAccount(UserLocalModel userModel) async {
    try {
      final List<UserLocalModel> accounts = getListAccount();

      final int index = accounts.indexWhere(
          (UserLocalModel element) => element.userName == userModel.userName);

      if (index == -1) {
        accounts.add(userModel);
      } else {
        accounts[index].copy(userModel);
      }

      accounts.sort((UserLocalModel a, UserLocalModel b) =>
          DateTime.parse(b.lastTime!).compareTo(DateTime.parse(a.lastTime!)));

      final String jsonAccount = jsonEncode(accounts);
      await storage.write(AppConst.keyLocalAccount, jsonAccount);
      return true;
    } catch (error) {
      return false;
    }
  }
}
