import 'dart:convert';

import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/data/source/dio/api/rest_client_base.dart';
import 'package:flutter_mobile/data/source/dio/api_error.dart';
import 'package:flutter_mobile/data/source/dio/api_response.dart';
import 'package:flutter_mobile/data/source/dio/rest_client.dart';
import 'package:flutter_mobile/domain/model/account_infor/cus_insider_data.dart';
import 'package:flutter_mobile/domain/model/account_infor/request_order.dart';
import 'package:flutter_mobile/domain/model/account_infor/request_pending.dart';
import 'package:flutter_mobile/domain/model/place_order/buying_power_data.dart';
import 'package:flutter_mobile/domain/model/place_order/cis_insider_req.dart';
import 'package:flutter_mobile/domain/model/place_order/condition_order_request.dart';
import 'package:flutter_mobile/domain/model/place_order/cus_restric_req.dart';
import 'package:flutter_mobile/domain/model/place_order/customer_portfolio_model.dart';
import 'package:flutter_mobile/domain/model/place_order/prepare_order_model.dart';
import 'package:flutter_mobile/domain/model/place_order/prepare_order_rq.dart';
import 'package:flutter_mobile/domain/repository/trading_repository.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_url.dart';

class TradingRepositoryImpl extends TradingRepository {
  final RestClient _client = RestClientBase();

  @override
  Future<BuyingPowerData> inquiryBuyingPower(
      {required String subAccoNo, String? secCd}) async {
    final ApiResponse response = await _client.post(
      'inquiryBuyingPower',
      data: <String, dynamic>{'subAccoNo': subAccoNo, 'secCd': secCd},
    );

    if (response.statusCode == 0 && response.data != null) {
      return BuyingPowerData.fromJson(response.data as Map<String, dynamic>);
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<num> getOrderLimitedQty(
      {required String subAccoNo,
      required String secCd,
      required num price,
      required TradeType tradeType,
      required num buyingPower}) async {
    final ApiResponse response = await _client.post(
      'getOrderLimitedQty',
      data: <String, dynamic>{
        'subAccoNo': subAccoNo,
        'secCd': secCd,
        'price': price,
        'tradeType': tradeType.value(),
        'buyingPower': buyingPower,
      },
    );
    return response.data.floor();
  }

  @override
  Future<PrepareOrderData?> prepareSubmitOrder(
      {required PrepareSubmitOrder prepareOrder}) async {
    final ApiResponse response = await _client.post(
      'prepareSubmitOrder',
      data: prepareOrder.toJsonPlaceOrderNormal(),
    );
    if (response.statusCode == 0 && response.data != null) {
      return PrepareOrderData.fromJson(response.data as Map<String, dynamic>);
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<num?> getCustomerRestriction(CusRestriction request) async {
    final ApiResponse response = await _client.post(
      AppUrl.getCustomerRestriction,
      data: request.toJson(),
    );
    if (response.statusCode == 0) {
      return response.data as num?;
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<CustomerInsiderData> validateCustomerInsider(
      CustomerInsiderRequest request) async {
    final ApiResponse response = await _client.post(
      AppUrl.validateCustomerInsider,
      data: request.toJson(),
    );

    if (response.statusCode == 0 && response.data != null) {
      return CustomerInsiderData.fromJson(
          response.data as Map<String, dynamic>);
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<bool> submitOrder(
      {required List<RequestOrder> requestOrder, required String otp}) async {
    final ApiResponse response = await _client.post('submitOrder',
        data: <String, dynamic>{
          'list': jsonEncode(requestOrder),
          'otpCode': otp
        });

    if (response.statusCode == 0 && response.data != null) {
      return true;
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<bool> submitOrderPending(
      {required List<RequestOrderPending> requestOrderPending,
      required String otp}) async {
    final ApiResponse response = await _client.post('submitOrderPending',
        data: <String, dynamic>{
          'requestList': jsonEncode(requestOrderPending),
          'otpCode': otp
        });

    if (response.statusCode == 0 && response.data != null) {
      return true;
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<String> getCondition(
      {required TradeType tradeType,
      required num price,
      required num? changeValue,
      required String? operation,
      required int type}) async {
    final ApiResponse response =
        await _client.post('getCondition', data: <String, dynamic>{
      'tradeType': tradeType.value(),
      'price': price,
      'changeValue': changeValue,
      'operation': operation,
      'type': type
    });

    if (response.statusCode == 0 && response.data != null) {
      return response.data as String;
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<bool> updateRequestCond(
      {required ConditionOrderRequest request}) async {
    final ApiResponse response =
        await _client.post('updateRequestCond', data: request.toJson(request));

    if (response.statusCode == 0 && response.data != null) {
      return true;
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<List<CustomerPortfolio>> findPortfolio(
      {required String? subAcc,
      required String? alloDate,
      required String secCd}) async {
    final ApiResponse response = await _client.post('findPortfolio',
        data: <String, dynamic>{
          'subAccoNo': subAcc,
          'alloDate': alloDate,
          'secCd': secCd
        });
    if (response.statusCode == 0) {
      return (response.data as List<dynamic>)
          .map((dynamic e) =>
              CustomerPortfolio.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<num> getPriceWithStepPrice(
      {required String secCd, required num price}) async {
    final ApiResponse response = await _client.post('getPriceWithStepPrice',
        data: <String, dynamic>{'secCd': secCd, 'price': price});

    if (response.statusCode == 0 && response.data != null) {
      return response.data as num;
    }
    throw ApiError.fromResponse(response);
  }

// http://10.10.1.85:9002/rest/front/api/findOrderRole?marketCd=100&roleName=ORDER_TYPE
  @override
  Future<void> getQuickOrderPrice({required Index index}) async {
    final ApiResponse response = await _client.get('findOrderRole',
        queryParameters: <String, dynamic>{
          'marketCd': index.marketCd(),
          'roleName': 'ORDER_TYPE'
        });

    ApiError.fromResponse(response);
  }
}
