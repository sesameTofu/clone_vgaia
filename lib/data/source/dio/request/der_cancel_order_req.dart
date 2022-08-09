class DertCancelOrderRequest {
  DertCancelOrderRequest({
    this.tradeDate,
    this.orgOrderNo,
    this.ordChannel,
    this.updLongTime,
  });

  num? tradeDate;
  String? orgOrderNo;
  num? ordChannel;
  num? updLongTime;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tradeDate': tradeDate,
      'orgOrderNo': orgOrderNo,
      'ordChannel': ordChannel,
      'updLongTime': updLongTime,
    };
  }
}
