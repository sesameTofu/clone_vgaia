import 'package:flutter_mobile/domain/model/market/filter_market.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/pages/top_sec_changed/item_sec_change.dart';
import 'package:flutter_mobile/pages/market/widget/widgets.dart';
import 'package:flutter_mobile/pages/watch_list/sec_quote_detail/sec_quote_detail_page.dart';
import 'package:flutter_mobile/widgets/no_data.dart';
import 'package:flutter_mobile/widgets/svg_icon.dart';

import 'top_sec_changed_controller.dart';

mixin TopChangecMixin on BaseMixin {
  TopSecChangedController get controller;

  // void _showDetailTicker(String secCdRx) {
  //   Get.toNamed(AppRouter.routerMarketSecDetail, arguments: secCdRx);
  // }

  Widget get buildHeader => Obx(() => HeaderLabel(
        labelList: <String>[
          LocaleKeys.topSecChanged_stock.tr,
          LocaleKeys.topSecChanged_price_match.tr,
          LocaleKeys.topSecChanged_change.tr,
          controller.changedSelect.value.labelHeaderTable ?? ''
        ],
      ));

  Widget get popupMenu => PopupMenu(
        right: 16.width,
        useWidthParent: true,
        childPopup: _buildFilter,
        child: Container(
          color: Colors.transparent,
          alignment: Alignment.centerRight,
          child: _buildWrapFilter,
        ),
      );

  Widget _buildFilter(Function dissmiss) => Container(
        padding: EdgeInsets.only(
          left: 8.width,
          right: 8.width,
          bottom: 16.height,
          top: 8.height,
        ),
        decoration: BoxDecoration(
          color: color.grey80,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: controller.changedFilter
              .map((Filter e) => InkWell(
                    onTap: () {
                      controller.onPress(e);
                      dissmiss();
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        e.label,
                        style: textStyle.regular(color: color.grey10),
                      ).paddingOnly(top: 8, bottom: 8),
                    ),
                  ))
              .toList(),
        ),
      );

  Widget get _buildWrapFilter => Container(
        width: 0.33.getWidth,
        margin: EdgeInsets.only(left: 8),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: color.grey70, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Obx(() => Text(
                  controller.changedSelect.value.label,
                  style: textStyle.regular(color: color.grey0),
                )),
            iconSvg(path: AppPath.icArrowDown),
          ],
        ),
      );

  Widget buildList({ScrollPhysics? physics, required bool isAll}) =>
      controller.listTopSecChange.isEmpty
          ? !isAll
              ? SizedBox(height: 32, child: Nodata())
              : Nodata()
          : ListView.builder(
              physics: physics ?? NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.listTopSecChange.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () async {
                    final bool? isPlaceOrder = await Get.to<bool>(() =>
                        SecQuoteDetailPage(controller
                                .listTopSecChange[index].stockItem.secID ??
                            ''));
                    if ((isPlaceOrder ?? false) && isAll) {
                      Get.back();
                    }
                  },
                  child: ItemSecChange(controller.listTopSecChange[index],
                      index % 2 != 0 ? color.grey90 : color.background0,
                      topSecChangedController: controller,
                      tag:
                          '${isAll ? 'ALLTopChange' : 'TopChange'}${controller.listTopSecChange[index].stockItem.secID}'),
                );
              },
            );
}
