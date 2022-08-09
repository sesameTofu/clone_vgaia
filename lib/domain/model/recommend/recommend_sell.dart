import 'package:flutter_mobile/utils/functs.dart';

class RecommendSell {
  RecommendSell({
    this.id,
    this.delCd,
    this.parentId,
    this.entryDate,
    this.secCd,
    this.price,
    this.remarks,
    this.regDateTime,
    this.regUserId,
    this.updDateTime,
    this.updUserId,
    this.buyEntryDate,
    this.buyPrice,
    this.updLongTime,
    this.parentUpdLongTime,
  });

  factory RecommendSell.fromMap(Map<String, dynamic> map) {
    return RecommendSell(
      id: map['id'] as num?,
      delCd: map['delCd'] as num?,
      parentId: map['parentId'] as num?,
      entryDate: map['entryDate'] as num?,
      secCd: map['secCd'] as String?,
      price: map['price'] as num?,
      remarks: map['remarks'] as String?,
      regDateTime: map['regDateTime'] as num?,
      regUserId: map['regUserId'] as String?,
      updDateTime: map['updDateTime'] as num?,
      updUserId: map['updUserId'] as String?,
      buyEntryDate: map['buyEntryDate'] as num?,
      buyPrice: map['buyPrice'] as num?,
      updLongTime: map['updLongTime'] as num?,
      parentUpdLongTime: map['parentUpdLongTime'] as num?,
    );
  }

  num? id;
  num? delCd;
  num? parentId;
  num? entryDate;
  String? secCd;
  num? price;
  String? remarks;
  num? regDateTime;
  String? regUserId;
  num? updDateTime;
  String? updUserId;
  num? buyEntryDate;
  num? buyPrice;
  num? updLongTime;
  num? parentUpdLongTime;

  num amountPrice() {
    if (isNull(buyPrice)) {
      return 0;
    }

    if (buyPrice! <= 0) {
      return 0;
    }

    return (((price ?? 0) - buyPrice!) / buyPrice!) * 100;
  }
}
