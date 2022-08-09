class RecommendBuyParam {
  RecommendBuyParam({
    required this.id,
    required this.entryDate,
    required this.secCd,
    required this.status,
    required this.top,
  });

  num? id;
  num? entryDate;
  String? secCd;
  num? status;
  num? top;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'entryDate': entryDate,
      'secCd': secCd,
      'status': status,
      'top': top,
    };
  }
}
