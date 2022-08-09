import 'dart:async';

import 'package:flutter_mobile/controller/account_manager.dart';
import 'package:flutter_mobile/controller/global_data_manager.dart';
import 'package:flutter_mobile/core/market_item_view_model.dart';
import 'package:flutter_mobile/core/model/stock_info_model.dart';
import 'package:flutter_mobile/core/model/stock_item_model.dart';
import 'package:flutter_mobile/core/repos/stock_repos.dart';
import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/data/repository/authencation_reponsitory_impl.dart';
import 'package:flutter_mobile/data/repository/trading_repository_impl.dart';
import 'package:flutter_mobile/data/source/dio/api/rest_client_base.dart';
import 'package:flutter_mobile/domain/model/account_infor/account_infor.dart';
import 'package:flutter_mobile/domain/model/account_infor/cus_insider_data.dart';
import 'package:flutter_mobile/domain/model/account_infor/sec_balance_list.dart';
import 'package:flutter_mobile/domain/model/authencation/pin_data_model.dart';
import 'package:flutter_mobile/domain/model/place_order/buying_power_data.dart';
import 'package:flutter_mobile/domain/model/place_order/cis_insider_req.dart';
import 'package:flutter_mobile/domain/model/place_order/condition_order_request.dart';
import 'package:flutter_mobile/domain/model/place_order/cus_restric_req.dart';
import 'package:flutter_mobile/domain/model/place_order/customer_portfolio_model.dart';
import 'package:flutter_mobile/domain/model/place_order/prepare_order_model.dart';
import 'package:flutter_mobile/domain/model/place_order/prepare_order_rq.dart';
import 'package:flutter_mobile/domain/repository/authentication_reponsitory.dart';
import 'package:flutter_mobile/domain/repository/trading_repository.dart';
import 'package:flutter_mobile/domain/repository/user_repository.dart';
import 'package:flutter_mobile/domain/usecase/place_order/place_order_use_case_mixi.dart';
import 'package:flutter_mobile/domain/usecase/place_order/validate_place_order_use_case.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/enum_helper.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_mobile/widgets/pop_up/show_popup.dart';

class PlaceOrderUseCase with PlaceOrderUsecaseMixi {
  final StockRepos _stockReponsitory = StockRepos();
  final TradingRepository _tradingRepository = TradingRepositoryImpl();
  final AuthencationReponsitory _authencationReponsitory =
      AuthencationReponsitoryImpl();

  final UserRepository _userRepository = UserRepositoryImpl(RestClientBase());

  final ValidatePlaceOrderUseCase _validatePlaceOrderUseCase =
      ValidatePlaceOrderUseCase();
  Timer? _debounceRequestStepPrice;

  // Get data subaccount list
  void getSubAccountList(
      {required Function onSuccess, required Function onFailure}) {
    try {
      final List<String> listAcc =
          AccountManager().getSubAccoList(EntrustBusinessCode.all);
      if (isNotNullOrEmpty(listAcc)) {
        onSuccess(listAcc);
      }
    } catch (err) {
      onFailure(err);
    }
  }

  // get Account default
  String getDefaultAccounList(List<String> listAcc) {
    return AccountManager().getSubAccoutDefault() ?? listAcc.first;
  }

// Get order price (ATC,ATO,....)
  List<String> getOrderQuickPrice({Index? index}) {
    if (index == Index.HOSE) {
      return quickOrderListHOSE;
    } else {
      return quickOrderList;
    }
  }

// AccountInfor
  Future<void> accountInformation(
      {required String? accountNo,
      required Function onSuccess,
      required Function onFailure}) async {
    if (isNullOrEmpty(accountNo)) {
      return;
    }
    try {
      final AccountInfor? accountInfor =
          await _userRepository.inqueryAccount(accountNo: accountNo!);
      if (accountInfor != null) {
        onSuccess(accountInfor);
      }
    } catch (error) {
      onFailure(error);
    }
  }

// get buying Power
  Future<void> inquiryBuyingPower(
      {String? subAccoNo,
      String? secCd,
      required Function onSuccess,
      required Function onFailure}) async {
    if (isNullOrEmpty(subAccoNo)) {
      return;
    }
    try {
      final BuyingPowerData buyingPowerData = await _tradingRepository
          .inquiryBuyingPower(subAccoNo: subAccoNo!, secCd: secCd);
      onSuccess(buyingPowerData);
    } catch (error) {
      onFailure();
    }
  }

// get max quantity sell and buy
  Future<void> getOrderLimitedQty(
      {required String? secCd,
      required String? subAccoNo,
      required num? buyingPower,
      required num price,
      required TradeType tradeType,
      required Function(num maxTotalQuantity) onSuccess,
      required Function onFailure}) async {
    try {
      final num maxQtty = await _tradingRepository.getOrderLimitedQty(
          subAccoNo: subAccoNo ?? '',
          secCd: secCd ?? '',
          buyingPower: buyingPower ?? 0,
          price: price,
          tradeType: tradeType);
      onSuccess(maxQtty);
    } catch (error) {
      onFailure();
    }
  }

