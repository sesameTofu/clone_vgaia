class FindTransferLocalParam {
  FindTransferLocalParam({
     this.toSubAccoNo,
    required this.fromSubAccoNo,
    required this.status,
    required this.mFromDate,
    required this.mToDate,
  });

  String? toSubAccoNo;
  String fromSubAccoNo;
  num status;
  String mFromDate;
  String mToDate;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'toSubAccoNo': null,
      'fromSubAccoNo': fromSubAccoNo,
      'status': status,
      'm_fromDate': mFromDate,
      'm_toDate': mToDate,
    };
  }
}
