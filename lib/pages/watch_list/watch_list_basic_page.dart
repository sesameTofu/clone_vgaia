import 'package:flutter_mobile/controller/watch_list_manager.dart';
import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/domain/model/sort_model.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/widget/header_market.dart';
import 'package:flutter_mobile/pages/watch_list/item/item_stock_widget.dart';
import 'package:flutter_mobile/pages/watch_list/search/search_stock_page.dart';
import 'package:flutter_mobile/pages/watch_list/watch_list_controller.dart';
import 'package:flutter_mobile/widgets/app_loading.dart';
import 'package:flutter_mobile/widgets/smart_load_list.dart';
import 'package:flutter_mobile/widgets/sort_collum.dart';
import 'package:flutter_mobile/widgets/svg_icon.dart';

class WatchListBasicPage extends BaseScreen<WatchListController>
    with SmartLoadList {
  WatchListBasicPage(this.watchListController, {Key? key}) : super(key: key);
  final WatchListController watchListController;
  @override
  Widget builder() {
    return Column(children: <Widget>[
      HeaderMarket(controller),
      SizedBox(height: 16),
      _buildSortHeader,
      Expanded(child: Obx(() {
        if (controller.isLoadingCtrl.value) {
          return appLoading;
        }
        if (watchListController.listStockItemViewModel.isEmpty) {
          return _buildEmptyListView;
        }
        return buildSmartList();
      }))
    ]);
  }

  Widget _buildTickerWatchingItem(StockItemViewModel stockItemViewModel) {
    return ItemStockWidget(
        stockItemViewModel: stockItemViewModel,
        removeItem: () {
          controller.removeSecFromCurrentCategory(stockItemViewModel);
        },
        slidableController: controller.slidableController,
        removable: !(controller.category.value?.viewOnly ?? false),
        tagController:
            'ItemStockWidgetBasic${stockItemViewModel.stockItem.secID}',
        idCategory: watchListController.category.value?.viewOnly ?? true
            ? null
            : watchListController.category.value?.id);
  }

  Widget get _buildSortHeader => Obx(() => Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      color: color.background2,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: controller.sorts
              .map((Sort e) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: SortWidget<SortType>(
                      onSortChanged: controller.sortWatchList,
                      title: e.title,
                      group: controller.sortType.value,
                      state: controller.sortState.value,
                      value: e.type)))
              .toList())));

  Widget get _buildEmptyListView => Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 16),
            Text(LocaleKeys.no_add.tr.toString(),
                style: textStyle.regular(size: 12, color: color.grey0)),
            TextButton(
                onPressed: _goToSearchPage,
                child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Icon(Icons.add, color: color.blue50),
                  SizedBox(width: 4),
                  Text(LocaleKeys.goline_AddSymbol.tr,
                      style: textStyle.regular(color: color.blue50))
                ]))
          ]);

  Future<void> _goToSearchPage() async {
    await Get.to(() =>
        SearchStockPage(categoryId: watchListController.category.value?.id));
  }

  @override
  WatchListController? putController() {
    return watchListController;
  }

  @override
  void onRefresh() {
    controller.onRefesh();
    refreshController.refreshCompleted();

    super.onRefresh();
  }

  @override
  Widget get listViewLoad => ListView.builder(
      controller: controller.scrollController,
      itemCount: (WatchListManager().categorySelect.value?.viewOnly ?? false)
          ? watchListController.listStockItemViewModel.length
          : watchListController.listStockItemViewModel.length + 1,
      itemBuilder: (_, int index) {
        if (index == controller.listStockItemViewModel.length) {
          return TextButton(
            onPressed: _goToSearchPage,
            child: Row(
              children: <Widget>[
                iconSvg(
                    path: AppPath.icAdd,
                    color: color.primary,
                    height: 24,
                    width: 24),
                SizedBox(height: 8),
                Text(
                  LocaleKeys.add_stock_short.tr,
                  style: textStyle.medium(color: color.primary),
                ),
              ],
            ),
          );
        }
        return _buildTickerWatchingItem(
            controller.listStockItemViewModel[index]);
      });
}
