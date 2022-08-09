class AdfParam {
  AdfParam({
    this.paramGroup,
    this.paramName,
    this.delCd,
    this.value,
    this.remarks,
    this.regDateTime,
    this.regUserId,
    this.updDateTime,
    this.updUserId,
  });

  AdfParam.fromJson(Map<String, dynamic> json) {
    paramGroup = json['paramGroup'] as String?;
    paramName = json['paramName'] as String?;
    delCd = json['delCd'] as num?;
    value = json['value'] as String?;
    remarks = json['remarks'] as String?;
    regDateTime = json['regDateTime'] as num?;
    regUserId = json['regUserId'] as String?;
    updDateTime = json['updDateTime'] as num?;
    updUserId = json['updUserId'] as String?;
  }

  String? paramGroup;
  String? paramName;
  num? delCd;
  String? value;
  String? remarks;
  num? regDateTime;
  String? regUserId;
  num? updDateTime;
  String? updUserId;

  Map<String?, dynamic> toJson() => <String?, dynamic>{
        'paramGroup': paramGroup,
        'paramName': paramName,
        'delCd': delCd,
        'value': value,
        'remarks': remarks,
        'regDateTime': regDateTime,
        'regUserId': regUserId,
        'updDateTime': updDateTime,
        'updUserId': updUserId,
      };
}
