import 'package:flutter_mobile/domain/model/order_diary/order_list_model.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/enum_helper.dart';

class RequestCondModel extends OrderListModelAbstract {
  RequestCondModel(
      {this.status,
      this.tradeType,
      this.condType,
      this.subAccoNo,
      this.secCd,
      this.ordQty,
      this.ordPrice,
      this.matQty,
      this.fromDate,
      this.toDate,
      this.updUserId,
      this.tradeDate,
      this.reqNo,
      this.regDateTime,
      this.refDate});

  factory RequestCondModel.fromJson(Map<String, dynamic> json) {
    return RequestCondModel(
      status: EnumHelper.getOrderConditionStatus(json['status'] as num),
      tradeType: EnumHelper.getTradeType(json['tradeType'] as num),
      condType: json['condType'] as String,
      subAccoNo: json['subAccoNo'] as String,
      updUserId: json['updUserId'] as String,
      secCd: json['secCd'] as String,
      ordQty: json['ordQty'] as num,
      ordPrice: json['ordPrice'] as num,
      regDateTime: json['regDateTime'] as num,
      matQty: json['matQty'] as num,
      fromDate: json['fromDate'] as num,
      toDate: json['toDate'] as num,
      refDate: json['refDate'] as num,
      reqNo: json['refNo'] as num,
    );
  }

  final OrderConditionStatus? status;
  final TradeType? tradeType;
  final String? condType;
  final String? subAccoNo;
  final String? secCd;
  final String? updUserId;
  final num? ordQty;
  final num? ordPrice;
  final num? matQty;
  final num? fromDate;
  final num? toDate;
  final num? regDateTime;
  final num? tradeDate;
  final num? reqNo;
  final num? refDate;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'tradeType': EnumHelper.setTradeType(tradeType),
      'condType': condType,
      'subAccoNo': subAccoNo,
      'secCd': secCd,
      'ordQty': ordQty,
      'ordPrice': ordPrice,
      'matQty': matQty,
      'fromDate': fromDate,
      'regDateTime': regDateTime,
      'toDate': toDate,
      'refDate': refDate,
      'refNo': reqNo
    };
  }

  @override
  //  implement custNoOrder
  String? get custNoOrder => updUserId;

  @override
  TradeType? get tradeTypeOrder => tradeType;

  @override
  String? get orderPrice => ordPrice?.formatPrice(decimalDigits: 2);

  @override
  String? get orderQty => ordQty?.formatPrice();

  @override
  String? get orderType => condType;

  @override
  String? get secCdOrder => secCd;
  @override
  String? get statusOrder => null;
  @override
  //  implement matPriceAvgOrder
  String? get matPriceAvgOrder => null;

  @override
  //  implement matQtyOrder
  String? get matQtyOrder => matQty?.formatPrice(decimalDigits: 2);

  @override
  //  implement pubQtyOrder
  String? get pubQtyOrder => null;

  @override
  //  implement reqTimeOrder
  String? get reqTimeOrder => _getOrderTime(regDateTime, isBottom: true);

  @override
  //  implement pubPriceOrder
  String? get pubPriceOrder => null;

  @override
  //  implement extStatusOrder
  String? get extStatusOrder => (status ?? OrderConditionStatus.all).title;

  @override
  //  implement orderDateTime
  String? get orderDateTime => _getOrderTime(regDateTime);

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
  String? get orderFormDate => fromDate?.formatDateDDMMYYYY();

  @override
  //  implement orderToDate
  String? get orderToDate => toDate?.formatDateDDMMYYYY();

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
  String? get ordOrgOrderNo => null;

  @override
  // implement ordRefNo
  num? get ordRefNo => null;

  @override
  num? get ordTradeDate => tradeDate;

  @override
  num? get updLongTime => null;

  @override
  num? get updDateTime => null;

  @override
  num? get alloDate => null;

  @override
  num? get ordChanel => null;

  @override
  bool get isEditOrder => status == OrderConditionStatus.effect;
}
