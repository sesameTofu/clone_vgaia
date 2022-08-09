import 'package:flutter/services.dart';
import 'package:flutter_mobile/domain/model/screener/screener_model.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/screener/creater_screener/detail/range_option/range_option_controller.dart';
import 'package:flutter_mobile/widgets/button/widget_button.dart';
import 'package:flutter_mobile/widgets/custom_slider.dart';
import 'package:flutter_mobile/widgets/text_field/build_input_text.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class RangeOptionView extends GetView<RangeOptionController> with BaseMixin {
  const RangeOptionView(this.scroll, this.screenerOption, {Key? key})
      : super(key: key);
  final ScrollController scroll;
  final ScreenerOption screenerOption;

  @override
  RangeOptionController get controller =>
      Get.put(RangeOptionController(screenerOption));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ListView(
              controller: scroll,
              padding: EdgeInsets.all(12),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildTextField(
                        textController: controller.textControllerFrom,
                        focusNode: controller.focusFrom,
                        hintText: LocaleKeys.screener_from.tr,
                        suffixText: screenerOption.unitMultiLang.toUpperCase()),
                    Container(
                      height: 1,
                      width: 50,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: color.grey40,
                      ),
                    ),
                    _buildTextField(
                        textController: controller.textControllerTo,
                        focusNode: controller.focusTo,
                        hintText: LocaleKeys.screener_to.tr,
                        suffixText: screenerOption.unitMultiLang.toUpperCase()),
                  ],
                ),
                SizedBox(height: 8),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: color.primary.withOpacity(0.8),
                    inactiveTrackColor: color.grey40,
                    rangeThumbShape: CustomRangeShape(),
                    trackHeight: 2.0,
                  ),
                  child: Obx(
                    () => RangeSlider(
                        min: (screenerOption.minValue ?? 0).toDouble(),
                        max: (screenerOption.maxValue ?? 0).toDouble(),
                        values: controller.currentRangeValues.value,
                        onChanged: controller.onChangeSlide),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '${(screenerOption.minValue ?? 0).formatVolume(decimalDigits: 2)} ${screenerOption.unitMultiLang}',
                      style: textStyle.custom(),
                    ),
                    Spacer(),
                    Text(
                      '${(screenerOption.maxValue ?? screenerOption.minValue ?? 0).formatVolume(decimalDigits: 2)} ${screenerOption.unitMultiLang}',
                      style: textStyle.custom(),
                    ),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: WidgetButton(
              onClick: () => controller.onApplyChange(),
              title: LocaleKeys.goline_Apply.tr,
              textColor: color.grey90,
              bgColor: color.primary,
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildTextField({
    required TextEditingController textController,
    required FocusNode focusNode,
    required String hintText,
    String? suffixText,
  }) =>
      Expanded(
        child: BuildInputText(
            controller: textController,
            hintText: hintText,
            currentNode: focusNode,
            suffixText: suffixText,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              ThousandsFormatter()
            ],
            textInputType: TextInputType.number),
      );
}
