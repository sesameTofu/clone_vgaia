import 'package:flutter_mobile/domain/model/order_diary/order_list_model.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/enum_helper.dart';

class OrderModel extends OrderListModelAbstract {
  OrderModel({
    this.tradeDate,
    this.orgOrderNo,
    this.delCd,
    this.reqNo,
    this.reqType,
    this.reqTime,
    this.orderNo,
    this.confirmNo,
    this.confirmTime,
    this.marketCd,
    this.sessionCd,
    this.ordType,
    this.ordChanel,
    this.secCd,
    this.secType,
    this.tradeType,
    this.sideType,
    this.ordQty,
    this.ordPrice,
    this.ordAmt,
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
    this.feeRate,
    this.feeAmt,
    this.commiRate,
    this.commiAmt,
    this.taxRate,
    this.taxAmt,
    this.transRate,
    this.transAmt,
    this.rightTaxRate,
    this.rightTaxQty,
    this.rightTaxAmt,
    this.marginRate,
    this.marginAmt,
    this.pubQty,
    this.pubPrice,
    this.canQty,
    this.matQty,
    this.matAmt,
    this.matPriceAvg,
    this.notes,
    this.transactionCd,
    this.brokerCd,
    this.introCd,
    this.serviceType,
    this.settleUnit,
    this.paymentDate,
    this.resolvedFlag,
    this.overFlag,
    this.activeStop,
    this.groupCd,
    this.mortContrNo,
    this.status,
    this.aprDateTime,
    this.aprUserId,
    this.regDateTime,
    this.regUserId,
    this.updDateTime,
    this.updUserId,
    this.marketSname,
    this.transactionName,
    this.branchName,
    this.branchCd,
    this.matPrice,
    this.isResolvedOrder,
    this.extStatus,
    this.confirmStatus,
    this.confirmDateTime,
    this.confirmUserId,
    this.ordSrcType,
    this.clientInfo,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      tradeDate: json['tradeDate'] as num,
      orgOrderNo: json['orgOrderNo'] as String,
      delCd: json['delCd'] as num,
      reqNo: json['reqNo'] as num,
      reqType: json['reqType'] as num,
      reqTime:
          json['reqTime'] == null ? 0 : (json['reqTime'] as num).toDouble(),
      orderNo: json['orderNo'] as String,
      confirmNo: json['confirmNo'] as String,
      confirmTime: json['confirmTime'] == null
          ? 0
          : (json['confirmTime'] as num).toDouble(),
      marketCd: json['marketCd'] as num,
      sessionCd: json['sessionCd'] as String,
      ordType: json['ordType'] as String,
      ordChanel: json['ordChanel'] as num,
      secCd: json['secCd'] as String,
      secType: json['secType'] as num,
      tradeType: EnumHelper.getTradeType(json['tradeType'] as num),
      sideType: json['sideType'] as num,
      ordQty: json['ordQty'] as num,
      ordPrice: json['ordPrice'] as num,
      ordAmt: json['ordAmt'] as num,
      stopPrice: json['stopPrice'] as num,
      ordQty2: json['ordQty2'] as num,
      cashQty: json['cashQty'] as num,
      subAccoCd: json['subAccoCd'] as num,
      subAccoNo: json['subAccoNo'] as String,
      custCd: json['custCd'] as num,
      custNo: json['custNo'] as String,
      custFlag: json['custFlag'] as String,
      custFamilyName: json['custFamilyName'] as String,
      custGivenName: json['custGivenName'] as String,
      custTransactionCd: json['custTransactionCd'] as String,
      firmNo: json['firmNo'] as String,
      traderId: json['traderId'] as String,
      bankBranchCd: json['bankBranchCd'] as String,
      feeRate: json['feeRate'] as num,
      feeAmt: json['feeAmt'] as num,
      commiRate: json['commiRate'] as num,
      commiAmt: json['commiAmt'] as num,
      taxRate: json['taxRate'] as num,
      taxAmt: json['taxAmt'] as num,
      transRate: json['transRate'] as num,
      transAmt: json['transAmt'] as num,
      rightTaxRate: json['rightTaxRate'] as num,
      rightTaxQty: json['rightTaxQty'] as num,
      rightTaxAmt: json['rightTaxAmt'] as num,
      marginRate: json['marginRate'] as num,
      marginAmt: json['marginAmt'] as num,
      pubQty: json['pubQty'] as num,
      pubPrice: json['pubPrice'] as num,
      canQty: json['canQty'] as num,
      matQty: json['matQty'] as num,
      matAmt: json['matAmt'] as num,
      matPriceAvg: json['matPriceAvg'] as num,
      notes: json['notes'] as String,
      transactionCd: json['transactionCd'] as String,
      brokerCd: json['brokerCd'] as String,
      introCd: json['introCd'] as String,
      serviceType: json['serviceType'] as num,
      settleUnit: json['settleUnit'] as num,
      paymentDate: json['paymentDate'] as num,
      resolvedFlag: json['resolvedFlag'] as num,
      overFlag: json['overFlag'] as num,
      activeStop: json['activeStop'] as num,
      groupCd: json['groupCd'] as String,
      mortContrNo: json['mortContrNo'] as String,
      status: json['status'] as String,
      aprDateTime: json['aprDateTime'] == null
          ? 0
          : (json['aprDateTime'] as num).toDouble(),
      aprUserId: json['aprUserId'] as String,
      regDateTime: json['regDateTime'] == null
          ? 0
          : (json['regDateTime'] as num).toDouble(),
      regUserId: json['regUserId'] as String,
      updDateTime: json['updDateTime'] == null
          ? 0
          : (json['updDateTime'] as num).toDouble(),
      updUserId: json['updUserId'] as String,
      marketSname: json['marketSname'] as String,
      transactionName: json['transactionName'] as String,
      branchName: json['branchName'] as String,
      branchCd: json['branchCd'] as num,
      matPrice: json['matPrice'] as num,
      isResolvedOrder: json['isResolvedOrder'] as bool,
      extStatus: json['extStatus'] as int,
      confirmStatus: json['confirmStatus'] as num,
      confirmDateTime: json['confirmDateTime'] == null
          ? 0
          : (json['confirmDateTime'] as num).toDouble(),
      confirmUserId: json['confirmUserId'] as String,
      ordSrcType: json['ordSrcType'] as num,
      clientInfo: json['clientInfo'] as String,
    );
  }

