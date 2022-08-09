class CustomerInsiderData {
  CustomerInsiderData({
    this.bigShareHolhder, //bigShareholder - back tra ra ten nhu vay: LOL
    this.insiderShareholder,
    this.maxRateWarning,
    this.privateTradingBond,
    this.maxRate,
    this.privateRemainQty,
  });

  CustomerInsiderData.fromJson(Map<String, dynamic> json) {
    bigShareHolhder = json['bigShareholder'] as bool;
    insiderShareholder = json['insiderShareholder'] as bool;
    maxRateWarning = json['maxRateWarning'] as bool;
    privateTradingBond = json['privateTradingBond'] as bool;
    maxRate = json['maxRate'] as num;
    privateRemainQty = json['privateRemainQty'] as num;
  }

  /// Co dong lon
  bool? bigShareHolhder;

  /// Co dong noi bo
  bool? insiderShareholder;

  /// Co danh dau cham ty le
  bool? maxRateWarning;

  bool? privateTradingBond;

  /// Ty lệ chào mua công khai
  num? maxRate;

  num? privateRemainQty;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bigShareholder'] = bigShareHolhder;
    data['insiderShareholder'] = insiderShareholder;
    data['maxRateWarning'] = maxRateWarning;
    data['privateTradingBond'] = privateTradingBond;
    data['maxRate'] = maxRate;
    data['privateRemainQty'] = privateRemainQty;
    return data;
  }
}
