import 'package:flutter_mobile/domain/model/order_diary/order_list_model.dart';
import 'package:flutter_mobile/domain/model/order_diary/request_pending_model.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/order/order_diary/basic/order_list_view_model/order_pre_status.dart';
import 'package:flutter_mobile/pages/order/order_diary/basic/widget/order_pre_item.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_mobile/widgets/table_horizontal/header_table_horizontal.dart';

import 'order_list_view_model_abstract.dart';

class OrderPreViewModel extends OrderListAbstract {
  OrderPreViewModel() {
    widthRightTable = 290;
    headerTitle = <Widget>[
      HeaderTableHorizontal(
          name: LocaleKeys.symbol_acc.tr, rowWidth: 100, isFirst: true),
      HeaderTableHorizontal(name: LocaleKeys.side_status.tr, rowWidth: 92),
      HeaderTableHorizontal(
          name: LocaleKeys.symbol_order_type.tr, rowWidth: 92),
      HeaderTableHorizontal(name: LocaleKeys.symbol_order.tr, rowWidth: 88),
      SizedBox(width: 12)
    ];
    orderListStatus = OrderPreStatus();
  }

  @override
  Future<void> callApi(
      {TradeType? tradeType, required Select<dynamic> status}) async {
    await userCase.findRequestPending(
        status: status.value as EnumOrderPreStatus,
        onSuccess: (List<RequestPendingModel> list) {
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
    return OrderPreItem(orderListModelAbstract);
  }

  @override
  void cancelOrderList(
      {required List<OrderListModelAbstract> orderListModelAbstract,
      required Function onSuccess,
      required Function onFailure}) {
    userCase.cancelRequestPending(
        listRequestPendingModel:
            orderListModelAbstract as List<RequestPendingModel>,
        onSuccess: onSuccess,
        onFailure: onFailure);
  }
}
