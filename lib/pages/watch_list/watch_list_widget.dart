import 'package:flutter_mobile/controller/watch_list_manager.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/watch_list/item/item_stock_box_widget.dart';
import 'package:flutter_mobile/pages/watch_list/search/search_stock_page.dart';
import 'package:flutter_mobile/pages/watch_list/watch_list_controller.dart';
import 'package:flutter_mobile/widgets/app_loading.dart';
import 'package:flutter_mobile/widgets/svg_icon.dart';

class WatchListWidget extends BaseScreen<WatchListController> {
  WatchListWidget({Key? key, required this.watchListController})
      : super(key: key);
  final WatchListController watchListController;
  @override
  Widget builder() {
    return SizedBox(height: 200, child: _buildList());
  }

  Widget _buildList() {
    return Obx(() {
      final bool isViewOnly =
          WatchListManager().categorySelect.value?.viewOnly ?? false;
      final int watchListLength =
          watchListController.listStockItemViewModel.length;
      final int itemCount = isViewOnly ? watchListLength : watchListLength + 1;
      if (controller.isLoadingCtrl.value) {
        return appLoading;
      }
      if (watchListController.listStockItemViewModel.isEmpty && !isViewOnly) {
        return _buildEmptyTicker;
      }
      return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 12),
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: (_, int index) {
            if (index != watchListLength) {
              return ItemStockBoxWidget(
                  tagController:
                      'ItemStockBoxWidgetBox${controller.listStockItemViewModel[index].stockItem.secID}',
                  stockItemViewModel: controller.listStockItemViewModel[index],
                  idCategory:
                      watchListController.category.value?.viewOnly ?? true
                          ? null
                          : watchListController.category.value?.id);
            } else {
              return GestureDetector(
                onTap: () async {
                  await Get.to(() => SearchStockPage(
                      categoryId: watchListController.category.value?.id));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: color.grey80,
                  ),
                  width: 152,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      iconSvg(
                          path: AppPath.icAdd,
                          color: color.primary,
                          height: 24,
                          width: 24),
                      SizedBox(width: 8),
                      Text(
                        LocaleKeys.add_stock_short.tr,
                        style: textStyle.medium(color: color.primary),
                      ),
                    ],
                  ),
                ),
              );
            }
          });
    });
  }

  Center get _buildEmptyTicker => Center(
        child: InkWell(
          onTap: () async {
            await Get.to(() => SearchStockPage(
                categoryId: watchListController.category.value?.id));

            // watchListManager.onRefresh(showLoading: false);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.add,
                color: color.primary,
              ),
              SizedBox(width: 8.width),
              Text(
                LocaleKeys.add_stock.tr,
                style: textStyle.medium(color: color.primary),
              ),
            ],
          ),
        ),
      );

  @override
  WatchListController? putController() {
    return watchListController;
  }
}
