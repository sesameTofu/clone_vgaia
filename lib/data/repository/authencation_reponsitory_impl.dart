import 'package:flutter_mobile/data/source/dio/api/rest_client_base.dart';
import 'package:flutter_mobile/data/source/dio/api_error.dart';
import 'package:flutter_mobile/data/source/dio/api_response.dart';
import 'package:flutter_mobile/domain/model/authencation/pin_data_model.dart';
import 'package:flutter_mobile/domain/repository/authentication_reponsitory.dart';

class AuthencationReponsitoryImpl extends AuthencationReponsitory {
  final RestClientBase _client = RestClientBase();

  @override
  Future<PinDataModel> checkPinType({required int businessCd}) async {
    final ApiResponse response = await _client.post('checkPinType',
        data: <String, dynamic>{'businessCd': businessCd});

    if (response.statusCode == 0 && response.data != null) {
      return PinDataModel.fromJson(response.data as Map<String, dynamic>);
    }
    throw ApiError.fromResponse(response);
  }
}
