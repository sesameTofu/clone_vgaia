import 'package:flutter_mobile/domain/model/screener/screener_model.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/screener/creater_screener/create_screener_controller.dart';
import 'package:flutter_mobile/pages/screener/creater_screener/enum_filter.dart';
import 'package:flutter_mobile/pages/screener/creater_screener/widget_view.dart';
import 'package:flutter_mobile/widgets/appbar_custom.dart';
import 'package:flutter_mobile/widgets/button/widget_button.dart';

class CreateScreenerPage extends BaseScreen<CreateScreenerController> {
  CreateScreenerPage({Key? key}) : super(key: key);

  @override
  CreateScreenerController putController() => CreateScreenerController();

  @override
  Widget builder() {
    return WillPopScope(
      onWillPop: () async {
        controller.onGetBack();
        return false;
      },
      child: Scaffold(
        appBar: _buildAppBar,
        body: _buildBody,
        bottomNavigationBar: _buildButtonAdd,
      ),
    );
  }

  PreferredSize get _buildAppBar => PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarCustom(
          titleAppBar: LocaleKeys.screener_filter.tr,
          callBack: () => controller.onGetBack(),
          actions: <Widget>[
            Obx(
              () => Visibility(
                visible: controller.isShowSave.value,
                child: TextButton(
                    onPressed: controller.onSaveScreener,
                    child: Text(
                      LocaleKeys.done.tr,
                      style: textStyle.medium(size: 14, color: color.primary),
                    )),
              ),
            )
          ],
        ),
      );

  Widget get _buildBody => ListView(
        padding: EdgeInsets.fromLTRB(12, 12, 12, 50),
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          //
          WidgetView()
              .buildTitleFilter(LocaleKeys.screener_market.tr.toUpperCase()),
          _buildGridOption(TypeScreenerView.market),
          SizedBox(height: 12),

          //
          WidgetView()
              .buildTitleFilter(LocaleKeys.screener_quotes_indicator.tr),
          _buildGridOption(TypeScreenerView.quotes,
              listFilterRX: controller.quotesFilter),
          SizedBox(height: 12),

          //
          WidgetView()
              .buildTitleFilter(LocaleKeys.screener_financial_indicator.tr),
          _buildGridOption(TypeScreenerView.financia,
              listFilterRX: controller.financiaFilter),
          SizedBox(height: 12),

          //
          WidgetView()
              .buildTitleFilter(LocaleKeys.screener_technical_indicator.tr),
          _buildGridOption(TypeScreenerView.technical,
              listFilterRX: controller.technicalFilter),

          SizedBox(height: 12),
        ],
      );

  Widget get _buildButtonAdd => Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 20, left: 12, right: 12),
        child: Obx(
          () => WidgetButton(
            onClick: () => controller.onViewResult(),
            title: LocaleKeys.screener_view_result.tr,
            textColor: controller.isShowSave.value ? color.grey0 : color.grey80,
            bgColor: controller.isShowSave.value ? color.primary : color.grey50,
          ),
        ),
      );

  Widget _buildGridOption(TypeScreenerView typeScreenerView,
      {RxList<ScreenerOption>? listFilterRX}) {
    switch (typeScreenerView) {
      // List
      case TypeScreenerView.market:
      case TypeScreenerView.industries:
        return Obx(
          () => GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 10 / 4.5,
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                WidgetView().buildItemFilter(
                  TypeScreenerView.market.titleBottomSheet,
                  isActive: controller.marketFilter.isNotEmpty,
                  onSelect: () =>
                      controller.onChangeScreener(TypeScreenerView.market),
                  onRemove: () =>
                      controller.onRemoveScreener(TypeScreenerView.market),
                ),
                WidgetView().buildItemFilter(
                  TypeScreenerView.industries.titleBottomSheet,
                  isActive: controller.industriesFilter.isNotEmpty,
                  onSelect: () =>
                      controller.onChangeScreener(TypeScreenerView.industries),
                  onRemove: () =>
                      controller.onRemoveScreener(TypeScreenerView.industries),
                )
              ]),
        );
      // Range
      case TypeScreenerView.quotes:
      case TypeScreenerView.financia:
      case TypeScreenerView.technical:
      default:
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 10 / 4.5,
          ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: typeScreenerView.listData.length,
          itemBuilder: (_, int index) => Obx(
            () => WidgetView().buildItemFilter(
              typeScreenerView.listData[index].nameOptionMultiLang,
              isActive: listFilterRX!.any((ScreenerOption element) =>
                  element.id == typeScreenerView.listData[index].id),
              onSelect: () => controller.onChangeScreener(typeScreenerView,
                  optionRange: typeScreenerView.listData[index]),
              onRemove: () => controller.onRemoveScreener(typeScreenerView,
                  option: typeScreenerView.listData[index]),
            ),
          ),
        );
    }
  }
}
