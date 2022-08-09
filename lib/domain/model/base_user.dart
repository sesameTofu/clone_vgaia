class BaseUser {
  BaseUser({
    this.userId,
    this.userType,
    this.manageType,
    this.branchCd,
    this.transactionCd,
    this.displayName,
    this.mobileNo,
  });

  BaseUser.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] as String?;
    userType = json['userType'] as num?;
    manageType = json['manageType'] as num?;
    branchCd = json['branchCd'] as String?;
    transactionCd = json['transactionCd'] as String?;
    displayName = json['displayName'] as String?;
    mobileNo = json['mobileNo'] as String?;
  }

  String? userId;
  num? userType;
  num? manageType;
  String? branchCd;
  String? transactionCd;
  String? displayName;
  String? mobileNo;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userId': userId,
        'userType': userType,
        'manageType': manageType,
        'branchCd': branchCd,
        'transactionCd': transactionCd,
        'displayName': displayName,
        'mobileNo': mobileNo,
      };
}
