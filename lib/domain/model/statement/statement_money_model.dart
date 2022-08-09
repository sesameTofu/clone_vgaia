class StatementMoneyModel {
  StatementMoneyModel({
    this.businessDate,
    this.remarks,
    this.secCd,
    this.quantity,
    this.debitAmt,
    this.creditAmt,
    this.currentAmt,
  });

  factory StatementMoneyModel.fromMap(Map<String?, dynamic> map) {
    return StatementMoneyModel(
      businessDate: map['businessDate'] as String?,
      remarks: map['remarks'] as String?,
      secCd: map['secCd'] as String?,
      quantity: map['quantity'] as num?,
      debitAmt: map['debitAmt'] as num?,
      creditAmt: map['creditAmt'] as num?,
      currentAmt: map['currentAmt'] as num?,
    );
  }

  /// <summary>
  /// Business Date
  /// </summary>
  String? businessDate;

  /// <summary>
  /// Remarks
  /// </summary>
  String? remarks;

  /// <summary>
  /// Securities Code
  /// </summary>
  String? secCd;

  /// <summary>
  /// Quantity
  /// </summary>
  num? quantity;

  /// <summary>
  /// Debit Amount
  /// </summary>
  num? debitAmt;

  /// <summary>
  /// Credit Amount
  /// </summary>
  num? creditAmt;

  /// <summary>
  /// Current Amount
  /// </summary>
  num? currentAmt;
}
