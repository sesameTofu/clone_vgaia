class FindPortfolio {
  const FindPortfolio({
    required this.subAccoNo,
    required this.alloDate,
    required this.secCd,
  });

  final String? subAccoNo;
  final String? alloDate;
  final String? secCd;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'subAccoNo': subAccoNo,
        'alloDate': alloDate,
        'secCd': secCd,
      };
}
