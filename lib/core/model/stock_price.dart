import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/core_support/enum/core_enum_helper.dart';
import 'package:flutter_mobile/extensions/extension.dart';

class StockPrice {
  StockPrice({
    this.tradeplace,
    this.symbol,
    this.basicPrice,
    this.floorPrice,
    this.ceilingPrice,
    this.sessionid,
  });

  factory StockPrice.fromJson(Map<String, dynamic> json) => StockPrice(
        tradeplace: json['tradeplace'] as String?,
        symbol: json['symbol'] as String?,
        basicPrice:
            ((json['basicprice'] as String?)?.formatNumber() ?? 0) / 1000,
        floorPrice:
            ((json['floorprice'] as String?)?.formatNumber() ?? 0) / 1000,
        ceilingPrice:
            ((json['ceilingprice'] as String?)?.formatNumber() ?? 0) / 1000,
        sessionid: CoreEnumHelper.getMarketSessionWithIndex(
            json['sessionid'] as String?, json['tradeplace'] as String?),
      );

  String? tradeplace;
  String? symbol;
  num? basicPrice;
  num? floorPrice;
  num? ceilingPrice;
  MarketStatusSessionWithIndex? sessionid;
}
