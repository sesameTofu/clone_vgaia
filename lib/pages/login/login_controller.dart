import 'dart:async';

import 'package:flutter_mobile/config/config.dart';
import 'package:flutter_mobile/controller/account_manager.dart';
import 'package:flutter_mobile/controller/watch_list_manager.dart';
import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/data/source/dio/api_error.dart';
import 'package:flutter_mobile/data/source/socket/socket_manager.dart';
import 'package:flutter_mobile/domain/model/local/user_local_model.dart';
import 'package:flutter_mobile/domain/usecase/user_use_case.dart';
import 'package:flutter_mobile/global/app_router.dart';
import 'package:flutter_mobile/global/app_theme.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/bimoetric_manager.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_mobile/utils/localization_service.dart';
import 'package:flutter_mobile/widgets/dialog/dialog.dart';
import 'package:flutter_mobile/widgets/network_connect.dart';
import 'package:local_auth/local_auth.dart';

class LoginController extends BaseController {
  final UserUseCase _userUseCase = UserUseCase.share;
  final BiometricManager _biometricManager = BiometricManager.share;

  late TextEditingController accountCtrl;
  late TextEditingController passwordCtrl;
  late FocusNode focusUserName;
  late List<BiometricType> _listBiometricType;
  List<UserLocalModel> listAccountLocal = <UserLocalModel>[];
  UserLocalModel? accountLocal = UserLocalModel();

  final Rx<bool> isSavePassW = Rx<bool>(false);

  final RxNotify<BiometricType> biometricType = BiometricType.face.objective;
  bool loadingCheckBiomatric = false;

  bool isBlockQuickClick = false;

  Rx<bool> isShowButtonLogin = false.obs;

  @override
  void onInit() {
    _getListBiometricTypes();
    accountCtrl = TextEditingController(text: ''); // 045C909259
    passwordCtrl = TextEditingController(text: ''); // 1
    _listen();
    super.onInit();
  }

  void _listen() {
    focusUserName = FocusNode()
      ..addListener(() {
        if (!focusUserName.hasFocus) {
          accountCtrl.text = _userUseCase.focusUserName(accountCtrl.text);
        }
      });
    accountCtrl.addListener(checkShowButtonLogin);
    passwordCtrl.addListener(checkShowButtonLogin);
  }

  void checkShowButtonLogin() {
    if (isNotNullOrEmpty(accountCtrl.text) &&
        isNotNullOrEmpty(passwordCtrl.text)) {
      isShowButtonLogin.value = true;
    } else {
      isShowButtonLogin.value = false;
    }
  }

  Future<void> _getListBiometricTypes() async {
    _listBiometricType =
        await _biometricManager.getListOfBiometricTypes() ?? <BiometricType>[];

    if (isNotNullOrEmpty(_listBiometricType)) {
      biometricType.value =
          _listBiometricType.contains(BiometricType.fingerprint)
              ? BiometricType.fingerprint
              : _listBiometricType[0];
    }

    await _getListAccountLocal();
  }

  // get account local
  Future<void> _getListAccountLocal() async {
    listAccountLocal = _userUseCase.getListAccountLocal();
    if (isNotNullOrEmpty(listAccountLocal)) {
      accountLocal = listAccountLocal.tryGet(0);
      accountCtrl.text = accountLocal?.userName ?? '';

      // if (accountLocal?.isBiometric ?? false) {
      //   Timer(Duration.zero, () {
      //     loginBiometric();
      //   });
      // }
    }
  }

  // login
  Future<void> login({String? account, String? password}) async {
    if (_isValidateLogin(account: account, password: password)) {
      final String accountValue = account ?? accountCtrl.text;
      final String passWordValue = password ?? passwordCtrl.text;
      showLoading();
      await _userUseCase.login(
        accountValue,
        passWordValue,
        onSuccess: () async {
          // if (!await _userUseCase.userRepository()) {
          //   hideLoading();

          //   return;
          // }

          // if (AccountManager().accountInfor?.isReset == '1') {
          //   hideLoading();
          //   await Get.toNamed(AppRouter.routerChangePasswordLoginPage,
          //       arguments: <String, dynamic>{
          //         'forceChangePw': true,
          //         'newPW': passWordValue
          //       });
          //   passwordCtrl.clear();
          //   return;
          // }

          hideLoading();
          await _saveAccountLocal(accountValue, passWordValue);
          passwordCtrl.clear();
          WatchListManager().init();
          _userUseCase.initNotification(accountValue);
          SocketManager().connect();
          Get.offAllNamed(AppRouter.routerMain);

          // await TwoFactorAuthen().startRequestToAuthen(BussinesType.Login,
          //     (AuthenModel? model, Function(dynamic value) submitApiSuccess) {
          //   if (model == null || model.sessionOTPCode!.isNotEmpty) {
          //     Get.offAllNamed(AppRouter.routerMain);
          //   }
          // });
        },
        onFailure: (dynamic error) {
          hideLoading();
          if (error is ApiError && error.errorCode == '401') {
            //  AppToast.showError(LocaleKeys.goline_incorrect_account_password.tr);
          } else {
            Get.find<NetWorkController>().isConnected;
            AppToast.showError(getError(error));
          }
        },
      );
    }
  }

  bool _isValidateLogin({String? account, String? password}) {
    if (isNullOrEmpty(accountCtrl.text) && isNullOrEmpty(account)) {
      AppToast.showError(LocaleKeys.UserNameCannotBlank.tr);
      return false;
    }

    if (isNullOrEmpty(passwordCtrl.text) && isNullOrEmpty(password)) {
      AppToast.showError(LocaleKeys.PasswordCannotBlank.tr);
      return false;
    }

    return true;
  }

