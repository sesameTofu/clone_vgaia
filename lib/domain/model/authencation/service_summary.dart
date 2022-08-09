import 'package:flutter_mobile/domain/model/authencation/srv_4511_result_data1.dart';
import 'package:flutter_mobile/domain/model/authencation/srv_4511_result_data2.dart';
import 'package:flutter_mobile/domain/model/authencation/srv_4511_result_data3.dart';
import 'package:flutter_mobile/domain/model/authencation/srv_4511_result_data4.dart';
import 'package:flutter_mobile/domain/model/authencation/srv_4511_result_data5.dart';
import 'package:flutter_mobile/domain/model/authencation/srv_4511_result_data6.dart';
import 'package:flutter_mobile/domain/model/authencation/srv_4511_result_data7.dart';

class ServiceSummary {
  ServiceSummary({
    this.custNo,
    this.contactCenterData,
    this.tradingOnlineData,
    this.transferData,
    this.smsData,
    this.emailData,
    this.advanceData,
    this.frontUserAuthenData,
    this.allowEditMobileEmail,
  });

  factory ServiceSummary.fromJson(Map<String, dynamic> json) => ServiceSummary(
      custNo: json['custNo'],
      contactCenterData: json['contactCenterData'] == null
          ? null
          : Srv4511ResultData1.fromJson(
              json['contactCenterData'] as Map<String, dynamic>),
      tradingOnlineData: json['tradingOnlineData'] == null
          ? null
          : Srv4511ResultData2.fromJson(
              json['tradingOnlineData'] as Map<String, dynamic>),
      transferData: json['transferData'] == null
          ? null
          : Srv4511ResultData4.fromJson(
              json['transferData'] as Map<String, dynamic>),
      smsData: json['smsData'] == null
          ? null
          : Srv4511ResultData5.fromJson(
              json['smsData'] as Map<String, dynamic>),
      emailData: json['emailData'] == null
          ? null
          : Srv4511ResultData6.fromJson(
              json['emailData'] as Map<String, dynamic>),
      advanceData: json['advanceData'] == null
          ? null
          : Srv4511ResultData7.fromJson(
              json['advanceData'] as Map<String, dynamic>),
      frontUserAuthenData: json['frontUserAuthenData'] == null
          ? null
          : Srv4511ResultData3.fromJson(
              json['frontUserAuthenData'] as Map<String, dynamic>),
      allowEditMobileEmail: json['allowEditMobileEmail']);

  String? custNo;
  Srv4511ResultData1? contactCenterData;
  Srv4511ResultData2? tradingOnlineData;
  Srv4511ResultData4? transferData;
  Srv4511ResultData5? smsData;
  Srv4511ResultData6? emailData;
  Srv4511ResultData7? advanceData;
  Srv4511ResultData3? frontUserAuthenData;
  bool? allowEditMobileEmail;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'custNo': custNo,
        'contactCenterData': contactCenterData?.toJson(),
        'tradingOnlineData': tradingOnlineData?.toJson(),
        'transferData': transferData?.toJson(),
        'smsData': smsData?.toJson(),
        'emailData': emailData?.toJson(),
        'advanceData': advanceData?.toJson(),
        'frontUserAuthenData': frontUserAuthenData?.toJson(),
        'allowEditMobileEmail': allowEditMobileEmail,
      };
}
