class SecBalanceList {
  SecBalanceList({
    this.secCd,
    this.transactionQtty,
    this.availQtty,
    this.soldQtty,
    this.marginQtty,
    this.t0Qtty,
    this.t1Qtty,
    this.t2Qtty,
    this.mortageQtty,
    this.limitedQtty,
    this.transactionPendingQtty,
    this.buyPendingQtty,
    this.holdQtty,
    this.limitedHoldCompany,
    this.holdVsdQtty,
    this.totalQtty,
    this.sellAvailQtty,
    this.sellAvailTotalQtty,
    this.transferAvail,
    this.totalAmt,
    this.subAccoNo,
    this.subAccoCd,
    this.fullName,
    this.mortSold,
    this.mortNeedUnblockToSell,
    this.transactionPendingLimited,
    this.avgPrice,
    this.floorPrice,
    this.basicPrice,
    this.ceilingPrice,
    this.totalMortQty,
    this.availMortQty,
    this.currentPrice,
  });

  factory SecBalanceList.fromJson(Map<String, dynamic> json) {
    return SecBalanceList(
      secCd: json['secCd'] as String?,
      transactionQtty: json['transactionQtty'] as num?,
      availQtty: json['availQtty'] as num?,
      soldQtty: json['soldQtty'] as num?,
      marginQtty: json['marginQtty'] as num?,
      t0Qtty: json['t0Qtty'] as num?,
      t1Qtty: json['t1Qtty'] as num?,
      t2Qtty: json['t2Qtty'] as num?,
      mortageQtty: json['mortageQtty'] as num?,
      limitedQtty: json['limitedQtty'] as num?,
      transactionPendingQtty: json['transactionPendingQtty'] as num?,
      buyPendingQtty: json['buyPendingQtty'] as num?,
      holdQtty: json['holdQtty'] as num?,
      limitedHoldCompany: json['limitedHoldCompany'] as num?,
      holdVsdQtty: json['holdVsdQtty'] as num?,
      totalQtty: json['totalQtty'] as num?,
      sellAvailQtty: json['sellAvailQtty'] as num?,
      sellAvailTotalQtty: json['sellAvailTotalQtty'] as num?,
      transferAvail: json['transferAvail'] as num?,
      totalAmt: json['totalAmt'] as num?,
      subAccoNo: json['subAccoNo'] as String?,
      subAccoCd: json['subAccoCd'] as num?,
      fullName: json['fullName'] as String?,
      mortSold: json['mortSold'] as num?,
      mortNeedUnblockToSell: json['mortNeedUnblockToSell'] as num?,
      transactionPendingLimited: json['transactionPendingLimited'] as num?,
      avgPrice: (json['avgPrice'] as num?)?.toDouble(),
      floorPrice: (json['floorPrice'] as num?)?.toDouble(),
      basicPrice: (json['basicPrice'] as num?)?.toDouble(),
      ceilingPrice: (json['ceilingPrice'] as num?)?.toDouble(),
      totalMortQty: json['totalMortQty'] as num?,
      availMortQty: json['availMortQty'] as num?,
      currentPrice: (json['currentPrice'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'secCd': secCd,
        'transactionQtty': transactionQtty,
        'availQtty': availQtty,
        'soldQtty': soldQtty,
        'marginQtty': marginQtty,
        't0Qtty': t0Qtty,
        't1Qtty': t1Qtty,
        't2Qtty': t2Qtty,
        'mortageQtty': mortageQtty,
        'limitedQtty': limitedQtty,
        'transactionPendingQtty': transactionPendingQtty,
        'buyPendingQtty': buyPendingQtty,
        'holdQtty': holdQtty,
        'limitedHoldCompany': limitedHoldCompany,
        'holdVsdQtty': holdVsdQtty,
        'totalQtty': totalQtty,
        'sellAvailQtty': sellAvailQtty,
        'sellAvailTotalQtty': sellAvailTotalQtty,
        'transferAvail': transferAvail,
        'totalAmt': totalAmt,
        'subAccoNo': subAccoNo,
        'subAccoCd': subAccoCd,
        'fullName': fullName,
        'mortSold': mortSold,
        'mortNeedUnblockToSell': mortNeedUnblockToSell,
        'transactionPendingLimited': transactionPendingLimited,
        'avgPrice': avgPrice,
        'floorPrice': floorPrice,
        'basicPrice': basicPrice,
        'ceilingPrice': ceilingPrice,
        'totalMortQty': totalMortQty,
        'availMortQty': availMortQty,
        'currentPrice': currentPrice,
      };
  String? secCd;
  num? transactionQtty;
  num? availQtty;
  num? soldQtty;
  num? marginQtty;
  num? t0Qtty;
  num? t1Qtty;
  num? t2Qtty;
  num? mortageQtty;
  num? limitedQtty;
  num? transactionPendingQtty;
  num? buyPendingQtty;
  num? holdQtty;
  num? limitedHoldCompany;
  num? holdVsdQtty;
  num? totalQtty;
  num? sellAvailQtty;
  num? sellAvailTotalQtty;
  num? transferAvail;
  num? totalAmt;
  String? subAccoNo;
  num? subAccoCd;
  String? fullName;
  num? mortSold;
  num? mortNeedUnblockToSell;
  num? transactionPendingLimited;
  double? avgPrice;
  double? floorPrice;
  double? basicPrice;
  double? ceilingPrice;
  num? totalMortQty;
  num? availMortQty;
  double? currentPrice;
}
