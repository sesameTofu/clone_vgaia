import 'package:flutter_mobile/base/base_mixin.dart';

class ChipsFilter<T> extends StatelessWidget with BaseMixin {
  ChipsFilter({
    Key? key,
    required this.title,
    required this.value,
    required this.onClick,
    this.isActive = false,
    this.width,
    this.height = 40,
    this.fontSize = 12,
  }) : super(key: key);

  final String title;
  final T value;
  final bool isActive;
  final Function(T) onClick;
  final double? width;
  final double height;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: width, height: height),
      child: ElevatedButton(
        onPressed: () => onClick(value),
        child: Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: textStyle.custom(
              size: fontSize,
              color: isActive ? color.primary : color.grey40,
              fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: color.grey80,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(
              color: isActive ? color.primary : color.grey70,
            ),
          ),
        ),
      ),
    );
  }
}
