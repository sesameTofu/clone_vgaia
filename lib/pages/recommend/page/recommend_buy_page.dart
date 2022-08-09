import 'package:flutter_mobile/domain/model/recommend/recommend_buy.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/recommend/recommend_controller.dart';
import 'package:flutter_mobile/pages/recommend/widget/title_recommend_widget.dart';
import 'package:flutter_mobile/widgets/row_data.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RecommendBuyPage extends BaseWidget<RecommendController> {
  RecommendBuyPage({Key? key}) : super(key: key);

  @override
  Widget builder() => Column(
        children: <Widget>[
          TitleRecommendWidget(),
          Expanded(child: _buildData()),
        ],
      );

  Widget _buildData() => ValueListenableBuilder<List<RecommendBuy>>(
        valueListenable: controller.recommendBuys,
        builder: (_, List<RecommendBuy> data, __) => SmartRefresher(
          enablePullDown: true,
          controller: controller.refreshBuyController,
          onRefresh: () => controller.findFrontRecommendBuy(),
          child: ListView.separated(
            separatorBuilder: (_, __) => Divider(thickness: 2.0),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) =>
                _buildItem(data[index]),
          ),
        ),
      );

  Widget _buildItem(RecommendBuy data) => Container(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        decoration: BoxDecoration(),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                _buildItemTitle(
                  data.entryDate?.formatDMMYYYY() ?? '',
                  flex: 2,
                  alignment: Alignment.centerLeft,
                ),
                _buildItemTitle(data.secCd ?? ''),
                _buildItemTitle(
                  data.price?.formatVolume(decimalDigits: 2, trimZero: true) ??
                      '',
                ),
                _buildItemTitle(
                  controller.priceValue(data.amountPrice()),
                  color: controller.priceColor(data.amountPrice()),
                )
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              children: <Widget>[
                Expanded(
                    child: BuildRowData(
                  LocaleKeys.goline_GiaMucTieu.tr,
                  data.price?.formatPrice() ?? '',
                )),
                SizedBox(width: 20.0),
                Expanded(
                    child: BuildRowData(
                  LocaleKeys.goline_GiaCatLo.tr,
                  data.lossPrice?.formatPrice() ?? '',
                ))
              ],
            ),
            BuildRowData(LocaleKeys.goline_GhiChu.tr, data.remarks ?? ''),
          ],
        ),
      );

  Widget _buildItemTitle(
    String title, {
    int flex = 1,
    Alignment? alignment,
    Color? color,
  }) =>
      Expanded(
        flex: flex,
        child: Align(
          alignment: alignment ?? Alignment.center,
          child: Text(
            title,
            style: textStyle.regular(color: color),
          ),
        ),
      );
}
