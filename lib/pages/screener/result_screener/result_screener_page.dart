import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/screener/result_screener/item_table/item_table.dart';
import 'package:flutter_mobile/pages/screener/result_screener/result_screener_controller.dart';
import 'package:flutter_mobile/widgets/appbar_custom.dart';
import 'package:flutter_mobile/widgets/button/widget_button.dart';
import 'package:flutter_mobile/widgets/no_data.dart';
import 'package:flutter_mobile/widgets/sort_collum.dart';
import 'package:flutter_mobile/widgets/svg_icon.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class ResultScreenerPage extends BaseScreen<ResultScreenerController> {
  ResultScreenerPage({Key? key}) : super(key: key);

  @override
  ResultScreenerController putController() => ResultScreenerController();

  @override
  Widget builder() {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
      bottomNavigationBar: _buildButtonAdd,
    );
  }

  PreferredSize get _buildAppBar => PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Obx(
          () => AppBarCustom(
            titleAppBar: controller.filterModel.value.nameFilter ??
                LocaleKeys.screener_new_filter.tr,
            actions: <Widget>[
              Obx(
                () => Visibility(
                  visible: controller.filterModel.value.idFilter == null,
                  child: TextButton(
                      onPressed: controller.onSaveScreener,
                      child: Text(
                        LocaleKeys.goline_Save.tr,
                        style: textStyle.custom(color: color.primary),
                      )),
                ),
              )
            ],
          ),
        ),
      );

  Widget get _buildBody => Obx(
        () => controller.listResult.isEmpty
            ? Nodata()
            : HorizontalDataTable(
                // horizontalScrollController: controller.scrollControllerTable,
                // verticalScrollController: controller.scrollControllerTable,
                leftHandSideColumnWidth: 150,
                rightHandSideColumnWidth: 830,
                isFixedHeader: true,
                headerWidgets: _getHeaderWidgets,
                leftSideItemBuilder: (BuildContext _, int index) =>
                    _buildLeftItemTable(index, controller.listResult[index]),
                rightSideItemBuilder: (BuildContext _, int index) =>
                    _buildRightItem(index, controller.listResult[index]),
                itemCount: controller.listResult.length,
                leftHandSideColBackgroundColor: color.background2,
                rightHandSideColBackgroundColor: color.background2,
              ),
      );

  Widget get _buildButtonAdd => Obx(
        () => Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              if (controller.isExpand.value)
                Expanded(
                  child: WidgetButton(
                    onClick: () => controller.onCancelAdd(),
                    title: LocaleKeys.screener_cancel.tr,
                    textColorGhost: color.primary,
                    colorBorder: color.primary,
                    typeButton: TypeButton.ghost,
                    bgColor: color.grey80,
                  ).paddingOnly(right: 12),
                ),
              Expanded(
                child: WidgetButton(
                  onClick: () => controller.onAddtoWatchlist(),
                  title: LocaleKeys.screener_add_watchList.tr,
                  titleDescript: controller.strTotalSelect,
                  bgColor: color.primary,
                  textColor: color.grey0,
                ),
              )
            ],
          ),
        ),
      );

  List<Widget> get _getHeaderWidgets => <Widget>[
        _headerTable(
          LocaleKeys.symbol.tr,
          TextAlign.left,
          150,
          false,
          SortType.symbol,
          mainAxisAlignment: MainAxisAlignment.start,
          padding: EdgeInsets.only(left: 12),
        ),
        _headerTable(LocaleKeys.goline_Price.tr, TextAlign.right, 90, true,
            SortType.price),
        _headerTable('%${LocaleKeys.stock_detail_change.tr}', TextAlign.right,
            90, true, SortType.change),
        _headerTable(
            LocaleKeys.screener_market_cap.tr + '(${LocaleKeys.billion.tr})',
            TextAlign.right,
            100,
            true,
            SortType.marketCap),
        _headerTable(LocaleKeys.stock_detail_p_b.tr, TextAlign.right, 90, true,
            SortType.pb),
        _headerTable(LocaleKeys.stock_detail_p_e.tr, TextAlign.right, 90, true,
            SortType.pe),
        _headerTable(LocaleKeys.screener_net_sales.tr, TextAlign.right, 90,
            true, SortType.netMag),
        _headerTable('${LocaleKeys.stock_detail_roa.tr} (%)', TextAlign.right,
            90, true, SortType.roa),
        _headerTable('${LocaleKeys.stock_detail_roe.tr} (%)', TextAlign.right,
            100, true, SortType.roe),
        _headerTable(
          LocaleKeys.stock_detail_eps.tr,
          TextAlign.right,
          90,
          true,
          SortType.eps,
          padding: EdgeInsets.only(right: 12),
        ),
      ];

  Widget _headerTable(
    String title,
    TextAlign tAlign,
    double rowWidth,
    bool sortEnabled,
    SortType sortType, {
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.end,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
  }) =>
      Container(
        padding: padding,
        color: color.background1,
        width: rowWidth,
        alignment: Alignment.centerRight,
        height: 48,
        child: SortWidget<SortType>(
            onSortChanged: (SortState state, SortType type) =>
                controller.onShortChange(state, type),
            title: title,
            group: controller.sortType.value,
            state: controller.sortState.value,
            value: sortType,
            mainAxisAlignment: mainAxisAlignment),
      );

  Widget _buildLeftItemTable(int index, StockItemViewModel item) => Obx(
        () => InkWell(
          onTap: () => controller.onSelectIterm(item),
          child: Container(
            height: 48.0,
            width: 150,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: color.grey60, width: 0.4),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Row(
                children: <Widget>[
                  if (controller.isExpand.value)
                    Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: iconSvg(
                            path: controller.listSelected.any(
                                    (String element) =>
                                        element == item.stockItem.secID)
                                ? AppPath.icRadioYes
                                : AppPath.icRadioNo)),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.stockItem.secID ?? '-',
                          style: textStyle.custom(
                            size: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          (vn ? item.stockItem.vName : item.stockItem.eName) ??
                              '- - -',
                          overflow: TextOverflow.ellipsis,
                          style: textStyle.custom(
                              size: 10,
                              fontWeight: FontWeight.w400,
                              color: color.grey20),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            alignment: Alignment.centerLeft,
          ),
        ),
      );

  Widget _buildRightItem(int index, StockItemViewModel item) =>
      ItemTable(item, tag: 'ScreenerItemController${item.stockItem.secID}');
}
