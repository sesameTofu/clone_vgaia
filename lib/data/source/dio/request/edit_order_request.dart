import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/enum_helper.dart';

class EditOrderRequest {
  EditOrderRequest({
    this.subAccoNo,
    this.orderNo,
    this.ordType,
    this.secCd,
    this.marketCd,
    this.tradeType,
    this.ordQtty,
    this.ordPrice,
    this.newQty,
    this.newPrice,
    this.ordChannel,
    this.otpCode,
  });

  String? subAccoNo;
  String? orderNo;
  String? ordType;
  String? secCd;
  num? marketCd;
  TradeType? tradeType;
  num? ordQtty;
  num? ordPrice;
  num? newQty;
  num? newPrice;
  num? ordChannel;
  String? otpCode;

  Map<String?, dynamic> toJson() {
    return <String?, dynamic>{
      'subAccoNo': subAccoNo,
      'orderNo': orderNo,
      'ordType': ordType,
      'secCd': secCd,
      'marketCd': marketCd,
      'tradeType': EnumHelper.setTradeType(tradeType),
      'ordQtty': ordQtty,
      'ordPrice': ordPrice,
      'newQty': newQty,
      'newPrice': newPrice,
      'ordChannel': ordChannel,
      'otpCode': otpCode,
    };
  }
}
