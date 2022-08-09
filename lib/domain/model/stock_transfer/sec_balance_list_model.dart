import 'package:flutter_mobile/import.dart';

class SecBalanceListModel {
  SecBalanceListModel({
    this.secCd,
    this.secTransaction,
    this.secTransferAvail,
  }) {
    textEditingController = TextEditingController(text: secTransferAvail);
  }

  factory SecBalanceListModel.fromJson(Map<String, dynamic> json) =>
      SecBalanceListModel(
        secCd: json['secCd'],
        secTransaction: json['secTransaction'],
        secTransferAvail: json['secTransferAvail'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'secCd': secCd,
        'secTransaction': secTransaction,
        'secTransferAvail': secTransferAvail,
      };

  String? secCd;
  String? secTransaction;
  String? secTransferAvail;
  TextEditingController? textEditingController;
}
