import 'package:flutter_mobile/domain/model/recommend/recommend_sell.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/recommend/recommend_controller.dart';
import 'package:flutter_mobile/pages/recommend/widget/title_recommend_widget.dart';
import 'package:flutter_mobile/widgets/row_data.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RecommendSellPage extends BaseWidget<RecommendController> {
  RecommendSellPage({Key? key}) : super(key: key);

  @override
  Widget builder() => Column(
        children: <Widget>[
          TitleRecommendWidget(),
          Expanded(child: _buildData()),
        ],
      );

  Widget _buildData() => ValueListenableBuilder<List<RecommendSell>>(
        valueListenable: controller.recommendSells,
        builder: (_, List<RecommendSell> data, __) => SmartRefresher(
          enablePullDown: true,
          controller: controller.refreshSellController,
          onRefresh: () => controller.findFrontRecommendSell(),
          child: ListView.separated(
            separatorBuilder: (_, __) => Divider(thickness: 2.0),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) =>
                _buildItem(data[index]),
          ),
        ),
      );

  Widget _buildItem(RecommendSell data) => Container(
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
                  LocaleKeys.goline_NgayMua.tr,
                  data.buyEntryDate?.formatDMMYYY() ?? '',
                )),
                SizedBox(width: 20.0),
                Expanded(
                    child: BuildRowData(
                  LocaleKeys.goline_GiaMua.tr,
                  data.buyPrice?.formatPrice() ?? '',
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
