class Srv4511RowData7 {
  Srv4511RowData7({
    this.select,
    this.id,
    this.fromDate,
    this.toDate,
    this.bankCd,
    this.bankBranchCd,
    this.limitValue,
    this.status,
    this.statusDisp,
    this.remarks,
    this.regDateTime,
    this.regUserId,
    this.updDateTime,
    this.updUserId,
    this.updateFlg,
    this.errorFlag,
    this.timeStamp,
  });

  factory Srv4511RowData7.fromJson(Map<String, dynamic> json) =>
      Srv4511RowData7(
          select: json['select'],
          id: json['id'],
          fromDate: json['fromDate'],
          toDate: json['toDate'],
          bankCd: json['bankCd'],
          bankBranchCd: json['bankBranchCd'],
          limitValue: json['limitValue'],
          status: json['status'],
          statusDisp: json['statusDisp'],
          remarks: json['remarks'],
          regDateTime: json['regDateTime'],
          regUserId: json['regUserId'],
          updDateTime: json['updDateTime'],
          updUserId: json['updUserId'],
          updateFlg: json['updateFlg'],
          errorFlag: json['errorFlag'],
          timeStamp: json['timeStamp']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'select': select,
        'id': id,
        'fromDate': fromDate,
        'toDate': toDate,
        'bankCd': bankCd,
        'bankBranchCd': bankBranchCd,
        'limitValue': limitValue,
        'status': status,
        'statusDisp': statusDisp,
        'remarks': remarks,
        'regDateTime': regDateTime,
        'regUserId': regUserId,
        'updDateTime': updDateTime,
        'updUserId': updUserId,
        'updateFlg': updateFlg,
        'errorFlag': errorFlag,
        'timeStamp': timeStamp,
      };

  bool? select;
  String? id;
  String? fromDate;
  String? toDate;
  String? bankCd;
  String? bankBranchCd;
  String? limitValue;
  String? status;
  String? statusDisp;
  String? remarks;
  String? regDateTime;
  String? regUserId;
  String? updDateTime;
  String? updUserId;
  String? updateFlg;
  String? errorFlag;
  String? timeStamp;
}
