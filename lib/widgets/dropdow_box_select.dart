import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/import.dart';
import 'dropdown_custom.dart';

class DropdownBoxSelect<T> extends StatelessWidget with BaseMixin {
  DropdownBoxSelect({
    Key? key,
    this.title,
    this.initialValue,
    required this.datas,
    required this.selectedValue,
    this.isEnabled = true,
    this.width,
    this.hint = '---',
    this.icon,
    this.isExpanded = true,
    this.borderColor,
    this.hintStyle,
    this.textColor,
    this.colorBg,
    this.backgroundImage,
  }) : super(key: key);

  final String? title;
  final String hint;
  final Select<T>? initialValue;
  final List<Select<T>> datas;
  final Function(Select<T>) selectedValue;
  final bool isEnabled;
  final double? width;
  final Color? borderColor;
  final Icon? icon;
  final bool? isExpanded;
  final TextStyle? hintStyle;
  final Color? textColor;
  final Color? colorBg;
  final String? backgroundImage;

  @override
  Widget build(BuildContext context) {
    return title != null
        ? Row(
            mainAxisAlignment: title == null
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Offstage(
                offstage: title == null,
                child: Row(
                  children: <Widget>[
                    Text(title ?? '',
                        style: textStyle.medium(color: color.grey20)),
                    SizedBox(width: 8)
                  ],
                ),
              ),
              Container(
                width: width ?? .6.getWidth,
                height: 32.0,
                padding: EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                      color: borderColor ?? color.branding, width: 1.0),
                  color: backgroundImage != null
                      ? null
                      : colorBg ?? color.background0,
                ),
                child: DropdownCustom<T>(
                  hint: hint,
                  onChanged: selectedValue,
                  value: initialValue,
                  data: datas,
                  textColor: textColor,
                  hintColor: color.grey40,
                  icon: icon,
                  isExpanded: isExpanded!,
                  hintStyle: hintStyle,
                  iconColor: textColor,
                ),
              )
              // Container(
            ],
          )
        : Container(
            width: width,
            height: 32.0,
            padding: EdgeInsets.only(left: 8, right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border:
                  Border.all(color: borderColor ?? color.grey70, width: 1.0),
              color: colorBg ?? color.background0,
            ),
            child: DropdownCustom<T>(
              hint: hint,
              onChanged: selectedValue,
              value: initialValue,
              data: datas,
              textColor: textColor,
              hintColor: color.grey40,
              icon: icon,
              isExpanded: isExpanded!,
              hintStyle: hintStyle,
              iconColor: textColor,
            ),
          );
  }
}
