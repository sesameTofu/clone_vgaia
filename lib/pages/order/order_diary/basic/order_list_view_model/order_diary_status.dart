import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/pages/order/order_diary/basic/order_list_view_model/order_list_status.dart';

class OrderDiaryStatus extends OrderListStatus {
  OrderDiaryStatus() {
    listSatus = <Select<DerOrderNorStatus>>[
      Select<DerOrderNorStatus>(
          id: 0,
          title: DerOrderNorStatus.all.title,
          value: DerOrderNorStatus.all),
      Select<DerOrderNorStatus>(
          id: 1,
          title: DerOrderNorStatus.cancel.title,
          value: DerOrderNorStatus.cancel),
      Select<DerOrderNorStatus>(
          id: 2,
          title: DerOrderNorStatus.intoTheSys.title,
          value: DerOrderNorStatus.intoTheSys),
      Select<DerOrderNorStatus>(
          id: 3,
          title: DerOrderNorStatus.waitMatch.title,
          value: DerOrderNorStatus.waitMatch),
      Select<DerOrderNorStatus>(
          id: 4,
          title: DerOrderNorStatus.parMatch.title,
          value: DerOrderNorStatus.parMatch),
      Select<DerOrderNorStatus>(
          id: 5,
          title: DerOrderNorStatus.match.title,
          value: DerOrderNorStatus.match),
      Select<DerOrderNorStatus>(
          id: 6,
          title: DerOrderNorStatus.parCancel.title,
          value: DerOrderNorStatus.parCancel),
      Select<DerOrderNorStatus>(
          id: 7,
          title: DerOrderNorStatus.cancelAll.title,
          value: DerOrderNorStatus.cancelAll),
      Select<DerOrderNorStatus>(
          id: 8,
          title: DerOrderNorStatus.rejectStock.title,
          value: DerOrderNorStatus.rejectStock)
    ];
    statusSelect = listSatus[0];
  }
}
