import 'package:flutter_mobile/config/config.dart';
import 'package:flutter_mobile/controller/session_manager.dart';
import 'package:flutter_mobile/data/source/dio/api/rest_client_base.dart';
import 'package:flutter_mobile/data/source/dio/api_response.dart';
import 'package:flutter_mobile/data/source/dio/rest_client.dart';
import 'package:flutter_mobile/data/source/gprc/grpc_client.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pbgrpc.dart';
import 'package:flutter_mobile/domain/model/screener/screener.dart';
import 'package:flutter_mobile/domain/model/screener/screener_model.dart';
import 'package:flutter_mobile/domain/repository/screener/screener_reponsitory.dart';
import 'package:flutter_mobile/global/app_log.dart';
import 'package:flutter_mobile/global/app_url.dart';
import 'package:grpc/grpc.dart';

class ScreenerReponsitoryImpl extends ScreenerReponsitory {
  final RestClient _restClient = RestClientBase();
  final MarketApiClient _marketApiClient = MarketApiClient(
    GrpcClient.share.client,
    options: GrpcClient.share.options,
  );

  @override
  Future<List<Screeeners>?> getScreeners() async {
    final dynamic _response = await _restClient.get(AppUrl.screenerFindAll,
        queryParameters: <String, dynamic>{
          'userId': SessionManager().username
        });

    final ApiResponse _apiResponse = ApiResponse.fromJson(_response);
    if (_apiResponse.data != null) {
      return List<Screeeners>.from((_apiResponse.data as List<dynamic>)
          .map((dynamic e) => Screeeners.fromMap(e)));
    }
    return null;
  }

  @override
  Future<void> createScreener(ScreenerModel screenerModel) async {
    // final dynamic _response = await _restClient.post(AppUrl.screenerSave,
    //     options: Options(
    //       contentType: 'application/json',
    //     ),
    //     queryParameters: <String, dynamic>{'userId': SessionManager().username},
    //     data: screenerModel.toMap());
//   // TODO: implement aprDateTime
    // final ApiResponse _apiResponse = ApiResponse.fromJson(_response);
    // if (_apiResponse.status != null &&
    //     _apiResponse.status!.toUpperCase().contains('ERROR')) {
    //   throw _apiResponse.description ?? 'error';
    // }
    return;
  }

  @override
  Future<void> deleteScreener(String idScreener) async {
    // final dynamic _response = await _restClient
    //     .delete(AppUrl.screenerDeleteById, queryParameters: <String, dynamic>{
    //   'id': idScreener,
    //   'userId': SessionManager().username
    // });
    //   // TODO: API

    // final ApiResponse _apiResponse = ApiResponse.fromJson(_response);
    // if (_apiResponse.status != null &&
    //     _apiResponse.status!.toUpperCase().contains('ERROR')) {
    //   throw _apiResponse.description ?? 'error';
    // }
    return;
  }

  @override
  Future<ResponseStream<ScreenerResponse>> findIndicatorScreener(
      {required ScreenerModel filter, int? offset}) async {
    final ScreenerInput _request = ScreenerInput()
      ..marketCd = NullableString(data: filter.listIdMarket)
      ..industries = NullableString(data: filter.listIdIndustries)
      ..quotesIndicators = NullableString(data: filter.listIdQuotes)
      ..financialIndicators = NullableString(data: filter.listIdFinancial)
      ..technicalIndicators = NullableString(data: filter.listIdTechnical)
      ..orderFieldType = filter.orderFieldType
      ..orderType = filter.orderType
      ..offset = offset == null ? 0 : offset * 20
      ..limit = 20
      ..authenCode = AppConfig.config.authenCode;

    AppLog.log.info('findIndicatorScreener: $_request');

    final ResponseStream<ScreenerResponse> _result =
        _marketApiClient.findIndicatorScreener(_request);

    return _result;
  }
}
