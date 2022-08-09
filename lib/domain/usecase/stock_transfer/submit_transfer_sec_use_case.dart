import 'package:flutter_mobile/data/repository/stock_transfer/submit_transfer_sec_repository_impl.dart';
import 'package:flutter_mobile/domain/repository/stock_transfer/submit_transfer_sec_repository.dart';

class SubmitTransferSecUseCase {
  final SubmitTransferSecRepository _submitTransferSecRepo =
      SubmitTransferSecRepositoryImpl();

  Future<void> submitTransferSec({
    String? subAcccoNoFrom,
    String? subAcccoNoTo,
    String? subAccCdFrom,
    String? subAccCdTo,
    String? secCd,
    String? quantity,
    String? price,
    String? remarks,
  }) async {
    await _submitTransferSecRepo.submitTransferSec(
      subAcccoNoFrom: subAcccoNoFrom,
      subAcccoNoTo: subAcccoNoTo,
      subAccCdFrom: subAccCdFrom,
      subAccCdTo: subAccCdTo,
      secCd: secCd,
      quantity: quantity,
      price: price,
      remarks: remarks,
    );
  }
}
