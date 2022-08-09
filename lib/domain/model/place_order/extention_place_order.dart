import 'package:flutter_mobile/domain/model/account_infor/request_order.dart';
import 'package:flutter_mobile/domain/model/account_infor/request_pending.dart';

abstract class ExtentionPlaceOrder {
  List<RequestOrder> get requestOrder;
  List<RequestOrderPending> get requestOrderPending;
}
