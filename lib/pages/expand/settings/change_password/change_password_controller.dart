// ignore_for_file: constant_identifier_names

import 'package:flutter_mobile/controller/session_manager.dart';
import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/domain/usecase/setting/setting_usecase.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';

enum TypeChangePass { LOGIN_PASS, ORDER_PASS }

class ChangePasswordController extends BaseController {
  final SettingUsecase _settingUsecase = SettingUsecase();

  TextEditingController currentPasswordCtrl = TextEditingController();
  TextEditingController newPasswordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();

  FocusNode currentNode = FocusNode();
  FocusNode newNode = FocusNode();
  FocusNode confirmNode = FocusNode();

  TypeChangePass _typeChangePass = TypeChangePass.LOGIN_PASS;

  //
  RxNotify<bool> isCanClick = false.objective;

  @override
  void onInit() {
    super.onInit();
    currentPasswordCtrl.addListener(() {
      isCanClick.value = currentPasswordCtrl.text.trim().isNotEmpty;
    });
    newPasswordCtrl.addListener(() {
      isCanClick.value = newPasswordCtrl.text.trim().isNotEmpty;
    });
    confirmPasswordCtrl.addListener(() {
      isCanClick.value = confirmPasswordCtrl.text.trim().isNotEmpty;
    });
  }

  Future<void> onChangePassword() async {
    if (!_validateInput) {
      return;
    }
    showLoading();
    if (_typeChangePass == TypeChangePass.LOGIN_PASS) {
      _onChangePassLogin();
    } else {
      _onChangePassOrder();
    }
    hideLoading();
  }

  void onChangeSegmant(int index) {
    if (index == 0 && _typeChangePass != TypeChangePass.LOGIN_PASS) {
      _clearTextControll();
      _typeChangePass = TypeChangePass.LOGIN_PASS;
    }
    if (index == 1 && _typeChangePass != TypeChangePass.ORDER_PASS) {
      _clearTextControll();
      _typeChangePass = TypeChangePass.ORDER_PASS;
    }
  }

  Future<void> _onChangePassLogin() async {
    await _settingUsecase.userChangePassword(
        currentPassword: currentPasswordCtrl.text.trim(),
        newPassword: newPasswordCtrl.text.trim(),
        confirmPassword: confirmPasswordCtrl.text.trim(),
        onSuccess: () async {
          AppToast.showSuccess(LocaleKeys.goline_ChangePasswordSuccess.tr);
          await 1.seconds.delay();
          SessionManager().logout();
        },
        onFailure: (dynamic error) {
          AppToast.showError(getError(error));
        });
  }

  Future<void> _onChangePassOrder() async {
    await _settingUsecase.changePinCd(
        currentPassword: currentPasswordCtrl.text.trim(),
        newPassword: newPasswordCtrl.text.trim(),
        confirmPassword: confirmPasswordCtrl.text.trim(),
        onSuccess: () {
          _clearTextControll();
          AppToast.showSuccess(LocaleKeys.goline_ChangePinSuccess.tr);
        },
        onFailure: (dynamic error) {
          AppToast.showError(getError(error));
        });
  }

  bool get _validateInput {
    if (currentPasswordCtrl.text.trim().isEmpty) {
      AppToast.showError(LocaleKeys.goline_CannotBeBlankOldPassword.tr);
      return false;
    } else if (newPasswordCtrl.text.trim().isEmpty) {
      AppToast.showError(LocaleKeys.goline_CannotBeBlankNewPassword.tr);
      return false;
    } else if (confirmPasswordCtrl.text.trim() != newPasswordCtrl.text.trim()) {
      AppToast.showError(LocaleKeys.goline_PasswordIsNotMatch.tr);
      return false;
    }
    return true;
  }

  void _clearTextControll() {
    currentPasswordCtrl.clear();
    newPasswordCtrl.clear();
    confirmPasswordCtrl.clear();
  }
}
