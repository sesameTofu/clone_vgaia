import 'package:flutter_mobile/domain/model/money_transfer/transfer_bank.dart';

class TransferBankModel {
  TransferBankModel({
     this.bankData,
     this.data,
     this.dataHistory,
     this.checkBankList,
     this.bankAccntNumber,
     this.bankCd,
     this.subAccoCd,
     this.subAccoNo,
     this.status,
     this.userName,
     this.fullName,
     this.balance,
     this.transferAvail,
     this.withdrawAvailByCash,
     this.withdrawAvailByAsset,
     this.remain,
     this.contractStatus,
     this.transactionCd,
     this.transferStatus,
     this.remarks,
     this.smsServUser,
     this.branchCd,
     this.groupCd,
     this.currCd,
     this.accoType,
  });

  factory TransferBankModel.fromMap(Map<String, dynamic> map) {
    return TransferBankModel(
      bankData: map['bankData'] == null
          ? null
          : TransferBank.fromMap(map['bankData'] as Map<String, dynamic>),
      data: map['data'] == null
          ? null
          : List<TransferBank>.from(
              map['data']?.map((dynamic x) => TransferBank.fromMap(x))),
      dataHistory: map['dataHistory'] == null
          ? null
          : List<TransferBank>.from(
              map['dataHistory']?.map((dynamic x) => TransferBank.fromMap(x))),
      checkBankList: map['checkBankList'],
      bankAccntNumber: map['bankAccntNumber'],
      bankCd: map['bankCd'],
      subAccoCd: map['subAccoCd'],
      subAccoNo: map['subAccoNo'],
      status: map['status'],
      userName: map['userName'],
      fullName: map['fullName'],
      balance: map['balance'],
      transferAvail: map['transferAvail'],
      withdrawAvailByCash: map['withdrawAvailByCash'],
      withdrawAvailByAsset: map['withdrawAvailByAsset'],
      remain: map['remain'],
      contractStatus: map['contractStatus'],
      transactionCd: map['transactionCd'],
      transferStatus: map['transferStatus'],
      remarks: map['remarks'],
      smsServUser: map['smsServUser'],
      branchCd: map['branchCd'],
      groupCd: map['groupCd'],
      currCd: map['currCd'],
      accoType: map['accoType'],
    );
  }

  TransferBank? bankData;
  List<TransferBank>? data;
  List<TransferBank>? dataHistory;
  num? checkBankList;
  String? bankAccntNumber;
  String? bankCd;
  String? subAccoCd;
  String? subAccoNo;
  String? status;
  String? userName;
  String? fullName;
  num? balance;
  num? transferAvail;
  num? withdrawAvailByCash;
  num? withdrawAvailByAsset;
  num? remain;
  String? contractStatus;
  String? transactionCd;
  String? transferStatus;
  String? remarks;
  String? smsServUser;
  num? branchCd;
  String? groupCd;
  String? currCd;
  num? accoType;
}
