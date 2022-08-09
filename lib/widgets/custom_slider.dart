import 'package:flutter_mobile/base/base_mixin.dart';

class CustomRangeShape extends RangeSliderThumbShape with BaseMixin {
  CustomRangeShape({this.colorSilder});

  final Color? colorSilder;

  static const double _thumbSize = 10.0;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(_thumbSize);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    bool? isOnTop,
    required SliderThemeData sliderTheme,
    TextDirection? textDirection,
    Thumb? thumb,
    bool? isPressed,
  }) {
    final Canvas canvas = context.canvas;
    Path thumbPath;

    final Paint paint = Paint()
      ..color = colorSilder ?? color.primary
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(center.dx - 48 / 2, center.dy - 24 / 2, 48, 24),
        Radius.circular(4),
      ),
      paint,
    );

    switch (textDirection!) {
      case TextDirection.rtl:
        switch (thumb) {
          case Thumb.start:
            thumbPath = _rightShape(_thumbSize, center);
            break;

          case Thumb.end:
          default:
            thumbPath = _leftShape(_thumbSize, center);
            break;
        }
        break;
      case TextDirection.ltr:
      default:
        switch (thumb) {
          case Thumb.start:
            thumbPath = _leftShape(_thumbSize, center);
            break;
          case Thumb.end:
          default:
            thumbPath = _rightShape(_thumbSize, center);
            break;
        }
        break;
    }

    paint
      ..color = color.grey90
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;

    canvas.drawPath(thumbPath, paint);
  }

  Path _rightShape(double size, Offset center, {bool invert = false}) {
    final Path _path = Path();

    _path.moveTo(center.dx - 48 / 6, center.dy - 24 / 4);
    _path.lineTo(center.dx - 48 / 6, center.dy + 24 / 4);

    _path.moveTo(center.dx, center.dy - 24 / 3);
    _path.lineTo(center.dx, center.dy + 24 / 3);

    _path.moveTo(center.dx + 48 / 6, center.dy - 24 / 4);
    _path.lineTo(center.dx + 48 / 6, center.dy + 24 / 4);

    return _path;
  }

  Path _leftShape(double size, Offset thumbCenter) =>
      _rightShape(size, thumbCenter, invert: true);
}
