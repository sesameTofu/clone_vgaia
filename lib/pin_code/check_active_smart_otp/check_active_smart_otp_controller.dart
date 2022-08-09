import 'dart:async';

import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/data/source/dio/api_error.dart';
import 'package:flutter_mobile/domain/usecase/smart_otp_usecase.dart';
import 'package:flutter_mobile/global/app_const.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';

class CheckActiveSmartOTPController extends BaseController {
  CheckActiveSmartOTPController(this.accRegister);

  final String accRegister;

  final SmartOTPUseCase _smartOTPuseCase = SmartOTPUseCase();

  Timer? _timer;
  final RxNotify<int> countdownOTP = AppConst.timeLiveOTP.objective;
  final TextEditingController textPinCodeController = TextEditingController();

  @override
  void onInit() {
    _startTimer();
    super.onInit();
  }

  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }

    const Duration oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (countdownOTP.value > 0) {
          countdownOTP.value--;
        }
      },
    );
  }

  // button: Gửi lại mã
  Future<void> onReSendOtp() async {
    await _smartOTPuseCase.registerSmartOtpDevice(
      custNo: accRegister,
      onSuccess: () {
        AppToast.showSuccess(LocaleKeys.goline_SubmitSuccess.tr);
        countdownOTP.value = AppConst.timeLiveOTP;
      },
      onFailure: (ApiError error) {
        AppToast.showError(getError(error));
      },
    );
  }

  //  button : Xác nhận
  void onClickConfirm() {
    if (textPinCodeController.text.isNotEmpty) {
      _activeSmartOtpDevice();
    } else {
      AppToast.showError(LocaleKeys.goline_NotEnterOtpCode.tr);
    }
  }

  //  Đăng ký Smart OTP
  Future<void> _activeSmartOtpDevice() async {
    showLoading();
    await _smartOTPuseCase.activeSmartOtpDevice(
      custNo: accRegister,
      otpCode: textPinCodeController.text.trim(),
      onSuccess: () async {
        // close popup cònfirm
        Get.back(result: true);
      },
      onFailure: (ApiError error) {
        AppToast.showError(getError(error));
      },
    );
    hideLoading();
  }

  @override
  void dispose() {
    textPinCodeController.dispose();
    countdownOTP.dispose();
    _timer?.cancel();
    super.dispose();
  }
}
