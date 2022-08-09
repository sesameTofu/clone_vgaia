import 'package:flutter/foundation.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/global/app_enum.dart';

class ConditionOrderRequest {
  ConditionOrderRequest(
      {required this.tradeType,
      required this.subAccoNo,
      required this.secCd,
      required this.ordQty,
      required this.ordPrice,
      required this.condType,
      required this.fromDate,
      required this.toDate,
      required this.matMethod,
      required this.condition,
      required this.value,
      required this.limitOffset,
      required this.otpCode});

  Map<String, dynamic> toJson(ConditionOrderRequest instance) =>
      <String, dynamic>{
        'tradeType': instance.tradeType.value(),
        'subAccoNo': instance.subAccoNo,
        'secCd': instance.secCd,
        'ordQty': instance.ordQty,
        'ordPrice': instance.ordPrice,
        'condType':
            instance.condType != null ? describeEnum(instance.condType!) : '',
        'fromDate': instance.fromDate == null
            ? ''
            : instance.fromDate!.formatTimeServerToNumber(),
        'toDate': instance.toDate == null
            ? ''
            : instance.toDate!.formatTimeServerToNumber(),
        'matMethod': instance.matMethod.value(),
        'condition': instance.condition,
        'value': instance.value,
        'limitOffset': instance.limitOffset ?? 0,
        'otpCode': instance.otpCode,
      };

  final TradeType tradeType;
  final String? subAccoNo;
  final String? secCd;
  final num? ordQty;
  final num? ordPrice;
  final ConditionType? condType;
  final DateTime? fromDate;
  final DateTime? toDate;
  final MatMethod? matMethod;
  final String? condition;
  final String? value;
  final num? limitOffset;
  final String? otpCode;
}
