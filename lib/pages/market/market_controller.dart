import 'dart:async';

import 'package:flutter_mobile/base/base_main_controller.dart';
import 'package:flutter_mobile/controller/refresh_manager.dart';
import 'package:flutter_mobile/controller/watch_list_manager.dart';
import 'package:flutter_mobile/core_support/lifecycle_event_handler.dart';
import 'package:flutter_mobile/data/source/socket/socket_manager.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pbgrpc.dart';
import 'package:flutter_mobile/domain/usecase/market_use_case.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/main/main_controller.dart';
import 'package:flutter_mobile/pages/market/pages/heat_map/heat_map_controller.dart';
import 'package:flutter_mobile/pages/market/pages/industry_heat_map/indestries_heat_map_controller.dart';
import 'package:flutter_mobile/pages/market/pages/market_depth_chart/market_depth_chart_controller.dart';
import 'package:flutter_mobile/pages/market/pages/market_index/market_index_controller.dart';
import 'package:flutter_mobile/pages/market/pages/top_foregin_trade/top_foregin_trade_controller.dart';
import 'package:flutter_mobile/pages/watch_list/watch_list_controller.dart';

import 'pages/net_flow/net_flow_controller.dart';
import 'pages/top_sec_changed/top_sec_changed_controller.dart';
import 'pages/top_sec_up_down/top_sec_up_down_controller.dart';

class MarketController extends BaseMainController<int> {
  MarketController()
      : super(
            currentPage: 0, indexPageChange: Get.find<MainController>().index);
  final MarketUseCase marketUseCase = MarketUseCase();

  late TopSecUpDownController topSecUpController;
  late TopSecUpDownController topSecDownController;
  late TopSecChangedController topSecChangedController;
  late MarketDepthChartController marketDepthChartController;
  late TopForeginTradeController topForeginTradeController;
  late WatchListController watchListController;
  late NetFlowController netFlowController;
  late MarketIndexController marketIndexController;
  late HeatMapController heatMapController;
  late IndustriesHeatMapController industriesHeatMapController;

  final PageController pageController = PageController();
  bool needRefresh = false;
  final Rx<Mode> modeMarket = Rx<Mode>(Mode.ADVANCE);
  ScrollController scrollController = ScrollController();
  StreamSubscription<AppLifecycleState>? streamLifecycleState;

  @override
  void onInit() {
    RefeshManager().subReresh('MarketPage', () {
      _onRefreshInterval();
    });
    SocketManager().stateSeverMarket.addListener(() {
      if (SocketManager().stateSeverMarket.value ==
          SystemState_StatusCode.AVAILABLE) {
        _onRefresh();
      }
    });
    streamLifecycleState = LifecycleEventHandler()
        .streamNotifyLifecycle
        .listen((AppLifecycleState event) {
      if (event == AppLifecycleState.resumed &&
          !LifecycleEventHandler().inactiveWithBimotric) {
        _onRefresh();
      }
    });

    watchListController = WatchListController();
    industriesHeatMapController = IndustriesHeatMapController();
    heatMapController = HeatMapController();

    marketDepthChartController = MarketDepthChartController(marketUseCase);
    netFlowController = NetFlowController(marketUseCase);

    topSecUpController = TopSecUpDownController(marketUseCase)
      ..isTopSecUp = true;
    topSecDownController = TopSecUpDownController(marketUseCase)
      ..isTopSecUp = false;
    topSecChangedController = TopSecChangedController();

    marketIndexController = MarketIndexController();
    topForeginTradeController = TopForeginTradeController(marketUseCase, false);

    super.onInit();
  }

  void _onRefresh() {
    watchListController.getWatchList(WatchListManager().categorySelect.value);
    heatMapController.getDataMarketCap();
    industriesHeatMapController.getIndustriesHeatMap();
    marketDepthChartController.findMarketDepth();
    netFlowController.findNetFlow();
    marketIndexController.onRefresh();
    // Top Giá
    topSecUpController.findTopSecUpDown();
    topSecDownController.findTopSecUpDown();
    topSecChangedController.findTopSecChanged();
    topForeginTradeController.findTopForeginTrade();
    RefeshManager().subReresh('MarketPage', () {
      _onRefreshInterval();
    });
  }

  void _onRefreshInterval() {
    if (isCurrentPage) {
      industriesHeatMapController.getIndustriesHeatMap();
      heatMapController.getDataMarketCap();
      marketDepthChartController.findMarketDepth();
      netFlowController.findNetFlow();
      topSecUpController.findTopSecUpDown();
      topSecDownController.findTopSecUpDown();
      topSecChangedController.findTopSecChanged();
      topForeginTradeController.findTopForeginTrade();
    }
  }

  @override
  void initPage({bool onInit = false}) {
    if (!onInit) {
      _onRefresh();
    }
  }

  void onScrollRefresh() {
    watchListController.getWatchList(WatchListManager().categorySelect.value);
    heatMapController.getDataMarketCap();
    industriesHeatMapController.getIndustriesHeatMap();
    marketDepthChartController.findMarketDepth();
    netFlowController.findNetFlow();
    // Top Giá
    topSecUpController.findTopSecUpDown();
    topSecDownController.findTopSecUpDown();
    topSecChangedController.findTopSecChanged();
    marketIndexController.onInit();
    topForeginTradeController.findTopForeginTrade();
  }

  void switchMode() {
    if (modeMarket.value == Mode.ADVANCE) {
      modeMarket.value = Mode.BASIC;
    } else {
      modeMarket.value = Mode.ADVANCE;
    }
    pageController.animateToPage(
      modeMarket.value.position,
      curve: Curves.linear,
      duration: Duration(milliseconds: 250),
    );
  }

  @override
  void onClose() {
    streamLifecycleState?.cancel();
    RefeshManager().unsubReresh('MarketPage');
    super.onClose();
  }
}
