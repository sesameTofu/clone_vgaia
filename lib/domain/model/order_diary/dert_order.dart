import 'package:flutter_mobile/domain/model/order_diary/order_list_model.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/enum_helper.dart';
import 'package:flutter_mobile/import.dart';

class DertOrder extends OrderListModelAbstract {
  // //////// Class Variables //////////

  /// Status */
  String? status;

  /// Extend status */
  num? extStatus;

  // <summary>
  /// Trade Date
  /// </summary>
  num? tradeDate;

  /// <summary>
  /// Org Order No
  /// </summary>
  String? orgOrderNo;

  /// <summary>
  /// Del Cd
  /// </summary>
  num? delCd;

  /// <summary>
  /// Req No
  /// </summary>
  num? reqNo;

  /// <summary>
  /// Req Type
  /// </summary>
  num? reqType;

  /// <summary>
  /// Req Time
  /// </summary>
  double? reqTime;

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
  /// Market Cd
  /// </summary>
  String? boardCd;

  /// <summary>
  /// Session Cd
  /// </summary>
  String? sessionCd;

  /// <summary>
  /// Expired Time
  /// </summary>
  num? expiredTime;

  /// <summary>
  /// Ord Type
  /// </summary>
  String? orgOrdType;

  /// <summary>
  /// Ord Type
  /// </summary>
  String? ordType;

  /// <summary>
  /// Mkt Time In Force
  /// </summary>
  String? mktTimeInForce;

  /// <summary>
  /// Mkt Ord Type
  /// </summary>
  String? mktOrdType;

  /// <summary>
  /// Ord Chanel
  /// </summary>
  @override
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
  /// Trade Type
  /// </summary>
  TradeType? tradeType;

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
  /// Multiple num?
  /// </summary>
  num? multipleNum;

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
  /// Fee Rate
  /// </summary>
  num? feeRate;

  /// <summary>
  /// Fee Amt
  /// </summary>
  num? feeAmt;

  /// <summary>
  /// Commi Rate
  /// </summary>
  num? commiRate;

  /// <summary>
  /// Commi Amt
  /// </summary>
  num? commiAmt;

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
  /// Pub Qty
  /// </summary>
  num? pubQty;

  /// <summary>
  /// Pub Price
  /// </summary>
  num? pubPrice;

  /// <summary>
  /// Can Qty
  /// </summary>
  num? canQty;

  /// <summary>
  /// Mat Qty
  /// </summary>
  num? matQty;

  /// <summary>
  /// Mat Amt
  /// </summary>
  num? matAmt;

  /// Daily close rate */
  num? dailyCloseRate;

  /// Daily close quantity */
  num? dailyCloseQty;

  /// Daily close fee amount */
  num? dailyCloseFeeAmt;

  /// <summary>
  /// Avg Price
  /// </summary>
  num? avgPrice;

  /// Fee debit amt */
  num? feeDebitAmt;

  /// <summary>
  /// Special Fee
  /// </summary>
  num? specialFee;

  /// <summary>
  /// Notes
  /// </summary>
  String? notes;

  /// <summary>
  /// Transaction Cd
  /// </summary>
  String? transactionCd;

  /// <summary>
  /// Broker Cd
  /// </summary>
  String? brokerCd;

  /// <summary>
  /// Resolved Flag
  /// </summary>
  num? resolvedFlag;

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
  @override
  num? updDateTime;

  /// <summary>
  /// Upd User Id
  /// </summary>
  String? updUserId;

  /// Branch code */
  String? branchCd;

  /// Branch name */
  String? branchName;

  /// Transaction name */
  String? transactionName;

  /// <summary>
  /// Update time long type
  /// </summary>
  @override
  num? updLongTime;

  bool? matFlag;

  bool orderNoChanged = false;
  bool subAccoNoChanged = false;
  bool tradeDateChanged = false;
  bool secCdChanged = false;
  bool ordQtyChanged = false;
  bool ordPriceChanged = false;
  bool pubQtyChanged = false;
  bool pubPriceChanged = false;
  bool matQtyChanged = false;
  bool avgPriceChanged = false;
  bool canQtyChanged = false;
  bool statusChanged = false;
  bool ordTypeChanged = false;

