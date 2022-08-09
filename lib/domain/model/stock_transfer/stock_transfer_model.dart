class StockTransferModel {
  StockTransferModel({
    this.subAccoNoFrom,
    this.subAccoNoTo,
    this.secCd,
    this.status,
    this.timeStamp,
    this.quantity,
  });

  factory StockTransferModel.fromJson(Map<String, dynamic> json) =>
      StockTransferModel(
        subAccoNoFrom: json['subAccoNoFrom'],
        subAccoNoTo: json['subAccoNoTo'],
        secCd: json['secCd'],
        status: json['status'],
        timeStamp: json['timeStamp'],
        quantity: json['quantity'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'subAccoNoFrom': subAccoNoFrom,
        'subAccoNoTo': subAccoNoTo,
        'secCd': secCd,
        'status': status,
        'timeStamp': timeStamp,
        'quantity': quantity,
      };

  String? subAccoNoFrom;
  String? subAccoNoTo;
  String? secCd;
  int? status;
  String? timeStamp;
  int? quantity;
}