  num getMaxQuantitySell({
    required AccountInfor? accountInfor,
    required String? secCd,
  }) {
    if (isNullOrEmpty(secCd) || isNullOrEmpty(accountInfor?.subAccoNo)) {
      return 0;
    }
    return getSecSecBalance(accountInfor: accountInfor)
            .firstWhere((SecBalanceList element) => element.secCd == secCd)
            .sellAvailQtty ??
        0;
  }

  Future<num> getMaxQuantityBuy({
    required AccountInfor? accountInfor,
    required num? buyingPower,
    required String? secCd,
    required num pirce,
  }) async {
    if (isNullOrEmpty(accountInfor?.subAccoNo)) {
      return 0;
    }
    if (buyingPower == null) {
      final BuyingPowerData? buyingPowerData =
          await _tradingRepository.inquiryBuyingPower(
              subAccoNo: accountInfor?.subAccoNo ?? '', secCd: secCd);
      return (buyingPowerData?.buyingPower ?? 0) ~/ pirce;
    }
    return buyingPower ~/ pirce;
  }

// List stock balance (quantity availiabe > 0)
  List<SecBalanceList> getSecSecBalance({required AccountInfor? accountInfor}) {
    return <SecBalanceList>[
      ...(accountInfor?.secBalanceList ?? <SecBalanceList>[])
          .where((SecBalanceList element) => (element.sellAvailQtty ?? 0) > 0)
    ];
  }

// Get session market
  void getMarketSession({required Index index, required Function onSuccess}) {
    final MarketItemViewModel? marketSessionViewModel =
        _stockReponsitory.getMarketSessionItem(index);
    if (marketSessionViewModel != null) {
      onSuccess(marketSessionViewModel);
    }
  }

  //Kiem tra khach hang co bi phong toa hay ko
  Future<bool> isCustomerRestriction(
      {required String subAccoNo,
      required TradeType tradeType,
      required Function onFailure}) async {
    try {
      final CusRestriction request = CusRestriction(
        subAccoCd: 0,
        subAccoNo: subAccoNo,
        restrictionCd: EnumHelper.getRestrictionCode(tradeType == TradeType.BUY
                ? RestrictionCode.orderBuy
                : RestrictionCode.orderSell)
            .toString(),
      );
      final num? result =
          await _tradingRepository.getCustomerRestriction(request);
      // true: Khách hàng bị phong toả
      return result != null && result == 0;
    } catch (error) {
      // show erroe
      onFailure(error);
      return false;
    }
  }

