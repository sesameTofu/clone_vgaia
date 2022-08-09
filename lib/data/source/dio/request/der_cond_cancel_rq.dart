class CancelDertRequestCond {
  CancelDertRequestCond({
    this.alloDate,
    this.refNo,
    this.updDateTime,
  });

  num? alloDate;
  num? refNo;
  num? updDateTime;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'alloDate': alloDate,
      'refNo': refNo,
      'updDateTime': updDateTime,
    };
  }
}
