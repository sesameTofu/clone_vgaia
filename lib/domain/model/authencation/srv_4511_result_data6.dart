import 'package:flutter_mobile/domain/model/authencation/srv_4501_result_data.dart';

class Srv4511ResultData6 {
  Srv4511ResultData6({
    this.email6,
    this.serviceList,
  });

  factory Srv4511ResultData6.fromJson(Map<String, dynamic> json) =>
      Srv4511ResultData6(
          email6: json['email6'],
          serviceList: json['serviceList'] == null
              ? null
              : (json['serviceList'] as List<dynamic>)
                  .map<Srv4501ResultData>(
                      (dynamic e) => Srv4501ResultData.fromJson(e))
                  .toList());

  Map<String, dynamic> toJson() => <String, dynamic>{
        'email6': email6,
        'serviceList': serviceList,
      };

  String? email6;
  List<Srv4501ResultData>? serviceList;
}
