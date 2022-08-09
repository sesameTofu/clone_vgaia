import 'package:flutter_mobile/import.dart';

class IndexTableHorizontal extends BaseWidget<BaseController> {
  IndexTableHorizontal({
    Key? key,
    required this.rowWidth,
    required this.titleUp,
    this.isLeft = false,
    this.height,
    this.titleDown,
    this.textStyleUp,
    this.textStyleDown,
    this.colorTitleUp,
    this.colorTitleDown,
    this.padding,
  }) : super(key: key);
  final bool? isLeft;
  final double rowWidth;
  final double? height;
  final String? titleUp;
  final String? titleDown;
  final TextStyle? textStyleUp;
  final TextStyle? textStyleDown;
  final Color? colorTitleUp;
  final Color? colorTitleDown;
  final EdgeInsets? padding;

  @override
  Widget builder() {
    final TextStyle styleUp =
        textStyleUp ?? textStyle.custom(color: colorTitleUp);
    final TextStyle styleDown =
        textStyleDown ?? textStyle.custom(size: 12, color: colorTitleDown);
    final CrossAxisAlignment crossAxisAlignment =
        isLeft! ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    return Container(
      height: height ?? 52.height,
      padding: padding ??
          EdgeInsets.only(
              left: isLeft! ? 12.width : 4.width,
              right: isLeft! ? 4.width : 8.width),
      width: rowWidth.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: crossAxisAlignment,
        children: <Widget>[
          Text(
            titleUp ?? '---',
            style: styleUp,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 2.height),
          Text(titleDown ?? '',
              textAlign: isLeft! ? TextAlign.start : TextAlign.end,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: styleDown)
        ],
      ),
    );
  }
}
