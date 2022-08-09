class SubmitTransferBankParam {
  SubmitTransferBankParam({
    required this.subAccoNo,
    required this.subAccCd,
    required this.bankAccoNumber,
    required this.bankAccoName,
    required this.bankCd,
    required this.bankBranchName,
    required this.bankBranchLocationCd,
    required this.amount,
    required this.feeType,
    required this.remarks,
    required this.sourceChannel,
    required this.otpCode,
  });

  String? subAccoNo;
  String? subAccCd;
  String? bankAccoNumber;
  String? bankAccoName;
  String? bankCd;
  String? bankBranchName;
  num? bankBranchLocationCd;
  num? amount;
  num? feeType;
  String? remarks;
  num? sourceChannel;
  String? otpCode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subAccoNo': subAccoNo,
      'subAccCd': subAccCd,
      'bankAccoNumber': bankAccoNumber,
      'bankAccoName': bankAccoName,
      'bankCd': bankCd,
      'bankBranchName': bankBranchName,
      'bankBranchLocationCd': bankBranchLocationCd,
      'amount': amount,
      'feeType': feeType,
      'remarks': remarks,
      'sourceChannel': sourceChannel,
      'otpCode': otpCode,
    };
  }
}