  Future<void> placeOrder(
      {required PrepareSubmitOrder prepareOrder,
      required StockInfoModel? stockInfoModel,
      required StockItemModel? stockItemModel,
      required MarketStatusSession? marketStatusSession,
      required BuyingPowerData? buyingPower,
      required num? maxQtty,
      required Function onSuccess,
      required Function onFailure}) async {
    try {
      // kiểm tra giá trị trướ khi đặt lênh
      EnumErrorPlaceOrder? errorPlaceOrder;

      errorPlaceOrder = _validatePlaceOrderUseCase.checkValiedPlaceOrder(
        prepareSubmitOrder: prepareOrder,
        stockInfoModel: stockInfoModel,
        buyingPower: buyingPower,
      );
      if (errorPlaceOrder != null) {
        onFailure(errorPlaceOrder);
        return;
      }

      // check price
      errorPlaceOrder = _validatePlaceOrderUseCase.checkPrice(
        stockItemModel: stockItemModel,
        isSubmit: true,
        prepareSubmitOrder: prepareOrder,
        stockInfoModel: stockInfoModel,
      );
      if (errorPlaceOrder != null) {
        onFailure(errorPlaceOrder);
        return;
      }
      // Check có vượt quá số lượng tối đa
      errorPlaceOrder = _validatePlaceOrderUseCase.checkOrderVolume(
          isSubmit: true,
          prepareSubmitOrder: prepareOrder,
          buyingPower: buyingPower,
          maxQtty: maxQtty);
      if (errorPlaceOrder != null) {
        onFailure(errorPlaceOrder);
        return;
      }

      // errorPlaceOrder = _validatePlaceOrderUseCase.checkMarketSession(
      //     prepareOrder: prepareOrder,
      //     marketStatusSessionWithIndex: marketStatusSession);
      // if (errorPlaceOrder != null) {
      //   onFailure(errorPlaceOrder);
      //   return;
      // }

      if (prepareOrder.placeOrderType == PlaceOrderType.OrderNormal) {
        placeNotConditionOrder(
            prepareOrder: prepareOrder,
            onSuccess: onSuccess,
            onFailure: onFailure);
      } else {
        placeConditionOrder(
            prepareOrder: prepareOrder,
            onSuccess: onSuccess,
            onFailure: onFailure,
            stockInfoModel: stockInfoModel);
      }
    } catch (error) {
      onFailure(error);
    }
  }

  Future<void> placeNotConditionOrder({
    required PrepareSubmitOrder prepareOrder,
    required Function onSuccess,
    required Function onFailure,
  }) async {
    try {
      final PrepareOrderData? prepareOrderData = await prepareSubmitOrder(
          prepareSubmitOrder: prepareOrder, onFailure: onFailure);
      if (prepareOrderData == null) {
        onFailure(EnumErrorPlaceOrder.errorCancelPopup);
        return;
      }
      if (prepareOrderData.restrictionLevel == null ||
          prepareOrderData.restrictionLevel != 0) {
        dialogConfirnPlaceCustomerInsider(
            message: LocaleKeys.goline_AccoHasBeenBlocked
                .trArgs(<String>[prepareOrder.subAccoNo ?? '']));
        onFailure(EnumErrorPlaceOrder.errorCancelPopup);

        return;
      }

      if (isNotNullOrEmpty(prepareOrderData.pendingOrderList) ||
          isNotNullOrEmpty(prepareOrderData.pendingOrderList)) {
        onFailure(EnumErrorPlaceOrder.errorCancelPopup);
        return;
      }

      if (!await validateCustomerInsider(
          customerInsider: prepareOrderData.customerInsiderData,
          prepareSubmitOrder: prepareOrder,
          onFailure: onFailure)) {
        onFailure(EnumErrorPlaceOrder.errorCancelPopup);
        return;
      }

      if (!(await dialogConfirnPlaceOrder(
              prepareOrderData: prepareOrderData, prepareOrder: prepareOrder) ??
          false)) {
        onFailure(EnumErrorPlaceOrder.errorCancelPopup);
        return;
      }

      final PinDataModel? pinDataModel =
          await _authencationReponsitory.checkPinType(businessCd: 2);

      // Smart Otp
      if (pinDataModel?.pinType == PinType.SmartOtp) {}

      submitOrder(
        prepareOrderData: prepareOrderData,
        onSuccess: onSuccess,
        onFailure: onFailure,
      );
    } catch (error) {
      onFailure(error);
    }
  }

