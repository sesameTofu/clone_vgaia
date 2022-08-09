import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/watch_list/favourite_page/bottom_sheet_category_add.dart';
import 'package:flutter_mobile/pages/watch_list/manager/bottom_sheet.dart';
import 'package:flutter_mobile/pages/watch_list/search/search_page_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionAddStockWidget extends BaseScreen<SearchStockController> {
  ActionAddStockWidget(this.secId, {Key? key, this.categoryId})
      : super(key: key);
  final String secId;
  final num? categoryId;
  @override
  Widget builder() {
    return InkWell(
        borderRadius: BorderRadius.circular(50.0),
        onTap: () async {
          if (controller.selectStockMap[secId] != null) {
            if (categoryId != null) {
              controller.addStockCategory(secId);
            } else {
              await Get.bottomSheet(
                BottomSheetCustom(
                  height: 0.4.getHeight,
                  padding: EdgeInsets.zero,
                  content: BottomSheetCategoryAdd(
                    secCd: secId,
                    title: 'Chọn danh mục',
                  ),
                ),
                isScrollControlled: true,
                enableDrag: false,
                backgroundColor: Colors.transparent,
              );
              //Get.delete<FavouriteController>();
            }

            //  controller.addStockCategory(controller.selectStockMap[secId]!);
          }
        },
        child: Obx(() => Padding(
            padding: EdgeInsets.all(4.0),
            child: SvgPicture.asset(
                (controller.selectStockMap[secId]?.stockItem.isFavourite ??
                        false)
                    ? AppPath.icStarWatched
                    : AppPath.icStarUnWatch))));
  }

  @override
  SearchStockController? putController() {
    return SearchStockController(categoryId: categoryId);
  }
}
