import 'package:flutter_mobile/domain/model/order_diary/order_list_model.dart';
import 'package:flutter_mobile/domain/model/order_diary/order_model.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/order/order_diary/basic/order_list_view_model/order_diary_status.dart';
import 'package:flutter_mobile/pages/order/order_diary/basic/widget/order_diary_item.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_mobile/widgets/table_horizontal/header_table_horizontal.dart';

import 'order_list_view_model_abstract.dart';

class OrderDiaryViewModel extends OrderListAbstract {
  OrderDiaryViewModel() {
    widthRightTable = 468;
    headerTitle = <Widget>[
      HeaderTableHorizontal(
          name: LocaleKeys.symbol_acc.tr, rowWidth: 100, isFirst: true),
      HeaderTableHorizontal(name: LocaleKeys.side_status.tr, rowWidth: 92),
      HeaderTableHorizontal(
          name: LocaleKeys.symbol_order_type.tr, rowWidth: 96),
      HeaderTableHorizontal(name: LocaleKeys.symbol_order.tr, rowWidth: 88),
      HeaderTableHorizontal(
          name: LocaleKeys.symbol_math_order.tr, rowWidth: 88),
      HeaderTableHorizontal(
          name: LocaleKeys.symbol_await_order.tr, rowWidth: 88),
      SizedBox(width: 12)
    ];
    orderListStatus = OrderDiaryStatus();
  }

  @override
  Future<void> callApi(
      {TradeType? tradeType, required Select<dynamic> status}) async {
    return await userCase.findOrder(
        status: status.value as DerOrderNorStatus,
        onSuccess: (List<OrderModel> list) {
          orderListOrigin = list;
          orderListFilter = list;
          fliterTradeType(tradeType: tradeType);
        },
        onFailure: (dynamic error) {
          AppToast.showError(getError(error));
        });
  }

  @override
  Widget itemList(OrderListModelAbstract orderListModelAbstract) {
    return OrderListRightSideItem(orderListModelAbstract);
  }

  @override
  void cancelOrderList(
      {required List<OrderListModelAbstract> orderListModelAbstract,
      required Function onSuccess,
      required Function onFailure}) {
    userCase.cancelOrder(
        listOrderModel: orderListModelAbstract as List<OrderModel>,
        onSuccess: onSuccess,
        onFailure: onFailure);
  }
}
