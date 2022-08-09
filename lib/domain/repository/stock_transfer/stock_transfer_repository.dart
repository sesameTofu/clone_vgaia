import 'package:flutter_mobile/domain/model/stock_transfer/stock_transfer_model.dart';

abstract class StockTransferRepository {
  Future<List<StockTransferModel>> getHistoryTransfer(
      {String? subAccoNoFrom, String? fromDate, String? toDate});
}
