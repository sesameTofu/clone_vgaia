import 'package:flutter_mobile/base/import_base.dart';

class TransferLocalModel with BaseMixin {
  TransferLocalModel(
      {this.alloDate,
      this.refNo,
      this.delCd,
      this.subAccoCd,
      this.toSubAccoCd,
      this.currCd,
      this.amount,
      this.feePayFlag,
      this.feeRate,
      this.feeMin,
      this.feeAmount,
      this.smsFee,
      this.transactionCd,
      this.remarks,
      this.status,
      this.srcChannel,
      this.approvedDateTime,
      this.approvedUserId,
      this.regDateTime,
      this.regUserId,
      this.updDateTime,
      this.updUserId,
      this.customerNo,
      this.toSubAccoNo,
      this.fromSubAccoNo,
      this.toSubAccoName,
      this.fromSubAccoName,
      this.transactionDate,
      this.transactionName,
      this.statusName,
      this.calculateName,
      this.history,
      this.mFromDate,
      this.mToDate,
      this.timeStamp,
      this.statusDisplay});

  factory TransferLocalModel.fromMap(Map<String, dynamic> map) =>
      TransferLocalModel(
        status: map['status'] as num?,
        remarks: map['remarks'] as String?,
        amount: map['amount'] as num?,
        updUserId: map['updUserId'] as String?,
        updDateTime: map['updDateTime'] as num?,
        regUserId: map['regUserId'] as String?,
        regDateTime: map['regDateTime'] as num?,
        delCd: map['delCd'] as num?,
        timeStamp: map['timeStamp'] as String?,
        alloDate: map['alloDate'] as int?,
        approvedDateTime: map['approvedDateTime'] as num?,
        approvedUserId: map['approvedUserId'] as String?,
        calculateName: map['calculateName'] as String?,
        currCd: map['currCd'] as String?,
        customerNo: map['customerNo'] as String?,
        feeAmount: map['feeAmount'] as num?,
        feeMin: map['feeMin'] as num?,
        feePayFlag: map['feePayFlag'] as num?,
        feeRate: map['feeRate'] as num?,
        fromSubAccoName: map['fromSubAccoName'] as String?,
        fromSubAccoNo: map['fromSubAccoNo'] as String?,
        history: map['history'] as bool?,
        mFromDate: map['mFromDate'] as num?,
        mToDate: map['mToDate'] as num?,
        refNo: map['refNo'] as num?,
        smsFee: map['smsFee'] as num?,
        statusDisplay: map['statusDisplay'] as String?,
        srcChannel: map['srcChannel'] as num?,
        statusName: map['statusName'] as String?,
        subAccoCd: map['subAccoCd'] as num?,
        toSubAccoCd: map['toSubAccoCd'] as num?,
        toSubAccoName: map['toSubAccoName'] as String?,
        toSubAccoNo: map['toSubAccoNo'] as String?,
        transactionCd: map['transactionCd'] as String?,
        transactionDate: map['transactionDate'] as num?,
        transactionName: map['transactionName'] as String?,
      );

  int? alloDate;
  num? refNo;
  num? delCd;
  num? subAccoCd;
  num? toSubAccoCd;
  String? currCd;
  num? amount;
  num? feePayFlag;
  num? feeRate;
  num? feeMin;
  num? feeAmount;
  num? smsFee;
  String? transactionCd;
  String? remarks;
  num? status;
  num? srcChannel;
  num? approvedDateTime;
  String? approvedUserId;
  num? regDateTime;
  String? regUserId;
  num? updDateTime;
  String? updUserId;
  String? customerNo;
  String? toSubAccoNo;
  String? fromSubAccoNo;
  String? toSubAccoName;
  String? fromSubAccoName;
  num? transactionDate;
  String? transactionName;
  String? statusName;
  String? calculateName;
  bool? history;
  num? mFromDate;
  num? mToDate;
  String? timeStamp;
  String? statusDisplay;

  String get getStatus {
    switch (status) {
      case 0:
        return 'Chưa chuyển';
      case 1:
        return 'Đã duyệt';
      case 2:
        return 'Đã thu tiền';
      case 3:
        return 'Đã thanh toán';
      case 9:
        return 'Huỷ';
      default:
        return '';
    }
  }

  Color? get colorStatus {
    switch (status) {
      case 0:
        return color.yellow50;
      case 1:
      case 2:
      case 3:
        return color.green50;
      case 9:
        return color.red50;
      default:
        return null;
    }
  }

  bool get isDelete => status == 0;
}
