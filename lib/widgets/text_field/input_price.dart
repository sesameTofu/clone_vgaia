import 'package:flutter/services.dart';
import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';

typedef OnTapCalculator = void Function(TypeCalcalator type);

class PriceWidget extends BaseWidget<BaseController> {
  PriceWidget(
      {Key? key,
      this.onTapCalculator,
      required this.textEditingController,
      required this.focusNodeCurrent,
      this.focusNodeNext,
      this.formatter,
      this.onTextChange,
      this.hintText = '',
      this.width,
      this.visible = true,
      this.scrollPadding = 20.0,
      this.enabled = true,
      int decimalDigits = 2})
      : super(key: key) {
    focusNodeCurrent.addListener(() {
      if (!textEditingController.text.isString && !focusNodeCurrent.hasFocus) {
        textEditingController.text = textEditingController.text
            .formatNumber()
            .formatPrice(decimalDigits: decimalDigits);
        textEditingController.selection = TextSelection.fromPosition(
            TextPosition(offset: textEditingController.text.length));
      }
      isFocus.value = focusNodeCurrent.hasFocus;
    });
  }

  final TextEditingController textEditingController;
  final OnTapCalculator? onTapCalculator;
  final Function(String value)? onTextChange;
  final FocusNode focusNodeCurrent;
  final FocusNode? focusNodeNext;
  final TextInputFormatter? formatter;
  final RxNotify<bool> isFocus = false.objective;
  final String hintText;
  final bool enabled;
  final bool visible;
  final double? width;
  final double scrollPadding;

  @override
  Widget builder() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ValueListenableBuilder<bool>(
            valueListenable: isFocus,
            builder: (BuildContext context, bool value, Widget? child) {
              return Container(
                  color: color.background0,
                  width: width ?? 0.5.getWidth,
                  height: 40.0,
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1, color: value ? color.primary : color.grey70),
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: 8, bottom: 8, left: 8),
                            child: TextField(
                              enabled: enabled,
                              scrollPadding:
                                  EdgeInsets.only(bottom: scrollPadding),
                              focusNode: focusNodeCurrent,
                              onEditingComplete: () {
                                if (focusNodeNext != null) {
                                  focusNodeNext!.requestFocus();
                                } else {
                                  focusNodeCurrent.unfocus();
                                }
                              },
                              cursorColor: color.primary,
                              controller: textEditingController,
                              keyboardType: TextInputType.numberWithOptions(
                                  signed: false, decimal: true),
                              style: textStyle.custom(),
                              onChanged: (String value) {
                                if (onTextChange != null) {
                                  onTextChange!(value);
                                }
                              },
                              inputFormatters: <TextInputFormatter>[
                                if (formatter != null) formatter!,
                                FilteringTextInputFormatter.deny(
                                    RegExp(r'\s\b|\b\s'))
                              ],
                              decoration: InputDecoration(
                                fillColor: color.grey80,
                                hintText: hintText,
                                hintStyle: textStyle.custom(
                                    size: 12, color: color.grey40),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                                isDense: true,
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: visible,
                          child: IgnorePointer(
                            ignoring: !enabled,
                            child: ButtonCaculator(
                              onDercement: () =>
                                  onTapCalculatorW(TypeCalcalator.decrement),
                              onIncrement: () =>
                                  onTapCalculatorW(TypeCalcalator.increment),
                              isFocus: isFocus,
                            ),
                          ),
                        )
                      ],
                    ),
                  ));
            }));
  }

  void onTapCalculatorW(TypeCalcalator calcalator) {
    if (onTapCalculator != null) {
      onTapCalculator!(calcalator);
      textEditingController.selection = TextSelection.fromPosition(
          TextPosition(offset: textEditingController.text.length));
    }
  }
}

class ButtonCaculator extends BaseWidget<BaseController> {
  ButtonCaculator({
    Key? key,
    required this.onIncrement,
    required this.onDercement,
    required this.isFocus,
  }) : super(key: key);

  final Function() onIncrement;
  final Function() onDercement;
  final RxNotify<bool> isFocus;

  @override
  Widget builder() {
    return ValueListenableBuilder<bool>(
        valueListenable: isFocus,
        builder: (BuildContext context, bool value, Widget? child) {
          final Color colorButton = value ? color.primary : color.grey40;
          return Container(
            color: color.grey80,
            child: Row(
              children: <Widget>[
                _buildButton(
                  label: '-',
                  onTap: onDercement,
                  colorButton: colorButton,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 2),
                  color: color.grey90,
                  width: 0.6,
                ),
                _buildButton(
                  label: '+',
                  onTap: onIncrement,
                  colorButton: colorButton,
                ),
              ],
            ),
          );
        });
  }

  Widget _buildButton(
      {required String label, required Function() onTap, Color? colorButton}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 36,
        alignment: Alignment.center,
        child: Text(
          label,
          style: textStyle.bold(color: colorButton ?? color.grey0, size: 20),
        ),
      ),
    );
  }
}
