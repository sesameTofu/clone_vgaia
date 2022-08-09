class ParameterBankParam {
  ParameterBankParam({
    required this.branchCd,
    required this.transactionCd,
    required this.groupCd,
    required this.paramGroup,
    required this.paramName,
    required this.bankCd,
    required this.bankBranchCd,
  });

  num? branchCd;
  String? transactionCd;
  String? groupCd;
  String? paramGroup;
  String? paramName;
  String? bankCd;
  String? bankBranchCd;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'branchCd': branchCd,
      'transactionCd': transactionCd,
      'groupCd': groupCd,
      'paramGroup': paramGroup,
      'paramName': paramName,
      'bankCd': bankCd,
      'bankBranchCd': bankBranchCd,
    };
  }
}
