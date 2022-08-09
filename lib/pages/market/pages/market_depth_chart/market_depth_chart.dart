import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/pages/market_depth_chart/market_depth_chart_controller.dart';
import 'package:flutter_mobile/pages/market/widget/bar_chart.dart';
import 'package:flutter_mobile/pages/market/widget/widgets.dart';

class MarketDepthChart extends BaseScreen<MarketDepthChartController> {
  MarketDepthChart(this.marketDepthChartController, {Key? key})
      : super(key: key);

  final MarketDepthChartController marketDepthChartController;

  @override
  MarketDepthChartController putController() {
    return marketDepthChartController;
  }

  @override
  Widget builder() {
    return Obx(
      () => controller.dataMarketDepth.value.tradeDate == 0
          ? SizedBox()
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleItemMarket(title: LocaleKeys.depth_market.tr),
                _buildMarketDepthChart(),
              ],
            ),
    );
  }

  Widget _buildMarketDepthChart() => SizedBox(
        height: 260,
        child: Column(
          children: <Widget>[
            SizedBox(height: 16),
            Expanded(
                child: VerticalBarLabelChart(controller.dataMarketDepth.value)),
            _buildLinerChart()
                .paddingSymmetric(vertical: AppSized().paddingVerySmall),
            _buildDescription()
          ],
        ).paddingAll(sized.paddingSmall),
      );

  Row _buildLinerChart() => Row(
        children: <Widget>[
          _buildContainLiner(
              percent: controller.sumDown,
              colorItem: color.red50,
              isBorderLeft: true),
          _buildContainLiner(
              percent: controller.dataMarketDepth.value.noChange,
              colorItem: color.yellow50),
          _buildContainLiner(
              percent: controller.sumUp,
              colorItem: color.green50,
              isBorderRight: true),
        ],
      );

  Row _buildDescription() => Row(
        children: <Widget>[
          Expanded(
            child: _buildTextDescription(
                title: LocaleKeys.down.tr,
                value: controller.sumDown.toString(),
                textColor: color.red50),
          ),
          _buildTextDescription(
              title: LocaleKeys.up.tr,
              value: controller.sumUp.toString(),
              textColor: color.green50),
        ],
      );

  Expanded _buildContainLiner(
          {required int percent,
          required Color colorItem,
          bool isBorderLeft = false,
          bool isBorderRight = false}) =>
      Expanded(
        flex: percent,
        child: Container(
          height: AppSized().height4,
          decoration: BoxDecoration(
            color: colorItem,
            borderRadius: BorderRadius.horizontal(
              left: isBorderLeft ? Radius.circular(10) : Radius.zero,
              right: isBorderRight ? Radius.circular(10) : Radius.zero,
            ),
          ),
        ),
      );

  Text _buildTextDescription(
          {required String title,
          required String value,
          required Color textColor}) =>
      Text(
        '$title : $value',
        style: textStyle.custom(
            color: textColor, fontWeight: FontWeight.w400, size: 12),
      );
}
