class CancelPendingRequest {
  CancelPendingRequest({
    this.tradeDate,
    this.reqNo,
  });

  final num? tradeDate;
  final num? reqNo;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'tradeDate': tradeDate,
      'reqNo': reqNo,
    };
  }
}
