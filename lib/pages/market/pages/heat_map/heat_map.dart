import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pbgrpc.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/global/app_router.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/pages/heat_map/heat_map_controller.dart';
import 'package:flutter_mobile/pages/market/widget/widgets.dart';
import 'package:flutter_mobile/pages/watch_list/sec_quote_detail/sec_quote_detail_page.dart';
import 'package:flutter_mobile/widgets/checkbox.dart';
import 'package:flutter_mobile/widgets/no_data.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:treemap/treemap.dart';

class HeatMap extends BaseScreen<HeatMapController> {
  HeatMap({
    Key? key,
    required this.heatMapController,
  }) : super(key: key);
  final HeatMapController heatMapController;
  @override
  HeatMapController putController() => heatMapController;

  @override
  Widget builder() {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TitleItemMarket(
            title: LocaleKeys.top_market_cap.tr,
            actionWidget: Row(
              children: <Widget>[
                _popupFilter,
                InkWell(
                  onTap: () => Get.toNamed(AppRouter.routerScreenerPage),
                  child: Container(
                    color: Colors.transparent,
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(AppPath.icFilter),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12.width),
            height: 218,
            child: Obx(
              () {
                if (controller.listMarketCap.isEmpty) {
                  return Nodata(title: LocaleKeys.no_data_market.tr);
                }

                return TreeMapLayout(
                  duration: Duration(milliseconds: 500),
                  tile: Binary(),
                  children: <TreeNode>[
                    TreeNode.node(
                      options: TreeNodeOptions(color: color.background0),
                      children: controller.listMarketCap
                          .map<TreeNode>(
                            (TopIndexContributionItem e) => TreeNode.leaf(
                              options: TreeNodeOptions(
                                child: _buildItem(e),
                                border: Border.all(
                                  width: 0.4,
                                  color: color.grey100,
                                ),
                              ),
                              value: e.contributePercent == 0
                                  ? 0.1
                                  : e.contributePercent.abs(),
                            ),
                          )
                          .toList(),
                    )
                  ],
                );
              },
            ),
          ),
        ]);
  }

  Widget _buildItem(TopIndexContributionItem info) => InkWell(
        onTap: () async {
          Get.to(() => SecQuoteDetailPage(info.secCd));
        },
        child: Container(
          color: info.contributePercent == 0
              ? color.yellow50
              : info.contributePercent > 0
                  ? color.green50
                  : color.red50,
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  info.secCd,
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                  style: textStyle.semiBold(
                      color: color.grey100, size: sized.fontSmallest),
                ),
                Text(
                  '${info.contributePercent.formatRate(2)}%',
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                  style: textStyle.semiBold(
                    size: sized.fontSmallest,
                    color: color.grey100,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget get _popupFilter => PopupMenu(
        childPopup: _buildFilter,
        child: Container(
          color: Colors.transparent,
          alignment: Alignment.centerRight,
          child: SvgPicture.asset(AppPath.icFilter2Svg),
        ),
      ).paddingOnly(right: 16.width);

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ...controller.listFilterMarket
                .map((Index e) => Obx(
                      () => CheckBox(
                        onPress: (_) => controller.onClickFilter(e),
                        title: e.marketStr(),
                        value: controller.currentIndexCd.value == e,
                      ).paddingOnly(top: 8.height),
                    ))
                .toList(),
          ],
        ),
      );
}
