// ignore_for_file: constant_identifier_names

import 'dart:ui';

import 'package:flutter_mobile/domain/model/watch_list/watch_list.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/watch_list/manager/bottom_sheet.dart';
import 'package:flutter_mobile/pages/watch_list/manager/category_cotroller.dart';
import 'package:flutter_mobile/pages/watch_list/update_categoty_popup/update_category_popup.dart';
import 'package:flutter_mobile/pages/watch_list/update_categoty_popup/update_category_popup_controller.dart';
import 'package:flutter_mobile/widgets/svg_icon.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';

class BottomSheetCategory extends BaseScreen<CategoryController> {
  BottomSheetCategory(
      {required this.type, required this.title, this.secCd, Key? key})
      : super(key: key);
  final TypeBottom type;
  final String title;
  final String? secCd;

  @override
  Widget builder() {
    return Container(child: _buildListCategory);
  }

  Widget get _buildListCategory => SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            _buildTitle,
            _buildActionCategory,
            _buildList,
          ]));

  Container get _buildTitle => Container(
      height: 44,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: color.grey80,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0))),
      child: Stack(children: <Widget>[
        TextButton(
            onPressed: () => Get.back(),
            child: Align(
                alignment: Alignment.centerLeft,
                child: iconSvg(path: AppPath.icArrowBack))),
        Center(
            child: Text(title,
                style: textStyle.medium(color: color.grey0, size: 13)))
      ]));

  Container get _buildActionCategory => Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: color.grey70),
              top: BorderSide(width: 1, color: color.grey70))),
      child: InkWell(
          onTap: () async {
            final dynamic result = await Get.bottomSheet(
              BottomSheetCustom(
                  height: .3.getHeight,
                  padding: EdgeInsets.zero,
                  content: UpdateWatchListPopUp(
                    UpdateCategoryPopupController(null),
                    typeBottomAdd: TypeBottomAdd.ADD,
                  )),
              isScrollControlled: true,
              enableDrag: true,
              backgroundColor: Colors.transparent,
            );

            Get.delete<UpdateCategoryPopupController>();

            if (result != null && result as bool) {
              Get.back();
            }
          },
          child: Row(children: <Widget>[
            Icon(
              Icons.add,
              color: color.primary,
              // size: 18,
            ),
            SizedBox(width: 24.width),
            Text(LocaleKeys.add_new_watch_list.tr,
                style: textStyle.medium(color: color.primary, size: 13))
          ])));

  Widget get _buildList => Obx(() => Expanded(
        child: ImplicitlyAnimatedReorderableList<WatchList>(
            key: UniqueKey(),
            shrinkWrap: true,
            items: controller.listCategorys(typeBottom: type),
            areItemsTheSame: (WatchList oldItem, WatchList newItem) {
              return oldItem == newItem;
            },
            onReorderFinished:
                (_, int current, int last, List<WatchList> newItems) {
              controller.saveCategorys(newItems);
            },
            updateDuration: Duration(milliseconds: 400),
            itemBuilder: (_, __, WatchList watchList, int? i) {
              return Reorderable(
                  key: ValueKey<String>('${watchList.id}'),
                  builder: (_, Animation<double> dragAnimation, bool inDrag) {
                    return SizeFadeTransition(
                        sizeFraction: 0.7,
                        curve: Curves.easeInOut,
                        animation: __,
                        child: Material(
                            color: Color.lerp(
                                Colors.white,
                                Colors.white.withOpacity(0.8),
                                dragAnimation.value),
                            elevation:
                                lerpDouble(0, 8, dragAnimation.value) ?? 0,
                            type: MaterialType.transparency,
                            child: InkWell(
                                onTap: () => onTapItemCategory(watchList),
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: color.grey70,
                                                width: 1))),
                                    child: Row(
                                      children: <Widget>[
                                        if (type == TypeBottom.EDIT_CATEGORY)
                                          Handle(
                                              // delay: Duration(milliseconds: 250),
                                              child: Container(
                                                  child: Icon(
                                            Icons.menu,
                                            color: color.grey40,
                                            size: 18,
                                          ).paddingOnly(right: 16.width))),
                                        Text(watchList.getCategoryName ?? '',
                                            style: textStyle.medium(
                                                color: color.grey0, size: 13)),
                                        Spacer(),
                                        if (type == TypeBottom.EDIT_CATEGORY)
                                          InkWell(
                                            onTap: () =>
                                                _onEditNameCategory(watchList),
                                            child: Icon(
                                              Icons.edit,
                                              color: watchList.viewOnly
                                                  ? color.grey70
                                                  : color.grey20,
                                              size: 18,
                                            ).paddingOnly(right: 12.width),
                                          ),
                                        if (type == TypeBottom.EDIT_CATEGORY)
                                          InkWell(
                                              onTap: () {
                                                if (!watchList.viewOnly) {
                                                  controller.removeCategory(
                                                      watchList);
                                                }
                                              },
                                              child: Icon(Icons.delete,
                                                  color: watchList.viewOnly
                                                      ? color.grey70
                                                      : color.grey20,
                                                  size: 18)),
                                      ],
                                    ).paddingSymmetric(
                                        horizontal: 12, vertical: 12)))));
                  });
            }),
      ));

  void onTapItemCategory(WatchList wl) {
    switch (type) {
      case TypeBottom.COPY_WATCHLIST:
        controller.copyWatchList(wl);
        break;

      case TypeBottom.EDIT_CATEGORY:
      default:
        _openNewCategory(wl);
        break;
    }
  }

  Future<void> _onEditNameCategory(WatchList item) async {
    if (!item.viewOnly) {
      Get.bottomSheet(
        BottomSheetCustom(
            height: .3.getHeight,
            padding: EdgeInsets.zero,
            content: UpdateWatchListPopUp(
              UpdateCategoryPopupController(item),
              typeBottomAdd: TypeBottomAdd.EDIT,
            )),
        isScrollControlled: true,
        enableDrag: false,
        backgroundColor: Colors.transparent,
      );

      await Get.delete<UpdateCategoryPopupController>();
    }
  }

  void _openNewCategory(WatchList category) {
    controller.changeSelectCategory(category);
    Get.back();
  }

  @override
  CategoryController? putController() {
    return CategoryController();
  }
}
