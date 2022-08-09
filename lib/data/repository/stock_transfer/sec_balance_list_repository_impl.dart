import 'package:flutter_mobile/data/source/dio/api/rest_client_base.dart';
import 'package:flutter_mobile/data/source/dio/api_error.dart';
import 'package:flutter_mobile/data/source/dio/api_response.dart';
import 'package:flutter_mobile/domain/model/stock_transfer/sec_balance_list_model.dart';
import 'package:flutter_mobile/domain/repository/stock_transfer/sec_balance_list_repository.dart';
import 'package:flutter_mobile/global/app_url.dart';

class SecBalanceListRepositoryImpl implements SecBalanceListRepository {
  final RestClientBase _client = RestClientBase();

  @override
  Future<List<SecBalanceListModel>> getSecBalanceList(
      {String? subAccoNoFrom, String? subAccoNoTo}) async {
    final ApiResponse response = await _client.post(
      AppUrl.inquiryAccountTransferSec,
      queryParameters: <String, dynamic>{
        'subAccoNoFrom': subAccoNoFrom,
        'subAccoNoTo': subAccoNoTo,
      },
    );
    final Map<String, dynamic> data = response.data as Map<String, dynamic>;
    if (response.statusCode == 0 && response.data != null) {
      return <SecBalanceListModel>[
        ...(data['secBalanceList'] as List<dynamic>)
            .map((dynamic e) =>
                SecBalanceListModel.fromJson(e as Map<String, dynamic>))
            .toList()
      ];
    }
    throw ApiError.fromResponse(response);
  }
}
