class GetPortfolioInvestmentRequest {
  GetPortfolioInvestmentRequest({
    required this.subAccoCd,
    required this.subAccoNo,
    required this.fromDate,
    required this.toDate,
    required this.secCd,
  });

  String subAccoCd;
  String subAccoNo;
  String fromDate;
  String toDate;
  String secCd;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'subAccoCd': subAccoCd,
        'subAccoNo': subAccoNo,
        'fromDate': fromDate,
        'toDate': toDate,
        'secCd': secCd,
      };
}
