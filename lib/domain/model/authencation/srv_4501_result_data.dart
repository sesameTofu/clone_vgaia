import 'package:flutter_mobile/domain/model/authencation/srv_4501_row_data.dart';
import 'package:flutter_mobile/domain/model/authencation/srv_4511_service_email_data.dart';
import 'package:flutter_mobile/domain/model/authencation/srv_4511_service_sms_data.dart';

class Srv4501ResultData {
  Srv4501ResultData({
    this.id,
    this.serviceGroupCd,
    this.delCd,
    this.serviceGroupName,
    this.srvSts,
    this.remarks,
    this.regDateTime,
    this.regUserId,
    this.updDateTime,
    this.updUserId,
    this.serviceType,
    this.registerOnline,
    this.timeStamp,
    this.feeConfigId,
    this.feeRegister,
    this.feeOnMonth,
    this.selected,
    this.oldSelected,
    this.serviceEmailData,
    this.serviceSmsData,
    this.detailList,
  });

  Srv4501ResultData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceGroupCd = json['serviceGroupCd'];
    delCd = json['delCd'];
    serviceGroupName = json['serviceGroupName'];
    srvSts = json['srvSts'];
    remarks = json['remarks'];
    regDateTime = json['regDateTime'];
    regUserId = json['regUserId'];
    updDateTime = json['updDateTime'];
    updUserId = json['updUserId'];
    serviceType = json['serviceType'];
    registerOnline = json['registerOnline'];
    timeStamp = json['timeStamp'];
    feeConfigId = json['feeConfigId'];
    feeRegister = json['feeRegister'];
    feeOnMonth = json['feeOnMonth'];
    selected = json['selected'];
    serviceEmailData = json['serviceEmailData'] == null
        ? null
        : Srv4511ServiceEmailData.fromJson(
            json['serviceEmailData'] as Map<String, dynamic>);
    serviceSmsData = json['serviceSmsData'] == null
        ? null
        : Srv4511ServiceSmsData.fromJson(
            json['serviceSmsData'] as Map<String, dynamic>);
    detailList = json['detailList'] == null
        ? null
        : (json['detailList'] as List<dynamic>)
            .map<Srv4501RowData>((dynamic e) => Srv4501RowData.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'serviceGroupCd': serviceGroupCd,
        'delCd': delCd,
        'serviceGroupName': serviceGroupName,
        'srvSts': srvSts,
        'remarks': remarks,
        'regDateTime': regDateTime,
        'regUserId': regUserId,
        'updDateTime': updDateTime,
        'updUserId': updUserId,
        'serviceType': serviceType,
        'registerOnline': registerOnline,
        'timeStamp': timeStamp,
        'feeConfigId': feeConfigId,
        'feeRegister': feeRegister,
        'feeOnMonth': feeOnMonth,
        'selected': selected,
        'serviceEmailData': serviceEmailData,
        'serviceSmsData': serviceSmsData,
        'detailList': detailList,
      };

  String? id;
  String? serviceGroupCd;
  String? delCd;
  String? serviceGroupName;
  String? srvSts;
  String? remarks;
  String? regDateTime;
  String? regUserId;
  String? updDateTime;
  String? updUserId;
  String? serviceType;
  String? registerOnline;
  String? timeStamp;
  num? feeConfigId;
  num? feeRegister;
  num? feeOnMonth;
  bool? oldSelected;
  bool? selected;
  Srv4511ServiceEmailData? serviceEmailData;
  Srv4511ServiceSmsData? serviceSmsData;
  List<Srv4501RowData>? detailList;
}
