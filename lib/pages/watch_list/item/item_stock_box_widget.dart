import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_mobile/core/model/match_price_model.dart';
import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/watch_list/item/line.dart';
import 'package:flutter_mobile/pages/watch_list/item/stock_item_controller.dart';
import 'package:flutter_mobile/pages/watch_list/sec_quote_detail/sec_quote_detail_page.dart';
import 'package:rxdart/rxdart.dart' as rx;

class ItemStockBoxWidget extends BaseScreen<StockItemController> {
  ItemStockBoxWidget({
    Key? key,
    required this.tagController,
    required this.stockItemViewModel,
    this.idCategory,
  }) : super(key: key, tag: tagController, isKeep: true);
  final String tagController;
  final StockItemViewModel stockItemViewModel;
  final num? idCategory;

  @override
  Widget builder() {
    return GetBuilder<StockItemController>(
        id: tagController,
        tag: tagController,
        dispose: (GetBuilderState<StockItemController> state) {
          Get.delete<StockItemController>(tag: tagController, force: true);
        },
        builder: (_) {
          return GestureDetector(
              onTap: () {
                Get.to(
                  () => SecQuoteDetailPage(
                    controller.itemViewModel?.stockItem.secID ?? '',
                    idCategory: idCategory,
                  ),
                );
              },
              child: Container(
                  margin: EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: color.grey80,
                  ),
                  width: 152,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 16),

                        //  Mã và khối lượng
                        _buildStockCode(controller),
                        SizedBox(height: 16),
                        //Biểu đồ
                        _buildChart(controller),
                        SizedBox(height: 8),
                        // Giá trị, thay đổi
                        _buildPriceChange(controller),
                        SizedBox(height: 8),
                        _buildLine(controller),
                        SizedBox(height: 16),
                      ])));
        });
  }

  Widget _buildStockCode(StockItemController controller) {
    return StreamBuilder<String>(
        stream: controller.secCdStream,
        builder: (_, AsyncSnapshot<String> snapshot) {
          return Text(controller.secCd,
              maxLines: 1, style: textStyle.bold(size: 15, color: color.grey0));
        });
  }

  Widget _buildLine(StockItemController controller) {
    return StreamBuilder<List<num>>(
        stream: rx.Rx.combineLatest2(controller.totalBuyQttyStream,
            controller.totalSellQttyStream, (num a, num b) => <num>[a, b]),
        builder: (_, __) {
          return Liner(
            advancers: controller.totalBuyQtty.toDouble(),
            decliners: controller.totalSellQtty.toDouble(),
            tiers: 0,
            width: 128,
          );
        });
  }

  Widget _buildChart(StockItemController controller) {
    return Expanded(
        child: AbsorbPointer(
            child: StreamBuilder<num>(
                initialData: controller.matchPrice,
                stream: controller.matchPriceStream,
                builder: (_, __) {
                  return StreamBuilder<MatchPriceModel>(
                      stream: controller.matchPriceDataStream,
                      builder: (_, __) {
                        return Container(
                            constraints: BoxConstraints(maxHeight: 32),
                            child: controller.chartPrice.match.isNotEmpty &&
                                    controller.matchPrice != 0
                                ? LineChart(
                                    _horizontalChart(
                                        controller,
                                        controller.chartPrice,
                                        controller.getLastColor(
                                            controller.matchPrice)),
                                  )
                                : SizedBox());
                      });
                })));
  }

  LineChartData _horizontalChart(StockItemController controller,
      MatchPriceModel _chartData, Color colorChart) {
    final List<Color> _gradientColors = <Color>[
      colorChart,
      color.background1.withOpacity(0),
      color.background1.withOpacity(0),
      color.background1.withOpacity(0)
    ];

    final List<FlSpot> barData = <FlSpot>[];

    int count = 0;

    final double baseLine = controller.basicPrice.toDouble();

    double minY = 0;
    double maxY = 0;
    double maxX = 0;

    if (_chartData.match.isNotEmpty) {
      count = _chartData.match.length;
      maxX = (_chartData.match.length - 1).toDouble();

      for (int i = 0; i < count; i++) {
        barData
            .add(FlSpot(i.toDouble(), _chartData.match[i].matPrice.toDouble()));
      }
      minY = _chartData.min.toDouble();

      if (minY > baseLine) {
        minY = baseLine;
      }

      maxY = _chartData.max.toDouble();

      if (maxY < baseLine) {
        maxY = baseLine;
      }
    } else {
      barData.add(FlSpot(0, 0));
    }

    return LineChartData(
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        axisTitleData: FlAxisTitleData(show: false),
        gridData: FlGridData(show: false),
        minX: 0,
        minY: minY,
        maxX: maxX,
        maxY: maxY,
        extraLinesData: ExtraLinesData(horizontalLines: <HorizontalLine>[
          HorizontalLine(
              y: baseLine,
              color: Color(0xff9DA1A9).withOpacity(0.5),
              strokeWidth: 0.5,
              dashArray: <int>[3, 2])
        ]),
        lineBarsData: <LineChartBarData>[
          LineChartBarData(
              spots: barData,
              // isCurved: true,
              barWidth: 0.5,
              colors: <Color>[colorChart],
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                  show: true,
                  gradientFrom: Offset(0.5, 0),
                  gradientTo: Offset(0.5, 2),
                  colors: _gradientColors))
        ]);
  }

  Widget _buildPriceChange(StockItemController controller) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder<num>(
              stream: controller.matchPriceStream,
              builder: (_, AsyncSnapshot<num> snapshot) {
                return StreamBuilder<StatusFiled>(
                    stream: controller
                        .mapSubjectChangeColor[Field.MATCH_PRICE]!.stream,
                    builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
                      final Color _colorPrice = controller.lastColor;
                      // Price Percent
                      final StatusFiled _changedPropertiesPrice = controller
                          .mapSubjectChangeColor[Field.MATCH_PRICE]!.value;
                      // LastPrice
                      final num _lastPrice = controller.matchPrice;

                      return Container(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Text(_lastPrice.formatPrice(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textStyle
                                  .bold(
                                      size: 16,
                                      color: _changedPropertiesPrice
                                          .textChangedColor(_colorPrice))
                                  .copyWith(
                                      backgroundColor: _changedPropertiesPrice
                                          .bgChangedColor)));
                    });
              }),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            StreamBuilder<num>(
                stream: controller.changePointStream,
                builder: (_, AsyncSnapshot<num> snapshot) {
                  return StreamBuilder<StatusFiled>(
                      stream: controller
                          .mapSubjectChangeColor[Field.CHANGE_POINT]!.stream,
                      builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
                        final Color _colorPrice = controller.lastColor;

                        // Price value
                        final StatusFiled _changedPropertiesPoint = controller
                            .mapSubjectChangeColor[Field.CHANGE_POINT]!.value;
                        final num _changePriceValue = controller.changePoint;
                        return Text(
                            '${_changePriceValue.getPrefix}${_changePriceValue.formatRate(2)}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textStyle
                                .bold(
                                    size: 10,
                                    color: _changedPropertiesPoint
                                        .textChangedColor(_colorPrice))
                                .copyWith(
                                    backgroundColor: _changedPropertiesPoint
                                        .bgChangedColor));
                      });
                }),
            SizedBox(width: 4),
            StreamBuilder<num>(
                stream: controller.changePercentStream,
                builder: (_, AsyncSnapshot<num> snapshot) {
                  return StreamBuilder<StatusFiled>(
                      stream: controller
                          .mapSubjectChangeColor[Field.CHANGE_PERCENT]!.stream,
                      builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
                        final Color _colorPrice = controller.lastColor;

                        // Price Percent
                        final StatusFiled _changedPropertiesPercent = controller
                            .mapSubjectChangeColor[Field.CHANGE_PERCENT]!.value;
                        final num _changePricePercent =
                            controller.changePercent;

                        return Container(
                            color: _changedPropertiesPercent.bgChangedColor,
                            child: Text(
                                '(${_changePricePercent.getPrefix}${_changePricePercent.formatRate(2)}%)',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textStyle
                                    .custom(
                                        size: 10,
                                        color: _changedPropertiesPercent
                                            .textChangedColor(_colorPrice))
                                    .copyWith(
                                        backgroundColor:
                                            _changedPropertiesPercent
                                                .bgChangedColor)));
                      });
                }),
          ])
        ]);
  }

  @override
  StockItemController? putController() {
    return StockItemController(
        itemViewModel: stockItemViewModel, getChartPrice: true);
  }
}