  // ignore: sort_constructors_first
  DertOrder({
    this.status,
    this.extStatus,
    this.tradeDate,
    this.orgOrderNo,
    this.delCd,
    this.reqNo,
    this.reqType,
    this.reqTime,
    this.orderNo,
    this.confirmNo,
    this.confirmTime,
    this.boardCd,
    this.sessionCd,
    this.expiredTime,
    this.orgOrdType,
    this.ordType,
    this.mktTimeInForce,
    this.mktOrdType,
    this.ordChanel,
    this.secCd,
    this.secType,
    this.tradeType,
    this.ordQty,
    this.ordPrice,
    this.ordAmt,
    this.multipleNum,
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
    this.feeRate,
    this.feeAmt,
    this.commiRate,
    this.commiAmt,
    this.taxRate,
    this.taxAmt,
    this.transRate,
    this.transAmt,
    this.pubQty,
    this.pubPrice,
    this.canQty,
    this.matQty,
    this.matAmt,
    this.dailyCloseRate,
    this.dailyCloseQty,
    this.dailyCloseFeeAmt,
    this.avgPrice,
    this.feeDebitAmt,
    this.specialFee,
    this.notes,
    this.transactionCd,
    this.brokerCd,
    this.resolvedFlag,
    this.aprDateTime,
    this.aprUserId,
    this.regDateTime,
    this.regUserId,
    this.updDateTime,
    this.updUserId,
    this.branchCd,
    this.branchName,
    this.transactionName,
    this.updLongTime,
    this.matFlag,
  });

  // ignore: sort_constructors_first
  factory DertOrder.fromJson(Map<String, dynamic> map) {
    // TODO check
    //if (map == null) return null;

    return DertOrder(
      status: map['status'] as String,
      extStatus: map['extStatus'] as num,
      tradeDate: map['tradeDate'] as num,
      orgOrderNo: map['orgOrderNo'] as String,
      delCd: map['delCd'] as num,
      reqNo: map['reqNo'] as num,
      reqType: map['reqType'] as num,
      reqTime:
          map['reqTime'] == null ? 0 : (map['reqTime'] as num?)!.toDouble(),
      orderNo: map['orderNo'] as String,
      confirmNo: map['confirmNo'] as String,
      confirmTime: map['confirmTime'] as num,
      boardCd: map['boardCd'] as String,
      sessionCd: map['sessionCd'] as String,
      expiredTime: map['expiredTime'] as num,
      orgOrdType: map['orgOrdType'] as String,
      ordType: map['ordType'] as String,
      mktTimeInForce: map['mktTimeInForce'] as String,
      mktOrdType: map['mktOrdType'] as String,
      ordChanel: map['ordChanel'] as num,
      secCd: map['secCd'] as String,
      secType: map['secType'] as num,
      tradeType: EnumHelper.getTradeType(map['tradeType'] as num),
      ordQty: map['ordQty'] as num,
      ordPrice: map['ordPrice'] as num,
      ordAmt: map['ordAmt'] as num,
      multipleNum: map['multipleNum'] as num,
      subAccoCd: map['subAccoCd'] as num,
      subAccoNo: map['subAccoNo'] as String,
      custCd: map['custCd'] as num,
      custNo: map['custNo'] as String,
      custFlag: map['custFlag'] as String,
      custFamilyName: map['custFamilyName'] as String,
      custGivenName: map['custGivenName'] as String,
      custTransactionCd: map['custTransactionCd'] as String,
      firmNo: map['firmNo'] as String,
      traderId: map['traderId'] as String,
      feeRate: map['feeRate'] as num,
      feeAmt: map['feeAmt'] as num,
      commiRate: map['commiRate'] as num,
      commiAmt: map['commiAmt'] as num,
      taxRate: map['taxRate'] as num,
      taxAmt: map['taxAmt'] as num,
      transRate: map['transRate'] as num,
      transAmt: map['transAmt'] as num,
      pubQty: map['pubQty'] as num,
      pubPrice: map['pubPrice'] as num,
      canQty: map['canQty'] as num,
      matQty: map['matQty'] as num,
      matAmt: map['matAmt'] as num,
      dailyCloseRate: map['dailyCloseRate'] as num,
      dailyCloseQty: map['dailyCloseQty'] as num,
      dailyCloseFeeAmt: map['dailyCloseFeeAmt'] as num,
      avgPrice: map['avgPrice'] as num,
      feeDebitAmt: map['feeDebitAmt'] as num,
      specialFee: map['specialFee'] as num,
      notes: map['notes'] as String,
      transactionCd: map['transactionCd'] as String,
      brokerCd: map['brokerCd'] as String,
      resolvedFlag: map['resolvedFlag'] as num,
      aprDateTime: map['aprDateTime'] as num,
      aprUserId: map['aprUserId'] as String,
      regDateTime: map['regDateTime'] as num,
      regUserId: map['regUserId'] as String,
      updDateTime: map['updDateTime'] as num,
      updUserId: map['updUserId'] as String,
      branchCd: map['branchCd'] as String,
      branchName: map['branchName'] as String,
      transactionName: map['transactionName'] as String,
      updLongTime: map['updLongTime'] as num,
      matFlag: map['matFlag'] as bool,
    );
  }

