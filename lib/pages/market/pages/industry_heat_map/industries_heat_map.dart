import 'package:flutter_mobile/domain/model/grpc/auto_trading.pbgrpc.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/pages/industry_heat_map/indestries_heat_map_controller.dart';
import 'package:flutter_mobile/pages/market/widget/widgets.dart';
import 'package:flutter_mobile/pages/watch_list/sec_quote_detail/sec_quote_detail_page.dart';
import 'package:flutter_mobile/widgets/no_data.dart';
import 'package:treemap/treemap.dart';

class IndustriesHeatMap extends BaseScreen<IndustriesHeatMapController> {
  IndustriesHeatMap({
    Key? key,
    required this.industriesHeatMapController,
  }) : super(key: key);
  final IndustriesHeatMapController industriesHeatMapController;

  @override
  IndustriesHeatMapController putController() => industriesHeatMapController;

  @override
  Widget builder() {
    return Obx(
      () => controller.listIndustries.isEmpty
          ? SizedBox()
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                  Obx(
                    () => TitleItemMarket(
                      title: vn
                          ? controller.currentIndustries.value.nameVn
                          : controller.currentIndustries.value.nameEn,
                      actionWidget: Icon(Icons.arrow_drop_down,
                          color: color.grey0, size: 24),
                      onClick: () => controller.popupListOption(),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 12, horizontal: 12.width),
                    height: 218,
                    child: Obx(
                      () {
                        if (controller.listIndustriesHeatMap.isEmpty) {
                          return Nodata(title: LocaleKeys.no_data_market.tr);
                        }

                        return TreeMapLayout(
                          duration: Duration(milliseconds: 500),
                          tile: Binary(),
                          children: <TreeNode>[
                            TreeNode.node(
                              options:
                                  TreeNodeOptions(color: color.background0),
                              children: controller.listIndustriesHeatMap
                                  .map<TreeNode>(
                                    (IndustriesHeatMapItem e) => TreeNode.leaf(
                                      options: TreeNodeOptions(
                                        child: _buildItem(e),
                                        border: Border.all(
                                          width: 0.4,
                                          color: color.grey100,
                                        ),
                                      ),
                                      value: e.changePercent == 0
                                          ? 0.1
                                          : e.changePercent.abs(),
                                    ),
                                  )
                                  .toList(),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ]),
    );
  }

  Widget _buildItem(IndustriesHeatMapItem info) => InkWell(
        onTap: () async {
          Get.to(() => SecQuoteDetailPage(info.secCd));
        },
        child: Container(
          color: info.changePoint == 0
              ? color.yellow50
              : info.changePoint > 0
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
                  '${info.changePercent.formatRate(2)}%',
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
}
