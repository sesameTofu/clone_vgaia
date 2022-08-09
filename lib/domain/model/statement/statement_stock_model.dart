class StatementStockModel {
  StatementStockModel({
    this.secCd,
    this.beginQty,
    this.lastAmt,
  });

  factory StatementStockModel.fromMap(Map<String, dynamic> map) {
    return StatementStockModel(
      secCd: map['secCd'] as String?,
      beginQty: map['beginQty'] as num?,
      lastAmt: map['lastAmt'] as num?,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'secCd': secCd,
      'beginQty': beginQty,
      'lastAmt': lastAmt,
    };
  }

  /// <summary>
  /// Securities Code
  /// </summary>
  String? secCd;

  /// <summary>
  /// Begin Quantity
  /// </summary>
  num? beginQty;

  /// <summary>
  /// Last Amount
  /// </summary>
  num? lastAmt;
}
