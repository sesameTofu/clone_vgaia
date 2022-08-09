import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_mobile/core/model/match_model.dart';
import 'package:flutter_mobile/core/model/match_price_model.dart';
import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/watch_list/sec_quote_detail/sec_quote_detail_controller.dart';
import 'package:flutter_mobile/widgets/app_loading.dart';
import 'package:flutter_mobile/widgets/no_data.dart';

class ChartMTCWidget extends BaseWidget<SecQuoteDetailController> {
  ChartMTCWidget({
    this.tagController,
    Key? key,
  }) : super(key: key, tag: tagController);
  final String? tagController;

  @override
  Widget builder() {
    return AbsorbPointer(
        child: ValueListenableBuilder<bool>(
      valueListenable: controller.stockInformationController.itemViewModel
              ?.mapLoadingApi[API_STOCK_VIEW_MODEL.MATCH_PRICE_DATA]!
          as RxNotify<bool>,
      builder: (_, bool? isLoading, __) {
        if (isLoading! == true) {
          return SizedBox(height: 200, child: appLoading);
        }
        return StreamBuilder<MatchPriceModel>(
            stream: controller.stockInformationController.matchPriceDataStream,
            builder: (_, AsyncSnapshot<MatchPriceModel> value) {
              return buildMtc(
                controller.stockInformationController.chartPrice,
              );
            });
      },
    ));
  }