  num? tradeDate;

  /// Org Order No */
  String? orgOrderNo;

  /// Del Cd */
  num? delCd;

  /// Req No */
  num? reqNo;

  /// Req Type */
  num? reqType;

  /// Req Time */
  double? reqTime;

  /// Order No */
  String? orderNo;

  /// Confirm No */
  String? confirmNo;

  /// Confirm Time */
  double? confirmTime;

  /// Market Cd */
  num? marketCd;

  /// Session Cd */
  String? sessionCd;

  /// Ord Type */
  String? ordType;

  /// Ord Chanel */
  @override
  num? ordChanel;

  /// Sec Cd */
  String? secCd;

  /// Sec Type */
  num? secType;

  /// Trade Type */
  TradeType? tradeType;

  /// Side type */
  num? sideType;

  /// Ord Qty */
  num? ordQty;

  /// Ord Price */
  num? ordPrice;

  /// Ord Amt */
  num? ordAmt;

  /// Stop Price */
  num? stopPrice;

  /// Ord Qty2 */
  num? ordQty2;

  /// Cash Qty */
  num? cashQty;

  /// Sub Acco Cd */
  num? subAccoCd;

  /// Sub Acco No */
  String? subAccoNo;

  /// Cust Cd */
  num? custCd;

  /// Cust No */
  String? custNo;

  /// Cust Flag */
  String? custFlag;

  /// Cust Family Name */
  String? custFamilyName;

  /// Cust Given Name */
  String? custGivenName;

  /// Cust Transaction Cd */
  String? custTransactionCd;

  /// Firm No */
  String? firmNo;

  /// Trader Id */
  String? traderId;

  /// Bank Branch Cd */
  String? bankBranchCd;

  /// Fee Rate */
  num? feeRate;

  /// Fee Amt */
  num? feeAmt;

  /// Commi Rate */
  num? commiRate;

  /// Commi Amt */
  num? commiAmt;

  /// Tax Rate */
  num? taxRate;

  /// Tax Amt */
  num? taxAmt;

  /// Trans Rate */
  num? transRate;

  /// Trans Amt */
  num? transAmt;

  /// Right Tax Rate */
  num? rightTaxRate;

  /// Right Tax Qty */
  num? rightTaxQty;

  /// Right Tax Amt */
  num? rightTaxAmt;

  /// Margin Rate */
  num? marginRate;

  /// Margin Amt */
  num? marginAmt;

  /// Pub Qty */
  num? pubQty;

  /// Pub Price */
  num? pubPrice;

  /// Can Qty */
  num? canQty;

  /// Mat Qty */
  num? matQty;

  /// Mat Amt */
  num? matAmt;

  /// Matched price average */
  num? matPriceAvg;

  /// Notes */
  String? notes;

  /// Transaction Cd */
  String? transactionCd;

  /// Broker Cd */
  String? brokerCd;

  /// Intro Cd */
  String? introCd;

  /// Service Type */
  num? serviceType;

  /// Settle Unit */
  num? settleUnit;

  /// Payment DateTime? */
  num? paymentDate;

  /// Resolved Flag */
  num? resolvedFlag;

  /// Over Flag */
  num? overFlag;

  /// Active Stop */
  num? activeStop;

  /// Group Cd */
  String? groupCd;

  /// Mortgage contract number */
  String? mortContrNo;

  /// Status */
  String? status;

  /// Apr DateTime? Time */
  double? aprDateTime;

  /// Apr User Id */
  String? aprUserId;

  /// Reg DateTime? Time */
  double? regDateTime;

  /// Reg User Id */
  String? regUserId;

  /// Upd DateTime? Time */
  @override
  double? updDateTime;

  /// Upd User Id */
  String? updUserId;

  /// Market Name */
  String? marketSname;

