import 'package:flutter/cupertino.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/asset/asset_controller.dart';
import 'package:flutter_mobile/pages/asset/portfolio/portfolio_page.dart';
import 'package:flutter_mobile/pages/asset/profit/profit_page.dart';

class AssetPage extends BaseScreen<AssetController> {
  AssetPage({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return GestureDetector(
        onTap: () {
          WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(0.5),
                    child: Container(color: color.grey80, height: 0.5)),
                centerTitle: true,
                title: ValueListenableBuilder<TypePageAsset>(
                    valueListenable: controller.typePage,
                    builder: (_, TypePageAsset typePage, __) =>
                        CupertinoSlidingSegmentedControl<TypePageAsset>(
                            onValueChanged: (TypePageAsset? newValue) {
                              controller.switchPage(
                                  type: newValue ?? TypePageAsset.portfolio);
                            },
                            padding: EdgeInsets.all(4),
                            children: <TypePageAsset, Widget>{
                              TypePageAsset.portfolio: _buildSwitchTabChild(
                                  title: TypePageAsset.portfolio.title,
                                  isSelect:
                                      typePage == TypePageAsset.portfolio),
                              TypePageAsset.profit: _buildSwitchTabChild(
                                  title: TypePageAsset.profit.title,
                                  isSelect: typePage == TypePageAsset.profit),
                            },
                            thumbColor: color.grey70,
                            backgroundColor: color.grey100,
                            groupValue: typePage))),
            body: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                children: <Widget>[PortfolioPage(), ProfitPage()])));
  }

  Widget _buildSwitchTabChild(
          {required String title, required bool isSelect}) =>
      Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(title,
              style: textStyle.custom(
                  color: isSelect ? color.grey0 : color.grey40,
                  size: 12,
                  fontWeight: isSelect ? FontWeight.w600 : FontWeight.w400)));

  @override
  AssetController? putController() {
    return AssetController();
  }
}
