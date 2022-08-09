import 'package:flutter_mobile/domain/model/account_infor/account_infor.dart';
import 'package:flutter_mobile/domain/model/params/login_param.dart';
export 'package:flutter_mobile/data/repository/user_repository_imp.dart';

abstract class UserRepository {
  Future<String?> login(LoginPrams params);

  Future<void> refreshToken(String refreshToken);

  Future<AccountInfor?> inqueryAccount({required String accountNo});

  Future<void> initNotification(String masterAccount);
}
