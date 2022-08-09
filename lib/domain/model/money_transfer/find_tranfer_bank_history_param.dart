class FindTransferBankParam {
  FindTransferBankParam({
    required this.fromdate,
    required this.toDate,
    required this.subAccoNoFrom,
    this.bankAccountNo,
    this.bankCd,
    required this.status,
  });
  String? fromdate;
  String? toDate;
  String? subAccoNoFrom;
  String? bankAccountNo;
  String? bankCd;
  num? status;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fromDate': fromdate,
      'toDate': toDate,
      'subAccoNoFrom': subAccoNoFrom,
      'bankAccountNo': bankAccountNo,
      'bankCd': bankCd,
      'status': status,
    };
  }
}
