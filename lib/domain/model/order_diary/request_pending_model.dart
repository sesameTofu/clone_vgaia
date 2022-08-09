import 'package:flutter_mobile/domain/model/order_diary/order_list_model.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/enum_helper.dart';

class RequestPendingModel extends OrderListModelAbstract {
  RequestPendingModel(
      {this.status,
      this.tradeType,
      this.ordType,
      this.secCd,
      this.subAccoNo,
      this.custNo,
      this.ordQty,
      this.ordPrice,
      this.reqNo,
      this.reqTime,
      this.tradeDate});

  factory RequestPendingModel.fromJson(Map<String, dynamic> json) {
    return RequestPendingModel(
        status: json['status'] as String,
        tradeType: EnumHelper.getTradeType(json['tradeType'] as num),
        ordType: json['ordType'] as String,
        secCd: json['secCd'] as String,
        subAccoNo: json['subAccoNo'] as String,
        custNo: json['custNo'] as String,
        ordQty: json['ordQty'] as num,
        reqTime: json['reqTime'] as num,
        ordPrice: json['ordPrice'] as num,
        reqNo: json['reqNo'] as num,
        tradeDate: json['tradeDate'] as num);
  }

  final String? status;
  final TradeType? tradeType;
  final String? ordType;
  final String? subAccoNo;
  final String? custNo;

  final String? secCd;
  final num? ordQty;
  final num? ordPrice;
  final num? reqTime;
  final num? reqNo;
  final num? tradeDate;

  Map<String?, dynamic> toMap() {
    return <String?, dynamic>{
      'tradeType': tradeType,
      'ordType': ordType,
      'secCd': secCd,
      'custNo': custNo,
      'subAccoNo': subAccoNo,
      'ordQty': ordQty,
      'ordPrice': ordPrice,
      'reqTime': reqTime,
      'reqNo': reqNo,
      'tradeDate': tradeDate
    };
  }

  num getTradingNumber() => EnumHelper.setTradeType(tradeType);

  @override
  String? get custNoOrder => custNo;

  @override
  TradeType? get tradeTypeOrder => tradeType;

  @override
  String? get orderPrice => ordPrice?.formatPrice(decimalDigits: 2);

  @override
  String? get orderQty => ordQty?.formatPrice();

  @override
  String? get orderType => ordType;

  @override
  String? get secCdOrder => secCd;

  @override
  //  implement statusOrder
  String? get statusOrder => null;
  @override
  //  implement matPriceAvgOrder
  String? get matPriceAvgOrder => null;

  @override
  //  implement matQtyOrder
  String? get matQtyOrder => null;

  @override
  //  implement pubQtyOrder
  String? get pubQtyOrder => null;

  @override
  //  implement reqTimeOrder
  String? get reqTimeOrder => reqTime?.formatHHMMSS();

  @override
  //  implement pubPriceOrder
  String? get pubPriceOrder => null;

  @override
  //  implement extStatusOrder
  String? get extStatusOrder => getStatusString(status);

  String getStatusString(String? st) {
    switch (st) {
      case 'P':
        return EnumOrderPreStatus.pending.title;
      case 'A':
        return EnumOrderPreStatus.approved.title;
      case 'X':
        return EnumOrderPreStatus.cancelled.title;
      default:
        return '';
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
  bool get isEditOrder => status == 'P';

  @override
  num? get ordChanel => null;
}
