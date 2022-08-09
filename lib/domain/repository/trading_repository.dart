import 'package:flutter_mobile/core_support/enum/core_enum.dart';
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
import 'package:flutter_mobile/global/app_enum.dart';

abstract class TradingRepository {
  Future<BuyingPowerData> inquiryBuyingPower(
      {required String subAccoNo, String? secCd});

  Future<num> getOrderLimitedQty(
      {required String subAccoNo,
      required String secCd,
      required num price,
      required TradeType tradeType,
      required num buyingPower});

  Future<PrepareOrderData?> prepareSubmitOrder(
      {required PrepareSubmitOrder prepareOrder});

  // Kiểm tra xem khách hàng có bị phong tỏa không
  Future<num?> getCustomerRestriction(CusRestriction request);

  //check big shareholder, insider shareholder
  Future<CustomerInsiderData> validateCustomerInsider(
      CustomerInsiderRequest request);

  Future<bool> submitOrder(
      {required List<RequestOrder> requestOrder, required String otp});

  Future<bool> submitOrderPending(
      {required List<RequestOrderPending> requestOrderPending,
      required String otp});

  //check condition order
  Future<String> getCondition(
      {required TradeType tradeType,
      required num price,
      required num? changeValue,
      required String? operation,
      required int type});

  //submit condition order
  Future<bool> updateRequestCond({required ConditionOrderRequest request});

  Future<List<CustomerPortfolio>> findPortfolio(
      {required String? subAcc,
      required String? alloDate,
      required String secCd});

  //calculate step price for take profit condition
  Future<num> getPriceWithStepPrice(
      {required String secCd, required num price});

  Future<void> getQuickOrderPrice({required Index index});
}
