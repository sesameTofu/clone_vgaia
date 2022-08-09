import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/domain/usecase/smart_otp_usecase.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/smart_otp/model/smart_otp_model.dart';

class ItemAccountSmartOTPController extends BaseController {
  ItemAccountSmartOTPController(this.smartOtp);
  final SmartOtp smartOtp;

  final SmartOTPUseCase _userCase = SmartOTPUseCase();

  RxNotify<String> codeOTP = ''.objective;

  @override
  void onInit() {
    getCodeOTP();
    super.onInit();
  }

  void getCodeOTP() {
    codeOTP.value = _userCase.getOtpCode(smartOtp.deviceKey ?? '');
  }
}
