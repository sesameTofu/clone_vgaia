class EntrustData {
  EntrustData({
    this.subAccoCd,
    this.subAccoNo,
    this.businessCd,
    this.startDate,
    this.endDate,
  });

  EntrustData.fromJson(Map<String, dynamic> json) {
    subAccoCd = json['codeGroupName'] as num?;
    subAccoNo = json['subAccoNo'] as String;
    businessCd = json['businessCd'] as num?;
    startDate = json['startDate'] as num?;
    endDate = json['endDate'] as num?;
  }
  num? subAccoCd;
  String? subAccoNo;
  num? businessCd;
  num? startDate;
  num? endDate;
}
