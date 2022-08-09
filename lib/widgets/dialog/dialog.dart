import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';

class CTSAlertDialog extends StatefulWidget {
  const CTSAlertDialog(
      {required this.title,
      required this.description,
      required this.onAccept,
      this.showTwoButton = true,
      this.isError = false,
      this.isDontShowAgain = false,
      this.acceptText,
      this.cancelText,
      this.onCancel,
      this.textAlign,
      this.dontShowAgain,
      this.contentWidget,
      this.colorPrimary,
      this.styleRight,
      this.styleLeft,
      Key? key,
      this.styleTitle})
      : super(key: key);

  final String title;
  final String description;
  final String? cancelText;
  final String? acceptText;

  final Function onAccept;
  final Function? onCancel;

  final bool showTwoButton;
  final bool isError;

  final TextAlign? textAlign;

  final bool isDontShowAgain;
  final Function? dontShowAgain;
  final Widget? contentWidget;
  final TextStyle? styleTitle;
  final TextStyle? styleLeft;
  final TextStyle? styleRight;
  final Color? colorPrimary;

  @override
  _ACBSAlertDialogState createState() => _ACBSAlertDialogState();
}

class _ACBSAlertDialogState extends State<CTSAlertDialog> with BaseMixin {
  // bool _dontShowAgain = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))),
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      backgroundColor: color.grey90,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 44,
            width: .9.getWidth,
            decoration: BoxDecoration(
              color: color.grey80,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4), topRight: Radius.circular(4)),
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: widget.styleTitle ??
                          textStyle.medium(
                            color: color.primary,
                            size: 15,
                          ),
                    ),
                  ),
                ),
                Container(height: 1, color: color.grey70)
              ],
            ),
          ),
          widget.contentWidget ??
              Padding(
                padding: EdgeInsets.only(
                  left: 12.width,
                  right: 12.width,
                  top: 24,
                ),
                child: Text(
                  widget.description,
                  style: textStyle.regular(
                    color: widget.isError ? color.red60 : color.grey0,
                    size: 13,
                  ),
                  textAlign: widget.textAlign ?? TextAlign.center,
                ),
              ),
          Padding(
            padding: EdgeInsets.only(
              top: 24,
              bottom: 24,
              left: 12.width,
              right: 12.width,
            ),
            child: Row(
              children: <Widget>[
                Visibility(
                  visible: widget.showTwoButton,
                  child: Expanded(
                    child: InkWell(
                      onTap: () {
                        if (isNotNull(widget.onCancel)) {
                          widget.onCancel!();
                          return;
                        }

                        Navigator.of(context).pop();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 32,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                                color: widget.colorPrimary ?? color.primary,
                                width: 1)),
                        child: Text(
                          widget.cancelText ?? LocaleKeys.cancel.tr,
                          style: widget.styleLeft ??
                              textStyle.bold(
                                color: widget.colorPrimary ?? color.primary,
                                size: 13,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: widget.showTwoButton ? 16.width : 0),
                Expanded(
                  child: InkWell(
                    onTap: () => widget.onAccept(),
                    child: Container(
                      alignment: Alignment.center,
                      height: 32,
                      decoration: BoxDecoration(
                        color: widget.colorPrimary ?? color.primary,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        widget.acceptText ?? LocaleKeys.confirm.tr,
                        style: widget.styleRight ??
                            textStyle.bold(
                              color: color.grey100,
                              size: 13,
                            ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
