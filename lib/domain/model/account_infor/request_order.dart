class RequestOrder {
  RequestOrder(
      this.tradeDate,
      this.reqNo,
      this.delCd,
      this.orgReqNo,
      this.reqType,
      this.reqTime,
      this.orgOrderNo,
      this.contraOrgOrderNo,
      this.orderNo,
      this.confirmNo,
      this.confirmTime,
      this.dealId,
      this.marketCd,
      this.tradeType,
      this.sideType,
      this.ordType,
      this.ordChanel,
      this.secCd,
      this.secType,
      this.ordQty,
      this.ordPrice,
      this.ordAmt,
      this.ordFlag,
      this.contraQty,
      this.contraPrice,
      this.stopPrice,
      this.ordQty2,
      this.cashQty,
      this.subAccoCd,
      this.subAccoNo,
      this.custCd,
      this.custNo,
      this.custFlag,
      this.custFamilyName,
      this.custGivenName,
      this.custTransactionCd,
      this.firmNo,
      this.traderId,
      this.bankBranchCd,
      this.brokerCd,
      this.introCd,
      this.feeRate,
      this.feeAmt,
      this.taxRate,
      this.taxAmt,
      this.transRate,
      this.transAmt,
      this.rightTaxRate,
      this.rightTaxAmt,
      this.marginRate,
      this.marginAmt,
      this.contraSubAccoCd,
      this.contraSubAccoNo,
      this.contraCustCd,
      this.contraCustNo,
      this.contraCustFlag,
      this.contraCustFamilyName,
      this.contraCustGivenName,
      this.contraCustTransactionCd,
      this.contraFirmNo,
      this.contraTraderId,
      this.contraBankBranchCd,
      this.contraBrokerCd,
      this.contraIntroCd,
      this.contraFeeRate,
      this.contraFeeAmt,
      this.contraTaxRate,
      this.contraTaxAmt,
      this.contraTransRate,
      this.contraTransAmt,
      this.contraRightTaxRate,
      this.contraRightTaxAmt,
      this.contraMarginRate,
      this.contraMarginAmt,
      this.tag,
      this.notes,
      this.transactionCd,
      this.serviceType,
      this.settleUnit,
      this.resolvedFlag,
      this.overFlag,
      this.groupCd,
      this.mortContrNo,
      this.status,
      this.targetStatus,
      this.aprDateTime,
      this.aprUserId,
      this.regDateTime,
      this.regUserId,
      this.updDateTime,
      this.updUserId,
      this.branchCd,
      this.branchName,
      this.transactionName,
      // ignore: avoid_positional_boolean_parameters
      this.autoApprove,
      this.requestTypeName,
      this.marketName,
      this.rowNum,
      this.custRequestId,
      this.ordSrcType,
      this.tradeTypeString,
      this.statusString,
      this.reqTypeString,
      this.tradeDateDisplay);

  factory RequestOrder.fromJson(Map<String, dynamic> json) => RequestOrder(
        json['tradeDate'] as num,
        json['reqNo'] as num,
        json['delCd'] as num,
        json['orgReqNo'] as num,
        json['reqType'] as num,
        json['reqTime'] as num,
        json['orgOrderNo'] as String,
        json['contraOrgOrderNo'] as String,
        json['orderNo'] as String,
        json['confirmNo'] as String,
        json['confirmTime'] as num,
        json['dealId'] as String,
        json['marketCd'] as num,
        json['tradeType'] as num,
        json['sideType'] as num,
        json['ordType'] as String,
        json['ordChanel'] as num,
        json['secCd'] as String,
        json['secType'] as num,
        json['ordQty'] as num,
        json['ordPrice'] as num,
        json['ordAmt'] as num,
        json['ordFlag'] as String,
        json['contraQty'] as num,
        json['contraPrice'] as num,
        json['stopPrice'] as num,
        json['ordQty2'] as num,
        json['cashQty'] as num,
        json['subAccoCd'] as num,
        json['subAccoNo'] as String,
        json['custCd'] as num,
        json['custNo'] as String,
        json['custFlag'] as String,
        json['custFamilyName'] as String,
        json['custGivenName'] as String,
        json['custTransactionCd'] as String,
        json['firmNo'] as String,
        json['traderId'] as String,
        json['bankBranchCd'] as String,
        json['brokerCd'] as String,
        json['introCd'] as String,
        json['feeRate'] as num,
        json['feeAmt'] as num,
        json['taxRate'] as num,
        json['taxAmt'] as num,
        json['transRate'] as num,
        json['transAmt'] as num,
        json['rightTaxRate'] as num,
        json['rightTaxAmt'] as num,
        json['marginRate'] as num,
        json['marginAmt'] as num,
        json['contraSubAccoCd'] as num,
        json['contraSubAccoNo'] as String,
        json['contraCustCd'] as num,
        json['contraCustNo'] as String,
        json['contraCustFlag'] as String,
        json['contraCustFamilyName'] as String,
        json['contraCustGivenName'] as String,
        json['contraCustTransactionCd'] as String,
        json['contraFirmNo'] as String,
        json['contraTraderId'] as String,
        json['contraBankBranchCd'] as String,
        json['contraBrokerCd'] as String,
        json['contraIntroCd'] as String,
        json['contraFeeRate'] as num,
        json['contraFeeAmt'] as num,
        json['contraTaxRate'] as num,
        json['contraTaxAmt'] as num,
        json['contraTransRate'] as num,
        json['contraTransAmt'] as num,
        json['contraRightTaxRate'] as num,
        json['contraRightTaxAmt'] as num,
        json['contraMarginRate'] as num,
        json['contraMarginAmt'] as num,
        json['tag'] as String,
        json['notes'] as String,
        json['transactionCd'] as String,
        json['serviceType'] as num,
        json['settleUnit'] as num,
        json['resolvedFlag'] as num,
        json['overFlag'] as num,
        json['groupCd'] as String,
        json['mortContrNo'] as String,
        json['status'] as String,
        json['targetStatus'] as String,
        json['aprDateTime'] as num,
        json['aprUserId'] as String,
        json['regDateTime'] as num,
        json['regUserId'] as String,
        json['updDateTime'] as num,
        json['updUserId'] as String,
        json['branchCd'] as num,
        json['branchName'] as String,
        json['transactionName'] as String,
        json['autoApprove'] as bool,
        json['requestTypeName'] as String,
        json['marketName'] as String,
        json['rowNum'] as num,
        json['custRequestId'] as num,
        json['ordSrcType'] as num,
        json['tradeTypeString'] as String,
        json['statusString'] as String,
        json['reqTypeString'] as String,
        json['tradeDateDisplay'] as String,
      );

  /// <summary>
  /// Trade Date
  /// </summary>
  num? tradeDate;

  /// <summary>
  /// Req No
  /// </summary>
  num? reqNo;

  /// <summary>
  /// Del Cd
  /// </summary>
  num? delCd;

  /// <summary>
  /// Org Req No
  /// </summary>
  num? orgReqNo;

  /// <summary>
  /// Req Type
  /// </summary>
  num? reqType;

  /// <summary>
  /// Req Time
  /// </summary>
  num? reqTime;

  /// <summary>
  /// Org Order No
  /// </summary>
  String? orgOrderNo;

  /// <summary>
  /// Contra Org Order No
  /// </summary>
  String? contraOrgOrderNo;

  /// <summary>
  /// Order No
  /// </summary>
  String? orderNo;

  /// <summary>
  /// Confirm No
  /// </summary>
  String? confirmNo;

  /// <summary>
  /// Confirm Time
  /// </summary>
  num? confirmTime;

  /// <summary>
  /// Deal Id
  /// </summary>
  String? dealId;

  /// <summary>
  /// Market Cd
  /// </summary>
  num? marketCd;

  /// <summary>
  /// Trade Type
  /// </summary>
  num? tradeType;

  /// <summary>
  /// Side type
  /// </summary>
  num? sideType;

  /// <summary>
  /// Ord Type
  /// </summary>
  String? ordType;

  /// <summary>
  /// Ord Chanel
  /// </summary>
  num? ordChanel;

  /// <summary>
  /// Sec Cd
  /// </summary>
  String? secCd;

  /// <summary>
  /// Sec Type
  /// </summary>
  num? secType;

  /// <summary>
  /// Ord Qty
  /// </summary>
  num? ordQty;

  /// <summary>
  /// Ord Price
  /// </summary>
  num? ordPrice;

  /// <summary>
  /// Ord Amt
  /// </summary>
  num? ordAmt;

  /// <summary>
  /// Order flag
  /// </summary>
  String? ordFlag;

  /// <summary>
  /// Contra Qty
  /// </summary>
  num? contraQty;

  /// <summary>
  /// Contra Price
  /// </summary>
  num? contraPrice;

  /// <summary>
  /// Stop Price
  /// </summary>
  num? stopPrice;

  /// <summary>
  /// Ord Qty2
  /// </summary>
  num? ordQty2;

  /// <summary>
  /// Cash quantity
  /// </summary>
  num? cashQty;

  /// <summary>
  /// Sub Acco Cd
  /// </summary>
  num? subAccoCd;

  /// <summary>
  /// Sub Acco No
  /// </summary>
  String? subAccoNo;

  /// <summary>
  /// Cust Cd
  /// </summary>
  num? custCd;

  /// <summary>
  /// Cust No
  /// </summary>
  String? custNo;

  /// <summary>
  /// Cust Flag
  /// </summary>
  String? custFlag;

  /// <summary>
  /// Cust Family Name
  /// </summary>
  String? custFamilyName;

  /// <summary>
  /// Cust Given Name
  /// </summary>
  String? custGivenName;

  /// <summary>
  /// Cust Transaction Cd
  /// </summary>
  String? custTransactionCd;

  /// <summary>
  /// Firm No
  /// </summary>
  String? firmNo;

  /// <summary>
  /// Trader Id
  /// </summary>
  String? traderId;

  /// <summary>
  /// Bank Branch Cd
  /// </summary>
  String? bankBranchCd;

  /// <summary>
  /// Broker Cd
  /// </summary>
  String? brokerCd;

  /// <summary>
  /// Intro Cd
  /// </summary>
  String? introCd;

  /// <summary>
  /// Fee Rate
  /// </summary>
  num? feeRate;

  /// <summary>
  /// Fee Amt
  /// </summary>
  num? feeAmt;

  /// <summary>
  /// Tax Rate
  /// </summary>
  num? taxRate;

  /// <summary>
  /// Tax Amt
  /// </summary>
  num? taxAmt;

  /// <summary>
  /// Trans Rate
  /// </summary>
  num? transRate;

  /// <summary>
  /// Trans Amt
  /// </summary>
  num? transAmt;

  /// <summary>
  /// Right Tax Rate
  /// </summary>
  num? rightTaxRate;

  /// <summary>
  /// Right Tax Amt
  /// </summary>
  num? rightTaxAmt;

  /// <summary>
  /// Margin Rate
  /// </summary>
  num? marginRate;

  /// <summary>
  /// Margin Amt
  /// </summary>
  num? marginAmt;

  /// <summary>
  /// Contra Sub Acco Cd
  /// </summary>
  num? contraSubAccoCd;

  /// <summary>
  /// Contra Sub Acco No
  /// </summary>
  String? contraSubAccoNo;

  /// <summary>
  /// Contra Cust Cd
  /// </summary>
  num? contraCustCd;

  /// <summary>
  /// Contra Cust No
  /// </summary>
  String? contraCustNo;

  /// <summary>
  /// Contra Cust Flag
  /// </summary>
  String? contraCustFlag;

  /// <summary>
  /// Contra Cust Family Name
  /// </summary>
  String? contraCustFamilyName;

  /// <summary>
  /// Contra Cust Given Name
  /// </summary>
  String? contraCustGivenName;

  /// <summary>
  /// Contra Cust Transaction Cd
  /// </summary>
  String? contraCustTransactionCd;

  /// <summary>
  /// Contra Firm No
  /// </summary>
  String? contraFirmNo;

  /// <summary>
  /// Contra Trader Id
  /// </summary>
  String? contraTraderId;

  /// <summary>
  /// Contra Bank Branch Cd
  /// </summary>
  String? contraBankBranchCd;

  /// <summary>
  /// Contra Broker Cd
  /// </summary>
  String? contraBrokerCd;

  /// <summary>
  /// Contra Intro Cd
  /// </summary>
  String? contraIntroCd;

  /// <summary>
  /// Contra Fee Rate
  /// </summary>
  num? contraFeeRate;

  /// <summary>
  /// Contra Fee Amt
  /// </summary>
  num? contraFeeAmt;

  /// <summary>
  /// Contra Tax Rate
  /// </summary>
  num? contraTaxRate;

  /// <summary>
  /// Contra Tax Amt
  /// </summary>
  num? contraTaxAmt;

  /// <summary>
  /// Contra Trans Rate
  /// </summary>
  num? contraTransRate;

  /// <summary>
  /// Contra Trans Amt
  /// </summary>
  num? contraTransAmt;

  /// <summary>
  /// Contra Right Tax Rate
  /// </summary>
  num? contraRightTaxRate;

  /// <summary>
  /// Contra Right Tax Amt
  /// </summary>
  num? contraRightTaxAmt;

  /// <summary>
  /// Contra Margin Rate
  /// </summary>
  num? contraMarginRate;

  /// <summary>
  /// Contra Margin Amt
  /// </summary>
  num? contraMarginAmt;

  /// <summary>
  /// Tag
  /// </summary>
  String? tag;

  /// <summary>
  /// Notes
  /// </summary>
  String? notes;

  /// <summary>
  /// Transaction Cd
  /// </summary>
  String? transactionCd;

  /// <summary>
  /// Service Type
  /// </summary>
  num? serviceType;

  /// <summary>
  /// Settle Unit
  /// </summary>
  num? settleUnit;

  /// <summary>
  /// Resolved Flag
  /// </summary>
  num? resolvedFlag;

  /// <summary>
  /// Over Flag
  /// </summary>
  num? overFlag;

  /// <summary>
  /// Group Cd
  /// </summary>
  String? groupCd;

  /// <summary>
  /// Mortgage contract num?ber
  /// </summary>
  String? mortContrNo;

  /// <summary>
  /// Status
  /// </summary>
  String? status;

  /// <summary>
  /// Target Status
  /// </summary>
  String? targetStatus;

  /// <summary>
  /// Apr Date Time
  /// </summary>
  num? aprDateTime;

  /// <summary>
  /// Apr User Id
  /// </summary>
  String? aprUserId;

  /// <summary>
  /// Reg Date Time
  /// </summary>
  num? regDateTime;

  /// <summary>
  /// Reg User Id
  /// </summary>
  String? regUserId;

  /// <summary>
  /// Upd Date Time
  /// </summary>
  num? updDateTime;

  /// <summary>
  /// Upd User Id
  /// </summary>
  String? updUserId;

  /// <summary>
  /// Brnach Code
  /// </summary>
  num? branchCd;

  /// <summary>
  /// Branch Name
  /// </summary>
  String? branchName;

  /// <summary>
  /// Transaction Name
  /// </summary>
  String? transactionName;

  /// <summary>
  /// Auto approve request
  /// </summary>
  bool? autoApprove;

  /// <summary>
  /// requestTypeName
  /// </summary>
  String? requestTypeName;

  /// <summary>
  /// marketName
  /// </summary>
  String? marketName;

  /// <summary>
  /// rowNum
  /// </summary>
  num? rowNum;

  /// <summary>
  /// Cust request id
  /// </summary>
  num? custRequestId;

  num? ordSrcType;

  String? tradeTypeString;

  String? statusString;

  String? reqTypeString;

  String? tradeDateDisplay;

  Map<String?, dynamic> toJson() => <String, dynamic>{
        'tradeDate': tradeDate,
        'reqNo': reqNo,
        'delCd': delCd,
        'orgReqNo': orgReqNo,
        'reqType': reqType,
        'reqTime': reqTime,
        'orgOrderNo': orgOrderNo,
        'contraOrgOrderNo': contraOrgOrderNo,
        'orderNo': orderNo,
        'confirmNo': confirmNo,
        'confirmTime': confirmTime,
        'dealId': dealId,
        'marketCd': marketCd,
        'tradeType': tradeType,
        'sideType': sideType,
        'ordType': ordType,
        'ordChanel': ordChanel,
        'secCd': secCd,
        'secType': secType,
        'ordQty': ordQty,
        'ordPrice': ordPrice,
        'ordAmt': ordAmt,
        'ordFlag': ordFlag,
        'contraQty': contraQty,
        'contraPrice': contraPrice,
        'stopPrice': stopPrice,
        'ordQty2': ordQty2,
        'cashQty': cashQty,
        'subAccoCd': subAccoCd,
        'subAccoNo': subAccoNo,
        'custCd': custCd,
        'custNo': custNo,
        'custFlag': custFlag,
        'custFamilyName': custFamilyName,
        'custGivenName': custGivenName,
        'custTransactionCd': custTransactionCd,
        'firmNo': firmNo,
        'traderId': traderId,
        'bankBranchCd': bankBranchCd,
        'brokerCd': brokerCd,
        'introCd': introCd,
        'feeRate': feeRate,
        'feeAmt': feeAmt,
        'taxRate': taxRate,
        'taxAmt': taxAmt,
        'transRate': transRate,
        'transAmt': transAmt,
        'rightTaxRate': rightTaxRate,
        'rightTaxAmt': rightTaxAmt,
        'marginRate': marginRate,
        'marginAmt': marginAmt,
        'contraSubAccoCd': contraSubAccoCd,
        'contraSubAccoNo': contraSubAccoNo,
        'contraCustCd': contraCustCd,
        'contraCustNo': contraCustNo,
        'contraCustFlag': contraCustFlag,
        'contraCustFamilyName': contraCustFamilyName,
        'contraCustGivenName': contraCustGivenName,
        'contraCustTransactionCd': contraCustTransactionCd,
        'contraFirmNo': contraFirmNo,
        'contraTraderId': contraTraderId,
        'contraBankBranchCd': contraBankBranchCd,
        'contraBrokerCd': contraBrokerCd,
        'contraIntroCd': contraIntroCd,
        'contraFeeRate': contraFeeRate,
        'contraFeeAmt': contraFeeAmt,
        'contraTaxRate': contraTaxRate,
        'contraTaxAmt': contraTaxAmt,
        'contraTransRate': contraTransRate,
        'contraTransAmt': contraTransAmt,
        'contraRightTaxRate': contraRightTaxRate,
        'contraRightTaxAmt': contraRightTaxAmt,
        'contraMarginRate': contraMarginRate,
        'contraMarginAmt': contraMarginAmt,
        'tag': tag,
        'notes': notes,
        'transactionCd': transactionCd,
        'serviceType': serviceType,
        'settleUnit': settleUnit,
        'resolvedFlag': resolvedFlag,
        'overFlag': overFlag,
        'groupCd': groupCd,
        'mortContrNo': mortContrNo,
        'status': status,
        'targetStatus': targetStatus,
        'aprDateTime': aprDateTime,
        'aprUserId': aprUserId,
        'regDateTime': regDateTime,
        'regUserId': regUserId,
        'updDateTime': updDateTime,
        'updUserId': updUserId,
        'branchCd': branchCd,
        'branchName': branchName,
        'transactionName': transactionName,
        'autoApprove': autoApprove ?? false,
        'requestTypeName': requestTypeName,
        'marketName': marketName,
        'rowNum': rowNum,
        'custRequestId': custRequestId,
        'ordSrcType': ordSrcType,
        'tradeTypeString': tradeTypeString,
        'statusString': statusString,
        'reqTypeString': reqTypeString,
        'tradeDateDisplay': tradeDateDisplay,
      };
}
