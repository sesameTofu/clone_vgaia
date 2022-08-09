abstract class SubmitTransferSecRepository {
  Future<void> submitTransferSec(
      {String? subAcccoNoFrom,
      String? subAcccoNoTo,
      String? subAccCdFrom,
      String? subAccCdTo,
      String? secCd,
      String? quantity,
      String? price,
      String? remarks});
}
