import 'package:flutter_mobile/domain/model/money_transfer/transfer_local_model.dart';

class AccountTraModel {
  AccountTraModel(
      {this.userName,
      this.idNo,
      this.tel,
      this.password,
      this.signature,
      this.fullName,
      this.balance,
      this.checkLocalList,
      this.transferAvail,
      this.withdrawAvailByCash,
      this.withdrawAvailByAsset,
      this.orderValue,
      this.remain,
      this.smsServUse,
      this.contractStatus,
      this.branchCd,
      this.groupCd,
      this.subAccoCd,
      this.transactionCd,
      this.transferStatus,
      this.currency,
      this.subAccoNo,
      this.data,
      this.transferLocalAllow,
      this.accoType});

  factory AccountTraModel.fromMap(Map<String, dynamic> map) => AccountTraModel(
        subAccoNo: map['subAccoNo'] as String?,
        transactionCd: map['transactionCd'] as String?,
        subAccoCd: map['subAccoCd'] as num?,
        data: map['data'] == null
            ? null
            : List<TransferLocalModel>.from(map['data']?.map((dynamic e) =>
                TransferLocalModel.fromMap(e as Map<String, dynamic>))),
        password: map['password'] as String?,
        userName: map['userName'] as String?,
        currency: map['currency'] as String?,
        accoType: map['accoType'] as num?,
        balance: map['balance'] as num?,
        branchCd: map['branchCd'] as num?,
        checkLocalList: map['checkLocalList'] as num?,
        contractStatus: map['contractStatus'] as String?,
        fullName: map['fullName'] as String?,
        groupCd: map['groupCd'] as String?,
        idNo: map['idNo'] as String?,
        orderValue: map['orderValue'] as num?,
        remain: map['remain'] as num?,
        signature: map['signature'] as String?,
        smsServUse: map['smsServUse'] as num?,
        tel: map['tel'] as String?,
        transferAvail: map['transferAvail'] as num?,
        transferLocalAllow: map['transferLocalAllow'] as bool?,
        transferStatus: map['transferStatus'] as String?,
        withdrawAvailByAsset: map['withdrawAvailByAsset'] as num?,
        withdrawAvailByCash: map['withdrawAvailByCash'] as num?,
      );

  String? userName;
  String? idNo;
  String? tel;
  String? password;
  String? signature;
  String? fullName;
  num? balance;
  num? checkLocalList;
  num? transferAvail;
  num? withdrawAvailByCash;
  num? withdrawAvailByAsset;
  num? orderValue;
  num? remain;
  num? smsServUse;
  String? contractStatus;
  num? branchCd;
  String? groupCd;
  num? subAccoCd;
  String? transactionCd;
  String? transferStatus;
  String? currency;
  String? subAccoNo;
  List<TransferLocalModel>? data;
  bool? transferLocalAllow;
  num? accoType;

// String? transferStatusData;
// String? secBalanceList;
// String? accountList;
// String? companyCode;
// String? beneficianAccountNo;
// String? beneficianName;
// String? beneficianBranchAddress;

}
