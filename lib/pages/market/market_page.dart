import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/main/main_controller.dart';
import 'package:flutter_mobile/pages/market/pages/heat_map/heat_map.dart';
import 'package:flutter_mobile/pages/market/pages/industry_heat_map/industries_heat_map.dart';
import 'package:flutter_mobile/pages/market/pages/market_index/market_index.dart';
import 'package:flutter_mobile/pages/market/pages/net_flow/net_flow.dart';
import 'package:flutter_mobile/pages/market/pages/top_foregin_trade/top_foregin_trade_widget.dart';
import 'package:flutter_mobile/pages/market/pages/top_sec_changed/top_sec_changed_widget.dart';
import 'package:flutter_mobile/pages/market/pages/top_sec_up_down/top_sec_up_down.dart';
import 'package:flutter_mobile/pages/market/widget/header_market.dart';
import 'package:flutter_mobile/pages/watch_list/manager/bottom_sheet.dart';
import 'package:flutter_mobile/pages/watch_list/manager/bottom_sheet_category.dart';
import 'package:flutter_mobile/pages/watch_list/watch_list_basic_page.dart';
import 'package:flutter_mobile/pages/watch_list/watch_list_widget.dart';
import 'package:flutter_mobile/widgets/appbar_custom.dart';
import 'package:flutter_mobile/widgets/smart_load_list.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'market_controller.dart';
import 'pages/market_depth_chart/market_depth_chart.dart';

class MarketPage extends BaseScreen<MarketController> with SmartLoadList {
  MarketPage({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return Scaffold(
      appBar: _buildAppBar,
      floatingActionButton: _buildFloatButtonCopy,
      body: _buildChangeMode,
    );
  }

  Widget get _buildChangeMode => PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: <Widget>[
            buildSmartList(),
            WatchListBasicPage(controller.watchListController)
          ]);

  Widget get _buildMarketAdvance =>
      ListView(shrinkWrap: true, children: <Widget>[
        HeaderMarket(controller.watchListController),
        SizedBox(height: 16),
        WatchListWidget(watchListController: controller.watchListController),
        IndustriesHeatMap(
            industriesHeatMapController:
                controller.industriesHeatMapController),
        HeatMap(heatMapController: controller.heatMapController),
        // IndexWatch(controller.indexWatchController),
        MarketDepthChart(controller.marketDepthChartController),
        MarketIndex(controller.marketIndexController),
        NetFlow(controller.netFlowController),
        TopSecUpDown(controller.topSecUpController,
            tagController: 'topSecUpController', widgetTitle: 'Top giá tăng'),
        TopSecUpDown(controller.topSecDownController,
            tagController: 'topSecDownController', widgetTitle: 'Top giá giảm'),
        TopSecChangedWidget(controller.topSecChangedController),
        TopForeginTradeWidget(controller.topForeginTradeController),
      ]);

  /// Mode BASIC
  Widget get buildListTickerBasic =>
      WatchListBasicPage(controller.watchListController);

  PreferredSizeWidget get _buildAppBar => PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarCustom(
            titleAppBar: LocaleKeys.market.tr,
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                  onPressed: () => controller.switchMode(),
                  icon: SvgPicture.asset(AppPath.swap,
                      width: 24, height: 24, color: color.grey40)),
            ]),
      );

  Widget get _buildFloatButtonCopy =>
      Obx(() => controller.modeMarket.value == Mode.BASIC
          ? GestureDetector(
              onTap: () {
                showListCategory(TypeBottom.COPY_WATCHLIST);
              },
              child: SvgPicture.asset(AppPath.swapDark),
            )
          : GestureDetector(
              onTap: () {
                Get.find<MainController>().index.value = 1;
                Get.find<MainController>().pageController.jumpToPage(1);
              },
              child: SvgPicture.asset(AppPath.swapDark),
            ));

  @override
  MarketController? putController() {
    return MarketController();
  }

  void showListCategory(TypeBottom typeBottom) {
    Get.bottomSheet(
        BottomSheetCustom(
            height: 0.4.getHeight,
            padding: EdgeInsets.zero,
            content: BottomSheetCategory(
                type: TypeBottom.COPY_WATCHLIST,
                title: LocaleKeys.my_watch_list.tr)),
        isScrollControlled: true,
        enableDrag: false,
        backgroundColor: Colors.transparent);
  }

  @override
  Widget get listViewLoad => _buildMarketAdvance;

  @override
  Future<void> onRefresh() async {
    controller.onScrollRefresh();
    refreshController.refreshCompleted();
  }
}
