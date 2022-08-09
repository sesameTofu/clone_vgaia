import 'package:flutter_mobile/data/source/dio/request/cancel_cond_request.dart';
import 'package:flutter_mobile/data/source/dio/request/der_cancel_order_req.dart';
import 'package:flutter_mobile/data/source/dio/request/der_cond_cancel_rq.dart';
import 'package:flutter_mobile/data/source/dio/request/der_order_request.dart';
import 'package:flutter_mobile/data/source/dio/request/find_oder.dart';
import 'package:flutter_mobile/data/source/dio/request/find_request_cond.dart';
import 'package:flutter_mobile/data/source/dio/request/find_request_pending.dart';
import 'package:flutter_mobile/domain/model/order_diary/dert_order.dart';
import 'package:flutter_mobile/domain/model/order_diary/dert_request_cond.dart';
import 'package:flutter_mobile/domain/model/order_diary/order_model.dart';
import 'package:flutter_mobile/domain/model/order_diary/request_cond_model.dart';
import 'package:flutter_mobile/domain/model/order_diary/request_pending_model.dart';

abstract class OrderListReponsitory {
  // Api lệnh trước giờ
  Future<List<OrderModel>> findOrder(FindOrder request);

  Future<bool> cancelOrder(List<String> request);
  // Api lệnh trước giờ
  Future<List<RequestPendingModel>> findRequestPending(
      FindRequestPending request);

  Future<bool> cancelRequestPending(List<String> request);

  // Api lệnh điều kiện
  Future<List<RequestCondModel>> findRequestCond(FindRequestCond request);

  Future<bool> cancelRequestCond(CancelCondRequest request);

  Future<List<DertOrder>> findDerOrderList(DerOrderRequest request);

  Future<List<DertRequestCond>> findDerOrderListCond(DerOrderRequest request);

  Future<bool> dertCancelOrder(DertCancelOrderRequest request);

  Future<bool> cancelDertRequestCond(CancelDertRequestCond request);

  Future<bool> dertCancelMultiOrder(List<String> request);
}
