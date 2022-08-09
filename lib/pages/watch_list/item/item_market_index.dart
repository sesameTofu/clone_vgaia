import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_mobile/core/market_item_view_model.dart';
import 'package:flutter_mobile/core/model/match_data_index_model.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/watch_list/item/market_index_item_controller.dart';

class ItemMarketIndex extends BaseScreen<ItemMarketIndexController> {
  ItemMarketIndex({
    Key? key,
    this.marketItemViewModel,
    required this.tagController,
  }) : super(
          key: key,
          tag: tagController,
          isKeep: true,
        );
  final String tagController;
  final MarketItemViewModel? marketItemViewModel;
  @override
  Widget builder() {
    return GetBuilder<ItemMarketIndexController>(
        id: tagController,
        tag: tagController,
        init: controller,
        builder: (_) {
          return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: IntrinsicHeight(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                    _buildIndexCode(controller),
                    const SizedBox(width: 4),
                    _buildChart(controller),
                    const SizedBox(width: 4),
                    _buildPricePoint(controller)
                  ])));
        });
  }

  Widget _buildIndexCode(ItemMarketIndexController controller) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder<Index>(
            stream: controller.indexStream,
            builder: (_, AsyncSnapshot<Index> snapshot) {
              return Text(
                controller.index.indexStr(),
                maxLines: 1,
                style: textStyle.bold(color: color.grey0, size: 13),
              );
            },
          ),
          SizedBox(height: 4),
          StreamBuilder<num>(
            stream: controller.totalQttyStream,
            builder: (_, AsyncSnapshot<num> snapshot) {
              return StreamBuilder<StatusFiled>(
                stream: controller
                    .mapSubjectChangeColor[Field.MARKET_TOTAL_AMT]!.stream,
                builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
                  final StatusFiled _changedMarketTotal = controller
                      .mapSubjectChangeColor[Field.MARKET_TOTAL_AMT]!.value;
                  return Row(
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          controller.totalAmt.formatPrice(decimalDigits: 1),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textStyle
                              .custom(
                                size: 12,
                                color: _changedMarketTotal
                                    .textChangedColor(color.grey20),
                              )
                              .copyWith(
                                backgroundColor:
                                    _changedMarketTotal.bgChangedColorGrey(),
                              ),
                        ),
                      ),
                      Text(
                        ' (${LocaleKeys.billion.tr})',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textStyle.custom(
                          size: 12,
                          color: color.grey20,
                        ),
                      )
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChart(ItemMarketIndexController controller) {
    return Expanded(
      flex: 1,
      child: AbsorbPointer(
        child: StreamBuilder<List<MatchDataIndexModel>>(
          stream: controller.chartsStream,
          builder: (_, __) {
            return Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(maxHeight: 32.width),
              child: controller.chartList.isNotEmpty
                  ? LineChart(
                      _horizontalChart(controller, controller.chartList,
                          controller.getColorWithCode()),
                    )
                  : const SizedBox(),
            );
          },
        ),
      ),
    );
  }

  LineChartData _horizontalChart(ItemMarketIndexController controller,
      List<MatchDataIndexModel> _chartData, Color colorChart) {
    final List<Color> _gradientColors = <Color>[
      colorChart,
      color.background1.withOpacity(0),
      color.background1.withOpacity(0),
      color.background1.withOpacity(0)
    ];

    final List<FlSpot> barData = <FlSpot>[];
    int count = 0;
    double maxX = 0;

    if (_chartData.isNotEmpty) {
      count = _chartData.length;
      maxX = (_chartData.length - 1).toDouble();

      for (int i = 0; i < count; i++) {
        barData.add(FlSpot(i.toDouble(), _chartData[i].val.toDouble()));
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
        maxX: maxX,
        extraLinesData: ExtraLinesData(horizontalLines: <HorizontalLine>[
          HorizontalLine(
              y: 0,
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
              colors: _gradientColors,
            ),
          )
        ]);
  }

  Widget _buildPricePoint(ItemMarketIndexController controller) {
    return Expanded(
      flex: 1,
      child: StreamBuilder<num>(
        stream: controller.colorCodeStream,
        builder: (_, AsyncSnapshot<num> snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<num>(
                  stream: controller.marketIndexStream,
                  builder: (_, AsyncSnapshot<num> snapshot) {
                    return StreamBuilder<StatusFiled>(
                      stream: controller
                          .mapSubjectChangeColor[Field.MARKET_MARKET_INDEX]!
                          .stream,
                      builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
                        final Color _colorPrice = controller.getColorWithCode();
                        // Price value
                        final StatusFiled _changedMarketIndex = controller
                            .mapSubjectChangeColor[Field.MARKET_MARKET_INDEX]!
                            .value;
                        final num _changePriceValue = controller.marketIndex;
                        return Container(
                          width: 88.0,
                          height: 24.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                            color: _colorPrice.withOpacity(0.3),
                          ),
                          child: Text(
                            _changePriceValue.formatPrice(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textStyle.bold().copyWith(
                                  fontSize: 15.0,
                                  color: _changedMarketIndex
                                      .textChangedColor(_colorPrice),
                                ),
                          ),
                        );
                      },
                    );
                  }),
              SizedBox(height: 2.0),
              SizedBox(
                width: 88.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    StreamBuilder<num>(
                      stream: controller.changeIndexPercentStream,
                      builder: (_, AsyncSnapshot<num> snapshot) {
                        return StreamBuilder<StatusFiled>(
                          stream: controller
                              .mapSubjectChangeColor[Field.MARKET_CHANGE_INDEX]!
                              .stream,
                          builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
                            final Color _color = controller.getColorWithCode();
                            // Price value
                            final StatusFiled _changedChangeIndex = controller
                                .mapSubjectChangeColor[
                                    Field.MARKET_CHANGE_INDEX]!
                                .value;
                            final num _changeValue = controller.changeIndex;
                            return Text(
                              _changeValue.formatPrice(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textStyle.custom(
                                size: 10.0,
                                fontWeight: FontWeight.w600,
                                backgroundColor:
                                    _changedChangeIndex.bgChangedColor,
                                color: _changedChangeIndex
                                    .textChangedColor(_color),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    StreamBuilder<num>(
                      stream: controller.changeIndexPercentStream,
                      builder: (_, AsyncSnapshot<num> snapshot) {
                        return StreamBuilder<StatusFiled>(
                          stream: controller
                              .mapSubjectChangeColor[
                                  Field.MARKET_CHANGE_INDEX_PERCENT]!
                              .stream,
                          builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
                            final Color _color = controller.getColorWithCode();
                            // Price value
                            final StatusFiled _changedChangeIndexPercent =
                                controller
                                    .mapSubjectChangeColor[
                                        Field.MARKET_CHANGE_INDEX_PERCENT]!
                                    .value;
                            final num _changePercentValue =
                                controller.changeIndexPercent;
                            return Text(
                              '${_changePercentValue.getPrefix}${_changePercentValue.formatRate(2)}%',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textStyle.custom(
                                size: 10.0,
                                fontWeight: FontWeight.w600,
                                backgroundColor:
                                    _changedChangeIndexPercent.bgChangedColor,
                                color: _changedChangeIndexPercent
                                    .textChangedColor(_color),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  ItemMarketIndexController? putController() {
    return ItemMarketIndexController(marketViewModel: marketItemViewModel);
  }
}