  /// Transaction Name */
  String? transactionName;

  /// Branch Name */
  String? branchName;

  /// branch cd*/
  num? branchCd;

  /// Matched price average */
  num? matPrice;

  bool? isResolvedOrder;

  /// Extend status */
  int? extStatus;

  /// Confirm status */
  num? confirmStatus;

  /// Confirm date time */
  double? confirmDateTime;

  /// Confirm user id */
  String? confirmUserId;

  num? ordSrcType;

  String? clientInfo;

  bool orderNoChanged = false;
  bool subAccoNoChanged = false;
  bool tradeDateChanged = false;
  bool secCdChanged = false;
  bool ordQtyChanged = false;
  bool ordPriceChanged = false;
  bool pubQtyChanged = false;
  bool pubPriceChanged = false;
  bool matQtyChanged = false;
  bool matPriceAvgChanged = false;
  bool canQtyChanged = false;
  bool statusChanged = false;
  bool ordTypeChanged = false;

  @override
  //  implement custNoOrder
  String? get custNoOrder => custNo;

  @override
  TradeType? get tradeTypeOrder => tradeType;

  @override
  String? get orderPrice => ordPrice?.formatPrice(decimalDigits: 2);

  @override
  String? get orderQty => ordQty?.formatPrice(decimalDigits: 0);

  @override
  String? get orderType => ordType;
  @override
  String? get secCdOrder => secCd;
  @override
  String? get reqTimeOrder => reqTime?.formatHHMMSS();

  @override
  //  implement statusOrder
  String? get statusOrder => null;

  @override
  //  implement matPriceAvgOrder
  String? get matPriceAvgOrder => matPriceAvg?.formatPrice(decimalDigits: 2);

  @override
  //  implement matQtyOrder
  String? get matQtyOrder => matQty?.formatPrice(decimalDigits: 0);

  @override
  //  implement pubQtyOrder
  String? get pubQtyOrder => pubQty?.formatPrice(decimalDigits: 0);
  @override
  //  implement pubQtyOrder
  String? get pubPriceOrder => pubQty?.formatPrice(decimalDigits: 2);

  @override
  //  implement extStatusOrder
  String? get extStatusOrder => getStatus(extStatus);
  String getStatus(int? value) {
    switch (value) {
      case 1:
        return DerOrderNorStatus.cancel.title;
      case 2:
        return DerOrderNorStatus.intoTheSys.title;
      case 3:
        return DerOrderNorStatus.waitMatch.title;
      case 4:
        return DerOrderNorStatus.parMatch.title;
      case 5:
        return DerOrderNorStatus.match.title;
      case 6:
        return DerOrderNorStatus.parCancel.title;
      case 7:
        return DerOrderNorStatus.cancelAll.title;
      case 8:
        return DerOrderNorStatus.rejectStock.title;
      case 0:
      default:
        return DerOrderNorStatus.all.title;
    }
  }

  @override
  //  implement orderDateTime
  String? get orderDateTime => null;

  @override
  //  implement orderFormDate
  String? get orderFormDate => null;

  @override
  //  implement orderToDate
  String? get orderToDate => null;

  @override
  //  implement accNoOrder
  String get accNoOrder => '';

  @override
  //  implement condition
  bool get condition => false;

  @override
  //  implement orderAvgPrice
  String get orderAvgPrice => '';

  @override
  //  implement orderCutLostAmp
  String get orderCutLostAmp => '';

  @override
  //  implement orderCutLostPrice
  String get orderCutLostPrice => '';

  @override
  //  implement orderGrossAmp
  String get orderGrossAmp => '';

  @override
  //  implement orderLimitOffset
  String get orderLimitOffset => '';

  @override
  //  implement orderMatQty
  String get orderMatQty => '';

  @override
  //  implement orderPriceStop
  String get orderPriceStop => '';

  @override
  //  implement orderPubPrice
  String get orderPubPrice => '';

  @override
  //  implement orderPubQty
  String get orderPubQty => '';

  @override
  //  implement orderRangeStop
  String get orderRangeStop => '';

  @override
  // implement tradeTypeOrderDer
  String get tradeTypeOrderDer => '';

  @override
  // implement orderRegDateTime
  String? get orderRegDateTime => null;

  @override
  // implement orderRegDateTimeBot
  String? get orderRegDateTimeBot => null;

  @override
  // implement orderUpdateTime
  String? get orderUpdateTime => null;

  @override
  // implement orderUpdateTimeBottom
  String? get orderUpdateTimeBottom => null;

  @override
  String? get getOrdChanel => null;

  @override
  // implement ordOrgOrderNo
  String? get ordOrgOrderNo => orgOrderNo;

  @override
  // implement ordRefNo
  num? get ordRefNo => null;

  @override
  num? get ordTradeDate => tradeDate;

  @override
  num? get updLongTime => null;

  @override
  num? get alloDate => null;

  @override
  bool get isEditOrder =>
      status == 'O' &&
      (ordType != 'PT' ||
          ordType != 'ATO' ||
          ordType != 'ATC' ||
          ordType != 'PLO');
}
