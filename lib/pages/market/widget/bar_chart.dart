import 'package:charts_flutter/flutter.dart' as charts hide Color;

import 'package:flutter_mobile/base/base_mixin.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pb.dart';

class ADIndexChartItem {
  ADIndexChartItem(
      {required this.label, required this.value, required this.color});

  final String label;
  final int value;
  final Color color;
}

class VerticalBarLabelChart extends StatelessWidget with BaseMixin {
  VerticalBarLabelChart(this.dataChart, {Key? key, this.animate})
      : super(key: key);
  final MarketDepth dataChart;
  final bool? animate;

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      _createStatData(dataChart),
      animate: animate,
      defaultRenderer: charts.BarRendererConfig<String>(
        barRendererDecorator: charts.BarLabelDecorator<String>(
          labelPosition: charts.BarLabelPosition.outside,
        ),
      ),
      layoutConfig: charts.LayoutConfig(
        leftMarginSpec: charts.MarginSpec.fixedPixel(0),
        topMarginSpec: charts.MarginSpec.fixedPixel(0),
        rightMarginSpec: charts.MarginSpec.fixedPixel(0),
        bottomMarginSpec: charts.MarginSpec.fixedPixel(30),
      ),
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec<String>(
          tickLengthPx: 0,
          lineStyle: charts.LineStyleSpec(
            thickness: 1,
            color: charts.ColorUtil.fromDartColor(Colors.transparent),
          ),
          labelStyle: charts.TextStyleSpec(
            fontSize: 8,
            color: charts.ColorUtil.fromDartColor(color.grey40),
          ),
        ),
      ),
      primaryMeasureAxis: charts.NumericAxisSpec(
        renderSpec: charts.NoneRenderSpec<num>(),
      ),
    );
  }

  List<charts.Series<ADIndexChartItem, String>> _createStatData(
      MarketDepth data) {
    final List<ADIndexChartItem> items = <ADIndexChartItem>[
      ADIndexChartItem(label: '<=-7%', value: data.down7, color: color.red50),
      ADIndexChartItem(label: '-7~-5%', value: data.down57, color: color.red50),
      ADIndexChartItem(label: '-5~-3%', value: data.down35, color: color.red50),
      ADIndexChartItem(label: '-3~-1%', value: data.down13, color: color.red50),
      ADIndexChartItem(label: '-1~0%', value: data.down01, color: color.red50),
      ADIndexChartItem(
          label: '0%', value: data.noChange, color: color.yellow50),
      ADIndexChartItem(label: '0~1%', value: data.up01, color: color.green50),
      ADIndexChartItem(label: '1~3%', value: data.up13, color: color.green50),
      ADIndexChartItem(label: '3~5%', value: data.up35, color: color.green50),
      ADIndexChartItem(label: '5~7%', value: data.up57, color: color.green50),
      ADIndexChartItem(label: '>=7%', value: data.up7, color: color.green50),
    ];

    return <charts.Series<ADIndexChartItem, String>>[
      charts.Series<ADIndexChartItem, String>(
        id: 'ADIndexChart',
        domainFn: (ADIndexChartItem item, _) => item.label,
        measureFn: (ADIndexChartItem item, _) => item.value,
        data: items,
        colorFn: (ADIndexChartItem item, __) =>
            charts.ColorUtil.fromDartColor(item.color),
        labelAccessorFn: (ADIndexChartItem item, _) => '${item.value}',
        outsideLabelStyleAccessorFn: (ADIndexChartItem item, __) =>
            charts.TextStyleSpec(
          fontFamily: 'ibm_plex_sans',
          fontSize: 10,
          color: charts.ColorUtil.fromDartColor(item.color),
        ),
      ),
    ];
  }
}
