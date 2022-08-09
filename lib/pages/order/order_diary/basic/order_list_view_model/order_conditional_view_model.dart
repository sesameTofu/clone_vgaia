import 'package:flutter_mobile/domain/model/order_diary/order_list_model.dart';
import 'package:flutter_mobile/domain/model/order_diary/request_cond_model.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/order/order_diary/basic/order_list_view_model/order_conditional_status.dart';
import 'package:flutter_mobile/pages/order/order_diary/basic/widget/order_conditional_item.dart';
import 'package:flutter_mobile/widgets/table_horizontal/header_table_horizontal.dart';

import 'order_list_view_model_abstract.dart';

class OrderConditionalViewModel extends OrderListAbstract {
  OrderConditionalViewModel() {
    widthRightTable = 968;
    headerTitle = <Widget>[
      HeaderTableHorizontal(
          name: LocaleKeys.symbol_acc.tr, rowWidth: 100, isFirst: true),
      HeaderTableHorizontal(name: LocaleKeys.side_status.tr, rowWidth: 92),
      HeaderTableHorizontal(name: LocaleKeys.symbol_order.tr, rowWidth: 96),
      HeaderTableHorizontal(name: LocaleKeys.cum_qty.tr, rowWidth: 88),
      HeaderTableHorizontal(name: LocaleKeys.order_dk_pt.tr, rowWidth: 88),
      HeaderTableHorizontal(
          name: LocaleKeys.to_date_form_date.tr, rowWidth: 104),
      HeaderTableHorizontal(
          name: LocaleKeys.symbol_order_price.tr, rowWidth: 88),
      HeaderTableHorizontal(
        name: LocaleKeys.symbol_ranger.tr,
        rowWidth: 132,
      ),
      HeaderTableHorizontal(name: LocaleKeys.diff_price.tr, rowWidth: 84),
      HeaderTableHorizontal(name: LocaleKeys.transaction_time.tr, rowWidth: 88),
      HeaderTableHorizontal(name: LocaleKeys.channel.tr, rowWidth: 88),
      SizedBox(width: 12)
    ];
    orderListStatus = OrderConditionalStatus();
  }
  @override
  Future<void> callApi(
      {TradeType? tradeType, required Select<dynamic> status}) async {
    await userCase.findRequestCond(
        status: status.value as OrderConditionStatus,
        onSuccess: (List<RequestCondModel> listOrderConditionalValue) {
          orderListOrigin = listOrderConditionalValue;
          orderListFilter = listOrderConditionalValue;
          fliterTradeType(tradeType: tradeType);
        },
        onFailure: (dynamic e) {
          //  CTSAlertDialog().show(error: e);
        });
  }

  @override
  Widget itemList(OrderListModelAbstract orderListModelAbstract) {
    return OrderConditionalItem(orderListModelAbstract);
  }

  @override
  void cancelOrderList(
      {required List<OrderListModelAbstract> orderListModelAbstract,
      required Function onSuccess,
      required Function onFailure}) {
    userCase.cancelRequestCond(
        listRequestCondModel: orderListModelAbstract as List<RequestCondModel>,
        onSuccess: onSuccess,
        onFailure: onFailure);
  }
}