  Future<void> placeConditionOrder(
      {required PrepareSubmitOrder prepareOrder,
      required StockInfoModel? stockInfoModel,
      required Function onSuccess,
      required Function onFailure}) async {
    try {
      EnumErrorPlaceOrder? errorPlaceOrder;
      errorPlaceOrder =
          _validatePlaceOrderUseCase.checkValiedPlaceOrdeCondition(
        prepareSubmitOrder: prepareOrder,
        stockInfoModel: stockInfoModel,
      );
      if (errorPlaceOrder != null) {
        onFailure(errorPlaceOrder);
        return;
      }

      // Kiểm tra tài khoản có bị phong toả hay không?
      if (!await isCustomerRestriction(
          subAccoNo: prepareOrder.subAccoNo!,
          tradeType: prepareOrder.tradeType!,
          onFailure: onFailure)) {
        ShowPopup().popUpNoty(
            barrier: true,
            content: LocaleKeys.goline_AccoHasBeenBlocked
                .trArgs(<String>[prepareOrder.subAccoNo ?? '']));
        onFailure(EnumErrorPlaceOrder.errorCancelPopup);
        return;
      }

      if (!await validateCustomerInsider(
          prepareSubmitOrder: prepareOrder, onFailure: onFailure)) {
        onFailure(EnumErrorPlaceOrder.errorCancelPopup);
        return;
      }

      if (!(await dialogConfirnPlaceOrderCondition() ?? false)) {
        onFailure(EnumErrorPlaceOrder.errorCancelPopup);
        return;
      }

      String? condition;
      if (needCheckCondition(prepareOrder: prepareOrder)) {
        condition = await _tradingRepository.getCondition(
            tradeType: prepareOrder.tradeType!,
            price: getOrderPriceCondition(prepareOrder: prepareOrder),
            changeValue: getChangeValue(prepareOrder: prepareOrder),
            operation: getOperation(prepareOrder: prepareOrder),
            type: getOrderConditionType(prepareOrder: prepareOrder).value());
      }
      final PinDataModel? pinDataModel =
          await _authencationReponsitory.checkPinType(businessCd: 2);
      if (pinDataModel == null || pinDataModel.pinType == null) {
        return;
      }
      // authen smart otp....

      final ConditionOrderRequest request = ConditionOrderRequest(
          tradeType: prepareOrder.tradeType!,
          subAccoNo: prepareOrder.subAccoNo,
          secCd: prepareOrder.secCd,
          ordQty: prepareOrder.orderQty,
          ordPrice: prepareOrder.orderPrice,
          condType: prepareOrder.placeOrderType.conditionType(),
          fromDate: prepareOrder.fromDate,
          toDate: prepareOrder.toDate,
          matMethod: prepareOrder.matMethod,
          condition: condition,
          value: getValue(prepareOrder: prepareOrder),
          limitOffset: getLimitOffset(prepareOrder: prepareOrder),
          otpCode: '');

      if (!await _tradingRepository.updateRequestCond(request: request)) {
        return;
      }
      onSuccess();
    } catch (error) {
      onFailure(error);
    }
  }

  bool needCheckCondition({required PrepareSubmitOrder prepareOrder}) {
    switch (prepareOrder.placeOrderType) {
      case PlaceOrderType.BeforeDay:
        return prepareOrder.orderPriceCondition ==
            OrderPriceCondition.referencePrice;
      case PlaceOrderType.Tendency:
      case PlaceOrderType.TakeProfit:
      case PlaceOrderType.StopLoss:
        return true;
      case PlaceOrderType.DisputePurchase:
      case PlaceOrderType.OrderNormal:
      default:
        return false;
    }
  }

  OrderConditionType? getOrderConditionType(
      {required PrepareSubmitOrder prepareOrder}) {
    switch (prepareOrder.placeOrderType) {
      case PlaceOrderType.Tendency:
        if (prepareOrder.spreadType == SpreadsType.percentage) {
          return OrderConditionType.SpreadByPercent;
        } else {
          return OrderConditionType.SpreadByValue;
        }
      case PlaceOrderType.TakeProfit:
        if (prepareOrder.priceDiffsType == PriceDiffsType.percentage) {
          return OrderConditionType.PriceByPercent;
        } else {
          return OrderConditionType.PriceByValue;
        }
      case PlaceOrderType.StopLoss:

      case PlaceOrderType.OrderNormal:

      case PlaceOrderType.BeforeDay:

      case PlaceOrderType.DisputePurchase:
        return null;
    }
  }