  Map<String?, dynamic> tojson() {
    return <String?, dynamic>{
      'status': status,
      'extStatus': extStatus,
      'tradeDate': tradeDate,
      'orgOrderNo': orgOrderNo,
      'delCd': delCd,
      'reqNo': reqNo,
      'reqType': reqType,
      'reqTime': reqTime,
      'orderNo': orderNo,
      'confirmNo': confirmNo,
      'confirmTime': confirmTime,
      'boardCd': boardCd,
      'sessionCd': sessionCd,
      'expiredTime': expiredTime,
      'orgOrdType': orgOrdType,
      'ordType': ordType,
      'mktTimeInForce': mktTimeInForce,
      'mktOrdType': mktOrdType,
      'ordChanel': ordChanel,
      'secCd': secCd,
      'secType': secType,
      'tradeType': tradeType,
      'ordQty': ordQty,
      'ordPrice': ordPrice,
      'ordAmt': ordAmt,
      'multipleNum': multipleNum,
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
      'feeRate': feeRate,
      'feeAmt': feeAmt,
      'commiRate': commiRate,
      'commiAmt': commiAmt,
      'taxRate': taxRate,
      'taxAmt': taxAmt,
      'transRate': transRate,
      'transAmt': transAmt,
      'pubQty': pubQty,
      'pubPrice': pubPrice,
      'canQty': canQty,
      'matQty': matQty,
      'matAmt': matAmt,
      'dailyCloseRate': dailyCloseRate,
      'dailyCloseQty': dailyCloseQty,
      'dailyCloseFeeAmt': dailyCloseFeeAmt,
      'avgPrice': avgPrice,
      'feeDebitAmt': feeDebitAmt,
      'specialFee': specialFee,
      'notes': notes,
      'transactionCd': transactionCd,
      'brokerCd': brokerCd,
      'resolvedFlag': resolvedFlag,
      'aprDateTime': aprDateTime,
      'aprUserId': aprUserId,
      'regDateTime': regDateTime,
      'regUserId': regUserId,
      'updDateTime': updDateTime,
      'updUserId': updUserId,
      'branchCd': branchCd,
      'branchName': branchName,
      'transactionName': transactionName,
      'updLongTime': updLongTime,
      'matFlag': matFlag,
    };
  }

  @override
  String get accNoOrder => custNo!;

  @override
  String get secCdOrder => secCd!;

  @override
  String get tradeTypeOrderDer {
    return tradeType.titleType;
  }

  @override
  TradeType? get tradeTypeOrder => tradeType;

  @override
  String get statusOrder => EnumHelper.getDerNorStatus(extStatus!);

  @override
  String get orderQty => ordQty!.formatVolume();

  @override
  String get orderPrice => ordPrice!.formatPrice(decimalDigits: 2);

  @override
  String get orderType => ordType!;

  @override
  String get orderPriceStop => '';

  @override
  String get orderCutLostAmp => '';

  @override
  String get orderGrossAmp => '';
  @override
  String get orderCutLostPrice => '';
  @override
  String get orderRangeStop => '';
  @override
  String get orderLimitOffset => '';

  @override
  bool get condition => false;

  @override
  String get orderUpdateTime => '';

  @override
  String get orderUpdateTimeBottom => '';

  @override
  String get orderRegDateTime => '';

  @override
  String get orderRegDateTimeBot => '';

  @override
  String get orderMatQty => matQty!.formatVolume();

  @override
  String get orderAvgPrice => avgPrice!.formatPrice(decimalDigits: 2);

  @override
  String get orderPubPrice => pubPrice!.formatPrice(decimalDigits: 2);

  @override
  String get orderPubQty => pubQty!.formatVolume();

  @override
  String get getOrdChanel => EnumHelper.getChanel(ordChanel!);

  @override
  // implement custNoOrder
  String? get custNoOrder => custNo;

  @override
  // implement extStatusOrder
  String? get extStatusOrder => '';

  @override
  // implement matPriceAvgOrder
  String? get matPriceAvgOrder => '';

  @override
  // implement matQtyOrder
  String? get matQtyOrder => '';

  @override
  // implement orderDateTime
  String? get orderDateTime => '';

  @override
  // implement orderFormDate
  String? get orderFormDate => '';

  @override
  // implement orderToDate
  String? get orderToDate => '';

  @override
  // implement pubPriceOrder
  String? get pubPriceOrder => '';

  @override
  // implement pubQtyOrder
  String? get pubQtyOrder => '';

  @override
  // implement reqTimeOrder
  String? get reqTimeOrder => '';

  @override
  // implement ordOrgOrderNo
  String? get ordOrgOrderNo => orgOrderNo;

  @override
  // implement ordRefNo
  num? get ordRefNo => null;

  @override
  num? get ordTradeDate => tradeDate;

  @override
  num? get alloDate => null;

  @override
  bool get isEditOrder {
    return status == 'O' || status == 'E';
  }
}
