import 'package:flutter_mobile/data/repository/order_list_reponsitory_impl.dart';
import 'package:flutter_mobile/data/source/dio/request/cancel_cond_request.dart';
import 'package:flutter_mobile/data/source/dio/request/find_oder.dart';
import 'package:flutter_mobile/data/source/dio/request/find_request_cond.dart';
import 'package:flutter_mobile/data/source/dio/request/find_request_pending.dart';
import 'package:flutter_mobile/domain/model/order_diary/order_model.dart';
import 'package:flutter_mobile/domain/model/order_diary/request_cond_model.dart';
import 'package:flutter_mobile/domain/model/order_diary/request_pending_model.dart';
import 'package:flutter_mobile/domain/repository/order_list_reponsitory.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/global/app_enum.dart';

class OrderListNormalUseCase {
  final OrderListReponsitory _reponse = OrderListReponsitoryImpl();

  Future<void> findOrder(
      {required DerOrderNorStatus status,
      required Function onSuccess,
      required Function onFailure}) async {
    try {
      final FindOrder _request = FindOrder(
          secCd: '',
          orderType: '',
          searchByUser: false,
          secType: 0,
          tradeType: 0,
          extStatus: status.value);
      final List<OrderModel> list = await _reponse.findOrder(_request);
      onSuccess(list);
    } catch (e) {
      onFailure(e);
    }
  }

  Future<void> cancelOrder(
      {required List<OrderModel> listOrderModel,
      required Function onSuccess,
      required Function onFailure}) async {
    try {
      final List<String> _request = <String>[];
      for (final OrderModel orderModel in listOrderModel) {
        _request.add(
            '${orderModel.subAccoNo};${orderModel.ordOrgOrderNo};${orderModel.marketCd};${orderModel.secCd};${orderModel.status}');
      }
      final bool success = await _reponse.cancelOrder(_request);
      onSuccess(success);
    } catch (e) {
      onFailure(e);
    }
  }

  Future<void> findRequestPending(
      {required EnumOrderPreStatus status,
      required Function onSuccess,
      required Function onFailure}) async {
    try {
      final FindRequestPending _request =
          FindRequestPending(secCd: '', status: status.value, marketCd: 0);
      final List<RequestPendingModel> list =
          await _reponse.findRequestPending(_request);
      onSuccess(list);
    } catch (e) {
      onFailure(e);
    }
  }

  Future<void> cancelRequestPending(
      {required List<RequestPendingModel> listRequestPendingModel,
      required Function onSuccess,
      required Function onFailure}) async {
    try {
      final List<String> _request = <String>[];
      for (final RequestPendingModel orderModel in listRequestPendingModel) {
        _request.add('${orderModel.tradeDate}:${orderModel.reqNo}');
      }

      final bool success = await _reponse.cancelRequestPending(_request);
      onSuccess(success);
    } catch (e) {
      onFailure(e);
    }
  }

  Future<void> findRequestCond(
      {required OrderConditionStatus status,
      required Function onSuccess,
      required Function onFailure}) async {
    try {
      final FindRequestCond _request = FindRequestCond(
          secCd: '',
          condType: '',
          //  fromDate: DateTime.now().add(Duration(days: -30)).formatTimeServer(),
          fromDate: DateTime.now().add(Duration(days: -700)).formatTimeServer(),
          toDate: DateTime.now().formatTimeServer(),
          status: status.value,
          regUserId: '');
      final List<RequestCondModel> list =
          await _reponse.findRequestCond(_request);
      onSuccess(list);
    } catch (e) {
      onFailure(e);
    }
  }

  Future<void> cancelRequestCond(
      {required List<RequestCondModel> listRequestCondModel,
      required Function onSuccess,
      required Function onFailure}) async {
    try {
      for (final RequestCondModel requestCondModel in listRequestCondModel) {
        await _reponse.cancelRequestCond(CancelCondRequest(
            refDate: requestCondModel.refDate, refNo: requestCondModel.reqNo));
      }
      onSuccess(true);
    } catch (e) {
      onFailure(e);
    }
  }
}
