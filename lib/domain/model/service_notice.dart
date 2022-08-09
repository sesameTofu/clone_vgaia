class ServiceNotice {
  ServiceNotice({
    this.id,
    this.custCd,
    this.serviceGroupId,
    this.status,
    this.remarks,
    this.regDateTime,
    this.regUserId,
    this.updDateTime,
    this.updUserId,
    this.serviceGroupCd,
    this.serviceGroupName,
  });

  factory ServiceNotice.fromJson(Map<String, dynamic> json) => ServiceNotice(
      id: json['id'],
      custCd: json['custCd'],
      serviceGroupId: json['serviceGroupId'],
      status: json['status'],
      remarks: json['remarks'],
      regDateTime: json['regDateTime'],
      regUserId: json['regUserId'],
      updDateTime: json['updDateTime'],
      updUserId: json['updUserId'],
      serviceGroupCd: json['serviceGroupCd'],
      serviceGroupName: json['serviceGroupName']);

  num? id;
  num? custCd;
  num? serviceGroupId;

  /// [status] 1: đã chọn, 0: ko chọn
  num? status;
  String? remarks;
  num? regDateTime;
  String? regUserId;
  num? updDateTime;
  String? updUserId;
  String? serviceGroupCd;
  String? serviceGroupName;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'custCd': custCd,
        'serviceGroupId': serviceGroupId,
        'status': status,
        'remarks': remarks,
        'regDateTime': regDateTime,
        'regUserId': regUserId,
        'updDateTime': updDateTime,
        'updUserId': updUserId,
        'serviceGroupCd': serviceGroupCd,
        'serviceGroupName': serviceGroupName,
      };
}
