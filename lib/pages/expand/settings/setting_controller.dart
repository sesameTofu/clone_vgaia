import 'dart:convert';

import 'package:flutter_mobile/controller/session_manager.dart';
import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/domain/model/local/user_local_model.dart';
import 'package:flutter_mobile/domain/usecase/user_use_case.dart';
import 'package:flutter_mobile/global/app_const.dart';
import 'package:flutter_mobile/global/app_router.dart';
import 'package:flutter_mobile/global/app_theme.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/bimoetric_manager.dart';
import 'package:flutter_mobile/utils/localization_service.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends BaseController with BaseMixin {
  final UserUseCase _userUseCase = UserUseCase();
  // Bio
  RxNotify<bool> isRegisterBio = false.objective;
  final BiometricManager _biometricManager = BiometricManager.share;
  List<UserLocalModel> _listAccLocal = <UserLocalModel>[];
  final String _currentAcc = SessionManager().username;

  late RxNotify<bool> isDarkTheme;
  late RxNotify<String> currentLanguage;

  @override
  void onInit() {
    super.onInit();
    _initCheckBio();

    isDarkTheme = (GetStorage().read<String?>(AppConst.keyThemeMode) ==
            AppThemeType.black.toString())
        .objective;
    currentLanguage = titleLang(
            GetStorage().read<String?>(AppConst.langID) ?? AppConst.langVI)
        .objective;
  }

  // check Bio
  Future<void> _initCheckBio() async {
    // init List AccLocal
    _listAccLocal = _userUseCase.getListAccountLocal();

    // check
    final UserLocalModel? _userLocalModel = _listAccLocal.firstWhereOrNull(
        (UserLocalModel user) => user.userName == _currentAcc);
    // set Giá trị bân đầu chop biến Bio
    isRegisterBio.value = _userLocalModel?.isBiometric ?? false;
  }

  //
  void onRegisterBio(bool isBio) {
    if (isBio) {
      _biometricManager.authenticate().then((bool value) {
        if (value) {
          showLoading();
          final List<UserLocalModel> _listNew = _listAccLocal
            ..firstWhereOrNull(
                    (UserLocalModel element) => element.userName == _currentAcc)
                ?.isBiometric = true;

          GetStorage().write(AppConst.keyLocalAccount, jsonEncode(_listNew));
          hideLoading();
          isRegisterBio.value = true;
        }
      });
    } else {
      isRegisterBio.value = isBio;
      final List<UserLocalModel> _listNew = _listAccLocal
        ..firstWhereOrNull(
                (UserLocalModel element) => element.userName == _currentAcc)
            ?.isBiometric = false;

      GetStorage().write(AppConst.keyLocalAccount, jsonEncode(_listNew));
    }
  }

  //
  void onChangeTheme(bool isDark) {
    Get.find<AppThemeBase>()
        .changeAppTheme(isDark ? AppThemeType.black : AppThemeType.bright);
    isDarkTheme.value = isDark;
  }

  //
  Future<void> onChnaglanguage(bool lang) async {
    final String langage = lang ? AppConst.langEN : AppConst.langVI;
    await LocalizationService.changeLocale(langage);
    currentLanguage.value = titleLang(langage);
  }

  //
  void onSettingNotification() {
    Get.toNamed(AppRouter.routerSettingNotification);
  }

  //
  void onSettingTwoAuthen() {
    Get.toNamed(AppRouter.routerTwoFactorAuthen);
  }

  //
  void onRegisterTwoAuthen() {}

  //
  void onManagerOtp() {
    Get.toNamed(AppRouter.routerManagerOtpPage);
  }

  //
  void onChangePassword() {
    Get.toNamed(AppRouter.routerChangePassword);
  }

  String titleLang(String lang) => lang == AppConst.langVI
      ? LocaleKeys.setting_page_selected_language_vi.tr
      : LocaleKeys.setting_page_selected_language_en.tr;
}
