import 'package:flutter_mobile/domain/usecase/market_use_case.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/pages/foreign_trade/foreign_trade_controller.dart';
import 'package:flutter_mobile/pages/market/widget/foreign_trade_chart.dart';
import 'package:flutter_mobile/widgets/appbar_custom.dart';
import 'package:flutter_mobile/widgets/smart_load_list.dart';

class ForeignTradeDetail extends BaseScreen<ForeignTradeController>
    with ForeignTradeChart, SmartLoadList {
  ForeignTradeDetail({Key? key}) : super(key: key, tag: 'ForeignTradeDetail');

  @override
  ForeignTradeController? putController() {
    return ForeignTradeController(MarketUseCase(), limit: 30);
  }

  @override
  Widget builder() {
    return Scaffold(
      appBar: _buildAppBar,
      body: Column(
        children: <Widget>[
          buildTitleChart(),
          Expanded(
            child: buildSmartList(
                enablePullUp: controller.listBuy.isNotEmpty,
                enablePullDown: false),
          ),
        ],
      ),
    );
  }

  PreferredSize get _buildAppBar => PreferredSize(
        child: AppBarCustom(
          titleAppBar: LocaleKeys.foreign_trade.tr,
          actions: <Widget>[popupFilter],
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      );

  @override
  Future<void> onLoading() async {
    await controller.onLoadMore();
    refreshController.loadComplete();
  }

  @override
  Widget get listViewLoad => ListView(
        children: <Widget>[
          buildForeignTrade(isDetailPage: true),
        ],
      );
}
