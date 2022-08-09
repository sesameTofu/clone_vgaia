import 'package:flutter_mobile/base/base_mixin.dart';

class CheckBox extends StatelessWidget with BaseMixin {
  const CheckBox({
    Key? key,
    this.title,
    required this.value,
    required this.onPress,
    this.selectColor,
    this.unSelectColor,
    this.titleColor,
    this.showTitle = true,
  }) : super(key: key);

  final String? title;
  final bool value;
  final Function(bool) onPress;
  final Color? selectColor;
  final Color? unSelectColor;
  final Color? titleColor;

  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () => onPress(!value),
          child: Icon(
            value ? Icons.check_box : Icons.check_box_outline_blank,
            color: value
                ? selectColor ?? color.primary
                : unSelectColor ?? color.grey10,
          ),
        ),
        if (showTitle)
          Text(
            title ?? '',
            style: textStyle.regular(
              color: titleColor ?? color.grey10,
            ),
          ).paddingOnly(left: 8),
      ],
    );
  }
}
