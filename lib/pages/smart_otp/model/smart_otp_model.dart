class SmartOtp {
  const SmartOtp({
    this.account,
    this.deviceKey,
    this.activatedTime,
  });

  SmartOtp.fromJson(Map<String, dynamic> json)
      : account = json['account'] as String,
        deviceKey = json['deviceKey'] as String,
        activatedTime = json['activatedTime'] as num;

  final String? account;
  final String? deviceKey;
  final num? activatedTime;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'account': account,
        'deviceKey': deviceKey,
        'activatedTime': activatedTime,
      };
}
