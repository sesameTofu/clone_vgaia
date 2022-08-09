import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/import.dart';

class SecuritiesPortfolio with BaseMixin {
  SecuritiesPortfolio({
    this.custodycd,
    this.accountno,
    this.symbol,
    this.totalQuantity,
    this.tradeQuantity,
    this.blockedQuantity,
    this.mortgageQuantity,
    this.restrictedQuantity,
    this.receivingRightQuantity,
    this.receivingt0,
    this.receivingt1,
    this.receivingt2,
    this.costprice,
    this.initialValue,
    this.marketPrice,
    this.stockValue,
    this.unrealizedProfit,
    this.unrealizedProfitRate,
    this.pendingToWithdraw,
  });

  factory SecuritiesPortfolio.fromJson(Map<String, dynamic> json) {
    return SecuritiesPortfolio(
      custodycd: json['custodycd'] as String?,
      accountno: json['accountno'] as String?,
      symbol: json['symbol'] as String?,
      totalQuantity: json['totalquantity'] as num?,
      tradeQuantity: json['tradequantity'] as num?,
      blockedQuantity: json['blockedquantity'] as num?,
      mortgageQuantity: json['mortgagequantity'] as num?,
      restrictedQuantity: json['restrictedquantity'] as num?,
      receivingRightQuantity: json['receivingrightquantity'] as num?,
      receivingt0: json['receivingt0'] as num?,
      receivingt1: json['receivingt1'] as num?,
      receivingt2: json['receivingt2'] as num?,
      costprice: json['costprice'] as num?,
      initialValue: json['initialvalue'] as num?,
      marketPrice: json['marketprice'] as num?,
      stockValue: json['stockvalue'] as num?,
      unrealizedProfit: json['unrealizedprofit'] as num?,
      unrealizedProfitRate: json['unrealizedprofitrate'] as String?,
      pendingToWithdraw: json['pendingtowithdraw'] as num?,
    );
  }

  String? custodycd;
  String? accountno;
  String? symbol;
  num? totalQuantity;
  num? tradeQuantity;
  num? blockedQuantity;
  num? mortgageQuantity;
  num? restrictedQuantity;
  num? receivingRightQuantity;
  num? receivingt0;
  num? receivingt1;
  num? receivingt2;
  num? costprice;
  num? initialValue;
  num? marketPrice;
  num? stockValue;
  num? unrealizedProfit;
  String? unrealizedProfitRate;
  num? pendingToWithdraw;

  StockItemViewModel? itemViewModel;

  num get matchPrice => (itemViewModel?.stockInfor?.matchPrice == null ||
          itemViewModel?.stockInfor?.matchPrice == 0)
      ? (marketPrice ?? 0)
      : ((itemViewModel?.stockInfor?.matchPrice ?? 0) * 1000);

  num get unrealizedProfitCal =>
      (totalQuantity ?? 0) * (matchPrice - (costprice ?? 0));

  num get unrealizedProfitRateCal => costprice == 0
      ? 100
      : (unrealizedProfitCal / ((totalQuantity ?? 0) * (costprice ?? 0))) * 100;

  num get totalValue => (totalQuantity ?? 0) * matchPrice;

  num get totalInitialValue => (totalQuantity ?? 0) * (costprice ?? 0);

  Color getColor({required num matchPrice}) {
    final num matchPriceValue = matchPrice * 1000;
    final num costPriceValue = costprice ?? 0;
    if (matchPriceValue == costPriceValue) {
      return color.yellow50;
    } else if (matchPrice > costPriceValue) {
      return color.green50;
    } else {
      return color.red50;
    }
  }
}
