import 'package:flutter_mobile/domain/model/order_diary/order_list_model.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/enum_helper.dart';
import 'package:flutter_mobile/import.dart';

class DertRequestCond extends OrderListModelAbstract {
  /// Allo Date */
  @override
  num? alloDate;

  /// Ref No */
  num? refNo;

  /// Del Cd */
  num? delCd;

  /// Req Time */
  double? reqTime;

  /// Cust cd */
  num? subAccoCd;

  /// Cust no */
  String? subAccoNo;

  /// Cust cd */
  num? custCd;

  /// Cust no */
  String? custNo;

  /// Cust Family Name */
  String? custFamilyName;

  /// Cust Given Name */
  String? custGivenName;

  /// Cust Transaction Cd */
  String? custTransactionCd;

  /// Sec Cd */
  String? secCd;

  /// Trade Type */
  TradeType? tradeType;

  /// Ord Qty */
  num? ordQty;

  /// Ord Price */
  num? ordPrice;

  /// Cond Type */
  DertRequestCondType? condType;

  /// Price Stop */
  num? priceStop;

  /// Range Stop */
  num? rangeStop;

  /// Gross Amp */
  num? grossAmp;

  /// Cut Lost Amp */
  num? cutLostAmp;

  /// Cut Lost Price */
  num? cutLostPrice;

  /// Limit Offset */
  num? limitOffset;

  /// Price Up */
  num? priceUp;

  /// Price Down */
  num? priceDown;

  /// Valid Date */
  num? validDate;

  /// Remarks */
  String? remarks;

  /// Notes */
  String? notes;

  /// Ord Chanel */
  @override
  num? ordChanel;

  /// Transaction Cd */
  String? transactionCd;

  /// Client Info */
  String? clientInfo;

  /// Status */
  DertRequestCondStatus? status;

  /// Reg Date Time */
  num? regDateTime;

  /// Reg User Id */
  String? regUserId;

  /// Upd Date Time */
  @override
  num? updDateTime;

  /// Upd User Id */
  String? updUserId;

  /// Update time long type */
  @override
  num? updLongTime;

  // ignore: sort_constructors_first
  DertRequestCond({
    this.alloDate,
    this.refNo,
    this.delCd,
    this.reqTime,
    this.subAccoCd,
    this.subAccoNo,
    this.custCd,
    this.custNo,
    this.custFamilyName,
    this.custGivenName,
    this.custTransactionCd,
    this.secCd,
    this.tradeType,
    this.ordQty,
    this.ordPrice,
    this.condType,
    this.priceStop,
    this.rangeStop,
    this.grossAmp,
    this.cutLostAmp,
    this.cutLostPrice,
    this.limitOffset,
    this.priceUp,
    this.priceDown,
    this.validDate,
    this.remarks,
    this.notes,
    this.ordChanel,
    this.transactionCd,
    this.clientInfo,
    this.status,
    this.regDateTime,
    this.regUserId,
    this.updDateTime,
    this.updUserId,
    this.updLongTime,
  });

  Map<String?, dynamic> tojson() {
    return <String?, dynamic>{
      'alloDate': alloDate,
      'refNo': refNo,
      'delCd': delCd,
      'reqTime': reqTime,
      'subAccoCd': subAccoCd,
      'subAccoNo': subAccoNo,
      'custCd': custCd,
      'custNo': custNo,
      'custFamilyName': custFamilyName,
      'custGivenName': custGivenName,
      'custTransactionCd': custTransactionCd,
      'secCd': secCd,
      'tradeType': tradeType,
      'ordQty': ordQty,
      'ordPrice': ordPrice,
      'condType': condType,
      'priceStop': priceStop,
      'rangeStop': rangeStop,
      'grossAmp': grossAmp,
      'cutLostAmp': cutLostAmp,
      'cutLostPrice': cutLostPrice,
      'limitOffset': limitOffset,
      'priceUp': priceUp,
      'priceDown': priceDown,
      'validDate': validDate,
      'remarks': remarks,
      'notes': notes,
      'ordChanel': ordChanel,
      'transactionCd': transactionCd,
      'clientInfo': clientInfo,
      'status': status,
      'regDateTime': regDateTime,
      'regUserId': regUserId,
      'updDateTime': updDateTime,
      'updUserId': updUserId,
      'updLongTime': updLongTime,
    };
  }

