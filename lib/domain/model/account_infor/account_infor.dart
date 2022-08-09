import 'lst_portfolio.dart';
import 'sec_balance_list.dart';

class AccountInfor {
  AccountInfor({
    this.userName,
    this.idNo,
    this.tel,
    this.password,
    this.signature,
    this.subAccoCd,
    this.subAccoNo,
    this.bankCd,
    this.buyingPower,
    this.buyToday,
    this.orderValue,
    this.remain,
    this.custCd,
    this.marginFlag,
    this.marginRate,
    this.marginRoom,
    this.totalAmt,
    this.withdrawAvail,
    this.asNewAsset,
    this.asNewNetAsset,
    this.totalAsset,
    this.totalDebit,
    this.lstSigner,
    this.lstStore,
    this.lstPortfolio,
    this.secBalanceList,
  });

  factory AccountInfor.fromJson(Map<String, dynamic> json) => AccountInfor(
        userName: json['userName'] as String?,
        idNo: json['idNo'] as String?,
        tel: json['tel'] as dynamic,
        password: json['password'] as dynamic,
        signature: json['signature'] as dynamic,
        subAccoCd: json['subAccoCd'] as num?,
        subAccoNo: json['subAccoNo'] as String?,
        bankCd: json['bankCd'] as String?,
        buyingPower: json['buyingPower'] as num?,
        buyToday: json['buyToday'] as num?,
        orderValue: json['orderValue'] as num?,
        remain: json['remain'] as num?,
        custCd: json['custCd'] as num?,
        marginFlag: json['marginFlag'] as dynamic,
        marginRate: json['marginRate'] as num?,
        marginRoom: json['marginRoom'] as dynamic,
        totalAmt: json['totalAmt'] as num?,
        withdrawAvail: json['withdrawAvail'] as dynamic,
        asNewAsset: json['asNewAsset'] as dynamic,
        asNewNetAsset: json['asNewNetAsset'] as dynamic,
        totalAsset: json['totalAsset'] as num?,
        totalDebit: json['totalDebit'] as num?,
        lstSigner: json['lstSigner'] as dynamic,
        lstStore: json['lstStore'] as dynamic,
        lstPortfolio: (json['lstPortfolio'] as List<dynamic>?)
            ?.map(
                (dynamic e) => LstPortfolio.fromJson(e as Map<String, dynamic>))
            .toList(),
        secBalanceList: (json['secBalanceList'] as List<dynamic>?)
            ?.map((dynamic e) =>
                SecBalanceList.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userName': userName,
        'idNo': idNo,
        'tel': tel,
        'password': password,
        'signature': signature,
        'subAccoCd': subAccoCd,
        'subAccoNo': subAccoNo,
        'bankCd': bankCd,
        'buyingPower': buyingPower,
        'buyToday': buyToday,
        'orderValue': orderValue,
        'remain': remain,
        'custCd': custCd,
        'marginFlag': marginFlag,
        'marginRate': marginRate,
        'marginRoom': marginRoom,
        'totalAmt': totalAmt,
        'withdrawAvail': withdrawAvail,
        'asNewAsset': asNewAsset,
        'asNewNetAsset': asNewNetAsset,
        'totalAsset': totalAsset,
        'totalDebit': totalDebit,
        'lstSigner': lstSigner,
        'lstStore': lstStore,
        'lstPortfolio':
            lstPortfolio?.map((LstPortfolio e) => e.toJson()).toList(),
        'secBalanceList':
            secBalanceList?.map((SecBalanceList e) => e.toJson()).toList(),
      };
  String? userName;
  String? idNo;
  dynamic tel;
  dynamic password;
  dynamic signature;
  num? subAccoCd;
  String? subAccoNo;
  String? bankCd;
  num? buyingPower;
  num? buyToday;
  num? orderValue;
  num? remain;
  num? custCd;
  dynamic marginFlag;
  num? marginRate;
  dynamic marginRoom;
  num? totalAmt;
  dynamic withdrawAvail;
  dynamic asNewAsset;
  dynamic asNewNetAsset;
  num? totalAsset;
  num? totalDebit;
  dynamic lstSigner;
  dynamic lstStore;
  List<LstPortfolio>? lstPortfolio;
  List<SecBalanceList>? secBalanceList;
}
