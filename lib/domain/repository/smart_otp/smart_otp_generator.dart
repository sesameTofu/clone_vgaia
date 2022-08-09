import 'package:base32/base32.dart';
import 'package:flutter_mobile/global/app_const.dart';
import 'package:otp/otp.dart';

class SmartOtpGenerator {
  String getOtpCode(String deviceKey) {
    return OTP.generateTOTPCodeString(
      base32.encodeString(deviceKey),
      DateTime.now().millisecondsSinceEpoch,
      interval: AppConst.timeLiveOTP,
      length: 6,
      algorithm: Algorithm.SHA1,
      isGoogle: true,
    );
  }
}
