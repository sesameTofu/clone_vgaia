class Srv4501RowData {
  Srv4501RowData({
    this.timeStamp,
    this.serviceCd,
    this.serviceCdDisp,
    this.serviceName,
    this.srvSts,
    this.srvStsDisp,
    this.remarks,
    this.groupId,
    this.updUserId,
  });

  factory Srv4501RowData.fromJson(Map<String, dynamic> json) => Srv4501RowData(
      timeStamp: json['timeStamp'],
      serviceCd: json['serviceCd'],
      serviceName: json['serviceName'],
      srvSts: json['srvSts'],
      srvStsDisp: json['srvStsDisp'],
      remarks: json['remarks'],
      groupId: json['groupId'],
      updUserId: json['updUserId']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'timeStamp': timeStamp,
        'serviceCd': serviceCd,
        'serviceName': serviceName,
        'srvSts': srvSts,
        'srvStsDisp': srvStsDisp,
        'remarks': remarks,
        'groupId': groupId,
        'updUserId': updUserId,
      };

  String? timeStamp;
  String? serviceCd;
  String? serviceCdDisp;
  String? serviceName;
  String? srvSts;
  String? srvStsDisp;
  String? remarks;
  String? groupId;
  String? updUserId;
}
