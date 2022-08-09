import 'package:flutter_mobile/domain/model/authencation/srv_4501_result_data.dart';

class Srv4511ResultData5 {
  Srv4511ResultData5({
    this.mobile55,
    this.serviceList,
  });

  factory Srv4511ResultData5.fromJson(Map<String, dynamic> json) =>
      Srv4511ResultData5(
          mobile55: json['mobile55'],
          serviceList: json['serviceList'] == null
              ? null
              : (json['serviceList'] as List<dynamic>)
                  .map<Srv4501ResultData>(
                      (dynamic e) => Srv4501ResultData.fromJson(e))
                  .toList());

  Map<String, dynamic> toJson() => <String, dynamic>{
        'mobile55': mobile55,
        'serviceList': serviceList,
      };

  String? mobile55;
  List<Srv4501ResultData>? serviceList;
}
