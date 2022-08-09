import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:lottie/lottie.dart';

enum TypeButton { active, inactive, secondary, ghost }

class WidgetButton extends StatelessWidget with BaseMixin {
  const WidgetButton({
    Key? key,
    required this.title,
    this.iconWidget,
    this.titleDescript,
    required this.onClick,
    this.typeButton = TypeButton.active,
    this.width,
    this.height = 40,
    this.bgColor,
    this.textColor,
    this.bgColorSecondary,
    this.textColorSecondary,
    this.bgColorGhost,
    this.textColorGhost,
    this.colorBorder,
    this.borderRadius = 4,
    this.textWeight,
    this.textSize = 14,
    this.isShowLoading = false,
    this.icon,
  }) : super(key: key);

  final String title;
  final Icon? iconWidget;
  final String? titleDescript;
  final Function onClick;

  /// [typeButton] trạng thái chọn màu cho button `active`, `inactive`, `secondary`, `ghost`
  final TypeButton typeButton;
  final double? width;

  ///[height] mặc định = `40`
  final double height;

  /// [bgColor] măcj định màu `textGreen`
  final Color? bgColor;

  /// [textColor] măcj định màu `neutral1`
  final Color? textColor;

  /// [bgColorSecondary] măcj định màu `golin1`
  final Color? bgColorSecondary;

  /// [textColorSecondary] măcj định màu `textGreen`
  final Color? textColorSecondary;

  /// [bgColor] măcj định màu `golin1`
  final Color? bgColorGhost;

  /// [textColorGhost] măcj định màu `neutral1`
  final Color? textColorGhost;

  /// [colorBorder] mặc định only `ghost` mới có border màu neutral2
  final Color? colorBorder;

  /// [borderRadius] mặc định = `8`
  final double borderRadius;

  /// [textWeight] mặc định `active = 600` , `other = 300`
  final FontWeight? textWeight;

  /// [textSize] mặc định = `14`
  final double? textSize;

  /// [isShowLoading] hiển thị loadding trong button. Mặc định : `false`
  final bool isShowLoading;

  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: width, height: height),
      child: ElevatedButton(
        onPressed: () {
          if (!isShowLoading) {
            onClick();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            iconWidget ?? SizedBox(),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  icon ?? SizedBox(),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: colorText,
                        fontWeight: fontText,
                        fontSize: textSize),
                  ),
                ],
              ),
            ),
            if (titleDescript != null)
              Text(
                titleDescript!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: colorText, fontWeight: fontText, fontSize: textSize),
              ),
            if (isShowLoading)
              Container(
                width: 24.0,
                height: 24.0,
                margin: const EdgeInsets.only(left: 12),
                child: Lottie.asset(
                  AppPath.loading,
                  width: 24,
                  height: 24,
                  fit: BoxFit.fill,
                ),
              )
          ],
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: colorBg,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: boderButton),
        ),
      ),
    );
  }

  Color get colorBg {
    switch (typeButton) {
      case TypeButton.active:
        return bgColor ?? color.primary;
      case TypeButton.inactive:
        return (bgColor ?? color.primary).withOpacity(0.5);
      case TypeButton.secondary:
        return bgColorSecondary ?? color.background1;
      case TypeButton.ghost:
        return bgColorGhost ?? color.background1;
      default:
        return bgColor ?? color.primary;
    }
  }

  BorderSide get boderButton {
    switch (typeButton) {
      case TypeButton.ghost:
        return BorderSide(color: colorBorder ?? color.grey20);
      case TypeButton.secondary:
        return BorderSide(color: colorBorder ?? color.primary);
      case TypeButton.active:
      case TypeButton.inactive:
      default:
        return BorderSide.none;
    }
  }

  Color get colorText {
    switch (typeButton) {
      case TypeButton.active:
        return textColor ?? color.grey0;
      case TypeButton.inactive:
        return textColor ?? color.grey20;
      case TypeButton.secondary:
        return textColorSecondary ?? color.primary;
      case TypeButton.ghost:
        return textColorGhost ?? color.grey0;
      default:
        return textColor ?? color.grey0;
    }
  }

  FontWeight get fontText {
    switch (typeButton) {
      case TypeButton.active:
      case TypeButton.inactive:
        return textWeight ?? FontWeight.w600;
      case TypeButton.secondary:
      case TypeButton.ghost:
      default:
        return textWeight ?? FontWeight.w300;
    }
  }
}
