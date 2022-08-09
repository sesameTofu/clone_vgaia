import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/pages/top_foregin_trade/top_foregin_all_page.dart';
import 'package:flutter_mobile/pages/market/pages/top_foregin_trade/top_foregin_trade_controller.dart';
import 'package:flutter_mobile/pages/market/pages/top_foregin_trade/widget_top_foregin.dart';
import 'package:flutter_mobile/pages/market/widget/widgets.dart';

class TopForeginTradeWidget extends BaseScreen<TopForeginTradeController>
    with WidgetTopForeginTrade {
  TopForeginTradeWidget(this.topSecChangedController, {Key? key})
      : super(key: key, tag: 'TopForeginTrade');

  final TopForeginTradeController topSecChangedController;

  @override
  TopForeginTradeController putController() {
    return topSecChangedController;
  }

  @override
  Widget builder() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTite,
          buildFilter,
          buildHeader,
          _buildList,
          Foodter(onPress: () => Get.to(() => TopForeginAllPage()))
        ]);
  }

  TitleItemMarket get _buildTite =>
      TitleItemMarket(title: 'Top nước ngoài mua bán');

  Widget get _buildList => Obx(() => buildList(isAll: false));
}
