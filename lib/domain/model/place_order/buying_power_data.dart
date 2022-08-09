class BuyingPowerData {
  BuyingPowerData({
    this.buyingPower,
    this.buyingPowerPa,
    this.room,
    this.serviceType,
    this.marginRate,
    this.limitL4,
    this.limitL5,
    this.limitL6,
    this.limitL7,
    this.limitL,
    this.normalLimitAllocated,
    this.maxLoanAsset,
    this.asBeginCashAmt,
    this.asNewCashAmt,
    this.asNewPendingAmt,
    this.asNewSecVal,
    this.asNewRightVal,
    this.asNewDebitTotal,
    this.totalDebit,
    this.asNewAsset,
    this.asNewNetAsset,
    this.asNewCurrentRate,
    this.todayBuyValue,
    this.totalMissMoney,
    this.normalLimitNeedSupp,
    this.needToLoand,
    this.warningRate,
    this.callRate,
    this.warningLevel,
    this.bankBalance,
    this.bankAvail,
    this.beginMargin,
    this.totalAsset,
    this.withdrawAvail,
    this.needToAdditionCash,
    this.needToAdditionSec,
    this.needToSell,
    this.marginContractAlloDate,
    this.marginContractRefNo,
    this.totalDepositAmount,
  });

  factory BuyingPowerData.fromJson(Map<String, dynamic> json) {
    return BuyingPowerData(
      buyingPower: json['buyingPower'] as num?,
      buyingPowerPa: json['buyingPowerPA'] as num?,
      room: json['room'] as num?,
      serviceType: json['serviceType'] as num?,
      marginRate: json['marginRate'] as num?,
      limitL4: json['limitL4'] as num?,
      limitL5: json['limitL5'] as num?,
      limitL6: json['limitL6'] as num?,
      limitL7: json['limitL7'] as num?,
      limitL: json['limitL'] as num?,
      normalLimitAllocated: json['normalLimitAllocated'] as num?,
      maxLoanAsset: json['maxLoanAsset'] as num?,
      asBeginCashAmt: json['asBeginCashAmt'] as num?,
      asNewCashAmt: json['asNewCashAmt'] as num?,
      asNewPendingAmt: json['asNewPendingAmt'] as num?,
      asNewSecVal: json['asNewSecVal'] as num?,
      asNewRightVal: json['asNewRightVal'] as num?,
      asNewDebitTotal: json['asNewDebitTotal'] as num?,
      totalDebit: json['totalDebit'] as num?,
      asNewAsset: json['asNewAsset'] as num?,
      asNewNetAsset: json['asNewNetAsset'] as num?,
      asNewCurrentRate: json['asNewCurrentRate'] as num?,
      todayBuyValue: json['todayBuyValue'] as num?,
      totalMissMoney: json['totalMissMoney'] as num?,
      normalLimitNeedSupp: json['normalLimitNeedSupp'] as num?,
      needToLoand: json['needToLoand'] as num?,
      warningRate: json['warningRate'] as num?,
      callRate: json['callRate'] as num?,
      warningLevel: json['warningLevel'] as num?,
      bankBalance: json['bankBalance'] as dynamic,
      bankAvail: json['bankAvail'] as dynamic,
      beginMargin: json['beginMargin'] as num?,
      totalAsset: json['totalAsset'] as num?,
      withdrawAvail: json['withdrawAvail'] as num?,
      needToAdditionCash: json['needToAdditionCash'] as num?,
      needToAdditionSec: json['needToAdditionSec'] as num?,
      needToSell: json['needToSell'] as num?,
      marginContractAlloDate: json['marginContractAlloDate'] as num?,
      marginContractRefNo: json['marginContractRefNo'] as num?,
      totalDepositAmount: json['totalDepositAmount'] as num?,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'buyingPower': buyingPower,
        'buyingPowerPA': buyingPowerPa,
        'room': room,
        'serviceType': serviceType,
        'marginRate': marginRate,
        'limitL4': limitL4,
        'limitL5': limitL5,
        'limitL6': limitL6,
        'limitL7': limitL7,
        'limitL': limitL,
        'normalLimitAllocated': normalLimitAllocated,
        'maxLoanAsset': maxLoanAsset,
        'asBeginCashAmt': asBeginCashAmt,
        'asNewCashAmt': asNewCashAmt,
        'asNewPendingAmt': asNewPendingAmt,
        'asNewSecVal': asNewSecVal,
        'asNewRightVal': asNewRightVal,
        'asNewDebitTotal': asNewDebitTotal,
        'totalDebit': totalDebit,
        'asNewAsset': asNewAsset,
        'asNewNetAsset': asNewNetAsset,
        'asNewCurrentRate': asNewCurrentRate,
        'todayBuyValue': todayBuyValue,
        'totalMissMoney': totalMissMoney,
        'normalLimitNeedSupp': normalLimitNeedSupp,
        'needToLoand': needToLoand,
        'warningRate': warningRate,
        'callRate': callRate,
        'warningLevel': warningLevel,
        'bankBalance': bankBalance,
        'bankAvail': bankAvail,
        'beginMargin': beginMargin,
        'totalAsset': totalAsset,
        'withdrawAvail': withdrawAvail,
        'needToAdditionCash': needToAdditionCash,
        'needToAdditionSec': needToAdditionSec,
        'needToSell': needToSell,
        'marginContractAlloDate': marginContractAlloDate,
        'marginContractRefNo': marginContractRefNo,
        'totalDepositAmount': totalDepositAmount,
      };

  num? buyingPower;
  num? buyingPowerPa;
  num? room;
  num? serviceType;
  num? marginRate;
  num? limitL4;
  num? limitL5;
  num? limitL6;
  num? limitL7;
  num? limitL;
  num? normalLimitAllocated;
  num? maxLoanAsset;
  num? asBeginCashAmt;
  num? asNewCashAmt;
  num? asNewPendingAmt;
  num? asNewSecVal;
  num? asNewRightVal;
  num? asNewDebitTotal;
  num? totalDebit;
  num? asNewAsset;
  num? asNewNetAsset;
  num? asNewCurrentRate;
  num? todayBuyValue;
  num? totalMissMoney;
  num? normalLimitNeedSupp;
  num? needToLoand;
  num? warningRate;
  num? callRate;
  num? warningLevel;
  dynamic bankBalance;
  dynamic bankAvail;
  num? beginMargin;
  num? totalAsset;
  num? withdrawAvail;
  num? needToAdditionCash;
  num? needToAdditionSec;
  num? needToSell;
  num? marginContractAlloDate;
  num? marginContractRefNo;
  num? totalDepositAmount;
}
