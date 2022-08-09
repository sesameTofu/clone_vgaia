class SatementRequest {
  SatementRequest({
    required this.accountType,
    required this.subAccoNo,
    required this.fromDate,
    required this.toDate,
  });

  String? accountType;
  String? subAccoNo;
  String? fromDate;
  String? toDate;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fil_accountType': accountType,
      'fil_subAccoNo': subAccoNo,
      'fil_fromDate': fromDate,
      'fil_toDate': toDate,
      'p_BEGIN_AMT': 0,
      'p_LAST_AMT': 0
    };
  }
}
