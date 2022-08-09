import 'package:flutter_mobile/domain/model/customer_bank.dart';

class Customer {
  Customer(
      {this.custCd,
      this.delCd,
      this.custNo,
      this.transactionCd,
      this.custFamilyName,
      this.custGivenName,
      this.custType,
      this.birthday,
      this.sex,
      this.mobileNo,
      this.emailAdrs,
      this.emailFlg,
      this.approvalCd,
      this.idNumber,
      this.issueLocation,
      this.issueDate,
      this.expireDate,
      this.countryCd,
      this.brokerCd,
      this.introducerCd,
      this.channelId,
      this.numberOfSig,
      this.accoDivide,
      this.accoSts,
      this.accoStsDate,
      this.accoStrDate,
      this.contractNo,
      this.orderMoneyConf,
      this.orderStockConf,
      this.notCollectTax,
      this.foreignType,
      this.regDateTime,
      this.regUserId,
      this.updDateTime,
      this.updUserId,
      this.bankList,
      this.address,
      this.telNo,
      this.preAccessTime,
      this.accoStsDisplay,
      this.userId,
      this.branchName,
      this.customerName,
      this.branchCd,
      this.contractStatus});

  Customer.fromJson(Map<String?, dynamic> json) {
    custCd = json['custCd'] as int?;
    delCd = json['delCd'] as int?;
    custNo = json['custNo'] as String?;
    transactionCd = json['transactionCd'] as String?;
    custFamilyName = json['custFamilyName'] as String?;
    custGivenName = json['custGivenName'] as String?;
    custType = json['custType'] as int?;
    birthday = json['birthday'] as int?;
    sex = json['sex'] as int?;
    mobileNo = json['mobileNo'] as String?;
    emailAdrs = json['emailAdrs'] as String?;
    emailFlg = json['emailFlg'] as int?;
    approvalCd = json['approvalCd'] as int?;
    idNumber = json['idNumber'] as String?;
    issueLocation = json['issueLocation'] as String?;
    issueDate = json['issueDate'] as int?;
    expireDate = json['expireDate'] as int?;
    countryCd = json['countryCd'] as String?;
    brokerCd = json['brokerCd'] as String?;
    introducerCd = json['introducerCd'] as String?;
    channelId = json['channelId'] as int?;
    numberOfSig = json['numberOfSig'] as int?;
    accoDivide = json['accoDivide'] as int?;
    accoSts = json['accoSts'] as int?;
    accoStsDate = json['accoStsDate'] as int?;
    accoStrDate = json['accoStrDate'] as int?;
    contractNo = json['contractNo'] as String?;
    orderMoneyConf = json['orderMoneyConf'] as int?;
    orderStockConf = json['orderStockConf'] as int?;
    notCollectTax = json['notCollectTax'] as int?;
    foreignType = json['foreignType'] as int?;
    regDateTime = json['regDateTime'] as int?;
    regUserId = json['regUserId'] as String?;
    updDateTime = json['updDateTime'] as int?;
    updUserId = json['updUserId'] as String?;
    if (json['bankList'] != null) {
      bankList = <CustomerBank>[];
      json['bankList'].forEach((dynamic v) {
        bankList!.add(CustomerBank.fromJson(v as Map<String?, dynamic>));
      });
    }

    address = json['address'] as String?;
    telNo = json['telNo'] as String?;
    preAccessTime = json['preAccessTime'] as int?;
    accoStsDisplay = json['accoStsDisplay'] as String?;
    userId = json['userId'] as String?;
    branchName = json['branchName'] as String?;
    customerName = json['customerName'] as String?;
    branchCd = json['branchCd'] as String?;
    contractStatus = json['contractStatus'] as int?;
  }

  int? custCd;
  int? delCd;
  String? custNo;
  String? transactionCd;
  String? custFamilyName;
  String? custGivenName;
  int? custType;
  int? birthday;
  int? sex;
  String? mobileNo;
  String? emailAdrs;
  int? emailFlg;
  int? approvalCd;
  String? idNumber;
  String? issueLocation;
  int? issueDate;
  int? expireDate;
  String? countryCd;
  String? brokerCd;
  int? channelId;
  int? numberOfSig;
  int? accoDivide;
  int? accoSts;
  int? accoStsDate;
  int? accoStrDate;
  String? contractNo;
  int? orderMoneyConf;
  int? orderStockConf;
  int? notCollectTax;
  int? foreignType;
  int? regDateTime;
  String? regUserId;
  int? updDateTime;
  String? updUserId;
  int? contractStatus;
  List<CustomerBank>? bankList;
  String? address;
  String? telNo;
  num? preAccessTime;
  String? accoStsDisplay;
  String? userId;
  String? branchName;
  String? introducerCd;
  String? customerName;
  String? branchCd;

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['custCd'] = custCd;
    data['delCd'] = delCd;
    data['custNo'] = custNo;
    data['transactionCd'] = transactionCd;
    data['custFamilyName'] = custFamilyName;
    data['custGivenName'] = custGivenName;
    data['custType'] = custType;
    data['birthday'] = birthday;
    data['sex'] = sex;
    data['mobileNo'] = mobileNo;
    data['emailAdrs'] = emailAdrs;
    data['emailFlg'] = emailFlg;
    data['approvalCd'] = approvalCd;
    data['idNumber'] = idNumber;
    data['issueLocation'] = issueLocation;
    data['issueDate'] = issueDate;
    data['expireDate'] = expireDate;
    data['countryCd'] = countryCd;
    data['brokerCd'] = brokerCd;
    data['introducerCd'] = introducerCd;
    data['channelId'] = channelId;
    data['numberOfSig'] = numberOfSig;
    data['accoDivide'] = accoDivide;
    data['accoSts'] = accoSts;
    data['accoStsDate'] = accoStsDate;
    data['accoStrDate'] = accoStrDate;
    data['contractNo'] = contractNo;
    data['orderMoneyConf'] = orderMoneyConf;
    data['orderStockConf'] = orderStockConf;
    data['notCollectTax'] = notCollectTax;
    data['foreignType'] = foreignType;
    data['regDateTime'] = regDateTime;
    data['regUserId'] = regUserId;
    data['updDateTime'] = updDateTime;
    data['updUserId'] = updUserId;
    if (bankList != null) {
      data['bankList'] = bankList!.map((CustomerBank v) => v.toJson()).toList();
    }

    data['address'] = address;
    data['telNo'] = telNo;
    data['preAccessTime'] = preAccessTime;
    data['accoStsDisplay'] = accoStsDisplay;
    data['userId'] = userId;
    data['branchName'] = branchName;
    data['customerName'] = customerName;
    data['branchCd'] = branchCd;
    data['contractStatus'] = contractStatus;
    return data;
  }
}
