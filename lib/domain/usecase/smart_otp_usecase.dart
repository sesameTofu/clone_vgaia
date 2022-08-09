import 'package:flutter_mobile/controller/device_manager.dart';
import 'package:flutter_mobile/data/repository/smart_otp/smart_otp_repository_impl.dart';
import 'package:flutter_mobile/domain/model/smart_otp/matrix_model.dart';
import 'package:flutter_mobile/domain/repository/smart_otp/smart_otp_generator.dart';
import 'package:flutter_mobile/domain/repository/smart_otp/smart_otp_repository.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/smart_otp/model/smart_otp_model.dart';
import 'package:flutter_mobile/utils/device.dart';

class SmartOTPUseCase {
  final SmartOTPRepository _smartOTPRepository = SmartOTPRepositoryImpl();
  final SmartOtpGenerator _smartOtpGenerator = SmartOtpGenerator();

  Future<void> registerSmartOtpDevice({
    String? custNo,
    required Function onSuccess,
    required Function onFailure,
  }) async {
    try {
      final DeviceInfo deviceInfo = DeviceManager().deviceInfo;
      await _smartOTPRepository.registerSmartOtpDevice(
        custNo: custNo,
        deviceId: deviceInfo.deviceId,
      );
      onSuccess();
    } catch (e) {
      onFailure(e);
    }
  }

  Future<void> activeSmartOtpDevice({
    required String custNo,
    required String otpCode,
    required Function onSuccess,
    required Function onFailure,
  }) async {
    //   final DeviceInfo deviceInfo = DeviceManager().deviceInfo;
    // try {
    //   await _smartOTPRepository.activeSmartOtpDevice(
    //     custNo: custNo,
    //     deviceId: deviceInfo.deviceId,
    //     deviceInfo: deviceInfo.deviceInfo.t,
    //     deviceKey: deviceInfo.deviceKey(otpCode),
    //     otpCode: otpCode,
    //   );
    //   final SmartOtp smartOtp = SmartOtp(
    //     account: custNo,
    //     deviceKey: deviceInfo.deviceKey(otpCode),
    //     activatedTime: DateTime.now().millisecond,
    //   );
    //   await _smartOTPRepository.addSmartOtp(smartOtp);
    //   onSuccess();
    // } catch (e) {
    //   onFailure(e);
    // }
  }

  Future<List<SmartOtp>> getListSmartOTP() async {
    return _smartOTPRepository.getSmartOtpList();
  }

  String getOtpCode(String deviceKey) {
    return _smartOtpGenerator.getOtpCode(deviceKey);
  }

  Future<void> removeSmartOtp(SmartOtp smartOtp) async {
    _smartOTPRepository.removeSmartOtp(smartOtp);
  }

  // lấy Smart otp theo UserId
  Future<String?> getSmartOtp(String accountId) async {
    final List<SmartOtp> _list = await getListSmartOTP();
    final SmartOtp? _otp = _list
        .firstWhereCanNull((SmartOtp element) => element.account == accountId);
    if (_otp == null) {
      AppToast.showError(LocaleKeys.goline_SmartOtpDeviceNotRegister.tr);
      return null;
    } else {
      return getOtpCode(_otp.deviceKey!);
    }
  }

  Future<void> getOtpAuthenCode(
      {required int businessCd,
      required int pinType,
      required Function(MatrixModel) onSuccess,
      required Function(dynamic) onFailure}) async {
    try {
      final MatrixModel? _respoinse = await _smartOTPRepository
          .getOtpAuthenCode(businessCd: businessCd, pinType: pinType);
      if (_respoinse != null) {
        onSuccess(_respoinse);
      }
    } catch (err) {
      onFailure(err);
    }
  }
}
