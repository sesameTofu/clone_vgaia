import 'package:flutter_mobile/domain/model/market/filter_market.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/pages/top_sec_up_down/item_top_price.dart';
import 'package:flutter_mobile/pages/market/widget/widgets.dart';
import 'package:flutter_mobile/pages/watch_list/sec_quote_detail/sec_quote_detail_page.dart';
import 'package:flutter_mobile/widgets/checkbox.dart';
import 'package:flutter_mobile/widgets/no_data.dart';
import 'package:flutter_svg/svg.dart';

import 'top_sec_up_down_controller.dart';

mixin TopSecUpDownMixin on BaseMixin {
  TopSecUpDownController get controller;

  void _showDetailTicker(String secCdRx) {
    Get.to(() => SecQuoteDetailPage(secCdRx));
  }

  HeaderLabel get buildHeader => HeaderLabel(
        labelList: <String>[
          LocaleKeys.topSecChanged_stock.tr,
          LocaleKeys.lastPrice.tr,
          LocaleKeys.topSecChanged_change.tr,
        ],
      );

  Widget get popupMenu => PopupMenu(
        childPopup: _buildFilter,
        child: Container(
          color: Colors.transparent,
          alignment: Alignment.centerRight,
          child: SvgPicture.asset(AppPath.icFilter),
        ),
      );

  Container _buildFilter(Function dissmiss) => Container(
      padding: EdgeInsets.only(
        left: 8.width,
        right: 8.width,
        bottom: 16.height,
        top: 8.height,
      ),
      decoration: BoxDecoration(
        color: color.background2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: controller.periodFilter
                    .map((Filter e) => Obx(
                          () => CheckBox(
                            onPress: (_) {
                              controller.onPress(
                                type: TypeFilter.period,
                                filter: e,
                              );
                              dissmiss();
                            },
                            title: e.label,
                            value: e.id == controller.periodSelect.value.id,
                          ).paddingOnly(top: sized.paddingVerySmall.height),
                        ))
                    .toList()),
          ],
        ),
      ));

  Widget buildList(
          {ScrollPhysics? physics, required String tag, required bool isAll}) =>
      controller.listStockItemViewModel.isEmpty
          ? isAll
              ? Nodata()
              : SizedBox(height: 32, child: Nodata())
          : ListView.builder(
              physics: physics ?? NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              // itemCount: controller.topPrice.length,
              itemCount: controller.listStockItemViewModel.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemTopPrice(
                  stockItemViewModel: controller.listStockItemViewModel[index],
                  // tickerWatch: SecQuoteInfoRx()
                  //   ..secCdRx = controller.topPrice[index].secCd.obs
                  //   ..subSecCRx =
                  //       controller.getSubName(controller.topPrice[index].secCd).obs
                  //   ..changePercentRx = controller.topPrice[index].changePercent.obs
                  //   ..lastPriceRx = controller.topPrice[index].closePrice.obs
                  //   ..enableChangedPercent = controller.periodSelect.value.id == 1,
                  colorBg: index % 2 != 0 ? color.grey90 : color.background0,
                  onPress: () => _showDetailTicker(controller
                          .listStockItemViewModel[index].stockItem.secID ??
                      ''),
                  tag:
                      '$tag${controller.listStockItemViewModel[index].stockItem.secID}',
                  isDay: controller.periodSelect.value.id == 1,
                );
              },
            );
}
