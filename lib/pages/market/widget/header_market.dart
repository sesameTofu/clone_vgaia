import 'package:flutter_mobile/domain/model/watch_list/watch_list.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/global/app_router.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/widget/popup_menu.dart';
import 'package:flutter_mobile/pages/watch_list/manager/bottom_sheet.dart';
import 'package:flutter_mobile/pages/watch_list/manager/bottom_sheet_category.dart';
import 'package:flutter_mobile/pages/watch_list/watch_list_controller.dart';
import 'package:flutter_mobile/widgets/svg_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderMarket extends BaseScreen<WatchListController> {
  HeaderMarket(this.watchListController, {Key? key}) : super(key: key);
  final WatchListController watchListController;

  @override
  Widget builder() {
    return Container(
        color: color.grey90,
        child: Column(children: <Widget>[
          SizedBox(height: 12),
          buildSearchTicker,
          SizedBox(height: 12),
          buildMenuWatchList
        ]));
  }

  Widget get buildSearchTicker => InkWell(
      onTap: () async {
        await Get.toNamed(AppRouter.routerSearchStock);
      },
      child: Container(
          height: 32,
          padding: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: color.grey80,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 1, color: color.grey60),
          ),
          child: Row(children: <Widget>[
            SvgPicture.asset(
              AppPath.icSearch,
              color: color.grey40,
            ),
            SizedBox(width: 8),
            Text(
              LocaleKeys.search_stock.tr,
              style: textStyle.custom(color: color.grey40, size: 12),
            )
          ])).paddingSymmetric(horizontal: 12));

  Widget get buildMenuWatchList => Column(children: <Widget>[
        Container(height: 1, color: color.grey60),
        SizedBox(height: 8),
        IntrinsicHeight(
            child: Row(children: <Widget>[
          _popupMenu,
          Spacer(),
          InkWell(
              onTap: () {
                Get.bottomSheet(
                    BottomSheetCustom(
                        height: 0.4.getHeight,
                        padding: EdgeInsets.zero,
                        content: BottomSheetCategory(
                            type: TypeBottom.EDIT_CATEGORY,
                            title: LocaleKeys.my_watch_list.tr)),
                    isScrollControlled: true,
                    enableDrag: false,
                    backgroundColor: Colors.transparent);
              },
              child: iconSvg(
                  path: AppPath.icCalenda, color: color.grey40, height: 30)),
          SizedBox(width: 12)
        ])),
        SizedBox(height: 8),
        Container(height: 1, color: color.grey60)
      ]);

  Widget get _popupMenu => PopupMenu(
        width: .5.getWidth,
        padingTop: .8,
        childPopup: _buildFilter,
        onState: (bool state) {
          controller.isDropdownOpened.value = state;
        },
        child: _buildWrapFilter,
      );

  Widget get _buildWrapFilter => Obx(() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                (vn
                        ? controller.category.value?.nameVi
                        : controller.category.value?.nameEn) ??
                    LocaleKeys.add_wl.tr,
                style: textStyle.bold(color: color.grey0, size: 15),
              ),
              SizedBox(width: 16),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    iconSvg(
                      path: AppPath.icSortUp,
                      color: controller.isDropdownOpened.value
                          ? color.primary
                          : color.grey40,
                      height: 6,
                    ),
                    SizedBox(height: 4),
                    iconSvg(
                        path: AppPath.icSortDown,
                        color: controller.isDropdownOpened.value
                            ? color.primary
                            : color.grey40,
                        height: 6)
                  ])
            ]),
      ));

  Widget _buildFilter(Function dissmiss) => Container(
        padding: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: color.grey80,
          borderRadius: BorderRadius.circular(8),
        ),
        constraints: BoxConstraints(maxHeight: Get.height * 0.5),
        child: Obx(
          () => ListView(
            padding: EdgeInsets.zero,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            children: controller.categoryManager.listCatgorys
                .map(
                  (WatchList? e) => InkWell(
                    onTap: () {
                      controller.categoryController.changeSelectCategory(e);
                      dissmiss();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.width,
                        vertical: 8,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: controller.category.value?.id == e?.id
                            ? color.grey70
                            : Colors.transparent,
                        border: Border(
                          bottom: BorderSide(width: .3, color: color.grey70),
                        ),
                      ),
                      child: Text(
                        (vn ? e?.nameVi : e?.nameEn) ?? '',
                        style: textStyle.regular(color: color.grey0),
                      ).paddingOnly(top: 8.height, bottom: 8.height),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      );

  @override
  WatchListController? putController() {
    return watchListController;
  }
}
