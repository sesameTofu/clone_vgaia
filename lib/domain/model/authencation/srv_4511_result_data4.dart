import 'package:flutter_mobile/domain/model/authencation/srv_4511_row_data4.dart';

class Srv4511ResultData4 {
  Srv4511ResultData4({
    this.timeStamp4,
    this.alloDate,
    this.refNo,
    this.transferList,
  });

  factory Srv4511ResultData4.fromJson(Map<String, dynamic> json) =>
      Srv4511ResultData4(
          timeStamp4: json['timeStamp4'],
          alloDate: json['alloDate'],
          refNo: json['refNo'],
          transferList: json['transferList'] == null
              ? null
              : (json['transferList'] as List<dynamic>)
                  .map<Srv4511RowData4>((dynamic e) =>
                      Srv4511RowData4.fromJson(e as Map<String, dynamic>))
                  .toList());

  Map<String, dynamic> toJson() => <String, dynamic>{
        'timeStamp4': timeStamp4,
        'alloDate': alloDate,
        'refNo': refNo,
        'transferList': transferList,
      };

  String? timeStamp4;
  String? alloDate;
  String? refNo;
  List<Srv4511RowData4>? transferList;
}
