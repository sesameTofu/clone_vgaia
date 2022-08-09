class ParameterBankData {
  ParameterBankData({
    this.startTime,
    this.endTime,
    this.nextDayBegin,
    this.nextDayEnd,
    this.maxAmount,
    this.minAmount,
    this.maxTime,
    this.transferFeeRate,
    this.transferFee,
    this.transferFeeMin,
    this.transferFeeFlg,
    this.smsFee,
    this.traLimitCompany,
    this.traLimitCustomer,
    this.padManageFeeMin,
    this.padFeeMin,
    this.padCollectFeeT3,
    this.padManageFeeRate,
    this.padCustFeeRate,
    this.padFeeDay,
    this.padCalcDays,
    this.padManageCalcDays,
    this.padBankFeeRate,
    this.padManageFreeDays,
    this.padContractMaxValue,
    this.padContractMinValue,
    this.padLimitCustomer,
    this.padTimeBegin,
    this.padTimeEnd,
    this.padLimitCompany,
    this.padFeeMinDays,
    this.padManageFeeMinDays,
    this.adCustFeeRate,
    this.adBankFeeRate,
    this.adFeeCalcDays,
    this.adFeeFreeDays,
    this.adFeeMinValue,
    this.adManageFeeRate,
    this.adManageFeeCalcDays,
    this.adManageFreeDays,
    this.adManageFeeMinValue,
    this.adContractMinValue,
    this.adContractMaxValue,
    this.adAdvanceRate,
    this.adLimitCustomer,
    this.adTimeBegin,
    this.adTimeEnd,
    this.adMaxDays,
    this.adWarningRate,
    this.adCallRate,
  });

  factory ParameterBankData.fromMap(Map<String?, dynamic> map) {
    return ParameterBankData(
      startTime: map['startTime'] as String?,
      endTime: map['endTime'] as String?,
      nextDayBegin: map['nextDayBegin'] as String?,
      nextDayEnd: map['nextDayEnd'] as String?,
      maxAmount: map['maxAmount'] as num?,
      minAmount: map['minAmount'] as num?,
      maxTime: map['maxTime'] as String?,
      transferFeeRate: map['transferFeeRate'] as num?,
      transferFee: map['transferFee'] as num?,
      transferFeeMin: map['transferFeeMin'] as num?,
      transferFeeFlg: map['transferFeeFlg'] as String?,
      smsFee: map['smsFee'] as num?,
      traLimitCompany: map['traLimitCompany'] as num?,
      traLimitCustomer: map['traLimitCustomer'] as num?,
      padManageFeeMin: map['padManageFeeMin'] as num?,
      padFeeMin: map['padFeeMin'] as num?,
      padCollectFeeT3: map['padCollectFeeT3'] as num?,
      padManageFeeRate: map['padManageFeeRate'] as num?,
      padCustFeeRate: map['padCustFeeRate'] as num?,
      padFeeDay: map['padFeeDay'] as num?,
      padCalcDays: map['padCalcDays'] as num?,
      padManageCalcDays: map['padManageCalcDays'] as num?,
      padBankFeeRate: map['padBankFeeRate'] as num?,
      padManageFreeDays: map['padManageFreeDays'] as num?,
      padContractMaxValue: map['padContractMaxValue'] as num?,
      padContractMinValue: map['padContractMinValue'] as num?,
      padLimitCustomer: map['padLimitCustomer'] as num?,
      padTimeBegin: map['padTimeBegin'] as String?,
      padTimeEnd: map['padTimeEnd'] as String?,
      padLimitCompany: map['padLimitCompany'] as num?,
      padFeeMinDays: map['padFeeMinDays'] as num?,
      padManageFeeMinDays: map['padManageFeeMinDays'] as num?,
      adCustFeeRate: map['adCustFeeRate'] as num?,
      adBankFeeRate: map['adBankFeeRate'] as num?,
      adFeeCalcDays: map['adFeeCalcDays'] as num?,
      adFeeFreeDays: map['adFeeFreeDays'] as num?,
      adFeeMinValue: map['adFeeMinValue'] as num?,
      adManageFeeRate: map['adManageFeeRate'] as num?,
      adManageFeeCalcDays: map['adManageFeeCalcDays'] as num?,
      adManageFreeDays: map['adManageFreeDays'] as num?,
      adManageFeeMinValue: map['adManageFeeMinValue'] as num?,
      adContractMinValue: map['adContractMinValue'] as num?,
      adContractMaxValue: map['adContractMaxValue'] as num?,
      adAdvanceRate: map['adAdvanceRate'] as num?,
      adLimitCustomer: map['adLimitCustomer'] as num?,
      adTimeBegin: map['adTimeBegin'] as String?,
      adTimeEnd: map['adTimeEnd'] as String?,
      adMaxDays: map['adMaxDays'] as num?,
      adWarningRate: map['adWarningRate'] as num?,
      adCallRate: map['adCallRate'] as num?,
    );
  }

  String? startTime;
  String? endTime;
  String? nextDayBegin;
  String? nextDayEnd;
  num? maxAmount;
  num? minAmount;
  String? maxTime;
  num? transferFeeRate;
  num? transferFee;
  num? transferFeeMin;
  String? transferFeeFlg;
  num? smsFee;
  num? traLimitCompany;
  num? traLimitCustomer;
  num? padManageFeeMin;
  num? padFeeMin;
  num? padCollectFeeT3;
  num? padManageFeeRate;
  num? padCustFeeRate;
  num? padFeeDay;
  num? padCalcDays;
  num? padManageCalcDays;
  num? padBankFeeRate;
  num? padManageFreeDays;
  num? padContractMaxValue;
  num? padContractMinValue;
  num? padLimitCustomer;
  String? padTimeBegin;
  String? padTimeEnd;
  num? padLimitCompany;
  num? padFeeMinDays;
  num? padManageFeeMinDays;
  num? adCustFeeRate;
  num? adBankFeeRate;
  num? adFeeCalcDays;
  num? adFeeFreeDays;
  num? adFeeMinValue;
  num? adManageFeeRate;
  num? adManageFeeCalcDays;
  num? adManageFreeDays;
  num? adManageFeeMinValue;
  num? adContractMinValue;
  num? adContractMaxValue;
  num? adAdvanceRate;
  num? adLimitCustomer;
  String? adTimeBegin;
  String? adTimeEnd;
  num? adMaxDays;
  num? adWarningRate;
  num? adCallRate;
}
