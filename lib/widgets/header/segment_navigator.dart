import 'package:flutter/material.dart';
import 'package:flutter_mobile/global/app_theme.dart';
import 'package:get/get.dart';

class SementNavigator extends StatefulWidget {
  const SementNavigator(
      {Key? key,
      this.onClick,
      required this.title1,
      this.title2,
      this.bgColorSelect,
      this.textColorSelect,
      this.bgColorUnSelect,
      this.textColorUnSelect,
      this.isFlexibale = false})
      : super(key: key);

  final String title1;

  final String? title2;

  final Function(int)? onClick;

  final Color? bgColorSelect;

  final Color? textColorSelect;

  final Color? bgColorUnSelect;

  final Color? textColorUnSelect;

  final bool isFlexibale;

  @override
  _SementNavigatorState createState() => _SementNavigatorState();
}

class _SementNavigatorState extends State<SementNavigator> {
  late double _widthTab1;
  late double _widthTab2;

  late Color _bgColorSelect;

  late Color _textColorSelect;

  late Color _bgColorUnSelect;

  late Color _textColorUnSelect;

  int _currentSelect = 0;

  @override
  void initState() {
    super.initState();
    _widthTab1 = _textSize(widget.title1).width;
    _widthTab2 = widget.title2 == null ? 0 : _textSize(widget.title2!).width;

    _bgColorSelect =
        widget.bgColorSelect ?? Get.find<AppThemeBase>().theme.background3;
    _textColorSelect =
        widget.textColorSelect ?? Get.find<AppThemeBase>().theme.green50;
    _bgColorUnSelect =
        widget.bgColorUnSelect ?? Get.find<AppThemeBase>().theme.grey0;
    _textColorUnSelect =
        widget.textColorUnSelect ?? Get.find<AppThemeBase>().theme.grey20;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: _bgColorUnSelect, borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.hardEdge,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(child: _buildItemSegment(0, widget.title1, _widthTab1)),
          if (widget.title2 != null)
            Flexible(child: _buildItemSegment(1, widget.title2!, _widthTab2))
        ],
      ),
    );
  }

  Widget _buildItemSegment(int id, String title, double width) =>
      GestureDetector(
        onTap: () {
          _currentSelect = id;
          setState(() {});
          if (widget.onClick != null) {
            widget.onClick!(id);
          }
        },
        child: Container(
          padding: EdgeInsets.all(4),
          width: widget.isFlexibale ? width : 100,
          constraints:
              BoxConstraints(maxWidth: Get.size.width / 3, minWidth: 94),
          decoration: BoxDecoration(
              color: _currentSelect == id ? _bgColorSelect : _bgColorUnSelect,
              borderRadius: _currentSelect == id
                  ? BorderRadius.circular(4)
                  : BorderRadius.zero),
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.center,
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color:
                  _currentSelect == id ? _textColorSelect : _textColorUnSelect,
            ),
          ),
        ),
      );

  Size _textSize(String text, {TextStyle? style}) {
    final TextPainter _textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return _textPainter.size;
  }
}