  // Gias tham chieu
  num getOrderPriceCondition({required PrepareSubmitOrder prepareOrder}) {
    switch (prepareOrder.placeOrderType) {
      case PlaceOrderType.BeforeDay:
        return prepareOrder.referencePrice ?? 0;
      case PlaceOrderType.Tendency:
        return prepareOrder.spreadValue ?? 0;
      case PlaceOrderType.TakeProfit:
      case PlaceOrderType.StopLoss:
        return prepareOrder.activePrice ?? 0;
      case PlaceOrderType.DisputePurchase:
      case PlaceOrderType.OrderNormal:
        return 0;
    }
  }

  String? getOperation({required PrepareSubmitOrder prepareOrder}) {
    switch (prepareOrder.placeOrderType) {
      case PlaceOrderType.BeforeDay:
        return prepareOrder.priceCondition.value();
      case PlaceOrderType.TakeProfit:
        return '>=';
      case PlaceOrderType.StopLoss:
        return '<=';
      default:
        return null;
    }
  }

  num? getChangeValue({required PrepareSubmitOrder prepareOrder}) {
    switch (prepareOrder.placeOrderType) {
      case PlaceOrderType.Tendency:
        return prepareOrder.lowestAndHighesPrice;
      default:
        return 0;
    }
  }

  num? getLimitOffset({required PrepareSubmitOrder prepareOrder}) {
    switch (prepareOrder.placeOrderType) {
      case PlaceOrderType.Tendency:
      case PlaceOrderType.TakeProfit:
      case PlaceOrderType.StopLoss:
        return prepareOrder.triggerPrice;
      default:
        return 0;
    }
  }

  String? getValue({required PrepareSubmitOrder prepareOrder}) {
    switch (prepareOrder.placeOrderType) {
      case PlaceOrderType.BeforeDay:
        return prepareOrder.orderPrice.toString();
      default:
        return null;
    }
  }

  Future<void> submitOrder({
    required PrepareOrderData prepareOrderData,
    required Function onSuccess,
    required Function onFailure,
  }) async {
    try {
      if (prepareOrderData.dataType == DataType.Order) {
        final bool success = await _tradingRepository.submitOrder(
            requestOrder: prepareOrderData.requestOrder, otp: '');
        if (success) {
          onSuccess(prepareOrderData);
        }
      } else {
        if (!(await dialogConfirnPlaceOrderPending() ?? false)) {
          onFailure(EnumErrorPlaceOrder.errorCancelPopup);
          return;
        }
        final bool success = await _tradingRepository.submitOrderPending(
            requestOrderPending: prepareOrderData.requestOrderPending, otp: '');
        if (success) {
          onSuccess();
        }
      }
    } catch (error) {
      onFailure(error);
    }
  }

  Future<PrepareOrderData?> prepareSubmitOrder({
    required PrepareSubmitOrder prepareSubmitOrder,
    required Function onFailure,
  }) async {
    return _tradingRepository.prepareSubmitOrder(
        prepareOrder: prepareSubmitOrder);
  }

