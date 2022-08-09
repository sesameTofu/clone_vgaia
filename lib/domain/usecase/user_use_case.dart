import 'package:flutter_mobile/config/config.dart';
import 'package:flutter_mobile/controller/global_data_manager.dart';
import 'package:flutter_mobile/controller/session_manager.dart';
import 'package:flutter_mobile/data/repository/local/local_user_repository_iml.dart';
import 'package:flutter_mobile/data/source/dio/api/rest_client_base.dart';
import 'package:flutter_mobile/data/source/socket/socket_manager.dart';
import 'package:flutter_mobile/domain/model/account_infor/authentication.dart';
import 'package:flutter_mobile/domain/model/local/user_local_model.dart';
import 'package:flutter_mobile/domain/model/params/login_param.dart';
import 'package:flutter_mobile/domain/repository/local/local_user_repository.dart';
import 'package:flutter_mobile/domain/repository/user_repository.dart';
import 'package:flutter_mobile/global/app_log.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';

import 'system_use_case.dart';

class UserUseCase {
  static final UserUseCase share = UserUseCase();

  final SystemUseCase _systemUseCase = SystemUseCase.share;

  final UserRepository _userRepository = UserRepositoryImpl(RestClientBase());

  final LocalUserRepository _localUserIml = LocalUserRepositoryIml();

  GlobalDataManager global = GlobalDataManager();

  Future<void> login(
    String username,
    String password, {
    String captcha = '',
    required Function onSuccess,
    required Function onFailure,
  }) async {
    try {
      final String? check = _checkValidate(username, password);
      if (check != null) {
        onFailure(check);
        return;
      }

      final String? accessToken = await _userRepository.login(LoginPrams(
          username: username,
          password: password,
          lang: '',
          srcChannel: '5',
          captcha: captcha));

      SessionManager().setAuthentication(Authentication(
        accessToken: accessToken,
      ));
      await _systemUseCase.initTradingMobile();
      SocketManager().connect();
      onSuccess();
    } catch (e) {
      onFailure(e);
    }
  }

  String getVersionApp() {
    return global.version ?? '';
  }

  String? _checkValidate(
    String? username,
    String? password,
  ) {
    if (isNullOrEmpty(username)) {
      return LocaleKeys.login_userName_not_entered.tr;
    }

    if (isNullOrEmpty(password)) {
      LocaleKeys.login_password_not_entered.tr;
    }

    return null;
  }

  String focusUserName(String userName) {
    final String input = userName.toUpperCase();
    String outPut = input;
    const int length = 6;

    if (input.isNotEmpty) {
      final String prefix =
          '${AppConfig.config.systemParam}${AppConfig.config.systemSymbolConfig}';

      if (input.startsWith(prefix)) {
        outPut = input.substring(prefix.length, input.length);
      }

      if (outPut.length < length) {
        outPut = outPut.padLeft(length, '0');
      }

      if (outPut.length < 10) {
        outPut = '$prefix$outPut'.substring(0, 10);
      }
    }
    return outPut;
  }

  Future<void> addAccountLocal({
    required UserLocalModel model,
  }) async {
    await _localUserIml.saveAccount(model);
  }

  List<UserLocalModel> getListAccountLocal() {
    return _localUserIml.getListAccount();
  }

  Future<void> initNotification(String username) async {
    try {
      _userRepository.initNotification(username);
    } catch (exception) {
      AppLog.log.printError(exception.toString());
    }
  }
}
