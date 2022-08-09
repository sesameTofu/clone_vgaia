import 'package:flutter_mobile/data/repository/stock_transfer/stock_transfer_repository_impl.dart';
import 'package:flutter_mobile/domain/model/stock_transfer/stock_transfer_model.dart';
import 'package:flutter_mobile/domain/repository/stock_transfer/stock_transfer_repository.dart';

class StockTransferUseCase {
  final StockTransferRepository _stockTransferRepo =
      StockTransferRepositoryImpl();

  Future<void> getHistoryTransfer({
    String? subAccoNoFrom,
    String? fromDate,
    String? toDate,
    required Function(List<StockTransferModel> listData) onSuccess,
    required Function onFailure,
  }) async {
    try {
      final List<StockTransferModel> data =
          await _stockTransferRepo.getHistoryTransfer(
        subAccoNoFrom: subAccoNoFrom,
        fromDate: fromDate,
        toDate: toDate,
      );

      onSuccess(data);
    } catch (error) {
      onFailure(error);
    }
  }
}
