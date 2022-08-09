class SmartOtpDeviceData {
  SmartOtpDeviceData({
    this.userId,
    this.deviceKey,
    this.deviceId,
    this.deviceInfo,
    this.activeDate,
    this.deactiveDate,
    this.status,
    this.remarks,
  });

  factory SmartOtpDeviceData.fromJson(Map<String, dynamic> json) =>
      SmartOtpDeviceData(
          userId: json['userId'],
          deviceKey: json['deviceKey'],
          deviceId: json['deviceId'],
          deviceInfo: json['deviceInfo'],
          activeDate: json['activeDate'],
          deactiveDate: json['deactiveDate'],
          status: json['status'],
          remarks: json['remarks']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userId': userId,
        'deviceKey': deviceKey,
        'deviceId': deviceId,
        'deviceInfo': deviceInfo,
        'activeDate': activeDate,
        'deactiveDate': deactiveDate,
        'status': status,
        'remarks': remarks,
      };

  String? userId;
  String? deviceKey;
  String? deviceId;
  String? deviceInfo;
  String? activeDate;
  String? deactiveDate;
  String? status;
  String? remarks;
}
