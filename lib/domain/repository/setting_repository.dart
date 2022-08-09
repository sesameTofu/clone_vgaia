import 'package:flutter_mobile/domain/model/authencation/service_summary.dart';
import 'package:flutter_mobile/domain/model/service_notice.dart';
import 'package:flutter_mobile/domain/model/smart_otp/smart_otp_device_data.dart';

abstract class SettingsRepository {
  Future<ServiceSummary?> getServiceOfCustomer({required String custNo});

  Future<bool> updateOneTimeAuthen({String? custNo, required num flag});

  Future<List<ServiceNotice>?> findListServiceNotice(
      {String? custNo, required String custCd});

  Future<bool> registerNotice(
      {required String custCd,
      String? custNo,
      required String serviceGroupId,
      required String status});

  Future<List<SmartOtpDeviceData>> findListSmartOtpDevice(
      {String? custNo, required String status});

  Future<bool> deactiveSmartOtpDevice(
      {String? custNo, required String deviceId});

  Future<void> userChangePassword(
      {required String currentPassword,
      required String newPassword,
      required String confirmPassword});

  Future<void> changePinCd(
      {required String currentPassword,
      required String newPassword,
      required String confirmPassword});
}
