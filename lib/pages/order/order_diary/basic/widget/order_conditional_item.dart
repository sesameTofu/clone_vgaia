import 'package:flutter_mobile/domain/model/order_diary/order_list_model.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/widgets/table_horizontal/index_table_horizontal.dart';

class OrderConditionalItem extends BaseWidget<BaseController> {
  OrderConditionalItem(this.orderModel, {Key? key}) : super(key: key);

  final OrderListModelAbstract orderModel;

  @override
  Widget builder() {
    return SizedBox(
      height: 52.height,
      child: Row(
        children: <Widget>[
          IndexTableHorizontal(
              titleUp: orderModel.tradeTypeOrder?.title(),
              titleDown: orderModel.extStatusOrder,
              colorTitleUp: orderModel.tradeTypeOrder.color(),
              rowWidth: 92),
          IndexTableHorizontal(
              titleUp: orderModel.orderQty,
              titleDown: orderModel.orderPrice,
              rowWidth: 96),
          IndexTableHorizontal(
              titleUp: orderModel.matQtyOrder,
              titleDown: orderModel.matPriceAvgOrder,
              rowWidth: 88),
          IndexTableHorizontal(titleUp: null, titleDown: null, rowWidth: 88),
          IndexTableHorizontal(
              titleUp: orderModel.orderFormDate,
              titleDown: orderModel.orderToDate,
              rowWidth: 104),
          IndexTableHorizontal(titleUp: null, titleDown: null, rowWidth: 88),
          IndexTableHorizontal(titleUp: null, titleDown: null, rowWidth: 132),
          IndexTableHorizontal(titleUp: null, titleDown: null, rowWidth: 84),
          IndexTableHorizontal(
              titleUp: orderModel.orderDateTime,
              titleDown: orderModel.reqTimeOrder,
              rowWidth: 88),
          IndexTableHorizontal(titleUp: null, titleDown: null, rowWidth: 88),
          SizedBox(width: 12)
        ],
      ),
    );
  }
}
