import 'package:flutter_mobile/data/source/dio/api/rest_client_base.dart';
import 'package:flutter_mobile/data/source/dio/api_error.dart';
import 'package:flutter_mobile/data/source/dio/api_response.dart';
import 'package:flutter_mobile/domain/repository/stock_transfer/submit_transfer_sec_repository.dart';
import 'package:flutter_mobile/global/app_url.dart';

class SubmitTransferSecRepositoryImpl implements SubmitTransferSecRepository {
  final RestClientBase _client = RestClientBase();

  @override
  Future<void> submitTransferSec(
      {String? subAcccoNoFrom,
      String? subAcccoNoTo,
      String? subAccCdFrom,
      String? subAccCdTo,
      String? secCd,
      String? quantity,
      String? price,
      String? remarks}) async {
    final ApiResponse response = await _client.post(
      AppUrl.inquiryAccountTransferSec,
      queryParameters: <String, dynamic>{
        'subAcccoNoFrom': subAcccoNoFrom,
        'subAcccoNoTo': subAcccoNoTo,
        'subAccCdFrom': subAccCdFrom,
        'subAccCdTo': subAccCdTo,
        'secCd': secCd,
        'quantity': quantity,
        'price': price,
        'remarks': remarks,
      },
    );
    if (response.statusCode == 0 && response.data != null) {
      return response.data;
    }
    throw ApiError.fromResponse(response);
  }
}
