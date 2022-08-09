// ignore_for_file: constant_identifier_names

import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/watch_list/favourite_page/favourite_controller.dart';
import 'package:flutter_mobile/pages/watch_list/manager/bottom_sheet.dart';
import 'package:flutter_mobile/pages/watch_list/update_categoty_popup/update_category_popup.dart';
import 'package:flutter_mobile/pages/watch_list/update_categoty_popup/update_category_popup_controller.dart';
import 'package:flutter_mobile/widgets/checkbox.dart';

class BottomSheetCategoryAdd extends BaseScreen<FavouriteController> {
  BottomSheetCategoryAdd(
      {required this.title, this.secCd, this.listSecCd, Key? key})
      : super(key: key);
  final String title;
  final String? secCd;
  final List<String>? listSecCd;

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
            _buildListAd,
            _buildActionButton
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
                child:
                    Icon(Icons.arrow_back_ios, color: color.grey40, size: 18))),
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
              enableDrag: false,
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

  // Widget     get _buildListAdd => Obx(()=> ListView.builder );
  Widget get _buildListAd => Obx(() => Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.listCategory.length,
            itemBuilder: (BuildContext context, int index) => Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: color.grey70, width: 1))),
                child: Row(children: <Widget>[
                  Text(controller.listCategory[index].getCategoryName ?? '',
                      style: textStyle.medium(color: color.grey0, size: 13)),
                  Spacer(),
                  Obx(() => CheckBox(
                      value: controller.listWatchListSelected
                          .contains(controller.listCategory[index].id),
                      onPress: (bool value) {
                        if (value) {
                          controller.listWatchListSelected
                              .add(controller.listCategory[index].id ?? 0);
                        } else {
                          controller.listWatchListSelected
                              .remove(controller.listCategory[index].id ?? 0);
                        }
                        // controller
                        //     .mapSelectWl[controller.listCategory[index].id]
                        //     ?.value = value;
                      }))
                ]).paddingSymmetric(horizontal: 12, vertical: 12))),
      ));

  Widget get _buildActionButton => Row(
        children: <Widget>[
          Expanded(
              child: InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(color: color.primary, width: 1)),
                      child: Text(LocaleKeys.cancel.tr,
                          style: textStyle.bold(
                              color: color.primary, size: 13))))),
          SizedBox(width: 16.width),
          Expanded(
              child: InkWell(
                  onTap: () => controller.onSaveStockToCategory(),
                  child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color.primary,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(LocaleKeys.add_watch_list.tr,
                          style:
                              textStyle.bold(color: color.grey100, size: 13)))))
        ],
      ).paddingSymmetric(horizontal: 12, vertical: 12);

  @override
  FavouriteController? putController() {
    return FavouriteController(secCd ?? '', listSecCd);
  }
}
