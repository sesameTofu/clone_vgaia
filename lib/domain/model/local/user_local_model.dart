class UserLocalModel {
  UserLocalModel({
    this.userName,
    this.passWord,
    this.isBiometric,
    this.lastTime,
    this.isShowAccount,
    this.industriesId,
  });

  factory UserLocalModel.fromJson(Map<String, dynamic> json) => UserLocalModel(
        userName: json['userName'] as String?,
        passWord: json['passWord'] as String?,
        lastTime: json['lastTime'] as String?,
        isBiometric: json['isBiometric'] as bool?,
        isShowAccount: json['isShowAccount'] as bool?,
        industriesId: json['industriesId'] as num?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userName': userName,
        'passWord': passWord,
        'isBiometric': isBiometric,
        'lastTime': lastTime,
        'isShowAccount': isShowAccount,
        'industriesId': industriesId,
      };

  void copy(UserLocalModel model) {
    userName = model.userName;
    passWord = model.passWord;
    isBiometric = model.isBiometric;
    lastTime = model.lastTime;
    isShowAccount = model.isShowAccount;
    industriesId = model.industriesId;
  }

  String? userName;
  String? passWord;
  bool? isBiometric;
  bool? isShowAccount;
  num? industriesId;
  String? lastTime;
}
