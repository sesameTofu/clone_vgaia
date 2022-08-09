class FindRequestCond {
  FindRequestCond({
    this.subAccNo,
    this.secCd,
    this.condType,
    this.fromDate,
    this.toDate,
    this.status,
    this.regUserId,
  });
  String? subAccNo;
  String? secCd;
  String? condType;
  String? fromDate;
  String? toDate;
  num? status;
  String? regUserId;

  Map<String?, dynamic> toJson() {
    return <String?, dynamic>{
      'subAccNo': subAccNo,
      'secCd': secCd,
      'condType': condType,
      'fromDate': fromDate,
      'toDate': toDate,
      'status': status,
      'regUserId': regUserId,
    };
  }
}
