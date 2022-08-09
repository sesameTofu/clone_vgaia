class FindRequestPending {
  FindRequestPending({
    this.status,
    this.secCd,
    this.subAccoNo,
    this.marketCd,
  });
  String? status;
  String? secCd;
  String? subAccoNo;
  num? marketCd;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'secCd': secCd,
      'subAccoNo': subAccoNo,
      'marketCd': marketCd,
    };
  }
}
