import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_mobile/core/model/match_price_model.dart';
import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/watch_list/item/stock_item_controller.dart';
import 'package:flutter_mobile/pages/watch_list/sec_quote_detail/sec_quote_detail_page.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemStockWidget extends BaseScreen<StockItemController> {
  ItemStockWidget(
      {Key? key,
      required this.tagController,
      required this.stockItemViewModel,
      required this.removeItem,
      required this.slidableController,
      required this.removable,
      this.idCategory})
      : super(
          key: key,
          isKeep: true,
          tag: tagController,
        );
  final String tagController;

  final SlidableController slidableController;

  final StockItemViewModel stockItemViewModel;
  final Function removeItem;
  final bool removable;
  final num? idCategory;

  @override
  Widget builder() {
    return GetBuilder<StockItemController>(
        id: tagController,
        init: controller,
        tag: tagController,
        dispose: (GetBuilderState<StockItemController> state) {
          Get.delete<StockItemController>(tag: tagController, force: true);
        },
        builder: (_) {
          return InkWell(
              onTap: () {
                Get.to(
                  () => SecQuoteDetailPage(
                      controller.itemViewModel?.stockItem.secID ?? '',
                      idCategory: idCategory),
                );
              },
              child: Slidable(
                  key: key,
                  controller: slidableController,
                  actionExtentRatio: 0.2,
                  enabled: removable,
                  movementDuration: Duration(milliseconds: 500),
                  actionPane: SlidableDrawerActionPane(),
                  direction: Axis.horizontal,
                  secondaryActions: <Widget>[
                    SlideAction(
                        onTap: () {
                          removeItem();
                          Get.delete<StockItemController>(
                              tag: stockItemViewModel.stockItem.secID);
                        },
                        closeOnTap: true,
                        child: Container(
                            alignment: Alignment.center,
                            color: color.red50,
                            width: 0.2.getHeight,
                            height: double.infinity,
                            child: Text('Xóa',
                                style: textStyle.semiBold(color: color.grey0))))
                  ],
                  child: Container(
                      width: double.infinity,
                      color: color.grey100,
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      child: IntrinsicHeight(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              //  Mã và khối lượng
                              _buildStockCode(controller),
                              SizedBox(width: 4),

                              //Biểu đồ
                              _buildChart(controller),
                              SizedBox(width: 4),
                              // Giá trị, thay đổi
                              _buildPriceChange(controller),
                              _buildPricePoint(controller)
                            ]),
                      ))));
        });
  }

  Widget _buildStockCode(StockItemController controller) {
    return Expanded(
        flex: 4,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<String>(
                  stream: controller.secCdStream,
                  builder: (_, AsyncSnapshot<String> snapshot) {
                    return Text(controller.secCd,
                        maxLines: 1, style: textStyle.bold(color: color.grey0));
                  }),
              SizedBox(height: 4),
              Text(
                controller.subTicker,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle.custom(size: 10, color: color.grey40),
              ),
            ]));
  }

  Widget _buildChart(StockItemController controller) {
    return Expanded(
        flex: 4,
        child: AbsorbPointer(
            child: StreamBuilder<num>(
                initialData: controller.matchPrice,
                stream: controller.matchPriceStream,
                builder: (_, __) {
                  return StreamBuilder<MatchPriceModel>(
                      stream: controller.matchPriceDataStream,
                      builder: (_, __) {
                        return Container(
                            alignment: Alignment.center,
                            constraints: BoxConstraints(maxHeight: 32.width),
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
    return Expanded(
        flex: 2,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
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
                          final StatusFiled _changedPropertiesPrice = controller
                              .mapSubjectChangeColor[Field.MATCH_PRICE]!.value;

                          // LastPrice
                          final num _lastPrice = controller.matchPrice;

                          return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(_lastPrice.formatPrice(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: textStyle
                                      .bold(
                                          color: _changedPropertiesPrice
                                              .textChangedColor(_colorPrice))
                                      .copyWith(
                                          backgroundColor:
                                              _changedPropertiesPrice
                                                  .bgChangedColor)));
                        });
                  }),
              SizedBox(height: 4),
              StreamBuilder<num>(
                  stream: controller.totalTradeQttyStream,
                  builder: (_, AsyncSnapshot<num> snapshot) {
                    return StreamBuilder<StatusFiled>(
                        stream: controller
                            .mapSubjectChangeColor[Field.TOTAL_QTTY]!.stream,
                        builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
                          final StatusFiled _changedProperties = controller
                              .mapSubjectChangeColor[Field.TOTAL_QTTY]!.value;
                          return Text(controller.totalTradeQtty.formatVolume(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textStyle
                                  .custom(
                                      size: 12,
                                      color: _changedProperties
                                          .textChangedColor(color.grey20))
                                  .copyWith(
                                      backgroundColor: _changedProperties
                                          .bgChangedColorGrey()));
                        });
                  })
            ]));
  }

  Widget _buildPricePoint(StockItemController controller) {
    return Expanded(
        flex: 2,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                                      color: _changedPropertiesPoint
                                          .textChangedColor(_colorPrice))
                                  .copyWith(
                                      backgroundColor: _changedPropertiesPoint
                                          .bgChangedColor));
                        });
                  }),
              SizedBox(height: 4),
              StreamBuilder<num>(
                  stream: controller.changePercentStream,
                  builder: (_, AsyncSnapshot<num> snapshot) {
                    return StreamBuilder<StatusFiled>(
                        stream: controller
                            .mapSubjectChangeColor[Field.CHANGE_PERCENT]!
                            .stream,
                        builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
                          final Color _colorPrice = controller.lastColor;

                          // Price Percent
                          final StatusFiled _changedPropertiesPercent =
                              controller
                                  .mapSubjectChangeColor[Field.CHANGE_PERCENT]!
                                  .value;
                          final num _changePricePercent =
                              controller.changePercent;

                          return Text(
                              '${_changePricePercent.getPrefix}${_changePricePercent.formatRate(2)}%',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textStyle
                                  .custom(
                                      size: 12,
                                      color: _changedPropertiesPercent
                                          .textChangedColor(_colorPrice))
                                  .copyWith(
                                      backgroundColor: _changedPropertiesPercent
                                          .bgChangedColor));
                        });
                  })
            ]));
  }

  @override
  StockItemController? putController() {
    return StockItemController(
        itemViewModel: stockItemViewModel, getChartPrice: true);
  }
}
