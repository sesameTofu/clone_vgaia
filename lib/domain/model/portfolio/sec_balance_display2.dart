class SecBalanceDisplay2 {
  SecBalanceDisplay2({
    this.secCode,
    this.secType,
    this.marketCode,
    this.normalQty,
    this.limitQty,
    this.waitTransQty,
    this.waitTransLimitQty,
    this.availSale,
    this.todaySale,
    this.mortage,
    this.blockCom,
    this.blockVSD,
    this.pendingReceive,
    this.total,
    this.total2,
    this.currentPrice,
    this.totaValue,
    this.sellPubQty,
    this.sellMatQty,
    this.sellPendingTotal,
    this.receiveT0,
    this.receiveT1,
    this.receiveT2,
  });

  SecBalanceDisplay2.fromJson(Map<String?, dynamic> json) {
    secCode = json['secCode'] as String?;
    secType = json['secType'] as String?;
    marketCode = json['marketCode'] as String?;
    normalQty = json['normalQty'] as num?;
    limitQty = json['limitQty'] as num?;
    waitTransQty = json['waitTransQty'] as num?;
    waitTransLimitQty = json['waitTransLimitQty'] as num?;
    availSale = json['availSale'] as num?;
    todaySale = json['todaySale'] as num?;
    mortage = json['mortage'] as num?;
    blockCom = json['blockCom'] as num?;
    blockVSD = json['blockVSD'] as num?;
    pendingReceive = json['pendingReceive'] as num?;
    total = json['total'] as num?;
    total2 = json['total2'] as num?;
    currentPrice = json['currentPrice'] as num?;
    totaValue = json['totaValue'] as num?;
    sellPubQty = json['sellPubQty'] as num?;
    sellMatQty = json['sellMatQty'] as num?;
    sellPendingTotal = json['sellPendingTotal'] as num?;
    receiveT0 = json['receiveT0'] as num?;
    receiveT1 = json['receiveT1'] as num?;
    receiveT2 = json['receiveT2'] as num?;
  }

  String? secCode;
  String? secType;
  String? marketCode;
  num? normalQty;
  num? limitQty;
  num? waitTransQty;
  num? waitTransLimitQty;
  num? availSale;
  num? todaySale;
  num? mortage;
  num? blockCom;
  num? blockVSD;
  num? pendingReceive;
  num? total;
  num? total2;
  num? currentPrice;
  num? totaValue;
  num? sellPubQty;
  num? sellMatQty;
  num? sellPendingTotal;
  num? receiveT0;
  num? receiveT1;
  num? receiveT2;

  Map<String?, dynamic> toJson() => <String?, dynamic>{
        'secCode': secCode,
        'secType': secType,
        'marketCode': marketCode,
        'normalQty': normalQty,
        'limitQty': limitQty,
        'waitTransQty': waitTransQty,
        'waitTransLimitQty': waitTransLimitQty,
        'availSale': availSale,
        'todaySale': todaySale,
        'mortage': mortage,
        'blockCom': blockCom,
        'blockVSD': blockVSD,
        'pendingReceive': pendingReceive,
        'total': total,
        'total2': total2,
        'currentPrice': currentPrice,
        'totaValue': totaValue,
        'sellPubQty': sellPubQty,
        'sellMatQty': sellMatQty,
        'sellPendingTotal': sellPendingTotal,
        'receiveT0': receiveT0,
        'receiveT1': receiveT1,
        'receiveT2': receiveT2,
      };

  num get getWaitBack => receiveT0 ?? 0 + (receiveT1 ?? 0) + (receiveT2 ?? 0);
  num get getBlockable => blockCom ?? 0 + (blockVSD ?? 0);
}
