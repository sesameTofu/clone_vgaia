import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/pages/order/order_diary/basic/order_list_view_model/order_list_status.dart';

class OrderConditionalStatus extends OrderListStatus {
  OrderConditionalStatus() {
    listSatus = <Select<OrderConditionStatus>>[
      Select<OrderConditionStatus>(
          id: 0,
          title: OrderConditionStatus.all.title,
          value: OrderConditionStatus.all),
      Select<OrderConditionStatus>(
          id: 1,
          title: OrderConditionStatus.effect.title,
          value: OrderConditionStatus.effect),
      Select<OrderConditionStatus>(
          id: 2,
          title: OrderConditionStatus.end.title,
          value: OrderConditionStatus.end),
      Select<OrderConditionStatus>(
          id: 3,
          title: OrderConditionStatus.endEffect.title,
          value: OrderConditionStatus.endEffect),
      Select<OrderConditionStatus>(
          id: 4,
          title: OrderConditionStatus.cancelled.title,
          value: OrderConditionStatus.cancelled)
    ];
    statusSelect = listSatus[0];
  }
}
