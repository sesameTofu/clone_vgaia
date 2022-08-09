class Srv4511ServiceSmsData {
  Srv4511ServiceSmsData({
    this.timeStamp,
    this.id,
    this.custCd,
    this.fromDate,
    this.mobile,
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

  factory Srv4511ServiceSmsData.fromJson(Map<String, dynamic> json) =>
      Srv4511ServiceSmsData(
          timeStamp: json['timeStamp'],
          id: json['id'],
          custCd: json['custCd'],
          fromDate: json['fromDate'],
          mobile: json['mobile'],
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
        'custCd': custCd,
        'fromDate': fromDate,
        'mobile': mobile,
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
  String? custCd;
  String? fromDate;
  String? mobile;
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
