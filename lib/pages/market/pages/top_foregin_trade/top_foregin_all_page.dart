import 'package:flutter_mobile/domain/usecase/market_use_case.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/pages/top_foregin_trade/top_foregin_trade_controller.dart';
import 'package:flutter_mobile/pages/market/pages/top_foregin_trade/widget_top_foregin.dart';
import 'package:flutter_mobile/widgets/appbar_custom.dart';
import 'package:flutter_mobile/widgets/refesh/smart_load_list_widget.dart';

class TopForeginAllPage extends BaseScreen<TopForeginTradeController>
    with WidgetTopForeginTrade, SmartLoadListWidget {
  TopForeginAllPage({Key? key}) : super(key: key, tag: 'TopForeginAll');

  @override
  Widget builder() {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarCustom(titleAppBar: LocaleKeys.top_foreign.tr)),
      body: Column(children: <Widget>[
        buildFilter,
        buildHeader,
        buildSmartListExpanded(
          controller,
          enablePullUp: true,
          child: Obx(
            () => buildList(physics: ClampingScrollPhysics(), isAll: true),
          ),
        )
      ]),
    );
  }

  @override
  TopForeginTradeController? putController() {
    return TopForeginTradeController(
      MarketUseCase(),
      true,
    );
  }
}
