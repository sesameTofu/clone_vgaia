class DerOrderRequest {
  DerOrderRequest({
    this.branchCd,
    this.secCd,
    this.brokerCd,
    this.tradeType,
    this.orderType,
    this.custNo,
    this.fromDate,
    this.ordChanel,
    this.regUserId,
    this.status,
    this.toDate,
    this.transactionCd,
  });

  String? branchCd;
  String? transactionCd;
  num? tradeType;
  String? secCd;
  String? orderType;
  String? brokerCd;
  String? custNo;
  dynamic status;
  String? regUserId;
  num? ordChanel;
  dynamic fromDate;
  dynamic toDate;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'branchCd': branchCd,
      'secCd': secCd,
      'transactionCd': transactionCd,
      'tradeType': tradeType,
      'orderType': orderType,
      'brokerCd': brokerCd,
      'custNo': custNo,
      'status': status,
      'regUserId': regUserId,
      'ordChanel': 0,
      'fromDate': fromDate,
      'toDate': toDate,
    };
  }
}
