import 'package:flutter_mobile/base/import_base.dart';
import 'package:flutter_mobile/pages/market/pages/liquidity/liquidity_controller.dart';
import 'package:flutter_mobile/pages/market/pages/liquidity/widget/liquidity_chart_widget.dart';
import 'package:flutter_mobile/pages/market/pages/liquidity/widget/liquidity_filter_widget.dart';

class LiquidityPage extends BaseScreen<LiquidityController> {
  LiquidityPage({Key? key}) : super(key: key);

  @override
  Widget builder() => Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              _buildFilter(),
              _buildChart(),
            ],
          ),
        ),
      );

  @override
  LiquidityController? putController() => LiquidityController();

  Widget _buildFilter() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: LiquidityFilterWidget(),
      );

  Widget _buildChart() => ChartWidget();
}
