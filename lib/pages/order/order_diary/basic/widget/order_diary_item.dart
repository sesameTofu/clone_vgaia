import 'package:flutter_mobile/domain/model/order_diary/order_list_model.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/widgets/table_horizontal/index_table_horizontal.dart';

class OrderListRightSideItem extends BaseWidget<BaseController> {
  OrderListRightSideItem(this.orderModel, {Key? key}) : super(key: key);

  final OrderListModelAbstract orderModel;
  @override
  Widget builder() {
    return SizedBox(
      height: 52.height,
      child: Row(
        children: <Widget>[
          IndexTableHorizontal(
              titleUp: orderModel.tradeTypeOrder?.title() ?? '---',
              titleDown: orderModel.extStatusOrder,
              colorTitleUp: orderModel.tradeTypeOrder.color(),
              rowWidth: 92),
          IndexTableHorizontal(
              titleUp: orderModel.orderType,
              titleDown: orderModel.reqTimeOrder,
              rowWidth: 96),
          IndexTableHorizontal(
              titleUp: orderModel.orderQty,
              titleDown: orderModel.orderPrice,
              rowWidth: 88),
          IndexTableHorizontal(
              titleUp: orderModel.matQtyOrder,
              titleDown: orderModel.matPriceAvgOrder,
              rowWidth: 88),
          IndexTableHorizontal(
              titleUp: orderModel.pubQtyOrder,
              titleDown: orderModel.pubPriceOrder,
              rowWidth: 88),
          SizedBox(width: 12)
        ],
      ),
    );
  }
}
