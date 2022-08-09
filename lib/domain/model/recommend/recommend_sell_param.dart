class RecommendSellParam {
  RecommendSellParam({
    required this.entryDate,
    required this.secCd,
    required this.top,
  });

  num? entryDate;
  String? secCd;
  num? top;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'entryDate': entryDate,
      'secCd': secCd,
      'top': top,
    };
  }
}
