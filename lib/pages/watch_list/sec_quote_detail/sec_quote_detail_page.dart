import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/place_order/information/stock_infor_widget.dart';
import 'package:flutter_mobile/pages/place_order/information/widget/ask_bid_widget.dart';
import 'package:flutter_mobile/pages/watch_list/sec_quote_detail/action_add_stock_widget.dart';
import 'package:flutter_mobile/pages/watch_list/sec_quote_detail/char_horizontal.dart';
import 'package:flutter_mobile/pages/watch_list/sec_quote_detail/sec_quote_detail_controller.dart';
import 'package:flutter_mobile/pages/watch_list/sec_quote_detail/technical_analysis_view.dart';
import 'package:flutter_mobile/pages/watch_list/sec_quote_detail/time_and_sale_widget.dart';
import 'package:flutter_mobile/widgets/appbar_custom.dart';
import 'package:flutter_mobile/widgets/button/widget_button.dart';
import 'package:flutter_mobile/widgets/no_data.dart';
import 'package:flutter_mobile/widgets/tabbar_sliver.dart';

class SecQuoteDetailPage extends BaseScreen<SecQuoteDetailController> {
  SecQuoteDetailPage(this.secCd, {Key? key, this.idCategory})
      : super(key: key, tag: secCd);

  final String secCd;
  final num? idCategory;

  @override
  SecQuoteDetailController putController() {
    return SecQuoteDetailController(secCd);
  }

  @override
  Widget builder() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar,
      body: _buildBody,
      bottomNavigationBar: _buildPlaceOrder(),
    );
  }

  Widget get _buildBody => NestedScrollView(
        controller: controller.scrollController,
        headerSliverBuilder: (_, __) {
          return <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, __) => StockInformationWidget(
                    controller.stockInformationController, (_) {},
                    tagController: 'SecQuoteDetailPage$secCd'),
                childCount: 1,
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: _buildTabBar,
            )
          ];
        },
        body: _buildTabPage,
      );

  TabBarViewSliver get _buildTabBar =>
      TabBarViewSliver(controller: controller.tabController, tabs: <Widget>[
        Tab(text: LocaleKeys.goline_Summary.tr),
        Tab(text: LocaleKeys.title_ptkt.tr),
        Tab(text: LocaleKeys.goline_News.tr),
      ]);

  Widget get _buildTabPage => PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller.pageviewController,
          children: <Widget>[
            _buildQuotes,
            TechnicalAnalysisView(secCd),
            Nodata(),
          ]);

  Widget get _buildQuotes =>
      ListView(padding: EdgeInsets.only(bottom: 100), children: <Widget>[
        _builHeaderTittle(title: LocaleKeys.table_price.tr),
        AskBidWidget((_) {}, controller.stockInformationController,
            tag: 'SecQuoteDetailPage$secCd'),
        SizedBox(height: 16),
        _buildLine,
        _builHeaderTittle(title: LocaleKeys.volume_and_time.tr),
        TimeAndSaleWidget(tagController: secCd),
        _buildLine,
        _builHeaderTittle(title: LocaleKeys.title_mtc.tr),
        ChartMTCWidget(tagController: secCd),
      ]);

  Widget get _buildLine => Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: color.grey70))));

  PreferredSize get _buildAppBar => PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: AppBarCustom(
          widgetTitle: StreamBuilder<String>(
              stream: controller.stockInformationController.secCdStream,
              builder: (_, AsyncSnapshot<String> snapshot) {
                return Column(children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(secCd,
                            style: textStyle.bold(
                                size: sized.fontMedium, color: color.grey0)),
                        SizedBox(width: 6),
                        Text(
                            '(${controller.stockInformationController.itemViewModel?.stockItem.index?.name ?? ''})',
                            style: textStyle.medium(
                                size: sized.fontMedium, color: color.grey20))
                      ]),
                  SizedBox(height: 2),
                  if (controller.secCd.isEmpty)
                    SizedBox()
                  else
                    Text(controller.stockInformationController.subTicker,
                        maxLines: 1,
                        style: textStyle.custom(size: 12, color: color.grey20))
                ]);
              }),
          actions: <Widget>[
            ActionAddStockWidget(secCd, categoryId: idCategory)
          ]));

  Widget _builHeaderTittle({required String title}) => Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Text(title,
          style: textStyle.custom(
              size: 15, fontWeight: FontWeight.w700, color: color.grey0)));

  Widget _buildPlaceOrder() {
    return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 20, left: 12, right: 12),
        child: Row(children: <Widget>[
          Expanded(
              child: WidgetButton(
                  title: LocaleKeys.sell.tr,
                  bgColor: color.red50,
                  onClick: () =>
                      controller.placeOrder(tradeType: TradeType.SELL))),
          SizedBox(width: 8),
          Expanded(
              child: WidgetButton(
                  title: LocaleKeys.buy.tr,
                  bgColor: color.green50,
                  onClick: () =>
                      controller.placeOrder(tradeType: TradeType.BUY))),
        ]));
  }
}
