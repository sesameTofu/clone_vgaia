import 'dart:async';

import 'package:flutter_mobile/base/base_main_controller.dart';
import 'package:flutter_mobile/controller/stock_manager.dart';
import 'package:flutter_mobile/core/model/stock_info_model.dart';
import 'package:flutter_mobile/core/model/stock_item_model.dart';
import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/domain/model/place_order/buying_power_data.dart';
import 'package:flutter_mobile/domain/model/place_order/customer_portfolio_model.dart';
import 'package:flutter_mobile/domain/model/place_order/prepare_order_rq.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/domain/usecase/place_order/calculate_place_order_use_case.dart';
import 'package:flutter_mobile/domain/usecase/place_order/validate_place_order_use_case.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/main/main_controller.dart';
import 'package:flutter_mobile/pages/order/order_controller.dart';
import 'package:flutter_mobile/pages/place_order/information/stock_information_controller.dart';
import 'package:flutter_mobile/pages/place_order/place_order_condition.dart';
import 'package:flutter_mobile/pages/place_order/place_order_value.dart';
import 'package:flutter_mobile/utils/debounce.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_mobile/widgets/account/account_mixi_controller.dart';

abstract class PlaceOrderControllerMixi extends BaseMainController<int>
    with PlaceOrderValue, PlaceOrderCondition, AccountMixi {
  PlaceOrderControllerMixi()
      : super(
            currentPage: 2, indexPageChange: Get.find<MainController>().index);

  StockInformationController? stockInformationController;

  final CalculatePlaceOrderUseCase calculatePlaceOrderUseCase =
      CalculatePlaceOrderUseCase();

// List mã chứng khoán ban đầu (cache)
  final RxListNotify<StockItemViewModel> listStockItem =
      <StockItemViewModel>[].objective;
  final ValidatePlaceOrderUseCase _validatePlaceOrderUseCase =
      ValidatePlaceOrderUseCase();
  final Debounce _debounce = Debounce(Duration(milliseconds: 400));
  StreamSubscription<MarketStatusSession>? streamStatusSession;

// = true  bàn phím đang bật
  final RxNotify<bool> isOpenKeyboard = false.objective;
  final RxNotify<num?> quickVolume = RxNotify<num?>(null);

  StockInfoModel? get stockInfoModel =>
      stockInformationController?.itemViewModel?.getStockInfomation();
  StockItemModel? get stockItemModel =>
      stockInformationController?.itemViewModel?.stockItem;
  MarketStatusSession? get marketStatusSession =>
      stockInformationController?.itemViewModel
          ?.getMarketViewModel()
          ?.marketStatusSession;

  set setDerivative(bool value) => isDerivative = value;

  String? get subAccountString => subAccount.value.title;
  bool isDerivative = false;

  // Giá đặt
  final TextEditingController priceController = TextEditingController();
  final FocusNode priceFocusNode = FocusNode();

  // Khối lượg đặt
  final TextEditingController volumeController = TextEditingController();
  final FocusNode volumeFocusNode = FocusNode();

  RxNotify<FocusPlaceOrder> suggestionCtrl = FocusPlaceOrder.NONE.objective;

  // Giá tham chiếu :app cũ thấy check nhưng chưa thấy truyền lên. check lại sau
  final TextEditingController basicPriceController = TextEditingController();

  // giá điều kiện ATO,ATC,...
  final RxListNotify<String> quickOrderSelect = <String>[].objective;

  final RxNotify<bool> isShowOrderSelect = false.objective;
  final RxNotify<bool> isShowVolumeSelect = false.objective;

  final RxNotify<String> quickOrder = ''.objective;

  final Rxn<BuyingPowerData> buyingPowerData = Rxn<BuyingPowerData>(null);
  final Rxn<num> maxBuyQuantity = Rxn<num>();

  StockMove? stockMove;
  StockInfoModel? stockInfoModelCurrent;

  PrepareSubmitOrder get prepareSubitOrder => PrepareSubmitOrder(
      secCd: stockInformationController?.secCd,
      tradeType: tradeTypeSelect.value,
      orderType: orderTypeSelected,
      index: stockInformationController?.itemViewModel?.stockItem.index,
      orderPrice: orderPrice,
      marginRate: buyingPowerData.value?.marginRate,
      orderQty: orderQuantity,
      subAccoNo: subAccount.value.title,
      splitType: 0,
      splitNum: 1,
      referencePrice: referencePrice,
      lowestAndHighesPrice: lowestAndHighesPrice,
      priceCondition: priceCondition.value.value,
      matMethod: matchMathod.value.value,
      fromDate: formDate,
      toDate: toDate.value,
      spreadType: spreadsType.value.value,
      priceDiffsType: priceDiffsType.value.value,
      spreadValue: spreadValue,
      triggerPrice: triggerPrice,
      orderPriceCondition: orderPriceCondition.value.value,
      activePrice: activePrice,
      orderPriceConditionNumber: orderPriceConditionNumber,
      placeOrderType: placeOrderTypeValue);

  @override
  void initPage({bool? onInit = false}) {
    initStockTra();
    initAccount();

    initCondition();
    activePriceController.addListener(
        () => getPriceWithStep(secCd: stockInformationController?.secCd ?? ''));
    priceController.addListener(() {
      if (quickOrder.value.isNotEmpty) {
        if (orderTypeSelected == 'LO') {
          quickOrder.value = '';
        }
      }
    });
    volumeController.addListener(() {
      quickVolume.value = volumeController.text.formatNumber();
    });

    priceFocusNode.addListener(() {
      suggestionCtrl.value = priceFocusNode.hasFocus
          ? FocusPlaceOrder.PRICE
          : FocusPlaceOrder.NONE;
      if (!priceFocusNode.hasFocus) {
        getMaxQuantity();
        isShowOrderSelect.value = false;
      } else {
        isShowOrderSelect.value = true;
      }
    });

    priceFocusNode.addListener(() {
      suggestionCtrl.value = priceFocusNode.hasFocus
          ? FocusPlaceOrder.PRICE
          : FocusPlaceOrder.NONE;
      if (!priceFocusNode.hasFocus && stockInfoModel != null) {
        getMaxQuantity();
        isShowOrderSelect.value = false;
        checkValiedPlaceOrderPrice();
      } else {
        isShowOrderSelect.value = true;
      }
    });

    volumeFocusNode.addListener(() {
      suggestionCtrl.value = volumeFocusNode.hasFocus
          ? FocusPlaceOrder.VOLUME
          : FocusPlaceOrder.NONE;

      if (!volumeFocusNode.hasFocus) {
        isShowVolumeSelect.value = false;
        checkValiedPlaceOrderVolume();
      } else {
        isShowVolumeSelect.value = true;
      }
    });
    //different price changed => calculate OrderPrice
    priceDiffController.addListener(() => getPriceWithStep(
        secCd:
            stockInformationController?.itemViewModel?.stockItem.secID ?? ''));
    //trigger price changed => calculate OrderPrice
    triggerPriceController.addListener(() => getPriceWithStep(
        secCd:
            stockInformationController?.itemViewModel?.stockItem.secID ?? ''));

    stockInformationController = StockInformationController();
    if (StockManager().stockMove.value.secCd.isNotEmpty) {
      final StockMove stockMove = StockManager().stockMove.value;
      tradeTypeSelect.value = stockMove.tradeType;
      stockInformationController?.searchController.text = stockMove.secCd;
      stockInformationController?.moveStock(stockMove.secCd);
    }
    stockInformationController?.searchFousNode.addListener(() {
      suggestionCtrl.value = stockInformationController!.searchFousNode.hasFocus
          ? FocusPlaceOrder.SEARCH_STOCK
          : FocusPlaceOrder.NONE;
    });
    stockInformationController?.searchController.addListener(() {
      searchStockWhenTextChange(
          stockInformationController?.searchController.text);
    });

    // Thay đổi mã=> check lại market để thay đổi giá điều kiện phù hợp với sàn ( ATO,ATC,...)

    stockInformationController?.stockInfor.addListener(() {
      if (isCurrentPage || stockMove != null) {
        final StockInfoModel? stockInfoModel =
            stockInformationController?.stockInfor.value;
        getQuickOrderPrice();

        if (stockInfoModel != null) {
          if (stockInfoModel.secID != stockInfoModelCurrent?.secID ||
              stockMove != null ||
              stockInfoModelCurrent == null) {
            priceController.text = stockMove?.price ??
                (stockInfoModel.matchPrice ?? 0).formatPrice();
          }

          if (stockInfoModel.dataWithApi ?? false || stockMove != null) {
            inquiryBuyingPower();
            placeOrderType();
          }
        } else {
          clearAll();
        }
        stockInfoModelCurrent = stockInfoModel;
        stockMove = null;
      }
    });

    Get.find<OrderController>().typePage.listen((TypePageOrder p0) {
      if (p0 == TypePageOrder.PlaceOrder) {
        inquiryBuyingPower();
      }
    });

    // Lần nào vào màn hình đặt lệnh đều gọi lại sức mua
    Get.find<MainController>().index.listen((int p0) {
      if (isCurrentPage) {
        inquiryBuyingPower();
      }
    });

    super.initPage();
  }

  void getQuickOrderPrice() {
    streamStatusSession?.cancel();
    streamStatusSession = stockInformationController?.itemViewModel
        ?.getMarketViewModel()
        ?.marketStatusSessionStream
        .listen((MarketStatusSession event) {
      quickOrderSelect.value = event
          .quickOrderList(
              index: stockInformationController?.itemViewModel?.stockItem.index)
          .where((String element) => element != 'LO')
          .toList();
    });
    quickOrderSelect.value = marketStatusSession
            ?.quickOrderList(
                index:
                    stockInformationController?.itemViewModel?.stockItem.index)
            .where((String element) => element != 'LO')
            .toList() ??
        <String>[];
  }

  void checkValiedPlaceOrderPrice() {
    final EnumErrorPlaceOrder? errorPlaceOrder =
        _validatePlaceOrderUseCase.checkPrice(
      prepareSubmitOrder: prepareSubitOrder,
      stockInfoModel: stockInfoModel,
      stockItemModel: stockItemModel,
    );
    if (errorPlaceOrder != null) {
      AppToast.showError(errorPlaceOrder.title());
    }
  }

  void checkValiedPlaceOrderVolume() {
    final EnumErrorPlaceOrder? errorPlaceOrder =
        _validatePlaceOrderUseCase.checkOrderVolume(
            prepareSubmitOrder: prepareSubitOrder,
            buyingPower: buyingPowerData.value,
            maxQtty: maxBuyQuantity.value);
    if (errorPlaceOrder != null) {
      AppToast.showError(errorPlaceOrder.title());
    }
  }

  void initStockTra() {
    StockManager().stockMove.addListener(() {
      final StockMove stockMove = StockManager().stockMove.value;
      tradeTypeSelect.value = stockMove.tradeType;
      stockInformationController?.searchController.text = stockMove.secCd;
      stockInformationController?.moveStock(stockMove.secCd);
      if (stockMove.volume != null && (stockMove.volume ?? 0) > 0) {
        setTextValue(
            controller: volumeController,
            value: stockMove.volume!.formatVolume());
      } else {
        volumeController.clear();
      }
      if (stockMove.price != null) {
        setTextValue(controller: priceController, value: stockMove.price ?? '');
      }
      this.stockMove = stockMove;
    });
  }

  Future<void> calculateActivePrice({required String secCd}) async {
    await findPortfolio(secCd: secCd);
  }

// Lấy sức mua
  void inquiryBuyingPower() {
    placeOrderUseCase.inquiryBuyingPower(
        subAccoNo: subAccountString,
        secCd: stockInformationController?.secCd,
        onSuccess: (BuyingPowerData value) {
          buyingPowerData.value = value;
          getMaxQuantity();
        },
        onFailure: (dynamic error) {
          buyingPowerData.value = BuyingPowerData();
          maxBuyQuantity.value = null;
          AppToast.showError(getError(error));
        });
  }

// Lất khối lượng tối đa
  void getMaxQuantity() {
    _debounce(() {
      if (stockInfoModel != null) {
        placeOrderUseCase.getOrderLimitedQty(
            secCd: stockInformationController?.secCd,
            subAccoNo: subAccount.value.value,
            price: ((orderPrice ?? 0) != 0)
                ? (orderPrice ?? 0)
                : stockInfoModel?.ceilingPrice ?? 0,
            tradeType: tradeTypeSelect.value,
            onSuccess: (num value) {
              maxBuyQuantity.value = value;
            },
            onFailure: () {
              maxBuyQuantity.value = 0;
            },
            buyingPower: buyingPowerData.value?.buyingPower);
      }
    });
  }

// Lấy giá bình quân : chỉ gọi ở màn chốt lãi và cắt lỗ
  Future<void> findPortfolio({required String secCd}) async {
    if (isNullOrEmpty(secCd)) {
      return;
    }
    if (placeOrderTypeSelect.value.value == PlaceOrderType.TakeProfit ||
        placeOrderTypeSelect.value.value == PlaceOrderType.StopLoss) {
      placeOrderUseCase.findPortfolio(
          subAcc: subAccountString,
          secCd: secCd,
          onSuccess: (List<CustomerPortfolio> customerPortfolios) {
            final String averagePrice = customerPortfolios.first.avgPrice
                    ?.formatPrice(decimalDigits: 3) ??
                '0';
            averageController.text = averagePrice;
          },
          onFailure: (dynamic e) {
            averageController.text = '0';
          });
    }
  }

// Lấy giá đặt ở màn hình chốt lãi và cắt lỗ
  Future<void> getPriceWithStep({required String secCd}) async {
    if (isNullOrEmpty(secCd)) {
      orderPriceController.text = '0';
      return;
    }
    if (placeOrderTypeSelect.value.value == PlaceOrderType.TakeProfit ||
        placeOrderTypeSelect.value.value == PlaceOrderType.StopLoss) {
      late final num price;
      if (placeOrderTypeSelect.value.value == PlaceOrderType.TakeProfit) {
        price = activePrice + triggerPrice;
      } else {
        price = activePrice - triggerPrice;
      }

      placeOrderUseCase.getPriceWithStepPrice(
          price: price,
          secCd: secCd,
          onSuccess: (num price) {
            orderPriceController.text = price.toString();
          },
          onFailure: () {
            orderPriceController.text = '0';
          });
    }
  }

  void onTapIncrementAndDecrementPrice(
    TypeCalcalator type,
    TextEditingController textEditingController,
  ) {
    final num priceChange =
        calculatePlaceOrderUseCase.caluateIncrementAndDecrementPrice(
            type: type,
            index: stockInformationController?.itemViewModel?.stockItem.index,
            price: textEditingController.text.formatNumber(),
            ticketInfor: stockInformationController?.itemViewModel?.stockInfor,
            stockItemModel: stockItemModel);
    if (orderPrice != priceChange && priceChange >= 0) {
      setTextValue(
          controller: textEditingController, value: priceChange.formatPrice());
      getMaxQuantity();
    }
  }

  void onTapIncrementAndDecrementPriceCodition(
    TypeCalcalator type,
    TextEditingController textEditingController,
  ) {
    final num priceChange =
        calculatePlaceOrderUseCase.caluateIncrementAndDecrementPriceCondition(
            type: type, price: textEditingController.text.formatNumber());
    if (priceChange > 0) {
      setTextValue(
          controller: textEditingController,
          value: priceChange.formatPrice(decimalDigits: 1).replaceSemicolon());
    } else {
      setTextValue(controller: textEditingController, value: '');
    }
  }

  void onTapIncrementAndDecrementVolume(
    TypeCalcalator type,
    TextEditingController textEditingController,
  ) {
    final num volumeChange = calculatePlaceOrderUseCase
        .caluateIncrementAndDecrementVolume(type, volumeController.text);
    if (volumeChange > 0) {
      setTextValue(
          controller: textEditingController,
          value: volumeChange.formatVolume());
    } else {
      setTextValue(controller: textEditingController, value: '');
    }
  }

// Chọn giá điều kiện : ATO,ATC,...
  void selectQuickOrder(String value) {
    if (value != quickOrder.value) {
      quickOrder.value = value;
      setTextValue(controller: priceController, value: quickOrder.value);
      getMaxQuantity();
    }
  }

  void changePriceOnTapPrice(String price) {
    if (price.isString) {
      quickOrder.value = price;
    }
    setTextValue(controller: priceController, value: price);
    getMaxQuantity();
  }

  void setTextValue(
      {required TextEditingController controller, required String value}) {
    controller.text = value;
    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));
  }

  final Rx<TradeType> tradeTypeSelect = Rx<TradeType>(TradeType.BUY);

  num? get orderPrice {
    switch (placeOrderTypeSelect.value.value) {
      case PlaceOrderType.Tendency:
      case PlaceOrderType.DisputePurchase:
        return tradeTypeSelect.value == TradeType.BUY
            ? stockInfoModel?.ceilingPrice
            : stockInfoModel?.floorPrice;
      case PlaceOrderType.TakeProfit:
      case PlaceOrderType.StopLoss:
        return orderPriceController.text.formatNumber();
      case PlaceOrderType.OrderNormal:
      case PlaceOrderType.BeforeDay:
      default:
        return calculatePlaceOrderUseCase.orderPrice(
            quickOrder: quickOrderSelect.value,
            priceString: priceController.text,
            tradeType: tradeTypeSelect.value,
            secQuotesSelect: stockInfoModel);
    }
  }

  num? get orderQuantity => volumeController.text.formatNumber();

  String get orderTypeSelected {
    return quickOrderSelect.value.firstWhere(
        (String element) => element == priceController.text,
        orElse: () => 'LO');
  }

  PlaceOrderType get placeOrderTypeValue =>
      placeOrderTypeSelect.value.value ?? PlaceOrderType.OrderNormal;

  bool get needCheckCondition {
    switch (placeOrderTypeValue) {
      case PlaceOrderType.BeforeDay:
        return orderPriceCondition.value.value ==
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

  void placeOrder();

  void selectTradeType(TradeType type) {
    if ((placeOrderTypeValue == PlaceOrderType.StopLoss ||
            placeOrderTypeValue == PlaceOrderType.TakeProfit) &&
        type == TradeType.BUY) {
      AppToast.showWarning(LocaleKeys.goline_KhongHoTroLenhMua
          .trArgs(<String>[placeOrderTypeValue.title]));
      return;
    }

    if (type != tradeTypeSelect.value) {
      tradeTypeSelect.value = type;
      getMaxQuantity();
    }
  }

  @override
  void accountChange(Select<String> subAccount, {bool isFrist = false}) {
    inquiryBuyingPower();
    calculateActivePrice(secCd: stockInformationController?.secCd ?? '');
  }

  void changePlaceOrder(Select<PlaceOrderType> value) {
    if (placeOrderTypeSelect.value == value) {
      return;
    }
    placeOrderTypeSelect.value = value;
    placeOrderType();
  }

  void selectVolume(num value) {
    setTextValue(controller: volumeController, value: value.formatVolume());
  }

// Khi thay đổi lệnh điều kiện
  void placeOrderType() {
    switch (placeOrderTypeSelect.value.value) {
      case PlaceOrderType.DisputePurchase:
        clearDataCondition();
        matchMathod.value = listMatMethod[1];
        break;
      case PlaceOrderType.TakeProfit:
      case PlaceOrderType.StopLoss:
        // Lệnh điều kiện chốt lãi và cắt lỗ . chuyển về lệnh bán
        clearDataCondition();

        tradeTypeSelect.value = TradeType.SELL;
        calculateActivePrice(secCd: stockInformationController?.secCd ?? '');
        calculateActivePriceChange();
        break;
      case PlaceOrderType.BeforeDay:
        clearDataCondition();
        if (priceController.text.isString) {
          priceController.text = '';
          priceController.text =
              (stockInformationController?.matchPrice ?? 0).formatPrice();
        }

        break;
      case PlaceOrderType.Tendency:
      case PlaceOrderType.OrderNormal:
      default:
        averageController.text = '0';
        activePriceController.text = '0';
        orderPriceController.text = '0';
        clearDataCondition();
    }
  }

  void changeStateKeyboard(bool value) {
    isOpenKeyboard.value = value;
  }

// Lấy mã chứng khoán được gợi ý dựa vào form nhập
  void searchStockWhenTextChange(String? textChange) {
    listStockItem.value =
        placeOrderUseCase.searchTextChange(textChange: textChange);
  }

// Chọn mã chứng khoán được gợi ý trên list
  void changeStockFromSuggestion(String secCd) {
    stockInformationController?.searchController.text = secCd;
    stockInformationController?.searchFousNode.unfocus();
  }

  void clearData({bool clearWithPlaceOrder = false}) {
    // placeOrderTypeSelect.value = listOrderType[0];
    initDate();
    if (!clearWithPlaceOrder) {
      priceController.clear();
      maxBuyQuantity.value = 0;
    }
    volumeController.clear();
    matchMathod.value = listMatMethod[0];
    orderPriceCondition.value = listOrderPriceConditions[0];
    priceCondition.value = listPriceConditions[0];
    spreadsType.value = listspreadsType[0];
    referencePriceController.clear();
    basicPriceController.clear();
    spreadValueController.clear();
    triggerPriceController.clear();
    lowestAndHighesPriceController.clear();
    averageController.clear();
    priceDiffController.clear();
    activePriceController.clear();
    orderPriceController.clear();
  }

  void clearAll() {
    initDate();
    priceController.clear();
    maxBuyQuantity.value = 0;
    volumeController.clear();
    matchMathod.value = listMatMethod[0];
    orderPriceCondition.value = listOrderPriceConditions[0];
    priceCondition.value = listPriceConditions[0];
    spreadsType.value = listspreadsType[0];
    referencePriceController.clear();
    basicPriceController.clear();
    spreadValueController.clear();
    triggerPriceController.clear();
    lowestAndHighesPriceController.clear();
    averageController.clear();
    priceDiffController.clear();
    activePriceController.clear();
    orderPriceController.clear();
  }

  @override
  void onClose() {
    streamStatusSession?.cancel();
    super.onClose();
  }
}