  //Kiem tra khach hang la co dong lon - co dong noi bo
  Future<bool> validateCustomerInsider(
      {required PrepareSubmitOrder prepareSubmitOrder,
      CustomerInsiderData? customerInsider,
      required Function onFailure}) async {
    try {
      CustomerInsiderData customerInsiderData;
      bool nextStep;
      if (customerInsider != null) {
        customerInsiderData = customerInsider;
      } else {
        final CustomerInsiderRequest request = CustomerInsiderRequest(
          ordPrice: prepareSubmitOrder.orderPrice,
          ordQty: prepareSubmitOrder.orderQty,
          secCd: prepareSubmitOrder.secCd,
          subAccountNo: prepareSubmitOrder.subAccoNo,
          tradeType: prepareSubmitOrder.tradeType?.value().toInt(),
        );
        customerInsiderData =
            await _tradingRepository.validateCustomerInsider(request);
      }

      ConditionOrder result;
      if (customerInsiderData.maxRateWarning ?? false) {
        // maxRate = customerInsiderData.maxRate;
        result = ConditionOrder.MaxRateWarning;
      } else if (customerInsiderData.bigShareHolhder ?? false) {
        result = ConditionOrder.BigShareHolder;
      } else if (customerInsiderData.insiderShareholder ?? false) {
        result = ConditionOrder.InsiderShareHolder;
      } else if ((customerInsiderData.privateTradingBond ?? false) &&
          (customerInsiderData.privateRemainQty ?? 0) > 0) {
        result = ConditionOrder.TradingBond;
      } else {
        result = ConditionOrder.Success;
      }
      switch (result) {
        case ConditionOrder.MaxRateWarning:
          nextStep = await _showConfirmDialog(
              message: LocaleKeys.msg_confirm_max_rate_warning.trArgs(
                  <String>[(customerInsiderData.maxRate ?? 0).formatPrice()]));
          break;
        case ConditionOrder.BigShareHolder:
          nextStep = await _showConfirmDialog(
              message: LocaleKeys.msg_confirm_big_share_holder.tr);
          break;
        case ConditionOrder.InsiderShareHolder:
          nextStep = await _showConfirmDialog(
              message: LocaleKeys.msg_confirm_insider_share_holder.tr);
          break;
        case ConditionOrder.TradingBond:
          nextStep = await _showConfirmDialog(
              message: LocaleKeys.msg_confirm_private_trading_bond
                  .trArgs(<String>[
            (customerInsiderData.privateRemainQty ?? 0).formatVolume()
          ]));
          break;
        case ConditionOrder.Success:
        default:
          nextStep = true;
          break;
      }
      return nextStep;
    } catch (e) {
      onFailure(e);
      return false;
    }
  }

  Future<bool> _showConfirmDialog({required String message}) async {
    return await dialogConfirnPlaceCustomerInsider(message: message) ?? false;
  }

// check smart otp
  void checkSmartOtp() {}

  Future<void> findPortfolio(
      {required String? subAcc,
      required String secCd,
      required Function onSuccess,
      required Function onFailure}) async {
    try {
      final List<CustomerPortfolio> customerPortfolios =
          await _tradingRepository.findPortfolio(
              subAcc: subAcc,
              alloDate: GlobalDataManager().frontInitialModelMobile.tradeDate,
              secCd: secCd);
      if (isNotNullOrEmpty(customerPortfolios)) {
        onSuccess(customerPortfolios);
      } else {
        onFailure();
      }
    } catch (e) {
      onFailure(e);
    }
  }

  DateTime getDateTimeFormSever() {
    DateTime dateTime = DateTime.now();
    final String? tradeDate =
        GlobalDataManager().frontInitialModelMobile.tradeDate;

    if (tradeDate != null && tradeDate.isNotEmpty) {
      final int year = int.tryParse(tradeDate.substring(0, 4)) ?? dateTime.year;
      final int month =
          int.tryParse(tradeDate.substring(4, 6)) ?? dateTime.month;
      final int day = int.tryParse(tradeDate.substring(6, 8)) ?? dateTime.day;
      dateTime = DateTime(year, month, day);
    }
    return dateTime;
  }

  Future<void> getPriceWithStepPrice(
      {required num price,
      required String secCd,
      required Function onSuccess,
      required Function onFailure}) async {
    try {
      if (_debounceRequestStepPrice?.isActive ?? false) {
        _debounceRequestStepPrice?.cancel();
      }

      _debounceRequestStepPrice = Timer(Duration(milliseconds: 200), () async {
        if (price <= 0) {
          onFailure();
          return;
        }
        final num orderPrice = await _tradingRepository.getPriceWithStepPrice(
            price: price, secCd: secCd);
        onSuccess(orderPrice);
      });
    } catch (e) {
      onFailure(e);
    }
  }

  List<StockItemViewModel> searchTextChange({required String? textChange}) {
    if (isNullOrEmpty(textChange)) {
      return _stockReponsitory.listStocks;
    }
    return _stockReponsitory.searchItems(textChange ?? '');
  }

  StockItemViewModel? getStockItem({
    required String? textChange,
  }) {
    return _stockReponsitory.getStockItem(textChange ?? '');
  }
}
