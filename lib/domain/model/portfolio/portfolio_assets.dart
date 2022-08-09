class PortfolioAssets {
  PortfolioAssets({
    this.businessDate,
    this.creditAmt,
    this.balanceAmt,
    this.totalAsset,
    this.growthAmt,
    this.growthPercent,
  });

  PortfolioAssets.fromJson(Map<String, dynamic> json) {
    businessDate = json['businessDate'] as num?;
    creditAmt = json['creditAmt'] as num?;
    balanceAmt = json['balanceAmt'] as num?;
    totalAsset = json['totalAsset'] as num?;
    growthAmt = json['growthAmt'] as num?;
    growthPercent = json['growthPercent'] as num?;
  }

  num? businessDate;
  num? creditAmt;
  num? balanceAmt;
  num? totalAsset;
  num? growthAmt;
  num? growthPercent;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'businessDate': businessDate,
        'creditAmt': creditAmt,
        'balanceAmt': balanceAmt,
        'totalAsset': totalAsset,
        'growthAmt': growthAmt,
        'growthPercent': growthPercent,
      };
}
