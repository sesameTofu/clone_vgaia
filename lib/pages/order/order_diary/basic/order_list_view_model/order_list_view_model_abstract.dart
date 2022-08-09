import 'package:flutter_mobile/domain/model/order_diary/order_list_model.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/domain/usecase/order_list_normal_use_case.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/order/order_diary/basic/order_list_view_model/order_list_status.dart';

abstract class OrderListAbstract {
  final OrderListNormalUseCase userCase = OrderListNormalUseCase();
  List<OrderListModelAbstract> orderListOrigin = <OrderListModelAbstract>[];
  List<OrderListModelAbstract> orderListFilter = <OrderListModelAbstract>[];
  late OrderListStatus orderListStatus;

  List<Select<dynamic>> getOrderListStatus() => orderListStatus.listSatus;
  Select<dynamic> getOrderListStatusSelect() => orderListStatus.statusSelect;
  List<Widget> headerTitle = <Widget>[];
  double widthRightTable = 0;

  Widget itemList(OrderListModelAbstract orderListModelAbstract);

  Future<void> callApi({TradeType? tradeType, required Select<dynamic> status});

  void cancelOrderList(
      {required List<OrderListModelAbstract> orderListModelAbstract,
      required Function onSuccess,
      required Function onFailure});

  void fliterTradeType({TradeType? tradeType}) {
    if (tradeType == null) {
      orderListFilter = orderListOrigin;
    } else {
      orderListFilter = orderListOrigin
          .where((OrderListModelAbstract orderModel) =>
              orderModel.tradeTypeOrder == tradeType)
          .toList();
    }
  }
}
