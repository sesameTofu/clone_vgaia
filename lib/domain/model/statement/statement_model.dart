import 'package:flutter_mobile/domain/model/statement/statement_money_model.dart';
import 'package:flutter_mobile/domain/model/statement/statement_stock_model.dart';

class StatementModel {
  StatementModel({
    this.accountType,
    this.subAccoNo,
    this.custNo,
    this.fromDate,
    this.toDate,
    this.listSatementMoney,
    this.listSatementStocks,
    this.beginAmt,
    this.lastAmt,
    this.currCd,
  });

  factory StatementModel.fromMap(Map<String, dynamic> map) {
    return StatementModel(
      accountType: map['fil_accountType'] as String,
      subAccoNo: map['fil_subAccoNo'] as String,
      custNo: map['fil_custNo'] as String,
      fromDate: map['fil_fromDate'] as String,
      toDate: map['fil_toDate'] as String,
      listSatementMoney: (map['listR9008Data'] as List<dynamic>)
          .map((dynamic e) => e as Map<String, dynamic>)
          .map((Map<String, dynamic> e) => StatementMoneyModel.fromMap(e))
          .toList(),
      listSatementStocks: (map['listR9008Data_Sub01'] as List<dynamic>)
          .map((dynamic e) => e as Map<String, dynamic>)
          .map((Map<String, dynamic> e) => StatementStockModel.fromMap(e))
          .toList(),
      beginAmt: map['p_BEGIN_AMT'] as num,
      lastAmt: map['p_LAST_AMT'] as num,
      currCd: map['p_CURR_CD'] as String,
    );
  }

  /// <summary>
  ///
  /// Loai TK: <br>
  /// 1: Tieu khoan<br>
  /// 2. Tai khoan
  /// </summary>
  String? accountType;

  /// <summary>
  /// Filter by SubAccount no
  /// </summary>
  String? subAccoNo;

  /// <summary>
  /// Filter by Cust no
  /// </summary>
  String? custNo;

  /// <summary>
  /// Filter by from date
  /// </summary>
  String? fromDate;

  /// <summary>
  /// Filter by to date
  /// </summary>
  String? toDate;

  /// <summary>
  /// Main report data
  /// </summary>
  List<StatementMoneyModel>? listSatementMoney;

  /// <summary>
  /// Sub report data source
  /// </summary>
  List<StatementStockModel>? listSatementStocks;

  /// <summary>
  /// Parameter begin amount
  /// </summary>
  num? beginAmt;

  /// <summary>
  /// Parameter last amount
  /// </summary>
  num? lastAmt;

  /// <summary>
  /// Parameter sub account curr_cd
  /// </summary>
  String? currCd;
}
