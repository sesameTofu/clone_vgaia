import 'package:flutter_mobile/domain/model/screener/screener_model.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/screener/creater_screener/detail/list_option/list_option_controller.dart';
import 'package:flutter_mobile/pages/screener/creater_screener/detail/list_option/list_option_view.dart';
import 'package:flutter_mobile/pages/screener/creater_screener/detail/range_option/range_option_controller.dart';
import 'package:flutter_mobile/pages/screener/creater_screener/detail/range_option/range_option_view.dart';
import 'package:flutter_mobile/pages/screener/creater_screener/enum_filter.dart';
import 'package:flutter_mobile/widgets/button/widget_button.dart';
import 'package:flutter_mobile/widgets/pop_up/show_bottom_sheet.dart';
import 'package:flutter_mobile/widgets/text_field/build_input_text.dart';

class WidgetView with BaseMixin {
  // Title
  Widget buildTitleFilter(String title) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          title,
          textAlign: TextAlign.left,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textStyle.semiBold(color: color.grey0, size: 12),
        ),
      );

  // Item
  Widget buildItemFilter(String? title,
          {bool isActive = false,
          required Function onSelect,
          required Function onRemove}) =>
      Stack(
        children: <Widget>[
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => onSelect(),
            child: Container(
              margin: EdgeInsets.only(
                top: 8,
                right: 8,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color.grey80,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: isActive ? color.primary : Colors.transparent),
              ),
              child: Text(
                title ?? '',
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textStyle.custom(
                  color: isActive ? color.primary : color.grey20,
                  size: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          if (isActive)
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: () => onRemove(),
                child: Icon(
                  Icons.cancel,
                  size: 18,
                  color: color.grey40,
                ),
              ),
            )
        ],
      );

  //
  Widget buildItemCheckBox(bool isSelect, String? title) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
        child: Row(
          children: <Widget>[
            Icon(
              isSelect
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank_outlined,
              size: 24,
              color: isSelect ? color.primary : color.grey40,
            ),
            SizedBox(width: 12),
            Text(
              title ?? '- - -',
              textAlign: TextAlign.left,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textStyle.custom(
                color: color.grey0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );

  // dùng cho Sàn, Ngành
  Future<Set<ScreenerOption>?> popupListOption(TypeScreenerView type,
      List<ScreenerOption> listSelected, List<ScreenerOption> listData) async {
    return await ShowBottomSheet()
        .showBottomSheetScale<Set<ScreenerOption>?>(
            title: type.titleBottomSheet,
            content: (ScrollController scroll) =>
                ListOptionView(scroll, listSelected, listData),
            paddingContent: EdgeInsets.zero)
        .whenComplete(() => Get.delete<ListOptionController>());
  }

  // dùng cho Quotes, Financia
  Future<ScreenerOption?> popupRangeOption(
      ScreenerOption currentScreenerOption) async {
    return ShowBottomSheet()
        .showBottomSheetScale<ScreenerOption?>(
            initHeight: 0.5,
            title: currentScreenerOption.nameOptionMultiLang,
            content: (ScrollController scroll) =>
                RangeOptionView(scroll, currentScreenerOption),
            // widgetBottom:
            paddingContent: EdgeInsets.zero)
        .whenComplete(() => Get.delete<RangeOptionController>());
  }

  Future<String?> popupNameNewScreener() async {
    final TextEditingController _textController = TextEditingController();
    return ShowBottomSheet().showBottomSheetScale<String?>(
        initHeight: 0.5,
        title: LocaleKeys.screener_save_filter.tr,
        content: (ScrollController scroll) => Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          LocaleKeys.screener_name_filter.tr,
                          style: textStyle.custom(
                            color: color.grey20,
                            size: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8),
                        BuildInputText(
                          controller: _textController,
                          hintText: LocaleKeys.screener_noti_input_24.tr,
                          maxLengthInputForm: 24,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  WidgetButton(
                    onClick: () {
                      if (_textController.text.trim().isNotEmpty) {
                        Get.back(result: _textController.text);
                      } else {
                        Get.back();
                      }
                    },
                    title: LocaleKeys.goline_Confirm.tr,
                    textColor: color.grey0,
                    bgColor: color.primary,
                  ),
                ],
              ),
            ),
        paddingContent: EdgeInsets.zero);
  }
}
