import 'dart:async';

import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/core_support/lifecycle_event_handler.dart';
import 'package:flutter_mobile/core_ui/base_stock_item.dart';
import 'package:flutter_mobile/domain/usecase/place_order/place_order_use_case.dart';
import 'package:flutter_mobile/domain/usecase/stock_use_case.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';

class StockInformationController extends BaseController with BaseStockItem {
  StockInformationController({
    String secCd = '',
    this.getMatchData = false,
    this.isGetStockPrice = false,
    this.getChartPrice = false,
  }) {
    searchController.text = secCd;
    searchStockWhenTextChange(searchController.text);
  }
  final TextEditingController searchController = TextEditingController();

  final PlaceOrderUseCase placeOrderUseCase = PlaceOrderUseCase();

  final FocusNode searchFousNode = FocusNode();
  final StockUseCase _stockUseCase = StockUseCase();
  final RxNotify<double> bPercent1 = RxNotify<double>(0);
  final RxNotify<double> bPercent2 = RxNotify<double>(0);
  final RxNotify<double> bPercent3 = RxNotify<double>(0);
  final RxNotify<double> sPercent1 = RxNotify<double>(0);
  final RxNotify<double> sPercent2 = RxNotify<double>(0);
  final RxNotify<double> sPercent3 = RxNotify<double>(0);
  final RxNotify<double> totalBidAsk = RxNotify<double>(0);
  final RxNotify<bool> isFoucus = false.objective;

  final RxNotify<bool> showAllInforStock = false.objective;
  final Rxn<StockItemViewModel> stockCache = Rxn<StockItemViewModel>();
  StreamSubscription<AppLifecycleState>? streamLifecycleState;

  double totalBid = 0;
  double totalAsk = 0;
  final bool getMatchData;
  final bool isGetStockPrice;
  final bool getChartPrice;

  @override
  void onInit() {
    streamLifecycleState = LifecycleEventHandler()
        .streamNotifyLifecycle
        .listen((AppLifecycleState event) {
      if (event == AppLifecycleState.resumed &&
          !LifecycleEventHandler().inactiveWithBimotric) {
        intBindData(
            isRefeshData: true,
            getChartData: getMatchData,
            getChartPrice: getChartPrice,
            isGetStockPrice: isGetStockPrice);
      }
    });
    searchFousNode.addListener(() {
      isFoucus.value = searchFousNode.hasFocus;
      if (!searchFousNode.hasFocus) {
        getStock(searchController.text);
      }
    });
    getStock(searchController.text);
    listenPercentQTTY();
    searchController.addListener(() {
      searchStockWhenTextChange(searchController.text);
    });
    super.onInit();
  }

  void getStock(String? textKey) {
    if (isNullOrEmpty(textKey)) {
      clearData();
      searchController.clear();
      return;
    }
    if (textKey == secCd) {
      return;
    } else {
      clearData();
    }
    _stockUseCase.getItemViewModel(textKey!,
        onSuccess: (StockItemViewModel item) {
      setStockItemViewModel = item;
      intBindData(
          isRefeshData: true,
          getChartData: getMatchData,
          getChartPrice: getChartPrice,
          isGetStockPrice: isGetStockPrice);
    }, onFailure: () {
      searchFaiure();
    });
  }

  void moveStock(String secCd) {
    searchController.text = secCd;
    getStock(secCd);
  }

  void listenPercentQTTY() {
    listerListBuySellQtty();
    totalBuyQttyStream.listen((num event) {
      setBPercent();
    });
    totalSellQttyStream.listen((num event) {
      setSPercent();
    });
  }

  void setBPercent() {
    totalBid = totalBuyQtty.toDouble();
    if (totalBid > 0) {
      bPercent1.value = totalBid == 0 ? 0 : (bQtty1 / totalBid);
      bPercent2.value = totalBid == 0 ? 0 : (bQtty2 / totalBid);
      bPercent3.value = totalBid == 0 ? 0 : (bQtty3 / totalBid);
      totalBidAsk.value = totalBid + totalAsk;
    } else {
      bPercent1.value = 0;
      bPercent2.value = 0;
      bPercent3.value = 0;
      totalBidAsk.value = totalBid + totalAsk;
    }
  }

  void setSPercent() {
    totalAsk = totalSellQtty.toDouble();
    if (totalAsk > 0) {
      sPercent1.value = totalAsk == 0 ? 0 : (sQtty1 / totalAsk);
      sPercent2.value = totalAsk == 0 ? 0 : (sQtty2 / totalAsk);
      sPercent3.value = totalAsk == 0 ? 0 : (sQtty3 / totalAsk);
      totalBidAsk.value = totalBid + totalAsk;
    } else {
      sPercent1.value = 0;
      sPercent2.value = 0;
      sPercent3.value = 0;
      totalBidAsk.value = totalBid + totalAsk;
    }
  }

  void searchFaiure() {
    clearData();
    AppToast.showError(LocaleKeys.not_get_code_information.tr);
  }

  // Lấy mã chứng khoán được gợi ý dựa vào form nhập
  void searchStockWhenTextChange(String? textChange) {
    stockCache.value = placeOrderUseCase.getStockItem(textChange: textChange);
  }

  @override
  void onClose() {
    streamLifecycleState?.cancel();
    clearData();
    super.onClose();
  }
}
