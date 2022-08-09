class GetPortfolioAssetRequest {
  const GetPortfolioAssetRequest({
    required this.subAccoCd,
    required this.subAccoNo,
    required this.fromDate,
    required this.toDate,
  });

  final String subAccoCd;
  final String subAccoNo;
  final String fromDate;
  final String toDate;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'subAccoCd': subAccoCd,
        'subAccoNo': subAccoNo,
        'fromDate': fromDate,
        'toDate': toDate,
      };
}
