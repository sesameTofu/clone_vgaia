import 'package:flutter_mobile/base/import_base.dart';
import 'package:flutter_mobile/domain/model/market/filter_market.dart';
import 'package:flutter_mobile/generated/locales.g.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/pages/market/pages/top_foregin_trade/item_top_foregin.dart';
import 'package:flutter_mobile/pages/market/pages/top_foregin_trade/top_foregin_trade_controller.dart';
import 'package:flutter_mobile/pages/market/widget/widgets.dart';
import 'package:flutter_mobile/pages/watch_list/sec_quote_detail/sec_quote_detail_page.dart';
import 'package:flutter_mobile/widgets/chips_filter.dart';
import 'package:flutter_mobile/widgets/no_data.dart';

mixin WidgetTopForeginTrade on BaseMixin {
  TopForeginTradeController get controller;

  Widget buildList({ScrollPhysics? physics, required bool isAll}) =>
      controller.listInternalMSModel.isEmpty
          ? isAll
              ? Nodata()
              : SizedBox(height: 32, child: Nodata())
          : ListView.builder(
              physics: physics ?? NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.listInternalMSModel.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () async {
                    final bool? isPlaceOrder = await Get.to<bool>(() =>
                        SecQuoteDetailPage(controller
                                .listInternalMSModel[index].stockItem.secID ??
                            ''));
                    if ((isPlaceOrder ?? false) && isAll) {
                      Get.back();
                    }
                  },
                  child: ItemTopForegin(controller.listInternalMSModel[index],
                      index % 2 != 0 ? color.grey90 : color.background0,
                      type: controller.currentFilter.value.type!,
                      tag:
                          '${isAll ? 'ALLTopForeginTrade' : 'TopForeginTrade'}${controller.listInternalMSModel[index].stockItem.secID}'),
                );
              },
            );

  Widget get buildHeader => Obx(
        () => HeaderLabel(isTopBorder: true, labelList: <String>[
          LocaleKeys.topSecChanged_stock.tr,
          if (controller.currentFilter.value.type ==
                  ForgeinTradeType.buyQuantity ||
              controller.currentFilter.value.type ==
                  ForgeinTradeType.saleQuantity)
            LocaleKeys.volume_top.tr
          else
            LocaleKeys.value_top.tr,
          LocaleKeys.lastPrice.tr,
        ]),
      );

  Widget get buildFilter => MediaQuery.removePadding(
        removeBottom: true,
        removeTop: true,
        context: Get.context!,
        child: Container(
          color: color.background1,
          padding: EdgeInsets.all(12),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 12,
              crossAxisSpacing: 8,
              crossAxisCount: 3,
              childAspectRatio: 10 / 3,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: controller.listFilter
                .map(
                  (FilterType<ForgeinTradeType> e) => Obx(
                    () => ChipsFilter<FilterType<ForgeinTradeType>>(
                      title: e.label,
                      value: e,
                      isActive: controller.currentFilter.value == e,
                      onClick: (FilterType<ForgeinTradeType> e) =>
                          controller.onChangrFiltrer(e),
                      width: 64,
                      height: 32,
                    ).paddingOnly(right: 8),
                  ),
                )
                .toList(),
          ),
        ),
      );
}
