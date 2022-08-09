class Srv4511RowData4 {
  Srv4511RowData4({
    this.select,
    this.alloDate,
    this.refNo,
    this.bankAccountName,
    this.isOwner,
    this.bankAccountNumber,
    this.bankCd,
    this.bankBranchName,
    this.bankBranchNameDisp,
    this.bankBranchLocation,
    this.remarks,
    this.regDateTime,
    this.regUserId,
    this.updDateTime,
    this.updUserId,
    this.bankBranchLocationCd,
    this.updateFlg,
    this.errorFlag,
    this.timeStamp,
  });

  factory Srv4511RowData4.fromJson(Map<String, dynamic> json) =>
      Srv4511RowData4(
          select: json['select'] as bool,
          alloDate: json['alloDate'],
          refNo: json['refNo'],
          bankAccountName: json['bankAccountName'],
          isOwner: json['isOwner'],
          bankAccountNumber: json['bankAccountNumber'],
          bankCd: json['bankCd'],
          bankBranchName: json['bankBranchName'],
          bankBranchNameDisp: json['bankBranchNameDisp'],
          bankBranchLocation: json['bankBranchLocation'],
          remarks: json['remarks'],
          regDateTime: json['regDateTime'],
          regUserId: json['regUserId'],
          updDateTime: json['updDateTime'],
          updUserId: json['updUserId'],
          bankBranchLocationCd: json['bankBranchLocationCd'],
          updateFlg: json['updateFlg'],
          errorFlag: json['errorFlag'],
          timeStamp: json['timeStamp']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'select': select,
        'alloDate': alloDate,
        'refNo': refNo,
        'bankAccountName': bankAccountName,
        'isOwner': isOwner,
        'bankAccountNumber': bankAccountNumber,
        'bankCd': bankCd,
        'bankBranchName': bankBranchName,
        'bankBranchNameDisp': bankBranchNameDisp,
        'bankBranchLocation': bankBranchLocation,
        'remarks': remarks,
        'regDateTime': regDateTime,
        'regUserId': regUserId,
        'updDateTime': updDateTime,
        'updUserId': updUserId,
        'bankBranchLocationCd': bankBranchLocationCd,
        'updateFlg': updateFlg,
        'errorFlag': errorFlag,
        'timeStamp': timeStamp,
      };

  bool? select;
  String? alloDate;
  String? refNo;
  String? bankAccountName;
  String? isOwner;
  String? bankAccountNumber;
  String? bankCd;
  String? bankBranchName;
  String? bankBranchNameDisp;
  String? bankBranchLocation;
  String? remarks;
  String? regDateTime;
  String? regUserId;
  String? updDateTime;
  String? updUserId;
  String? bankBranchLocationCd;
  String? updateFlg;
  String? errorFlag;
  String? timeStamp;
}
