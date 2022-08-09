import 'package:flutter_mobile/data/source/dio/api/rest_client_base.dart';
import 'package:flutter_mobile/data/source/dio/api_error.dart';
import 'package:flutter_mobile/data/source/dio/api_response.dart';
import 'package:flutter_mobile/domain/model/stock_transfer/stock_transfer_model.dart';
import 'package:flutter_mobile/domain/repository/stock_transfer/stock_transfer_repository.dart';
import 'package:flutter_mobile/global/app_url.dart';

class StockTransferRepositoryImpl implements StockTransferRepository {
  final RestClientBase _client = RestClientBase();

  @override
  Future<List<StockTransferModel>> getHistoryTransfer(
      {String? subAccoNoFrom, String? fromDate, String? toDate}) async {
    final ApiResponse response = await _client.post(
      AppUrl.findTransferSecHistory,
      queryParameters: <String, dynamic>{
        'subAccoNoFrom': subAccoNoFrom,
        'fromDate': fromDate,
        'toDate': toDate,
      },
    );
    if (response.statusCode == 0 && response.data != null) {
      return <StockTransferModel>[
        ...(response.data as List<dynamic>)
            .map((dynamic e) =>
                StockTransferModel.fromJson(e as Map<String, dynamic>))
            .toList()
      ];
    }
    throw ApiError.fromResponse(response);
  }
}
