class TransferContractBank {
  TransferContractBank({
    this.alloDate,
    this.refNo,
    this.bankAccoNumber,
    this.province,
    this.delCd,
    this.subAccoCd,
    this.bankCd,
    this.bankBranchCd,
    this.bankBranchName,
    this.bankBranchNameDisp,
    this.bankBranchLocationCd,
    this.bankAccountNumber,
    this.bankAccountName,
    this.srcDate,
    this.srcNo,
    this.regDateTime,
    this.regUserId,
    this.updDateTime,
    this.updUserId,
  });

  factory TransferContractBank.fromMap(Map<String, dynamic> map) {
    return TransferContractBank(
      alloDate: map['alloDate'],
      refNo: map['refNo'],
      bankAccoNumber: map['bankAccoNumber'],
      province: map['province'],
      delCd: map['delCd'],
      subAccoCd: map['subAccoCd'],
      bankCd: map['bankCd'],
      bankBranchCd: map['bankBranchCd'],
      bankBranchName: map['bankBranchName'],
      bankBranchNameDisp: map['bankBranchNameDisp'],
      bankBranchLocationCd: map['bankBranchLocationCd'],
      bankAccountNumber: map['bankAccountNumber'],
      bankAccountName: map['bankAccountName'],
      srcDate: map['srcDate'],
      srcNo: map['srcNo'],
      regDateTime: map['regDateTime'],
      regUserId: map['regUserId'],
      updDateTime: map['updDateTime'],
      updUserId: map['updUserId'],
    );
  }

  num? alloDate;

  num? refNo;

  String? bankAccoNumber;

  String? province;

  num? delCd;

  num? subAccoCd;

  String? bankCd;

  String? bankBranchCd;

  String? bankBranchName;

  String? bankBranchNameDisp;

  num? bankBranchLocationCd;

  String? bankAccountNumber;

  String? bankAccountName;

  num? srcDate;

  num? srcNo;

  num? regDateTime;

  String? regUserId;

  num? updDateTime;

  String? updUserId;
}
