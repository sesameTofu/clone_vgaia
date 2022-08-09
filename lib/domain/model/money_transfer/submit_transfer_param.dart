class SubmitTransferParam {
  SubmitTransferParam({
    required this.alloDate,
    required this.refNo,
    required this.subAccoNo,
    required this.subAccoTo,
    required this.subAccCd,
    required this.toSubAccCd,
    required this.amount,
    required this.remarks,
    required this.sourceChannel,
    required this.password,
    required this.timeStamp,
    required this.mode,
    required this.otpCode,
  });

  num? alloDate;
  num? refNo;
  String? subAccoNo;
  String? subAccoTo;
  num? subAccCd;
  num? toSubAccCd;
  num? amount;
  String? remarks;
  num? sourceChannel;
  num? password;
  String? timeStamp;
  num? mode;
  String? otpCode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'alloDate': alloDate,
      'refNo': refNo,
      'subAccoNo': subAccoNo,
      'subAccoTo': subAccoTo,
      'subAccCd': subAccCd,
      'toSubAccCd': toSubAccCd,
      'amount': amount,
      'remarks': remarks,
      'sourceChannel': sourceChannel,
      'password': password,
      'timeStamp': timeStamp,
      'mode': mode,
      'otpCode': otpCode,
    };
  }
}
