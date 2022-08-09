import 'package:flutter_mobile/base/base_mixin.dart';

class AppButton extends StatelessWidget with BaseMixin {
  AppButton(
      {Key? key,
      required this.title,
      this.background = Colors.white,
      this.colorTile,
      this.fontSize = 16,
      this.padding,
      this.margin,
      this.fontWeight = FontWeight.w500,
      this.borderCircle = 4,
      this.height,
      this.width,
      this.onTap,
      this.borderColor = Colors.black,
      this.isShowLoading = false,
      this.style,
      this.icon})
      : super(key: key);

  final Color background;
  final Color borderColor;
  final String title;
  final Color? colorTile;
  final FontWeight fontWeight;
  final double fontSize;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final void Function()? onTap;
  final double borderCircle;
  final bool isShowLoading;
  final Widget? icon;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.all(0),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderCircle),
        onTap: () {
          if (onTap != null && !isShowLoading) {
            return onTap!();
          }
        },
        child: Container(
          padding: padding ?? EdgeInsets.all(12),
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(borderCircle),
              border: Border.all(color: borderColor, width: 0.5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Center(
              //   child: Text(title,
              //       style: TextStyle(
              //           color: colorTile,
              //           fontSize: fontSize,
              //           fontWeight: fontWeight)),
              // ),
              Center(
                child: Text.rich(
                  TextSpan(children: <InlineSpan>[
                    WidgetSpan(
                        child: icon ?? SizedBox(),
                        alignment: PlaceholderAlignment.middle),
                    TextSpan(text: title)
                  ]),
                  style: style ??
                      textStyle.custom(
                          color: colorTile ?? color.grey10,
                          size: fontSize,
                          fontWeight: fontWeight),
                ),
              ),
              Visibility(
                visible: isShowLoading,
                child: SizedBox(
                  width: 8.0,
                ),
              ),
              Visibility(
                visible: isShowLoading,
                child: SizedBox(
                  width: 16.0,
                  height: 16.0,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
