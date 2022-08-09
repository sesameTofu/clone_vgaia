import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/pages/order/order_diary/basic/order_list_view_model/order_list_status.dart';

class OrderPreStatus extends OrderListStatus {
  OrderPreStatus() {
    listSatus = <Select<EnumOrderPreStatus>>[
      Select<EnumOrderPreStatus>(
          id: 0,
          title: EnumOrderPreStatus.all.title,
          value: EnumOrderPreStatus.all),
      Select<EnumOrderPreStatus>(
          id: 1,
          title: EnumOrderPreStatus.pending.title,
          value: EnumOrderPreStatus.pending),
      Select<EnumOrderPreStatus>(
          id: 2,
          title: EnumOrderPreStatus.approved.title,
          value: EnumOrderPreStatus.approved),
      Select<EnumOrderPreStatus>(
          id: 3,
          title: EnumOrderPreStatus.cancelled.title,
          value: EnumOrderPreStatus.cancelled)
    ];

    statusSelect = listSatus[0];
  }
}
