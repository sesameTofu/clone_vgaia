class FindOrder {
  FindOrder({
    this.subAccoNo,
    this.secCd,
    this.secType,
    this.tradeType,
    this.orderType,
    this.extStatus,
    this.searchByUser,
  });

  String? subAccoNo;
  String? secCd;
  num? secType;
  num? tradeType;
  String? orderType;
  int? extStatus;
  bool? searchByUser;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'subAccoNo': subAccoNo,
      'secCd': secCd,
      'secType': secType,
      'tradeType': tradeType,
      'orderType': orderType,
      'extStatus': extStatus,
      'searchByUser': searchByUser,
    };
  }
}
