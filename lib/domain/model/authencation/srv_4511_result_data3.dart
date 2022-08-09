class Srv4511ResultData3 {
  Srv4511ResultData3({
    this.loginType,
    this.orderType,
    this.payAdvanceType,
    this.tranferType,
    this.capitalIncreaseAppType,
    this.oddLotType,
    this.marginType,
    this.oneTimeAuth,
  });

  factory Srv4511ResultData3.fromJson(Map<String, dynamic> json) =>
      Srv4511ResultData3(
          loginType: json['loginType'],
          orderType: json['orderType'],
          payAdvanceType: json['payAdvanceType'],
          tranferType: json['tranferType'],
          capitalIncreaseAppType: json['capitalIncreaseAppType'],
          oddLotType: json['oddLotType'],
          marginType: json['marginType'],
          oneTimeAuth: json['oneTimeAuth']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'loginType': loginType,
        'orderType': orderType,
        'payAdvanceType': payAdvanceType,
        'tranferType': tranferType,
        'capitalIncreaseAppType': capitalIncreaseAppType,
        'oddLotType': oddLotType,
        'marginType': marginType,
        'oneTimeAuth': oneTimeAuth,
      };

  String? loginType;
  String? orderType;
  String? payAdvanceType;
  String? tranferType;
  String? capitalIncreaseAppType;
  String? oddLotType;
  String? marginType;
  String? oneTimeAuth;
}
