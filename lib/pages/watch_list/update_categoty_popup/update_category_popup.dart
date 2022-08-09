import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/widgets/button/widget_button.dart';
import 'package:flutter_mobile/widgets/text_field/customer_form_filed.dart';

import 'update_category_popup_controller.dart';

class UpdateWatchListPopUp extends BaseScreen<UpdateCategoryPopupController> {
  UpdateWatchListPopUp(
    this.updateCategoryPopupController, {
    Key? key,
    required this.typeBottomAdd,
  }) : super(key: key);

  final UpdateCategoryPopupController updateCategoryPopupController;
  final TypeBottomAdd typeBottomAdd;

  @override
  Widget builder() => GestureDetector(
        onTap: () {
          WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
        },
        child: _buildAddCategory,
      );

  Widget get _buildAddCategory => SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            _buildTitle,
            _buildTextField,
            Spacer(),
            _buildActionButton
          ]));

  Container get _buildTitle => Container(
        height: 44,
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: color.grey80,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
        ),
        child: Stack(
          children: <Widget>[
            TextButton(
              onPressed: () => Get.back(),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: color.grey40,
                  size: 18,
                ),
              ),
            ),
            Center(
              child: Text(
                typeBottomAdd == TypeBottomAdd.EDIT
                    ? LocaleKeys.edit_watch_list.tr
                    : LocaleKeys.add_new_watch_list.tr,
                style: textStyle.medium(
                  color: color.grey0,
                  size: 13,
                ),
              ),
            ),
          ],
        ),
      );

  Widget get _buildTextField => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            LocaleKeys.name_wl.tr,
            style: textStyle.medium(color: color.grey20),
          ),
          SizedBox(height: 12),
          CustomerFormField(
            textStyle: textStyle.regular(
              color: color.grey0,
              size: 12,
            ),
            editingController: controller.editingController,
            maxLines: 1,
            hintText: LocaleKeys.type_name_wl.tr,
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            borderRadius: 8,
            autofocus: true,
            // currentFocusNote: categoryNameFocusNode,
          ),
        ],
      ).paddingAll(12);

  Widget get _buildActionButton => WidgetButton(
        width: double.infinity,
        title: LocaleKeys.confirm.tr,
        // iconWidget: Icon(
        //   Icons.add,
        //   size: 22,
        //   color: color.primary,
        // ),
        onClick: () {
          if (controller.editingController.text.isEmpty) {
            AppToast.showError(LocaleKeys.watch_list_not_empty.tr);
          } else {
            if (typeBottomAdd == TypeBottomAdd.ADD) {
              controller.saveWatchList();
            } else {
              controller.updateWatchList();
            }
          }
        },
      ).paddingAll(12);

  // @override
  // Widget builder1() {
  //   /// If has [category] => set name to TextField
  //   if (controller.category != null) {
  //     controller.editingController.text =
  //         controller.category?.categoryNameVi ?? '';
  //   }

  //   return AnimatedContainer(
  //       // height: .3.getHeight,
  //       padding: MediaQuery.of(context).viewInsets,
  //       duration: const Duration(milliseconds: 300),
  //       child: Material(
  //           child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
  //         Container(
  //             width: MediaQuery.of(context).size.width,
  //             decoration: BoxDecoration(color: color.background1),
  //             child: Column(children: <Widget>[
  //               Padding(
  //                 padding: const EdgeInsets.all(12.0),
  //                 child: Text(
  //                   controller.category == null
  //                       ? LocaleKeys.home_new_category_hint.tr
  //                       : LocaleKeys.edit_list.tr,
  //                   style: textStyle.semiBold(size: 16),
  //                 ),
  //               ),
  //               Divider(color: Color(0xFF787878)),
  //               Padding(
  //                   padding: const EdgeInsets.all(12.0),
  //                   child: Row(children: <Widget>[
  //                     Text(
  //                       'Tên danh sách',
  //                       style: textStyle.semiBold(size: 16),
  //                     ),
  //                     SizedBox(width: 40),
  //                     Expanded(child: _buildTextField())
  //                   ])),
  //               Padding(
  //                   padding: const EdgeInsets.all(12.0),
  //                   child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                       children: <Widget>[
  //                         Expanded(
  //                             child: Container(
  //                                 height: 40,
  //                                 padding: const EdgeInsets.symmetric(
  //                                     horizontal: 16, vertical: 10),
  //                                 decoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.circular(8),
  //                                   color: color.background2,
  //                                 ),
  //                                 child: InkWell(
  //                                     onTap: () => Get.back(),
  //                                     child: Center(
  //                                         child: Text(LocaleKeys.cancel.tr,
  //                                             style: textStyle.regular(
  //                                                 color: color.primary)))))),
  //                         SizedBox(width: 12),
  //                         Expanded(
  //                             child: Container(
  //                                 height: 40,
  //                                 padding: const EdgeInsets.symmetric(
  //                                     horizontal: 16, vertical: 10),
  //                                 decoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.circular(8),
  //                                   color: color.primary,
  //                                 ),
  //                                 child: AbsorbPointer(
  //                                     absorbing:
  //                                         controller.preventMultiTap.value,
  //                                     child: InkWell(
  //                                         onTap: () {
  //                                           if (controller.editingController
  //                                               .text.isEmpty) {
  //                                             AppToast.showError(
  //                                                 'Không được để trống tên!');
  //                                           } else {
  //                                             controller.saveWatchList();
  //                                           }
  //                                         },
  //                                         child: Center(
  //                                             child: Text('Lưu',
  //                                                 style:
  //                                                     textStyle.semiBold()))))))
  //                       ]))
  //             ]))
  //       ])));
  // }

  // Widget _buildTextField() {
  //   return TextField(
  //       autofocus: true,
  //       maxLength: 24,
  //       controller: controller.editingController,
  //       autocorrect: false,
  //       keyboardType: TextInputType.visiblePassword,
  //       style: TextStyle(
  //         color: color.grey0,
  //       ),
  //       decoration: InputDecoration(
  //         counterText: '',
  //         hintText: 'Nhập tên danh sách',
  //         hintStyle: textStyle.regular(),
  //         contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
  //         suffixIcon: Padding(
  //           padding: const EdgeInsets.only(top: 14),
  //           child: Obx(
  //             () => Text(
  //               '${controller.streamLengthCount.value}/24',
  //               style: textStyle.regular(size: 12),
  //             ),
  //           ),
  //         ),
  //         isDense: true,
  //         filled: true,
  //         fillColor: color.background1,
  //         enabledBorder: OutlineInputBorder(
  //             borderSide: BorderSide(
  //               width: 1,
  //               color: color.blue50,
  //             ),
  //             borderRadius: BorderRadius.circular(8)),
  //         focusedBorder: OutlineInputBorder(
  //             borderSide: BorderSide(
  //               width: 1,
  //               color: color.blue50,
  //             ),
  //             borderRadius: BorderRadius.circular(8)),
  //         disabledBorder: OutlineInputBorder(
  //             borderSide: BorderSide(
  //               width: 1,
  //               color: color.blue50,
  //             ),
  //             borderRadius: BorderRadius.circular(8)),
  //       ));
  // }

  @override
  UpdateCategoryPopupController putController() {
    return updateCategoryPopupController;
  }
}
