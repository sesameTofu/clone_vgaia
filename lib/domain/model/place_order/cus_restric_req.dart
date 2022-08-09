class CusRestriction {
  CusRestriction({
    this.restrictionCd,
    this.subAccoCd,
    this.subAccoNo,
  });

  num? subAccoCd;
  String? restrictionCd;
  String? subAccoNo;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'subAccoCd': 0,
      'subAccoNo': subAccoNo,
      'restrictionCd': restrictionCd,
    };
  }
}
