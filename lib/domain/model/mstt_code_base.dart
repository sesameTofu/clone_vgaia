class MsttCodeBase {
  MsttCodeBase({
    this.codeGroupName,
    this.code,
    this.codeValue1,
    this.codeValue2,
  });

  MsttCodeBase.fromJson(Map<String, dynamic> json) {
    codeGroupName = json['codeGroupName'] as String?;
    code = json['code'] as num?;
    codeValue1 = json['codeValue1'] as String?;
    codeValue2 = json['codeValue2'] as String?;
  }

  String? codeGroupName;
  num? code;
  String? codeValue1;
  String? codeValue2;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'codeGroupName': codeGroupName,
        'code': code,
        'codeValue1': codeValue1,
        'codeValue2': codeValue2,
      };
}
