class CustomerPortfolio {
  CustomerPortfolio({
    this.subAccountNo,
    this.custName,
    this.secCd,
    this.remainQty,
    this.sellAvailQty,
    this.rightQty,
    this.rightAmt,
    this.investmentAmt,
    this.avgPrice,
    this.currentPrice,
    this.investmentAmtInday,
    this.profitAmtInday,
    this.profitAmtAcm,
    this.floorPrice,
    this.basicPrice,
    this.ceilingPrice,
    this.lastPrice,
    this.changePoint,
    this.changePercent,
    this.investmentValueInday,
    this.profitValueInday,
    this.profitValueAcm,
    this.profitPercentAcm,
    this.marginnumerest,
    this.transDate,
    this.subAccoCd,
    this.secClassName,
  });

  CustomerPortfolio.fromJson(Map<String, dynamic> json) {
    subAccountNo = json['subAccountNo'] as String?;
    custName = json['custName'] as String?;
    secCd = json['secCd'] as String?;
    remainQty = json['remainQty'] as num?;
    sellAvailQty = json['sellAvailQty'] as num?;
    rightQty = json['rightQty'] as num?;
    rightAmt = json['rightAmt'] as num?;
    investmentAmt = json['investmentAmt'] as num?;
    avgPrice = json['avgPrice'] as num?;
    currentPrice = json['currentPrice'] as num?;
    investmentAmtInday = json['investmentAmtInday'] as num?;
    profitAmtInday = json['profitAmtInday'] as num?;
    profitAmtAcm = json['profitAmtAcm'] as num?;
    floorPrice = json['floorPrice'] as num?;
    basicPrice = json['basicPrice'] as num?;
    ceilingPrice = json['ceilingPrice'] as num?;
    lastPrice = json['lastPrice'] as num?;
    changePoint = json['changePoint'] as num?;
    changePercent = json['changePercent'] as num?;
    investmentValueInday = json['investmentValueInday'] as num?;
    profitValueInday = json['profitValueInday'] as num?;
    profitValueAcm = json['profitValueAcm'] as num?;
    profitPercentAcm = json['profitPercentAcm'] as num?;
    marginnumerest = json['marginnumerest'] as num?;
    transDate = json['transDate'] as num?;
    subAccoCd = json['subAccoCd'] as num?;
    secClassName = json['secClassName'] as String?;
  }

  String? subAccountNo;
  String? custName;
  String? secCd;
  num? remainQty;
  num? sellAvailQty;
  num? rightQty;
  num? rightAmt;
  num? investmentAmt;
  num? avgPrice;
  num? currentPrice;
  num? investmentAmtInday;
  num? profitAmtInday;
  num? profitAmtAcm;
  num? floorPrice;
  num? basicPrice;
  num? ceilingPrice;
  num? lastPrice;
  num? changePoint;
  num? changePercent;
  num? investmentValueInday;
  num? profitValueInday;
  num? profitValueAcm;
  num? profitPercentAcm;
  num? marginnumerest;
  num? transDate;
  num? subAccoCd;
  String? secClassName;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'subAccountNo': subAccountNo,
        'custName': custName,
        'secCd': secCd,
        'remainQty': remainQty,
        'sellAvailQty': sellAvailQty,
        'rightQty': rightQty,
        'rightAmt': rightAmt,
        'investmentAmt': investmentAmt,
        'avgPrice': avgPrice,
        'currentPrice': currentPrice,
        'investmentAmtInday': investmentAmtInday,
        'profitAmtInday': profitAmtInday,
        'profitAmtAcm': profitAmtAcm,
        'floorPrice': floorPrice,
        'basicPrice': basicPrice,
        'ceilingPrice': ceilingPrice,
        'lastPrice': lastPrice,
        'changePoint': changePoint,
        'changePercent': changePercent,
        'investmentValueInday': investmentValueInday,
        'profitValueInday': profitValueInday,
        'profitValueAcm': profitValueAcm,
        'profitPercentAcm': profitPercentAcm,
        'marginnumerest': marginnumerest,
        'transDate': transDate,
        'subAccoCd': subAccoCd,
        'secClassName': secClassName,
      };

  num get percentProfitAmtAcm {
    if (investmentAmt == null || investmentAmt! <= 0) {
      return 0;
    }
    return ((profitAmtAcm ?? 0) / investmentAmt!) * 100;
  }

  num get percentProfit {
    return (calProfitAmtAcm / (investmentAmt ?? 0)) * 100;
  }

  num get calInvesmentAmtInDay {
    return (currentPrice ?? 0) * (remainQty ?? 0) * 1000;
  }

  num get calProfitAmtAcm {
    return ((currentPrice ?? 0) - (avgPrice ?? 0)) * (remainQty ?? 0) * 1000;
  }
}
