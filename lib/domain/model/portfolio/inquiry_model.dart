import 'package:flutter_mobile/domain/model/account_infor/sec_balance_list.dart';
import 'package:flutter_mobile/domain/model/portfolio/right_info_inq_data.dart';
import 'package:flutter_mobile/domain/model/portfolio/sec_balance_display2.dart';

class InquiryModel {
  InquiryModel({
    this.casAmt,
    this.buyingPower,
    this.paymentAvail,
    this.withDrawAvail,
    this.buyToday,
    this.buyPendingPay,
    this.pendingSell,
    this.t0Amount,
    this.t1Amount,
    this.t2Amount,
    this.paymentTotal,
    this.subAccount,
    this.rightType,
    this.defaultSubAccoNo,
    this.subAccountList,
    this.secBalanceData,
    this.secBalanceData2,
    this.rightData,
    this.rightList,
    this.accountList,
    this.subAccoNo,
    this.subAccountType,
    this.orderTypeList,
  });

  InquiryModel.fromJson(Map<String, dynamic> json) {
    casAmt = json['casAmt'] as num?;
    buyingPower = json['buyingPower'] as num?;
    paymentAvail = json['paymentAvail'] as num?;
    withDrawAvail = json['withDrawAvail'] as num?;
    buyToday = json['buyToday'] as num?;
    buyPendingPay = json['buyPendingPay'] as num?;
    pendingSell = json['pendingSell'] as num?;
    t0Amount = json['t0Amount'] as num?;
    t1Amount = json['t1Amount'] as num?;
    t2Amount = json['t2Amount'] as num?;
    paymentTotal = json['paymentTotal'] as num?;
    subAccount = json['subAccount'] as String;
    rightType = json['rightType'] as num?;
    defaultSubAccoNo = json['defaultSubAccoNo'] as String?;
    // subAccountList =
    //     List.castFrom<dynamic, String>(json['subAccountList'] as List<dynamic>);

    secBalanceData = (json['secBalanceData'] as List<dynamic>?)
            ?.map((dynamic e) =>
                SecBalanceList.fromJson(e as Map<String, dynamic>))
            .toList() ??
        <SecBalanceList>[];
    secBalanceData2 = (json['secBalanceData2'] as List<dynamic>?)
            ?.map((dynamic e) =>
                SecBalanceDisplay2.fromJson(e as Map<String, dynamic>))
            .toList() ??
        <SecBalanceDisplay2>[];
    rightData = (json['rightData'] as List<dynamic>?)
            ?.map((dynamic e) =>
                RightInfoInqData.fromJson(e as Map<String, dynamic>))
            .toList() ??
        <RightInfoInqData>[];
    rightList = json['rightList'];
    // accountList =
    //     List.castFrom<dynamic, String>(json['accountList'] as List<dynamic>);

    subAccoNo = json['subAccoNo'] as String?;
    subAccountType = json['subAccountType'] as num?;
    // orderTypeList =
    //     List.castFrom<dynamic, String>(json['orderTypeList'] as List<dynamic>);
  }

  num? casAmt;
  num? buyingPower;
  num? paymentAvail;
  num? withDrawAvail;
  num? buyToday;
  num? buyPendingPay;
  num? pendingSell;
  num? t0Amount;
  num? t1Amount;
  num? t2Amount;
  num? paymentTotal;
  String? subAccount;
  num? rightType;
  String? defaultSubAccoNo;
  List<String>? subAccountList;
  List<SecBalanceList>? secBalanceData;
  List<SecBalanceDisplay2>? secBalanceData2;
  List<RightInfoInqData>? rightData;
  dynamic rightList;
  List<String>? accountList;
  String? subAccoNo;
  num? subAccountType;
  List<String>? orderTypeList;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'casAmt': casAmt,
        'buyingPower': buyingPower,
        'paymentAvail': paymentAvail,
        'withDrawAvail': withDrawAvail,
        'buyToday': buyToday,
        'buyPendingPay': buyPendingPay,
        'pendingSell': pendingSell,
        't0Amount': t0Amount,
        't1Amount': t1Amount,
        't2Amount': t2Amount,
        'paymentTotal': paymentTotal,
        'subAccount': subAccount,
        'rightType': rightType,
        'defaultSubAccoNo': defaultSubAccoNo,
        'subAccountList': subAccountList,
        'secBalanceData': secBalanceData,
        'secBalanceData2': secBalanceData2,
        'rightData': rightData,
        'rightList': rightList,
        'accountList': accountList,
        'subAccoNo': subAccoNo,
        'subAccountType': subAccountType,
        'orderTypeList': orderTypeList,
      };
}