  void check() {}

  String versionApp() {
    return _userUseCase.getVersionApp();
  }

  // function đổi ngôn ngữ
  Future<void> changeLang(String lang) async {
    final Locale locale = LocalizationService.locale;
    if (locale.languageCode != lang) {
      await LocalizationService.changeLocale(lang);
    }
  }

  // function faceID
  Future<void> loginBiometric() async {
    if (loadingCheckBiomatric) {
      return;
    }
    loadingCheckBiomatric = true;
    final String? validate = await checkValidateBiometric();

    if (isNotNull(validate)) {
      AppToast.showError(validate!);
      loadingCheckBiomatric = false;

      return;
    }

    if (!(await _biometricManager.authenticate())) {
      loadingCheckBiomatric = false;

      return;
    }
    loadingCheckBiomatric = false;

    login(account: accountLocal?.userName, password: accountLocal?.passWord);
  }

  // check login sinh trắc
  Future<String?> checkValidateBiometric() async {
    if (isNull(accountLocal) || accountCtrl.text != accountLocal?.userName) {
      return LocaleKeys.goline_LoginBeforeUseBiometricMsg.tr;
    }

    if (isNullOrEmpty(accountLocal?.userName) ||
        isNullOrEmpty(accountLocal?.passWord) ||
        !(accountLocal?.isBiometric ?? false)) {
      return LocaleKeys.goline_NotYetConfigBiometric.tr;
    }

    if (isNull(_listBiometricType)) {
      return LocaleKeys.goline_NotYetConfigBiometric.tr;
    }

    if (!(await _biometricManager.isBiometricAvailable())) {
      return LocaleKeys.goline_NotYetConfigBiometric.tr;
    }
    return null;
  }

  // save account local
  Future<void> _saveAccountLocal(String account, String password) async {
    late UserLocalModel param;

    final int _index = listAccountLocal
        .indexWhere((UserLocalModel acc) => acc.userName == account);

    if (_index > -1) {
      param = listAccountLocal[_index]
        ..lastTime = '${DateTime.now()}'
        ..passWord = password;
    } else {
      bool isBiometric = false;

      if (_listBiometricType.isNotEmpty) {
        if (await _wantUserBiometricDialog()) {
          final bool result = await _biometricManager.authenticate();
          isBiometric = result;
        }
      }

      param = UserLocalModel(
        userName: account,
        passWord: password,
        isBiometric: isBiometric,
        lastTime: '${DateTime.now()}',
      );
    }
    AccountManager().userLocalModel = param;
    await _userUseCase.addAccountLocal(model: param);
  }

  // dialog xác nhận đăng nhập bằng sinh trắc
  Future<bool> _wantUserBiometricDialog() async {
    final bool? res = await Get.dialog(
      CTSAlertDialog(
        title: LocaleKeys.confirm.tr,
        description: biometricType.value == BiometricType.fingerprint
            ? LocaleKeys.goline_UseFingerprintConfirmMsg.tr
            : LocaleKeys.goline_UseFaceIdConfirmMsg.tr,
        onAccept: () {
          return Get.back<bool>(result: true);
        },
        onCancel: () {
          return Get.back<bool>(result: false);
        },
      ),
    );

    return res ?? false;
  }

  Future<void> callHotline() async {
    // if (isBlockQuickClick) {
    //   return;
    // }
    // isBlockQuickClick = true;
    // final Uri uriHotline =
    //     Uri.parse('tel://${AppConfig.config.switchboardPhone}');
    // await launchUrl(uriHotline);
    // isBlockQuickClick = false;
  }

  void callRick() {
    // Get.toNamed(AppRouter.routerWebView, arguments: <String>[
    //   'Công bố rủi ro',
    //   AppConfig.config.riskDisclosure,
    // ]);
  }

  void functionGuide() {
    Get.toNamed(AppRouter.routerWebView, arguments: <String>[
      LocaleKeys.goline_UserGuide.tr,
      AppConfig.config.userGuideUrl,
    ]);
  }

  void functionForgotPassword() {
    Get.toNamed(AppRouter.routerWebView, arguments: <String>[
      LocaleKeys.forget_password.tr,
      AppConfig.config.forgotPasswordUrl,
    ]);
  }

  void functionContact() {
    Get.toNamed(AppRouter.routerWebView, arguments: <String>[
      'Liên hệ',
      AppConfig.config.contactUrl,
    ]);
  }

  void onClickSmartOtp() {
    Get.toNamed(AppRouter.routerSmartOTPPage);
  }

  void changeIsSavePassW() {
    isSavePassW.value = isSavePassW.isFalse;
  }

  void changeAccount(UserLocalModel value) {
    accountLocal = value;
    accountCtrl.text = value.userName ?? '';
    passwordCtrl.clear();
  }

  // thay đổi theme
  void changeTheme() {
    // if (themeBlack.value != value) {
    //   themeBlack.value = value;
    //   AppThemeType type = AppThemeType.black;
    //   if (!themeBlack.value) {
    //     type = AppThemeType.bright;
    //   }
    if (Get.find<AppThemeBase>().appTheme == AppThemeType.black) {
      Get.find<AppThemeBase>().changeAppTheme(AppThemeType.bright);
    } else {
      Get.find<AppThemeBase>().changeAppTheme(AppThemeType.black);
    }
  }
}
