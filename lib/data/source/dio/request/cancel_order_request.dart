class CancelOrderRequest {
  CancelOrderRequest({
    this.subAccoNo,
    this.orgOrderNo,
    this.orderNo,
    this.secCd,
    this.status,
  });

  String? subAccoNo;
  String? orgOrderNo;
  String? orderNo;
  String? secCd;
  String? status;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'subAccoNo': subAccoNo,
      'orgOrderNo': orgOrderNo,
      'orderNo': orderNo,
      'secCd': secCd,
      'status': status,
    };
  }
}