  // ignore: sort_constructors_first
  factory DertRequestCond.fromJson(Map<String, dynamic> map) {
    return DertRequestCond(
      alloDate: map['alloDate'] as num,
      refNo: map['refNo'] as num,
      delCd: map['delCd'] as num,
      reqTime: map['reqTime'] == null ? 0 : (map['reqTime'] as num).toDouble(),
      subAccoCd: map['subAccoCd'] as num,
      subAccoNo: map['subAccoNo'] as String,
      custCd: map['custCd'] as num,
      custNo: map['custNo'] as String,
      custFamilyName: map['custFamilyName'] as String,
      custGivenName: map['custGivenName'] as String,
      custTransactionCd: map['custTransactionCd'] as String,
      secCd: map['secCd'] as String,
      tradeType: EnumHelper.getTradeType(map['tradeType'] as num),
      ordQty: map['ordQty'] as num,
      ordPrice: map['ordPrice'] as num,
      condType: EnumHelper.setDertRequestCondType(map['condType'] as String),
      priceStop: map['priceStop'] as num,
      rangeStop: map['rangeStop'] as num,
      grossAmp: map['grossAmp'] as num,
      cutLostAmp: map['cutLostAmp'] as num,
      cutLostPrice: map['cutLostPrice'] as num,
      limitOffset: map['limitOffset'] as num,
      priceUp: map['priceUp'] as num,
      priceDown: map['priceDown'] as num,
      validDate: map['validDate'] as num,
      remarks: map['remarks'] as String,
      notes: map['notes'] as String,
      ordChanel: map['ordChanel'] as num,
      transactionCd: map['transactionCd'] as String,
      clientInfo: map['clientInfo'] as String,
      status: EnumHelper.setDertRequestCondStatus(map['status'] as num),
      regDateTime: map['regDateTime'] as num,
      regUserId: map['regUserId'] as String,
      updDateTime: map['updDateTime'] as num,
      updUserId: map['updUserId'] as String,
      updLongTime: map['updLongTime'] as num,
    );
  }

  @override
  String get accNoOrder => custNo!;

  @override
  String get secCdOrder => secCd!;

  @override
  String get tradeTypeOrderDer {
    return tradeType.title();
  }

  @override
  TradeType? get tradeTypeOrder => tradeType;

  @override
  String get statusOrder => status == DertRequestCondStatus.orderNew
      ? LocaleKeys.created.tr
      : LocaleKeys.bond_transfer_deleted.tr;

  @override
  String get orderQty => ordQty!.formatVolume();

  @override
  String get orderPrice => ordPrice!.formatPrice(decimalDigits: 2);

  @override
  String get orderType => EnumHelper.getDertRequestCondType(condType!);

  @override
  String get orderPriceStop => priceStop!.formatPrice(decimalDigits: 2);

  @override
  String get orderCutLostAmp => cutLostAmp!.formatPrice(decimalDigits: 0);

  @override
  String get orderGrossAmp => grossAmp!.formatPrice(decimalDigits: 0);

  @override
  String get orderCutLostPrice => cutLostPrice!.formatPrice(decimalDigits: 1);

  @override
  String get orderRangeStop => rangeStop!.formatPrice(decimalDigits: 0);

  @override
  String get orderLimitOffset => limitOffset!.formatPrice(decimalDigits: 0);

  @override
  String get orderMatQty => '';

  @override
  bool get condition => true;

  @override
  String get orderUpdateTime {
    if (status != DertRequestCondStatus.orderDeleted) {
      return '---';
    }
    return _getOrderTime(updDateTime, isBottom: true);
  }

  @override
  String get orderUpdateTimeBottom {
    if (status != DertRequestCondStatus.orderDeleted) {
      return '---';
    }
    return _getOrderTime(updDateTime);
  }

  @override
  String get orderRegDateTime => _getOrderTime(regDateTime);

  @override
  String get orderRegDateTimeBot => _getOrderTime(regDateTime, isBottom: true);

  String _getOrderTime(num? orderTime, {bool isBottom = false}) {
    if (orderTime == 0 || orderTime == null) {
      return '---';
    }
    final DateTime dateTime = getDate(orderTime.toInt());
    if (isBottom) {
      return '${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
    }
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  DateTime getDate(int value) {
    return DateTime.fromMicrosecondsSinceEpoch(value * 1000);
  }

  @override
  String get orderAvgPrice => '';

  @override
  String get orderPubPrice => '';

  @override
  String get orderPubQty => '';

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
  String? get ordOrgOrderNo => null;

  @override
  // implement ordRefNo
  num? get ordRefNo => refNo;

  @override
  num? get ordTradeDate => null;

  @override
  bool get isEditOrder {
    return status == DertRequestCondStatus.orderNew;
  }
}
