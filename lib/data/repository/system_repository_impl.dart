import 'package:flutter_mobile/data/source/dio/api/rest_client_base.dart';
import 'package:flutter_mobile/data/source/dio/api_response.dart';
import 'package:flutter_mobile/data/source/dio/rest_client.dart';
import 'package:flutter_mobile/domain/model/front_initial_model_mobile.dart';
import 'package:flutter_mobile/domain/repository/system_repository.dart';

class SystemRepositoryIpml extends SystemRepository {
  final RestClient _client = RestClientBase();

  @override
  Future<FrontInitialModelMobile?> initTradingAnonymous() async {
    final ApiResponse response = await _client
        .post('public/initTradingAnonymous', data: <String, dynamic>{
      'param':
          'ORDER_TYPE|SUB_ACCOUNT|ENTRUST|CATEGORY|PARAMETER|PARAMETER_ADDITION|ENTRUST_TYPE|DERT_SECPRICE|ENTRUST_TYPE_DETAIL|SECURITIES|ADF_PARAMETER',
    });

    if (response.statusCode == 0 && response.data != null) {
      return FrontInitialModelMobile.fromJson(
          response.data as Map<String, dynamic>);
    }

    return null;
  }

  @override
  Future<FrontInitialModelMobile?> initTradingMobile() async {
    final ApiResponse response = await _client.post(
      'initTradingMobile',
      data: <String, dynamic>{
        'param': <String>[
          'ORDER_TYPE',
          'SUB_ACCOUNT',
          'ENTRUST',
          'CATEGORY',
          'PARAMETER',
          'PARAMETER_ADDITION',
          'ENTRUST_TYPE',
          'DERT_SECPRICE',
          'ENTRUST_TYPE_DETAIL',
          'SECURITIES',
          'ADF_PARAMETER',
        ].join('|'),
      },
    );
    if (response.statusCode == 0) {
      final FrontInitialModelMobile data = FrontInitialModelMobile.fromJson(
          response.data as Map<String, dynamic>);
      return data;
    }
    return null;
  }
}
