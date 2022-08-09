import 'package:flutter_mobile/domain/model/authencation/srv_4511_row_data7.dart';

class Srv4511ResultData7 {
  Srv4511ResultData7({
    this.payAdvanceAuto,
    this.timeStamp7,
    this.id7,
    this.advanceList,
  });

  factory Srv4511ResultData7.fromJson(Map<String, dynamic> json) =>
      Srv4511ResultData7(
        payAdvanceAuto: json['payAdvanceAuto'],
        timeStamp7: json['timeStamp7'],
        id7: json['id7'],
        advanceList: json['advanceList'] == null
            ? null
            : (json['advanceList'] as List<dynamic>)
                .map<Srv4511RowData7>(
                    (dynamic e) => Srv4511RowData7.fromJson(e))
                .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'payAdvanceAuto': payAdvanceAuto,
        'timeStamp7': timeStamp7,
        'id7': id7,
        'advanceList': advanceList,
      };

  String? payAdvanceAuto;
  String? timeStamp7;
  String? id7;
  List<Srv4511RowData7>? advanceList;
}