  Widget buildMtc(MatchPriceModel matchDataModel) => Container(
        height: 204,
        padding: EdgeInsets.symmetric(vertical: 16),
        margin: EdgeInsets.symmetric(horizontal: 8),
        width: double.infinity,
        decoration: BoxDecoration(),
        child: () {
          final List<Color> _gradientColors = <Color>[];

          // List để render chart
          final List<FlSpot> barData = <FlSpot>[];
          final List<String> timeStamp = <String>[];

          // Tổng cách điểm để vẽ
          final int count = matchDataModel.match.length;

          if (count == 0) {
            return SizedBox(
              child: Nodata(),
            );
          }

          double minY = 0;
          double maxY = 0;

          final int maxX = count - 1;
          double baseLine = (matchDataModel.basicPrice ?? 0) * 1000;

          if (baseLine == 0) {
            return SizedBox();
          }
          if (matchDataModel.match.isNotEmpty) {
            maxY = matchDataModel.max.toDouble() * 1000;
          }

          bool forDer = false;
          if (baseLine / maxY > 100) {
            baseLine = baseLine / 1000;
            forDer = true;
          }
          // Map ra các điểm để vẽ vào chart
          for (int i = 0; i < count; i++) {
            final num y = matchDataModel.match[i].matPrice * 1000;
            barData.add(FlSpot(i.toDouble(), y.toDouble()));

            _gradientColors.add(y > baseLine
                ? color.green50
                : y == baseLine
                    ? color.yellow50
                    : color.red50);

            timeStamp.add(matchDataModel.match[i].matTime);
          }

          minY = barData.map((FlSpot e) => e.y).reduce(min);
          maxY = barData.map((FlSpot e) => e.y).reduce(max);
          if (minY > baseLine) {
            minY = baseLine;
          } else if (minY * (forDer ? 1000 : 1) <
              (matchDataModel.floorPrice ?? 0) * 1000) {
            minY = (matchDataModel.floorPrice ?? 0) * 1000;
          }

          if (maxY < baseLine) {
            maxY = baseLine;
          } else if (maxY * (forDer ? 1000 : 1) >
              (matchDataModel.ceilingPrice ?? 0) * 1000) {
            maxY = (matchDataModel.ceilingPrice ?? 0) * 1000;
          }

          int drawRowX = 18;

          if (count < drawRowX) {
            drawRowX = (count ~/ 2).toInt();
          }

          if (drawRowX == 0) {
            drawRowX = 1;
          }

          const double valueForDer = 1.0;
          const double valueForBasic = 500.0;

          double fminY = (minY / 1000).round() * 1000.toDouble();
          if (fminY > minY) {
            fminY = forDer ? minY - valueForDer : fminY - valueForBasic;
          } else {
            if (forDer) {
              fminY = minY - valueForDer;
            }
          }

          double fmaxY = (maxY / 1000).round() * 1000.toDouble();
          if (fmaxY < maxY) {
            fmaxY = forDer ? maxY + valueForDer : fmaxY + valueForBasic;
          } else {
            if (forDer) {
              fmaxY = maxY + valueForDer;
            }
          }

          double intervalY = 1000.toDouble();

          final double avg = fmaxY - fminY;
          if (avg <= 20) {
            intervalY = 2.0;
          } else if (avg <= 100) {
            intervalY = 10.0;
          } else if (avg <= 2000) {
            intervalY = 200.0;
          } else if (avg <= 5000) {
            intervalY = 500.0;
          } else if (avg <= 10000) {
            intervalY = 1000.toDouble();
          } else {
            intervalY = (avg / 1000 % 10 + 1) * 1000;
          }

          final double intervalX = (count ~/ drawRowX).toDouble();

          return LineChart(LineChartData(
              lineTouchData: LineTouchData(enabled: false),
              lineBarsData: <LineChartBarData>[
                LineChartBarData(
                  spots: barData,
                  isCurved: true,
                  barWidth: 1.0,
                  isStrokeCapRound: true,
                  dotData: FlDotData(show: false),
                  colors: _gradientColors,
                ),
              ],
              minX: 0,
              minY: fminY,
              maxX: maxX.toDouble(),
              maxY: fmaxY,
              extraLinesData: ExtraLinesData(horizontalLines: <HorizontalLine>[
                HorizontalLine(
                  y: baseLine,
                  color: color.yellow50,
                  strokeWidth: .5,
                  // dashArray: <int>[3, 2],
                ),
                if (drawRowX == 1 &&
                    barData.isNotEmpty &&
                    _gradientColors.isNotEmpty)
                  HorizontalLine(
                    y: barData[0].y,
                    color: _gradientColors[0],
                    strokeWidth: .5,
                    // dashArray: <int>[3, 2],
                  ),
              ]),
              titlesData: FlTitlesData(
                show: true,
                topTitles: SideTitles(
                  showTitles: false,
                ),
                rightTitles: SideTitles(
                  showTitles: false,
                ),
                leftTitles: SideTitles(
                  showTitles: true,
                  interval: intervalY,
                  reservedSize: 20,
                  getTextStyles: (_, double value) => dateTextStyle,
                  getTitles: (double value) {
                    return value.formatPrice(
                        convertToThounsand: !forDer, decimalDigits: 1);
                  },
                ),
                bottomTitles: SideTitles(
                  showTitles: true,
                  rotateAngle: -90,
                  margin: 8.0,
                  interval: intervalX,
                  getTextStyles: (_, double value) => dateTextStyle,
                  getTitles: (double index) {
                    if (intervalX + index > timeStamp.length) {
                      return timeStamp[timeStamp.length - 1];
                    }

                    return timeStamp[index.toInt()];
                  },
                ),
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: intervalY,
                getDrawingHorizontalLine: (double value) {
                  return FlLine(
                    dashArray: <int>[4, 4],
                    color: color.grey70,
                    strokeWidth: .5,
                  );
                },
              ),
              borderData: FlBorderData(
                  show: true,
                  border: Border(
                      bottom: BorderSide(color: color.grey70, width: 1.0)))));
        }(),
      );

  TextStyle get dateTextStyle => TextStyle(
      fontSize: 6, color: color.grey10, fontWeight: FontWeight.normal);
  Widget buildPrice({required String title, num? price}) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: 8),
          Container(
            height: 12,
            width: 12,
            decoration: BoxDecoration(
                color: controller.stockInformationController.getLastColor(
                  price ?? 0,
                ),
                shape: BoxShape.circle),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  style: textStyle.regular(size: 10, color: color.grey40)),
              SizedBox(height: 2),
              Text(((price ?? 0) == 0) ? '...' : (price ?? 0).formatPrice(),
                  style: textStyle.regular(size: 12)),
            ],
          ),
          SizedBox(width: 8),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.data, this.color);

  MatchModel data;
  Color color;
}
