class LstPortfolio {
  LstPortfolio({
    this.alloDate,
    this.refNo,
    this.transDate,
    this.rightQty,
    this.rightAmt,
    this.avgPrice,
    this.delCd,
    this.subAccoCd,
    this.subAccoNo,
    this.secCd,
    this.qty,
    this.investAmt,
    this.transactionCd,
    this.regDateTime,
    this.regUserId,
    this.updDateTime,
    this.updUserId,
    this.floorPrice,
    this.basicPrice,
    this.ceilingPrice,
    this.allowEntrust,
    this.custNo,
  });

  factory LstPortfolio.fromJson(Map<String, dynamic> json) => LstPortfolio(
        alloDate: json['alloDate'] as dynamic,
        refNo: json['refNo'] as dynamic,
        transDate: json['transDate'] as num?,
        rightQty: json['rightQty'] as num?,
        rightAmt: json['rightAmt'] as num?,
        avgPrice: (json['avgPrice'] as num?)?.toDouble(),
        delCd: json['delCd'] as dynamic,
        subAccoCd: json['subAccoCd'] as num?,
        subAccoNo: json['subAccoNo'] as String?,
        secCd: json['secCd'] as String?,
        qty: json['qty'] as num?,
        investAmt: json['investAmt'] as num?,
        transactionCd: json['transactionCd'] as dynamic,
        regDateTime: json['regDateTime'] as dynamic,
        regUserId: json['regUserId'] as dynamic,
        updDateTime: json['updDateTime'] as dynamic,
        updUserId: json['updUserId'] as dynamic,
        floorPrice: json['floorPrice'] as dynamic,
        basicPrice: json['basicPrice'] as dynamic,
        ceilingPrice: json['ceilingPrice'] as dynamic,
        allowEntrust: json['allowEntrust'] as bool?,
        custNo: json['custNo'] as dynamic,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'alloDate': alloDate,
        'refNo': refNo,
        'transDate': transDate,
        'rightQty': rightQty,
        'rightAmt': rightAmt,
        'avgPrice': avgPrice,
        'delCd': delCd,
        'subAccoCd': subAccoCd,
        'subAccoNo': subAccoNo,
        'secCd': secCd,
        'qty': qty,
        'investAmt': investAmt,
        'transactionCd': transactionCd,
        'regDateTime': regDateTime,
        'regUserId': regUserId,
        'updDateTime': updDateTime,
        'updUserId': updUserId,
        'floorPrice': floorPrice,
        'basicPrice': basicPrice,
        'ceilingPrice': ceilingPrice,
        'allowEntrust': allowEntrust,
        'custNo': custNo,
      };
  dynamic alloDate;
  dynamic refNo;
  num? transDate;
  num? rightQty;
  num? rightAmt;
  num? avgPrice;
  dynamic delCd;
  num? subAccoCd;
  String? subAccoNo;
  String? secCd;
  num? qty;
  num? investAmt;
  dynamic transactionCd;
  dynamic regDateTime;
  dynamic regUserId;
  dynamic updDateTime;
  dynamic updUserId;
  dynamic floorPrice;
  dynamic basicPrice;
  dynamic ceilingPrice;
  bool? allowEntrust;
  dynamic custNo;
}
