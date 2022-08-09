import 'dart:async';

import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/data/source/dio/api_error.dart';
import 'package:flutter_mobile/domain/usecase/smart_otp_usecase.dart';
import 'package:flutter_mobile/domain/usecase/user_use_case.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/smart_otp/model/smart_otp_model.dart';
import 'package:flutter_mobile/pin_code/pin_code_mixin.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_mobile/widgets/pop_up/show_popup.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SmartOTPController extends BaseController with BaseMixin, PinCodeMixin {
  final UserUseCase _userUseCase = UserUseCase.share;
  final SmartOTPUseCase _smartOTPuseCase = SmartOTPUseCase();

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  TextEditingController controllerRegister = TextEditingController(text: '');
  FocusNode focusAccRegister = FocusNode();
  RxListNotify<SmartOtp> listSmartOtp = <SmartOtp>[].objective;

  @override
  void onInit() {
    //
    getListSmartOTP();

    super.onInit();
  }

  Future<void> getListSmartOTP() async {
    listSmartOtp.value = await _smartOTPuseCase.getListSmartOTP();
    refreshController.refreshCompleted();
  }

  void _userNameFocusChanged() {
    controllerRegister.text =
        _userUseCase.focusUserName(controllerRegister.text);
  }

  Future<void> onClickActiveOTP({bool reSendOtp = false}) async {
    if (controllerRegister.text.trim().isEmpty) {
      AppToast.showError(LocaleKeys.msg_bank_account_no_is_empty.tr);
      return;
    }
    focusAccRegister.unfocus();

    _userNameFocusChanged();
    showLoading();
    // Kích hoạt
    await _smartOTPuseCase.registerSmartOtpDevice(
      custNo: controllerRegister.text.trim(),
      onSuccess: () async {
        hideLoading();
        // popup cònfirm OTP
        dialogCheckOTPAcive(controllerRegister.text.trim()).then((bool? value) {
          if (value != null && value) {
            getListSmartOTP();
          }
        });
      },
      onFailure: (ApiError error) {
        ShowPopup().popUpNoty(
            content: getError(error), textButton: LocaleKeys.close.tr);
      },
    );
    hideLoading();
  }

  // xóa item TK đã đang ký
  void removeSmartOTP(SmartOtp smartOtp) {
    ShowPopup().popUpConfirm(
        content: LocaleKeys.title_ask_remove_device_smart_otp.tr,
        textConfirm: LocaleKeys.delete.tr,
        bgColorConfirm: color.red50,
        onClickConfirm: () async {
          await _smartOTPuseCase.removeSmartOtp(smartOtp);
          // lấy list data
          getListSmartOTP();
        });
  }

  @override
  void dispose() {
    controllerRegister.dispose();
    refreshController.dispose();
    // _timer?.cancel();
    super.dispose();
  }
}
