// import 'package:flutter_mobile/data/source/dio/api/rest_client_auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter_mobile/controller/device_manager.dart';
import 'package:flutter_mobile/data/source/dio/api_error.dart';
import 'package:flutter_mobile/data/source/dio/api_response.dart';
import 'package:flutter_mobile/data/source/dio/rest_client.dart';
import 'package:flutter_mobile/data/source/firebase/firebase_manager.dart';
import 'package:flutter_mobile/domain/model/account_infor/account_infor.dart';
import 'package:flutter_mobile/domain/model/params/login_param.dart';
import 'package:flutter_mobile/domain/repository/user_repository.dart';
import 'package:flutter_mobile/global/app_url.dart';
import 'package:flutter_mobile/utils/device.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(this._client);

  final RestClient _client;

  @override
  Future<String?> login(LoginPrams params) async {
    final ApiResponse response = await _client.post(
      'login',
      options: Options(headers: <String, dynamic>{'IsMobile': '1'}),
      data: params.toJson(),
    );

    if (response.statusCode == 1) {
      throw ApiError.fromResponse(response);
    }

    return response.data as String?;
  }

  @override
  Future<void> refreshToken(String refreshToken) {
    throw UnimplementedError();
  }

  @override
  Future<AccountInfor?> inqueryAccount({required String accountNo}) async {
    final ApiResponse response = await _client.post('inqueryAccount',
        data: <String, dynamic>{'subAccoNo': accountNo});

    if (response.statusCode == 0) {
      return AccountInfor.fromJson(response.data as Map<String, dynamic>);
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<void> initNotification(String masterAccount) async {
    final DeviceInfo _deviceInfo = DeviceManager().deviceInfo;
    await _client.post(
      AppUrl.initNotification,
      data: <String, dynamic>{
        'masterAccount': masterAccount,
        'deviceId': _deviceInfo.deviceId,
        'platform': _deviceInfo.deviceInfo?.os,
        'pushId': FirebaseManager.share.token
      },
      options: Options(contentType: Headers.jsonContentType),
    );
  }
}
