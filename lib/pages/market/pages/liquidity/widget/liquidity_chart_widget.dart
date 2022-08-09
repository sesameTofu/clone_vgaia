import 'package:flutter_mobile/domain/model/grpc/auto_trading.pb.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/pages/liquidity/liquidity_controller.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends BaseWidget<LiquidityController> {
  ChartWidget({Key? key}) : super(key: key);

  @override
  Widget builder() => SizedBox(
        height: 300,
        width: double.infinity,
        child: _chart(),
      );

  Widget _chart() => Obx(() {
        final List<MarketLiquidityItem> data = controller.listDataChart;
        return SfCartesianChart(
          trackballBehavior: TrackballBehavior(
              enable: false,
              tooltipDisplayMode: TrackballDisplayMode.groupAllPoints),
          legend: Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              overflowMode: LegendItemOverflowMode.wrap,
              textStyle: textStyle.medium(color: color.grey60, size: 10.0)),
          primaryXAxis: CategoryAxis(
            labelRotation: -45,
            axisLine: AxisLine(width: 0),
            majorGridLines: MajorGridLines(width: 0.0),
            labelStyle: textStyle.medium(color: color.grey50, size: 10.0),
            edgeLabelPlacement: EdgeLabelPlacement.shift,
          ),
          plotAreaBorderWidth: 0,
          primaryYAxis: NumericAxis(
            labelStyle: textStyle.medium(color: color.grey50, size: 10.0),
            majorGridLines: MajorGridLines(
                width: 1.0,
                dashArray: const <double>[3, 3],
                color: color.grey60),
            axisLine: AxisLine(width: 0),
            interval: 5000000,
            numberFormat: NumberFormat.compact(locale: 'vi'),
          ),
          series: <ChartSeries<MarketLiquidityItem, String>>[
            // Hiện tại
            ColumnSeries<MarketLiquidityItem, String>(
                dataSource: data,
                xValueMapper: (MarketLiquidityItem sales, _) => sales.time,
                yValueMapper: (MarketLiquidityItem sales, _) => sales.valueT0,
                name: LocaleKeys.liquidity_now.tr,
                color: color.blue60,
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: false)),
            // Phiên trước
            LineSeries<MarketLiquidityItem, String>(
                dataSource: data,
                xValueMapper: (MarketLiquidityItem sales, _) => sales.time,
                yValueMapper: (MarketLiquidityItem sales, _) => sales.valueT1,
                name: LocaleKeys.liquidity_before_session.tr,
                color: color.green60,
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: false)),
            // 1 tuần
            LineSeries<MarketLiquidityItem, String>(
                dataSource: data,
                xValueMapper: (MarketLiquidityItem sales, _) => sales.time,
                yValueMapper: (MarketLiquidityItem sales, _) => sales.valueT5,
                name: LocaleKeys.liquidity_1_week.tr,
                color: color.violet60,
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: false)),
            // 2 tuần
            LineSeries<MarketLiquidityItem, String>(
                dataSource: data,
                xValueMapper: (MarketLiquidityItem sales, _) => sales.time,
                yValueMapper: (MarketLiquidityItem sales, _) => sales.valueT10,
                name: LocaleKeys.liquidity_2_week.tr,
                color: color.yellow60,
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: false)),
            // 1 tháng
            LineSeries<MarketLiquidityItem, String>(
                dataSource: data,
                xValueMapper: (MarketLiquidityItem sales, _) => sales.time,
                yValueMapper: (MarketLiquidityItem sales, _) => sales.valueT30,
                name: LocaleKeys.liquidity_1_month.tr,
                color: color.red60,
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: false)),
          ],
        );
      });
}
