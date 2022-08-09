import 'dart:async';

import 'package:flutter_mobile/controller/refresh_manager.dart';
import 'package:flutter_mobile/controller/stock_manager.dart';
import 'package:flutter_mobile/core/model/match_model.dart';
import 'package:flutter_mobile/core/model/match_volume.dart';
import 'package:flutter_mobile/core/model/stock_info_model.dart';
import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/place_order/information/stock_information_controller.dart';

class VolumeAnalysis {
  late double price;
  late double p;
  late double buy;
  late double sell;
  late double vol;
  late double volPercent;
}

class SecQuoteDetailController extends BaseController
    with GetTickerProviderStateMixin {
  SecQuoteDetailController(this.secCd);
  late final StockInformationController stockInformationController;
  StreamSubscription<List<MatchModel>>? streamSubscription;
  StreamSubscription<List<MatchVolume>>? streamSubscription1;
  final RxNotify<StockInfoModel?> stockInfor = RxNotify<StockInfoModel?>(null);
  final RxListNotify<MatchVolume> listSale = <MatchVolume>[].objective;
  final RxListNotify<MatchModel> listMatchQuantity = <MatchModel>[].objective;

  late Rx<Select<int>> currentTimeFilter;
  final List<Select<int>> listTimeFilter = <Select<int>>[
    Select<int>(title: 'T', value: 0),
    Select<int>(title: 'T-1', value: 1),
    Select<int>(title: 'T-5', value: 5)
  ];
  //
  ScrollController scrollController = ScrollController();
  PageController pageviewController = PageController(initialPage: 0);
  late TabController tabController;

  num maxPercentListSale = 1;

  @override
  void onInit() {
    currentTimeFilter = listTimeFilter.first.obs;
    stockInformationController = StockInformationController(
        secCd: secCd, getMatchData: true, getChartPrice: true);
    stockInformationController.stockInfor.addListener(() {
      stockInfor.value = stockInformationController.stockInfor.value;
      stockInfor.refresh();
    });
    streamSubscription = stockInformationController.matchDataSteam
        .listen((List<MatchModel> event) {
      listMatchQuantity.value = <MatchModel>[
        ...stockInformationController.matchData
      ];
    });
    streamSubscription1 = stockInformationController.timeSaleSteam
        .listen((List<MatchVolume> event) {
      listMatchQuantity.value = <MatchModel>[
        ...stockInformationController.matchData
      ];

      maxPercentListSale = stockInformationController.timeSale
              .reduce((MatchVolume val1, MatchVolume val2) =>
                  (val1.percentByTotal ?? 0) > (val2.percentByTotal ?? 0)
                      ? val1
                      : val2)
              .percentByTotal ??
          1;
      listSale.value = stockInformationController.timeSale;
    });

    currentTimeFilter.listen((Select<int> time) {
      listSale.value.clear();
      stockInformationController.stockCache.value
          ?.getTimeSale(time: time.value ?? 0);
    });

    RefeshManager().subReresh('TimeSale', () {
      stockInformationController.stockCache.value
          ?.getTimeSale(time: currentTimeFilter.value.value ?? 0);
    });

    tabController = TabController(length: 3, vsync: this)
      ..addListener(() {
        pageviewController.jumpToPage(tabController.index);
      });

    super.onInit();
  }

  @override
  void onClose() {
    streamSubscription?.cancel();
    streamSubscription1?.cancel();
    RefeshManager().unsubReresh('TimeSale');
    super.onClose();
  }

  final String secCd;

  void placeOrder({required TradeType tradeType}) {
    StockManager().moveStock(secCd: secCd, tradeType: tradeType);
    Get.back(result: true);
  }
}
