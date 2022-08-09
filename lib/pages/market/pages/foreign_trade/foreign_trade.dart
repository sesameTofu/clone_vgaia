import 'package:flutter_mobile/global/app_router.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/pages/foreign_trade/foreign_trade_controller.dart';
import 'package:flutter_mobile/pages/market/widget/foreign_trade_chart.dart';
import 'package:flutter_mobile/pages/market/widget/widgets.dart';

class ForeignTrade extends BaseScreen<ForeignTradeController>
    with ForeignTradeChart {
  ForeignTrade(this.foreignTradeController, {Key? key})
      : super(key: key, tag: 'MarketForeignTrade');

  final ForeignTradeController foreignTradeController;

  @override
  ForeignTradeController putController() {
    return foreignTradeController;
  }

  @override
  Widget builder() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleItemMarket(
          title: LocaleKeys.foreign_trade.tr,
          actionWidget: popupFilter,
        ),
        buildTitleChart(),
        buildForeignTrade(),
        Obx(
          () => controller.isDataEmpty
              ? SizedBox()
              : Foodter(
                  onPress: () =>
                      Get.toNamed(AppRouter.routerForeignTradeDetail),
                ),
        ),
      ],
    );
  }
}
