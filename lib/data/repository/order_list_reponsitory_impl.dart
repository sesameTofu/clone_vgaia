import 'dart:convert';

import 'package:flutter_mobile/data/source/dio/api/rest_client_base.dart';
import 'package:flutter_mobile/data/source/dio/api_error.dart';
import 'package:flutter_mobile/data/source/dio/api_response.dart';
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
import 'package:flutter_mobile/domain/repository/order_list_reponsitory.dart';
import 'package:flutter_mobile/global/app_url.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';

class OrderListReponsitoryImpl extends OrderListReponsitory {
  final RestClientBase _client = Get.find<RestClientBase>();

  @override
  Future<List<OrderModel>> findOrder(FindOrder request) async {
    final ApiResponse response =
        await _client.post(AppUrl.findOrder, data: request.toJson());
    if (response.statusCode == 0) {
      if (isNullOrEmpty(response.data)) {
        return <OrderModel>[];
      }
      return (response.data as List<dynamic>)
          .map((dynamic e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw ApiError.fromResponse(response);
    }
  }

  @override
  Future<bool> cancelOrder(List<String> request) async {
    final ApiResponse response = await _client.post(AppUrl.cancelOrder,
        data: <String, dynamic>{'input': jsonEncode(request)});
    if (response.statusCode == 0) {
      return true;
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<List<RequestPendingModel>> findRequestPending(
      FindRequestPending request) async {
    final ApiResponse response =
        await _client.post(AppUrl.findRequestPending, data: request.toJson());
    if (response.statusCode == 0) {
      if (isNullOrEmpty(response.data)) {
        return <RequestPendingModel>[];
      }
      return (response.data as List<dynamic>)
          .map((dynamic e) =>
              RequestPendingModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw ApiError.fromResponse(response);
    }
  }

  @override
  Future<bool> cancelRequestPending(List<String> request) async {
    final ApiResponse response =
        await _client.post(AppUrl.cancelRequestPending, data: <String, dynamic>{
      'input': <String>[...request]
    });

    if (response.statusCode == 0) {
      return true;
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<List<RequestCondModel>> findRequestCond(
      FindRequestCond request) async {
    final ApiResponse response =
        await _client.post(AppUrl.findRequestCond, data: request.toJson());
    if (response.statusCode == 0) {
      if (isNullOrEmpty(response.data)) {
        return <RequestCondModel>[];
      }
      return (response.data as List<dynamic>)
          .map((dynamic e) =>
              RequestCondModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw ApiError.fromResponse(response);
    }
  }

  @override
  Future<bool> cancelRequestCond(CancelCondRequest request) async {
    final ApiResponse response =
        await _client.post(AppUrl.cancelRequestCond, data: jsonEncode(request));
    if (response.statusCode == 0) {
      return true;
    }
    throw ApiError.fromResponse(response);
  }

  //So lenh Phai Sinh
  @override
  Future<List<DertOrder>> findDerOrderList(DerOrderRequest request) async {
    final ApiResponse response =
        await _client.post(AppUrl.findDerOrder, data: request.toJson());
    if (response.statusCode == 0) {
      if (response.data != null) {
        return (response.data as List<dynamic>)
            .map((dynamic e) => DertOrder.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return <DertOrder>[];
    } else {
      throw ApiError.fromResponse(response);
    }
  }

  @override
  Future<List<DertRequestCond>> findDerOrderListCond(
      DerOrderRequest request) async {
    final ApiResponse response =
        await _client.post(AppUrl.finderOrderCond, data: request.toJson());
    if (response.statusCode == 0) {
      if (response.data != null) {
        return (response.data as List<dynamic>)
            .map((dynamic e) =>
                DertRequestCond.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return <DertRequestCond>[];
    } else {
      throw ApiError.fromResponse(response);
    }
  }

  @override
  Future<bool> dertCancelOrder(DertCancelOrderRequest request) async {
    final ApiResponse response = await _client.post(
      AppUrl.dertCancelOrder,
      data: request.toMap(),
    );
    if (response.statusCode == 0) {
      return true;
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<bool> cancelDertRequestCond(CancelDertRequestCond request) async {
    final ApiResponse response = await _client.post(
      AppUrl.cancelDertRequestCond,
      data: request.toMap(),
    );
    if (response.statusCode == 0) {
      return true;
    }
    throw ApiError.fromResponse(response);
  }

  //dertCancelMultiOrder
  @override
  Future<bool> dertCancelMultiOrder(List<String> request) async {
    final ApiResponse response = await _client.post(
      AppUrl.dertCancelMultiOrder,
      data: <String, dynamic>{
        'input': request,
      },
    );
    if (response.statusCode == 0) {
      return true;
    }
    throw ApiError.fromResponse(response);
  }
}
