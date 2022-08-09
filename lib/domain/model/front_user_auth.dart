class FrontUserAuth {
  FrontUserAuth({
    this.id,
    this.delCd,
    this.userID,
    this.userType,
    this.applicationCd,
    this.loginPinType,
    this.tradingPinType,
    this.advancePinType,
    this.transferPinType,
    this.oddSellPinType,
    this.capIncreasePinType,
    this.regDateTime,
    this.regUserId,
    this.updDateTime,
    this.updUserId,
  });

  FrontUserAuth.fromJson(Map<String?, dynamic> json) {
    id = json['id'] as num?;
    delCd = json['delCd'] as num?;
    userID = json['userID'] as String?;
    userType = json['userType'] as num?;
    applicationCd = json['applicationCd'] as num?;
    loginPinType = json['loginPinType'] as num?;
    tradingPinType = json['tradingPinType'] as num?;
    advancePinType = json['advancePinType'] as num?;
    transferPinType = json['transferPinType'] as num?;
    oddSellPinType = json['oddSellPinType'] as num?;
    capIncreasePinType = json['capIncreasePinType'] as num?;
    regDateTime =
        DateTime.fromMillisecondsSinceEpoch(json['regDateTime'] as int);
    regUserId = json['regUserId'] as String?;
    updDateTime =
        DateTime.fromMillisecondsSinceEpoch(json['updDateTime'] as int);
    updUserId = json['updUserId'] as String?;
  }

  num? id;
  num? delCd;
  String? userID;
  num? userType;
  num? applicationCd;
  num? loginPinType;
  num? tradingPinType;
  num? advancePinType;
  num? transferPinType;
  num? oddSellPinType;
  num? capIncreasePinType;
  DateTime? regDateTime;
  String? regUserId;
  DateTime? updDateTime;
  String? updUserId;

  Map<String?, dynamic> toJson() => <String?, dynamic>{
        'id': id,
        'delCd': delCd,
        'userID': userID,
        'userType': userType,
        'applicationCd': applicationCd,
        'loginPinType': loginPinType,
        'tradingPinType': tradingPinType,
        'advancePinType': advancePinType,
        'transferPinType': transferPinType,
        'oddSellPinType': oddSellPinType,
        'capIncreasePinType': capIncreasePinType,
        'regDateTime': regDateTime?.toIso8601String(),
        'regUserId': regUserId,
        'updDateTime': updDateTime?.toIso8601String(),
        'updUserId': updUserId,
      };
}
