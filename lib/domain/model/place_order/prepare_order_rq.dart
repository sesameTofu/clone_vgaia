import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/global/app_enum.dart';

class PrepareSubmitOrder {
  PrepareSubmitOrder(
      {this.subAccoNo,
      this.tradeType,
      this.secCd,
      this.index,
      this.orderType,
      this.orderPrice,
      this.orderQty,
      this.marginRate,
      this.splitType = 0,
      this.splitNum = 1,
      this.mortContractNo,
      this.interval,
      this.srcChannel = 0,
      this.resolvedFlag = 0,
      this.sideType = 0,
      this.placeOrderType = PlaceOrderType.OrderNormal,
      this.triggerPrice,
      this.referencePrice,
      this.lowestAndHighesPrice,
      this.spreadType,
      this.priceDiffsType,
      this.priceCondition,
      this.matMethod,
      this.spreadValue,
      this.orderPriceCondition,
      this.activePrice,
      this.orderPriceConditionNumber,
      this.fromDate,
      this.toDate});

  String? subAccoNo;

  //Buy =1, sell =2
  TradeType? tradeType;
  String? secCd;
  Index? index;

  //order type = LO, ATO, ATC, MOK, MAK, PLO, MTL
  String? orderType;
  num? orderPrice;
  num? orderQty;
  num? marginRate;

  //default = 0
  num splitType;

  // default = 1
  num splitNum;
  String? mortContractNo;
  String? interval;
  num srcChannel;
  num resolvedFlag;
  num sideType;

  // Lệnh điều kiện
  PlaceOrderType placeOrderType;

  DateTime? fromDate;
  DateTime? toDate;

// Điều kiện giá của lệnh trước ngày ( không điều kiện và giá tham chiếu)
  OrderPriceCondition? orderPriceCondition;

  // điều kiện so sánh giá : >=, <=
  PriceCondition? priceCondition;

// Phương thức: phát sinh 1 lần, khớp đủ Kl đặt
  MatMethod? matMethod;

// Giá chênh lệch
  num? triggerPrice;

// Giá tham chiếu
  num? referencePrice;

// Khoảng dừng
  SpreadsType? spreadType;

  // giá trị khoảng dừng
  num? spreadValue;

// type chenh lech
  PriceDiffsType? priceDiffsType;

// Gia thap nhat
  num? lowestAndHighesPrice;

// Gia kich hoat
  num? activePrice;

// Giá đặt ở chốt lãi, cắt lỗi
  num? orderPriceConditionNumber;

  Map<String, dynamic> toJsonPlaceOrderNormal() => <String, dynamic>{
        'subAccoNo': subAccoNo,
        'tradeType': tradeType?.value(),
        'secCd': secCd,
        'marketCd': index?.marketCd(),
        'order_type': orderType,
        'order_price': orderPrice,
        'order_qty': orderQty,
        'marginRate': marginRate,
        'split_type': splitType,
        'split_num': splitNum,
        'mortContractNo': mortContractNo,
        'interval': interval,
        'srcChannel': srcChannel,
        'resolvedFlag': resolvedFlag,
        'sideType': sideType,
      };
}
