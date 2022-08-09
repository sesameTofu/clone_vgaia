class PortfolioInvestment {
  PortfolioInvestment(
      {this.transDate,
      this.investAmt,
      this.beginInvestAmt,
      this.boughtAmt,
      this.soldAmt,
      this.endInvestAmt,
      this.growthPercent,
      this.profitAmt});

  PortfolioInvestment.fromJson(Map<String, dynamic> json) {
    transDate = json['transDate'] as num?;
    investAmt = json['investAmt'] as num?;
    beginInvestAmt = json['beginInvestAmt'] as num?;
    boughtAmt = json['boughtAmt'] as num?;
    soldAmt = json['soldAmt'] as num?;
    endInvestAmt = json['endInvestAmt'] as num?;
    growthPercent = json['growthPercent'] as num?;
    profitAmt = json['profitAmt'] as num?;
  }

  num? transDate;
  num? investAmt;
  num? beginInvestAmt;
  num? boughtAmt;
  num? soldAmt;
  num? endInvestAmt;
  num? growthPercent;
  num? profitAmt;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'transDate': transDate,
        'investAmt': investAmt,
        'beginInvestAmt': beginInvestAmt,
        'boughtAmt': boughtAmt,
        'soldAmt': soldAmt,
        'endInvestAmt': endInvestAmt,
        'growthPercent': growthPercent,
        'profitAmt': profitAmt,
      };
}
