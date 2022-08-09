class MatchVolume {
  MatchVolume({
    this.tradeDate,
    this.secCd,
    this.matPrice,
    this.buyQty,
    this.buyAmt,
    this.buyPercent,
    this.sellQty,
    this.sellAmt,
    this.sellPercent,
    this.totalQty,
    this.totalAmt,
    this.percentByTotal,
  });

  num? tradeDate;
  String? secCd;
  num? matPrice;
  num? buyQty;
  num? buyAmt;
  num? buyPercent;
  num? sellQty;
  num? sellAmt;
  num? sellPercent;
  num? totalQty;
  num? totalAmt;
  num? percentByTotal;
}
