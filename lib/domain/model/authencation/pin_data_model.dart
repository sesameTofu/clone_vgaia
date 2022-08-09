import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/enum_helper.dart';

class PinDataModel {
  PinDataModel({this.pinType, this.caSerial});
  factory PinDataModel.fromJson(Map<String, dynamic> json) {
    return PinDataModel(
        pinType: EnumHelper.getPinType(json['pinType'] as num?),
        caSerial: json['caSerial'] as String?);
  }
  final PinType? pinType;
  final String? caSerial;
}
