import 'package:flutter_mobile/data/repository/settings_repository_impl.dart';
import 'package:flutter_mobile/domain/model/authencation/service_summary.dart';
import 'package:flutter_mobile/domain/model/authencation/srv_4511_result_data3.dart';
import 'package:flutter_mobile/domain/model/service_notice.dart';
import 'package:flutter_mobile/domain/model/smart_otp/smart_otp_device_data.dart';
import 'package:flutter_mobile/domain/repository/setting_repository.dart';

class SettingUsecase {
  final SettingsRepository _settingsRepository = SettingsRepositoryImpl();

  Future<void> getServiceOfCustomer(String custNo,
      {required Function(Srv4511ResultData3) onSuccess,
      required Function(dynamic) onFailure}) async {
    try {
      final ServiceSummary? _respoinse =
          await _settingsRepository.getServiceOfCustomer(custNo: custNo);
      if (_respoinse?.frontUserAuthenData != null) {
        onSuccess(_respoinse!.frontUserAuthenData!);
      }
    } catch (err) {
      onFailure(err);
    }
  }

  /// [flag] `0`: Đăng ký, `1`: Bỏ
  Future<void> updateOneTimeAuthen(
      {String? custNo,
      required num flag,
      required Function(bool) onSuccess,
      required Function(dynamic) onFailure}) async {
    try {
      final bool _response = await _settingsRepository.updateOneTimeAuthen(
          custNo: custNo, flag: flag);

      onSuccess(_response);
    } catch (err) {
      onFailure(err);
    }
  }

  Future<void> findListServiceNotice(
      {String? custNo,
      required String custCd,
      required Function(List<ServiceNotice>?) onSuccess,
      required Function(dynamic) onFailure}) async {
    try {
      final List<ServiceNotice>? _response = await _settingsRepository
          .findListServiceNotice(custNo: custNo, custCd: custCd);

      onSuccess(_response);
    } catch (err) {
      onFailure(err);
    }
  }

  Future<void> registerNotice(
      {required String custCd,
      String? custNo,
      required String serviceGroupId,
      required String status,
      required Function(bool) onSuccess,
      required Function(dynamic) onFailure}) async {
    try {
      final bool _response = await _settingsRepository.registerNotice(
          custNo: custNo,
          custCd: custCd,
          serviceGroupId: serviceGroupId,
          status: status);

      onSuccess(_response);
    } catch (err) {
      onFailure(err);
    }
  }

  Future<void> findListSmartOtpDevice(
      {String? custNo,
      required String status,
      required Function(List<SmartOtpDeviceData>) onSuccess,
      required Function(dynamic) onFailure}) async {
    try {
      final List<SmartOtpDeviceData> _response = await _settingsRepository
          .findListSmartOtpDevice(custNo: custNo, status: status);

      onSuccess(_response);
    } catch (err) {
      onFailure(err);
    }
  }

  Future<void> deactiveSmartOtpDevice(
      {String? custNo,
      required String deviceId,
      required Function(bool) onSuccess,
      required Function(dynamic) onFailure}) async {
    try {
      final bool _response = await _settingsRepository.deactiveSmartOtpDevice(
          custNo: custNo, deviceId: deviceId);

      onSuccess(_response);
    } catch (err) {
      onFailure(err);
    }
  }

  Future<void> userChangePassword(
      {required String currentPassword,
      required String newPassword,
      required String confirmPassword,
      required Function onSuccess,
      required Function(dynamic) onFailure}) async {
    try {
      await _settingsRepository.userChangePassword(
          confirmPassword: confirmPassword,
          currentPassword: currentPassword,
          newPassword: newPassword);

      onSuccess();
    } catch (err) {
      onFailure(err);
    }
  }

  Future<void> changePinCd(
      {required String currentPassword,
      required String newPassword,
      required String confirmPassword,
      required Function onSuccess,
      required Function(dynamic) onFailure}) async {
    try {
      await _settingsRepository.changePinCd(
          confirmPassword: confirmPassword,
          currentPassword: currentPassword,
          newPassword: newPassword);

      onSuccess();
    } catch (err) {
      onFailure(err);
    }
  }
}
