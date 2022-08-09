import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_mobile/base/base_page.dart';
import 'package:flutter_mobile/domain/model/market/filter_market.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/pages/market/widget/widgets.dart';
import 'package:flutter_mobile/widgets/chips_filter.dart';

import 'net_flow_controller.dart';

class NetFlow extends BaseScreen<NetFlowController> {
  NetFlow(this.netFlowController, {Key? key}) : super(key: key);

  final NetFlowController netFlowController;

  @override
  NetFlowController putController() {
    return netFlowController;
  }

  @override
  Widget builder() {
    return Column(
      children: <Widget>[
        _buildTite,
        _buildDesciption,
        _buildFilter,
        _buildChart,
      ],
    );
  }

  TitleItemMarket get _buildTite => TitleItemMarket(
        title: 'Net Flow',
      );

  Widget get _buildFilter => Container(
        color: color.background1,
        height: 32,
        width: double.infinity,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12),
          scrollDirection: Axis.horizontal,
          physics: ClampingScrollPhysics(),
          children: controller.tnFilter
              .map(
                (Filter e) => Obx(
                  () => ChipsFilter<Filter>(
                    title: e.label,
                    value: e,
                    isActive: controller.tnSelect.value == e,
                    onClick: (Filter e) => controller.onPress(e),
                    width: 58,
                    height: 32,
                  ).paddingOnly(right: 8),
                ),
              )
              .toList(),
        ),
      );

  Widget get _buildDesciption => Container(
        padding: EdgeInsets.symmetric(vertical: 16.height, horizontal: 8.width),
        color: color.background1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: color.green50,
                  ),
                  height: 6.0.height,
                  width: 6.0.width,
                ),
                SizedBox(width: 4.0.width),
                Text(
                  'Net flow > 0: Tín hiệu tích cực',
                  style: textStyle.regular(
                    size: 10,
                    color: color.grey10,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: color.red50,
                  ),
                  height: 6.0.height,
                  width: 6.0.width,
                ),
                SizedBox(width: 4.0),
                Text(
                  'Net flow < 0: Tín hiệu tiêu cực',
                  style: textStyle.regular(
                    size: 10,
                    color: color.grey10,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Obx get _buildChart => Obx(() {
        final TextStyle dateTextStyle = TextStyle(
          fontSize: 8,
          color: color.grey30,
          fontWeight: FontWeight.normal,
        );

        final List<Color> _gradientColors = <Color>[];
        final List<FlSpot> _barData = <FlSpot>[];
        final List<int> _timeStamp = <int>[];

        // Tổng cách điểm để vẽ
        final int count = controller.netFlow.length;

        if (count < 2) {
          return SizedBox(
            height: 100,
            child: Center(
              child: Text(
                'Không có dữ liệu',
                textAlign: TextAlign.center,
                style: textStyle.regular(color: color.grey40, size: 14),
              ),
            ),
          );
        }

        double minY = 0;
        double maxY = 0;

        final int maxX = count - 1;

        // Map ra các điểm để vẽ vào chart
        for (int i = 0; i < count; i++) {
          final double y = controller.netFlow[i].netAmt;
          _barData.add(FlSpot(i.toDouble(), y));
          _timeStamp.add(controller.netFlow[i].time.toInt());
          _gradientColors.add(y > 0 ? color.green50 : color.red50);
        }

        minY = _barData.map((FlSpot e) => e.y).reduce(min);
        maxY = _barData.map((FlSpot e) => e.y).reduce(max);

        if (minY == maxY) {
          return SizedBox(
            height: 100,
            child: Center(
              child: Text(
                'Không có dữ liệu',
                textAlign: TextAlign.center,
                style: textStyle.regular(color: color.grey40, size: 14),
              ),
            ),
          );
        }

        const int drawRowY = 9;
        int drawRowX = 18;

        if (count < drawRowX) {
          drawRowX = (count ~/ 2).toInt();
        }

        if (drawRowX == 0) {
          drawRowX = 1;
        }

        final double intervalY = ((maxY - minY) ~/ drawRowY).toDouble();

        final double intervalX = (count ~/ drawRowX).toDouble();

        return AspectRatio(
          aspectRatio: 1.2,
          child: Container(
            padding: EdgeInsets.only(
                left: 4.width,
                right: 4.width,
                bottom: 16.height,
                top: 8.height),
            width: double.infinity,
            decoration: BoxDecoration(
              color: color.background1,
            ),
            clipBehavior: Clip.hardEdge,
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(enabled: false),
                lineBarsData: <LineChartBarData>[
                  LineChartBarData(
                    spots: _barData,
                    isCurved: true,
                    barWidth: 1.0,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(
                      show: true,
                      colors: _gradientColors
                          .map((Color e) => e.withOpacity(.3))
                          .toList(),
                    ),
                    dotData: FlDotData(show: false),
                    colors: _gradientColors,
                  ),
                ],
                minX: 0,
                minY: minY,
                maxX: maxX.toDouble(),
                maxY: maxY,
                titlesData: FlTitlesData(
                  show: true,
                  leftTitles: SideTitles(
                    showTitles: true,
                    interval: intervalY,
                    reservedSize: 30,
                    getTextStyles: (_, double value) => dateTextStyle,
                    getTitles: (double value) {
                      // return value.toString();
                      return (value / 100000000).toStringAsFixed(1);
                    },
                  ),
                  bottomTitles: SideTitles(
                    showTitles: true,
                    rotateAngle: -90,
                    margin: 8.0,
                    interval: intervalX,
                    getTextStyles: (_, double value) => dateTextStyle,
                    getTitles: (double index) {
                      if (index > _timeStamp.length - 1) {
                        return '0';
                      }

                      return _timeStamp[index.toInt()].formatToDDMMYYYY();
                    },
                  ),
                  rightTitles: SideTitles(showTitles: false),
                  topTitles: SideTitles(showTitles: false),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: intervalY,
                  getDrawingHorizontalLine: (double value) {
                    return FlLine(
                      dashArray: <int>[4, 4],
                      color: color.background3,
                      strokeWidth: 1,
                    );
                  },
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    bottom: BorderSide(
                      color: color.background3,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      });
}
