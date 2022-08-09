class CancelCondRequest {
  CancelCondRequest({
    this.refDate,
    this.refNo,
  });
  final num? refDate;
  final num? refNo;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'refDate': refDate,
      'refNo': refNo,
    };
  }
}
