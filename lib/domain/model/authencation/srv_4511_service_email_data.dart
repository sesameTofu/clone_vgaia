class Srv4511ServiceEmailData {
  Srv4511ServiceEmailData({
    this.timeStamp,
    this.id,
    this.delCd,
    this.refId,
    this.custCd,
    this.fromDate,
    this.email,
    this.serviceGroupId,
    this.lastFeeDate,
    this.srvSts,
    this.status,
    this.remarks,
    this.regDateTime,
    this.regUserId,
    this.updDateTime,
    this.updUserId,
  });

  factory Srv4511ServiceEmailData.fromJson(Map<String, dynamic> json) =>
      Srv4511ServiceEmailData(
          timeStamp: json['timeStamp'],
          id: json['id'],
          delCd: json['delCd'],
          refId: json['refId'],
          custCd: json['custCd'],
          fromDate: json['fromDate'],
          email: json['email'],
          serviceGroupId: json['serviceGroupId'],
          lastFeeDate: json['lastFeeDate'],
          srvSts: json['srvSts'],
          status: json['status'],
          remarks: json['remarks'],
          regDateTime: json['regDateTime'],
          regUserId: json['regUserId'],
          updDateTime: json['updDateTime'],
          updUserId: json['updUserId']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'timeStamp': timeStamp,
        'id': id,
        'delCd': delCd,
        'refId': refId,
        'custCd': custCd,
        'fromDate': fromDate,
        'email': email,
        'serviceGroupId': serviceGroupId,
        'lastFeeDate': lastFeeDate,
        'srvSts': srvSts,
        'status': status,
        'remarks': remarks,
        'regDateTime': regDateTime,
        'regUserId': regUserId,
        'updDateTime': updDateTime,
        'updUserId': updUserId,
      };

  String? timeStamp;
  String? id;
  String? delCd;
  String? refId;
  String? custCd;
  String? fromDate;
  String? email;
  String? serviceGroupId;
  String? lastFeeDate;
  String? srvSts;
  String? status;
  String? remarks;
  String? regDateTime;
  String? regUserId;
  String? updDateTime;
  String? updUserId;
}
