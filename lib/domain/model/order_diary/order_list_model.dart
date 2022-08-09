import 'package:flutter_mobile/global/app_enum.dart';

abstract class OrderListModelAbstract {
  String? get secCdOrder;

  String? get custNoOrder;

  TradeType? get tradeTypeOrder;
  String? get reqTimeOrder;
  String? get statusOrder;
  String? get orderQty;
  String? get orderPrice;
  String? get orderType;
  String? get matPriceAvgOrder;
  String? get matQtyOrder;
  String? get pubQtyOrder;
  String? get pubPriceOrder;
  String? get extStatusOrder;
  String? get orderDateTime;
  String? get orderFormDate;
  String? get orderToDate;
  bool selectCancelOrder = false;

  //bool isEditOrder = false;

  bool? get orderToDatea => selectCancelOrder;
  //From der

  bool get isEditOrder;
  String get accNoOrder;
  String get tradeTypeOrderDer;
  String get orderPriceStop;
  //bien do
  String get orderCutLostAmp;
  //cho lai
  String get orderGrossAmp;
  //khong dung
  String get orderCutLostPrice;
  String get orderRangeStop;
  String get orderLimitOffset;
  bool get condition;
  //KL khop
  String get orderMatQty;
  //Gia khop
  String get orderAvgPrice;
  //kl - gia cho
  String get orderPubQty;
  String get orderPubPrice;
  String? get orderRegDateTime;
  String? get orderRegDateTimeBot;
  String? get orderUpdateTime;
  String? get orderUpdateTimeBottom;
  String? get getOrdChanel;
  num? get ordRefNo;
  String? get ordOrgOrderNo;
  num? get ordTradeDate;
  num? get updLongTime;
  num? get updDateTime;
  num? get alloDate;
  num? get ordChanel;
}
