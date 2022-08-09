import 'dart:convert';

import 'package:flutter_mobile/controller/session_manager.dart';
import 'package:flutter_mobile/data/source/dio/api/rest_client_base.dart';
import 'package:flutter_mobile/data/source/dio/api_error.dart';
import 'package:flutter_mobile/data/source/dio/api_response.dart';
import 'package:flutter_mobile/domain/model/authencation/service_summary.dart';
import 'package:flutter_mobile/domain/model/service_notice.dart';
import 'package:flutter_mobile/domain/model/smart_otp/smart_otp_device_data.dart';
import 'package:flutter_mobile/domain/repository/setting_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final RestClientBase _client = RestClientBase();

  @override
  Future<bool> updateOneTimeAuthen({String? custNo, required num flag}) async {
    final ApiResponse response = await _client.post(
      'updateOneTimeAuthen',
      data: <String, dynamic>{
        'custNo': custNo ?? SessionManager().username,
        'flag': flag,
      },
    );
    if (response.statusCode == 0) {
      return response.statusCode == 0 && response.data != null;
    }
    // false => show thông báo lỗi
    throw ApiError.fromResponse(response);
  }

  @override
  Future<ServiceSummary?> getServiceOfCustomer({required String custNo}) async {
    final ApiResponse response = await _client.post(
      'getServiceOfCustomer',
      data: <String, dynamic>{'custNo': custNo},
    );
    if (response.statusCode == 0) {
      return ServiceSummary.fromJson(response.data as Map<String, dynamic>);
    }
    return null;
  }

  @override
  Future<List<ServiceNotice>?> findListServiceNotice(
      {String? custNo, required String custCd}) async {
    final ApiResponse _response = await _client.post(
      'findListServiceNotice',
      data: <String, dynamic>{
        'custCd': custCd,
        'custNo': custNo ?? SessionManager().username
      },
    );

    if (_response.statusCode == 0 && _response.data != null) {
      return List<ServiceNotice>.from(
          _response.data.map((dynamic x) => ServiceNotice.fromJson(x)));
    }
    return null;
  }

  @override
  Future<bool> registerNotice(
      {required String custCd,
      String? custNo,
      required String serviceGroupId,
      required String status}) async {
    final ApiResponse _response = await _client.post(
      'registerNotice',
      data: <String, dynamic>{
        'custCd': custCd,
        'custNo': custNo ?? SessionManager().username,
        'serviceGroupId': serviceGroupId,
        'status': status,
      },
    );
    if (_response.statusCode == 0) {
      return true;
    }
    // false => show thông báo lỗi
    throw ApiError.fromResponse(_response);
  }

  @override
  Future<List<SmartOtpDeviceData>> findListSmartOtpDevice(
      {String? custNo, required String status}) async {
    final ApiResponse _response = await _client.post(
      'findListSmartOtpDevice',
      data: <String, dynamic>{
        'custNo': custNo ?? SessionManager().username,
        'status': status
      },
    );
    if (_response.statusCode == 0) {
      return List<SmartOtpDeviceData>.from(
          _response.data.map((dynamic x) => SmartOtpDeviceData.fromJson(x)));
    }
    // false => show thông báo lỗi
    throw ApiError.fromResponse(_response);
  }

  @override
  Future<bool> deactiveSmartOtpDevice(
      {String? custNo, required String deviceId}) async {
    final ApiResponse _response = await _client.post(
      'deactiveSmartOtpDevice',
      data: <String, dynamic>{
        'custNo': custNo ?? SessionManager().username,
        'deviceId': deviceId
      },
    );
    if (_response.statusCode == 0) {
      return true;
    }
    // false => show thông báo lỗi
    throw ApiError.fromResponse(_response);
  }

  @override
  Future<void> userChangePassword(
      {required String currentPassword,
      required String newPassword,
      required String confirmPassword}) async {
    final ApiResponse _response = await _client.post(
      'UserChangePassword',
      data: <String, dynamic>{
        'currentPassword': currentPassword,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword,
      },
    );
    if (_response.statusCode == 0) {
      return;
    }
    // false => show thông báo lỗi
    throw ApiError.fromResponse(_response);
  }

  @override
  Future<void> changePinCd(
      {required String currentPassword,
      required String newPassword,
      required String confirmPassword}) async {
    final ApiResponse _response = await _client.post(
      'UserChangePinCD',
      data: <String, dynamic>{
        'currentPinCd': currentPassword,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword,
      },
    );
    if (_response.statusCode == 0) {
      return;
    }
    // false => show thông báo lỗi
    throw ApiError.fromResponse(_response);
  }
}
