import 'dart:convert';

import 'package:flutter_mobile/data/source/dio/api/rest_client_base.dart';
import 'package:flutter_mobile/data/source/dio/api_error.dart';
import 'package:flutter_mobile/data/source/dio/api_response.dart';
import 'package:flutter_mobile/domain/model/smart_otp/matrix_model.dart';
import 'package:flutter_mobile/domain/repository/smart_otp/smart_otp_repository.dart';
import 'package:flutter_mobile/global/app_const.dart';
import 'package:flutter_mobile/global/app_url.dart';
import 'package:flutter_mobile/pages/smart_otp/model/smart_otp_model.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SmartOTPRepositoryImpl extends SmartOTPRepository {
  final RestClientBase _restClientBase = Get.find<RestClientBase>();
  final GetStorage _storage = Get.find<GetStorage>();

  @override
  Future<void> registerSmartOtpDevice({
    String? custNo,
    String? deviceId,
  }) async {
    final ApiResponse response = await _restClientBase.post(
      AppUrl.registerSmartOtpDevice,
      data: <String, dynamic>{
        'custNo': custNo ?? '',
        'deviceId': deviceId ?? '',
      },
    );

    if (response.statusCode == 0) {
      return;
    }

    throw ApiError(
      errorCode: response.errorCode,
      message: response.message,
      extraData: null,
    );
  }

  @override
  Future<void> activeSmartOtpDevice(
      {String? custNo,
      String? deviceKey,
      String? deviceId,
      String? deviceInfo,
      String? otpCode}) async {
    final ApiResponse response = await _restClientBase.post(
      AppUrl.activeSmartOtpDevice,
      data: <String, dynamic>{
        'custNo': custNo ?? '',
        'deviceKey': deviceKey ?? '',
        'deviceId': deviceId ?? '',
        'deviceInfo': deviceInfo ?? '',
        'otpCode': otpCode ?? '',
      },
    );

    if (response.statusCode == 0) {
      return;
    }

    throw ApiError(
      errorCode: response.errorCode,
      message: response.message,
      extraData: null,
    );
  }

  @override
  Future<List<SmartOtp>> getSmartOtpList() async {
    if (_storage.hasData(AppConst.keySmartOtp)) {
      final String? accountString = _storage.read<String>(AppConst.keySmartOtp);
      if (isNotNullOrEmpty(accountString)) {
        final List<dynamic> data = jsonDecode(accountString!) as List<dynamic>;
        return data
            .map<SmartOtp>(
                (dynamic e) => SmartOtp.fromJson(e as Map<String, dynamic>))
            .toList();
      }
    }
    return <SmartOtp>[];
  }

  @override
  Future<void> saveSmartOtpList(List<SmartOtp> smartOtp) {
    final String jsonAccount = jsonEncode(smartOtp);
    return _storage.write(AppConst.keySmartOtp, jsonAccount);
  }

  @override
  Future<void> addSmartOtp(SmartOtp smartOtp) async {
    final List<SmartOtp> list = await getSmartOtpList();
    if (isNotNullOrEmpty(list)) {
      list.removeWhere(
          (SmartOtp element) => element.account == smartOtp.account);
    }
    list.add(smartOtp);
    return saveSmartOtpList(list);
  }

  @override
  Future<void> removeSmartOtp(SmartOtp smartOtp) async {
    final List<SmartOtp> list = await getSmartOtpList();
    list.removeWhere((SmartOtp element) => element.account == smartOtp.account);
    return saveSmartOtpList(list);
  }

  @override
  Future<void> removeAccountOtp(String account) async {
    final List<SmartOtp> list = await getSmartOtpList();
    list.removeWhere((SmartOtp element) => element.account == account);
    return saveSmartOtpList(list);
  }

  @override
  Future<MatrixModel?> getOtpAuthenCode(
      {required int businessCd, required int pinType}) async {
    final ApiResponse response = await _restClientBase.post('getOtpAuthenCode',
        data: <String, dynamic>{'businessCd': businessCd, 'pinType': pinType});
    if (response.statusCode == 0 && response.data != null) {
      return MatrixModel.fromJson(response.data as Map<String, dynamic>);
    }
    throw ApiError.fromResponse(response);
  }
}
