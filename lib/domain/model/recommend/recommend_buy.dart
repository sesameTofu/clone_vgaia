import 'package:flutter_mobile/utils/functs.dart';

class RecommendBuy {
  RecommendBuy({
    this.id,
    this.delCd,
    this.entryDate,
    this.secCd,
    this.price,
    this.profitPrice,
    this.lossPrice,
    this.status,
    this.remarks,
    this.regDateTime,
    this.regUserId,
    this.updDateTime,
    this.updUserId,
    this.basicPrice,
    this.updLongTime,
  });

  factory RecommendBuy.fromMap(Map<String, dynamic> map) {
    return RecommendBuy(
      id: map['id'] as num?,
      delCd: map['delCd'] as num?,
      entryDate: map['entryDate'] as num?,
      secCd: map['secCd'] as String?,
      price: map['price'] as num?,
      profitPrice: map['profitPrice'] as num?,
      lossPrice: map['lossPrice'] as num?,
      status: map['status'] as num?,
      remarks: map['remarks'] as String?,
      regDateTime: map['regDateTime'] as num?,
      regUserId: map['regUserId'] as String?,
      updDateTime: map['updDateTime'] as num?,
      updUserId: map['updUserId'] as String?,
      basicPrice: map['basicPrice'] as num?,
      updLongTime: map['updLongTime'] as num?,
    );
  }

  num? id;
  num? delCd;
  num? entryDate;
  String? secCd;
  num? price;
  num? profitPrice;
  num? lossPrice;
  num? status;
  String? remarks;
  num? regDateTime;
  String? regUserId;
  num? updDateTime;
  String? updUserId;
  num? basicPrice;
  num? updLongTime;

  num amountPrice() {
    if (isNull(price)) {
      return 0;
    }

    if (price! <= 0) {
      return 0;
    }

    return (((basicPrice ?? 0) - price!) / price!) * 100;
  }
}
