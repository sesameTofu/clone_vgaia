class TransferContract {
  TransferContract({
    this.alloDate,
    this.refNo,
    this.delCd,
    this.subAccoCd,
    this.contrDateFrom,
    this.contrDateTo,
    this.locaTransfer,
    this.bankTransfer,
    this.contrFee,
    this.smsServUse,
    this.transactionCd,
    this.status,
    this.remarks,
    this.srcChannel,
    this.approvedDateTime,
    this.approvedUserId,
    this.regDateTime,
    this.regUserId,
    this.updDateTime,
    this.updUserId,
    this.fullName,
    this.subAccoNo,
    this.branchCd,
    this.groupCd,
    this.bankAccNumber,
  });

  factory TransferContract.fromMap(Map<String, dynamic> map) {
    return TransferContract(
      alloDate: map['alloDate'],
      refNo: map['refNo'],
      delCd: map['delCd'],
      subAccoCd: map['subAccoCd'],
      contrDateFrom: map['contrDateFrom'],
      contrDateTo: map['contrDateTo'],
      locaTransfer: map['locaTransfer'],
      bankTransfer: map['bankTransfer'],
      contrFee: map['contrFee'],
      smsServUse: map['smsServUse'],
      transactionCd: map['transactionCd'],
      status: map['status'],
      remarks: map['remarks'],
      srcChannel: map['srcChannel'],
      approvedDateTime: map['approvedDateTime'],
      approvedUserId: map['approvedUserId'],
      regDateTime: map['regDateTime'],
      regUserId: map['regUserId'],
      updDateTime: map['updDateTime'],
      updUserId: map['updUserId'],
      fullName: map['fullName'],
      subAccoNo: map['subAccoNo'],
      branchCd: map['branchCd'],
      groupCd: map['groupCd'],
      bankAccNumber: map['bankAccNumber'],
    );
  }

  num? alloDate;

  num? refNo;

  num? delCd;

  num? subAccoCd;

  num? contrDateFrom;

  num? contrDateTo;

  num? locaTransfer;

  num? bankTransfer;

  num? contrFee;

  num? smsServUse;

  String? transactionCd;

  num? status;

  String? remarks;

  num? srcChannel;

  double? approvedDateTime;

  String? approvedUserId;

  double? regDateTime;

  String? regUserId;

  double? updDateTime;

  String? updUserId;

  String? fullName;

  String? subAccoNo;

  num? branchCd;

  String? groupCd;

  String? bankAccNumber;
}
