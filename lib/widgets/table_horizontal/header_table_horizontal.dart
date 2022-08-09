import 'package:flutter_mobile/import.dart';

class HeaderTableHorizontal extends BaseWidget<BaseController> {
  HeaderTableHorizontal(
      {Key? key,
      required this.name,
      this.isFirst = false,
      required this.rowWidth,
      this.rowHeight})
      : super(key: key) {
    edgeInsets = EdgeInsets.only(
        left: (isFirst ?? false) ? 12.width : 4.width,
        right: (isFirst ?? false) ? 4.width : 8.width,
        top: 4.height,
        bottom: 4.height);
  }

  final String name;
  late final EdgeInsets edgeInsets;
  final bool? isFirst;
  final double rowWidth;
  final double? rowHeight;

  @override
  Widget builder() {
    final AlignmentGeometry alignment =
        (isFirst ?? false) ? Alignment.centerLeft : Alignment.centerRight;
    final TextAlign textAlign =
        (isFirst ?? false) ? TextAlign.start : TextAlign.end;
    return Container(
      alignment: alignment,
      padding: edgeInsets,
      width: rowWidth.width,
      height: rowHeight ?? 24.height,
      child: Text(name,
          overflow: TextOverflow.ellipsis,
          textAlign: textAlign,
          style: textStyle.custom(size: 10, color: color.grey20)),
    );
  }
}
