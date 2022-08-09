class RequestOrderPending {
  RequestOrderPending(
      this.tradeDate,
      this.reqNo,
      this.delCd,
      this.reqType,
      this.reqTime,
      this.orgOrderNo,
      this.orderNo,
      this.marketCd,
      this.tradeType,
      this.ordType,
      this.ordChanel,
      this.secCd,
      this.secType,
      this.ordQty,
      this.ordPrice,
      this.ordAmt,
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
      this.commiRate,
      this.commiAmt,
      this.taxRate,
      this.taxAmt,
      this.transRate,
      this.transAmt,
      this.rightTaxRate,
      this.rigthTaxAmt,
      this.marginRate,
      this.marginAmt,
      this.tag,
      this.notes,
      this.transactionCd,
      this.serviceType,
      this.settleUnit,
      this.groupCd,
      this.status,
      this.sendSms,
      this.sendEmail,
      this.aprDateTime,
      this.aprUserId,
      this.regDateTime,
      this.regUserId,
      this.updDateTime,
      this.updUserId,
      this.branchCd,
      this.branchName,
      this.mortContrNo,
      this.transactionName,
      this.requestTypeName,
      this.marketName,
      this.ordFlag,
      this.clientInfo);
  factory RequestOrderPending.fromJson(Map<String, dynamic> json) =>
      RequestOrderPending(
        json['tradeDate'] as num,
        json['reqNo'] as num,
        json['delCd'] as num,
        json['reqType'] as num,
        json['reqTime'] as num,
        json['orgOrderNo'] as String,
        json['orderNo'] as String,
        json['marketCd'] as num,
        json['tradeType'] as num,
        json['ordType'] as String,
        json['ordChanel'] as num,
        json['secCd'] as String,
        json['secType'] as num,
        json['ordQty'] as num,
        json['ordPrice'] as num,
        json['ordAmt'] as num,
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
        json['commiRate'] as num,
        json['commiAmt'] as num,
        json['taxRate'] as num,
        json['taxAmt'] as num,
        json['transRate'] as num,
        json['transAmt'] as num,
        json['rightTaxRate'] as num,
        json['rigthTaxAmt'] as num,
        json['marginRate'] as num,
        json['marginAmt'] as num,
        json['tag'] as String,
        json['notes'] as String,
        json['transactionCd'] as String,
        json['serviceType'] as num,
        json['settleUnit'] as num,
        json['groupCd'] as String,
        json['status'] as String,
        json['sendSms'] as num,
        json['sendEmail'] as num,
        json['aprDateTime'] as num,
        json['aprUserId'] as String,
        json['regDateTime'] as num,
        json['regUserId'] as String,
        json['updDateTime'] as num,
        json['updUserId'] as String,
        json['branchCd'] as String,
        json['branchName'] as String,
        json['mortContrNo'] as String,
        json['transactionName'] as String,
        json['requestTypeName'] as String,
        json['marketName'] as String,
        json['ordFlag'] as String,
        json['clientInfo'] as String,
      );

  /// <summary>
  /// Trade Date
  /// </summary>
  final num tradeDate;

  /// <summary>
  /// Req No
  /// </summary>
  final num reqNo;

  /// <summary>
  /// Del Cd
  /// </summary>
  final num delCd;

  /// <summary>
  /// Req Type
  /// </summary>
  final num reqType;

  /// <summary>
  /// Req Time
  /// </summary>
  final num reqTime;

  /// <summary>
  /// Org Order No
  /// </summary>
  final String orgOrderNo;

  /// <summary>
  /// Order No
  /// </summary>
  final String orderNo;

  /// <summary>
  /// Market Cd
  /// </summary>
  final num marketCd;

  /// <summary>
  /// Trade Type
  /// </summary>
  final num tradeType;

  /// <summary>
  /// Ord Type
  /// </summary>
  final String ordType;

  /// <summary>
  /// Ord Chanel
  /// </summary>
  final num ordChanel;

  /// <summary>
  /// Sec Cd
  /// </summary>
  final String secCd;

  /// <summary>
  /// Sec Type
  /// </summary>
  final num secType;

  /// <summary>
  /// Ord Qty
  /// </summary>
  final num ordQty;

  /// <summary>
  /// Ord Price
  /// </summary>
  final num ordPrice;

  /// <summary>
  /// Ord Amt
  /// </summary>
  final num ordAmt;

  /// <summary>
  /// Sub Acco Cd
  /// </summary>
  final num subAccoCd;

  /// <summary>
  /// Sub Acco No
  /// </summary>
  final String subAccoNo;

  /// <summary>
  /// Cust Cd
  /// </summary>
  final num custCd;

  /// <summary>
  /// Cust No
  /// </summary>
  final String custNo;

  /// <summary>
  /// Cust Flag
  /// </summary>
  final String custFlag;

  /// <summary>
  /// Cust Family Name
  /// </summary>
  final String custFamilyName;

  /// <summary>
  /// Cust Given Name
  /// </summary>
  final String custGivenName;

  /// <summary>
  /// Cust Transaction Cd
  /// </summary>
  final String custTransactionCd;

  /// <summary>
  /// Firm No
  /// </summary>
  final String firmNo;

  /// <summary>
  /// Trader Id
  /// </summary>
  final String traderId;

  /// <summary>
  /// Bank Branch Cd
  /// </summary>
  final String bankBranchCd;

  /// <summary>
  /// Broker Cd
  /// </summary>
  final String brokerCd;

  /// <summary>
  /// Intro Cd
  /// </summary>
  final String introCd;

  /// <summary>
  /// Fee Rate
  /// </summary>
  final num feeRate;

  /// <summary>
  /// Fee Amt
  /// </summary>
  final num feeAmt;

  /// <summary>
  /// Commi Rate
  /// </summary>
  final num commiRate;

  /// <summary>
  /// Commi Amt
  /// </summary>
  final num commiAmt;

  /// <summary>
  /// Tax Rate
  /// </summary>
  final num taxRate;

  /// <summary>
  /// Tax Amt
  /// </summary>
  final num taxAmt;

  /// <summary>
  /// Trans Rate
  /// </summary>
  final num transRate;

  /// <summary>
  /// Trans Amt
  /// </summary>
  final num transAmt;

  /// <summary>
  /// Right Tax Rate
  /// </summary>
  final num rightTaxRate;

  /// <summary>
  /// Rigth Tax Amt
  /// </summary>
  final num rigthTaxAmt;

  /// <summary>
  /// Margin Rate
  /// </summary>
  final num marginRate;

  /// <summary>
  /// Margin Amt
  /// </summary>
  final num marginAmt;

  /// <summary>
  /// Tag
  /// </summary>
  final String tag;

  /// <summary>
  /// Notes
  /// </summary>
  final String notes;

  /// <summary>
  /// Transaction Cd
  /// </summary>
  final String transactionCd;

  /// <summary>
  /// Service Type
  /// </summary>
  final num serviceType;

  /// <summary>
  /// Settle Unit
  /// </summary>
  final num settleUnit;

  /// <summary>
  /// Group Cd
  /// </summary>
  final String groupCd;

  /// <summary>
  /// Status
  /// </summary>
  final String status;

  /// Send SMS */
  final num sendSms;

  /// Send email */
  final num sendEmail;

  /// <summary>
  /// Apr Date Time
  /// </summary>
  final num aprDateTime;

  /// <summary>
  /// Apr User Id
  /// </summary>
  final String aprUserId;

  /// <summary>
  /// Reg Date Time
  /// </summary>
  final num regDateTime;

  /// <summary>
  /// Reg User Id
  /// </summary>
  final String regUserId;

  /// <summary>
  /// Upd Date Time
  /// </summary>
  final num updDateTime;

  /// <summary>
  /// Upd User Id
  /// </summary>
  final String updUserId;

  /// <summary>
  /// Branch code
  /// </summary>
  final String branchCd;

  /// <summary>
  /// Branch Name
  /// </summary>
  final String branchName;

  /// <summary>
  /// mortContrNo
  /// </summary>
  final String mortContrNo;

  /// <summary>
  /// Transaction Name
  /// </summary>
  final String transactionName;

  /// <summary>
  /// requestTypeName
  /// </summary>
  final String requestTypeName;

  /// <summary>
  /// marketName
  /// </summary>
  final String marketName;

  /// <summary>
  /// Order approve flag (A- Dong y, D tu choi)
  /// </summary>
  final String ordFlag;

  final String clientInfo;

  String get custName {
    return '$custFamilyName $custGivenName';
  }

  bool get isSendSms {
    return sendSms > 0;
  }

  bool get isSendEmail {
    return sendEmail > 0;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'tradeDate': tradeDate,
        'reqNo': reqNo,
        'delCd': delCd,
        'reqType': reqType,
        'reqTime': reqTime,
        'orgOrderNo': orgOrderNo,
        'orderNo': orderNo,
        'marketCd': marketCd,
        'tradeType': tradeType,
        'ordType': ordType,
        'ordChanel': ordChanel,
        'secCd': secCd,
        'secType': secType,
        'ordQty': ordQty,
        'ordPrice': ordPrice,
        'ordAmt': ordAmt,
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
        'commiRate': commiRate,
        'commiAmt': commiAmt,
        'taxRate': taxRate,
        'taxAmt': taxAmt,
        'transRate': transRate,
        'transAmt': transAmt,
        'rightTaxRate': rightTaxRate,
        'rigthTaxAmt': rigthTaxAmt,
        'marginRate': marginRate,
        'marginAmt': marginAmt,
        'tag': tag,
        'notes': notes,
        'transactionCd': transactionCd,
        'serviceType': serviceType,
        'settleUnit': settleUnit,
        'groupCd': groupCd,
        'status': status,
        'sendSms': sendSms,
        'sendEmail': sendEmail,
        'aprDateTime': aprDateTime,
        'aprUserId': aprUserId,
        'regDateTime': regDateTime,
        'regUserId': regUserId,
        'updDateTime': updDateTime,
        'updUserId': updUserId,
        'branchCd': branchCd,
        'branchName': branchName,
        'mortContrNo': mortContrNo,
        'transactionName': transactionName,
        'requestTypeName': requestTypeName,
        'marketName': marketName,
        'ordFlag': ordFlag,
        'clientInfo': clientInfo,
      };
}
