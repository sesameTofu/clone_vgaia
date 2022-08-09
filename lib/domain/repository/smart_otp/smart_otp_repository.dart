import 'package:flutter_mobile/domain/model/smart_otp/matrix_model.dart';
import 'package:flutter_mobile/pages/smart_otp/model/smart_otp_model.dart';

abstract class SmartOTPRepository {
  Future<void> registerSmartOtpDevice({
    String? custNo,
    String? deviceId,
  });

  Future<void> activeSmartOtpDevice({
    String? custNo,
    String? deviceKey,
    String? deviceId,
    String? deviceInfo,
    String? otpCode,
  });

  Future<List<SmartOtp>> getSmartOtpList();

  Future<void> saveSmartOtpList(List<SmartOtp> smartOtp);

  Future<void> addSmartOtp(SmartOtp smartOtp);

  Future<void> removeSmartOtp(SmartOtp smartOtp);

  Future<void> removeAccountOtp(String account);

  Future<MatrixModel?> getOtpAuthenCode(
      {required int businessCd, required int pinType});
}
