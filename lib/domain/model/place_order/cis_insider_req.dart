//cus indise
class CustomerInsiderRequest {
  CustomerInsiderRequest({
    this.ordPrice,
    this.ordQty,
    this.secCd,
    this.subAccountNo,
    this.tradeType,
  });
  String? subAccountNo;
  String? secCd;
  int? tradeType;
  num? ordQty;
  num? ordPrice;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'subAccoNo': subAccountNo,
      'secCd': secCd,
      'tradeType': tradeType,
      'ordQty': ordQty,
      'ordPrice': ordPrice,
    };
  }
}
