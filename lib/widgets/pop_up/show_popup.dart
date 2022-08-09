import 'package:flutter_mobile/global/app_theme.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/widgets/button/widget_button.dart';

class ShowPopup with BaseMixin {
  Future<T?> popUpNoty<T>(
          {String? title,
          required String content,
          String? textButton,
          Color? bgColorButton,
          bool barrier = true,
          Function? onClickButton}) async =>
      await Get.dialog<T>(
        Dialog(
          elevation: 0,
          backgroundColor: Get.find<AppThemeBase>().theme.background3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // title
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  title ?? 'Thông báo',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Get.find<AppThemeBase>().theme.green50),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  textScaleFactor: 1,
                ),
              ),
              Divider(
                height: 1,
                color: Get.find<AppThemeBase>().theme.grey0,
              ),
              // content
              Container(
                padding: const EdgeInsets.all(12),
                constraints: BoxConstraints(maxHeight: 200),
                child: SingleChildScrollView(
                  child: Text(
                    content,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Get.find<AppThemeBase>().theme.grey20),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 1,
                  ),
                ),
              ),
              // button
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: WidgetButton(
                  onClick: () {
                    Get.back();
                    if (onClickButton != null) {
                      return onClickButton();
                    }
                  },
                  title: textButton ?? 'Đóng',
                  bgColor: bgColorButton,
                  height: 32,
                  borderRadius: 4,
                ),
              ),
            ],
          ),
        ),
        barrierDismissible: barrier,
      );

  // dialog confirm
  Future<T?> popUpConfirm<T>(
          {String? title,
          required String content,
          bool barrier = true,
          String? textCancel,
          String? textConfirm,
          Color? bgColorConfirm,
          Function? onClickConfirm}) async =>
      await Get.dialog<T>(
        Dialog(
          elevation: 0,
          backgroundColor: Get.find<AppThemeBase>().theme.grey80,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // title
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  title ?? 'Thông báo',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Get.find<AppThemeBase>().theme.green50),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  textScaleFactor: 1,
                ),
              ),
              Divider(
                height: 1,
                color: color.grey20,
              ),
              // content
              Container(
                padding: const EdgeInsets.all(12),
                constraints: BoxConstraints(maxHeight: 200),
                child: SingleChildScrollView(
                  child: Text(
                    content,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Get.find<AppThemeBase>().theme.grey20),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 1,
                  ),
                ),
              ),
              // button
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: WidgetButton(
                        typeButton: TypeButton.secondary,
                        onClick: () {
                          Get.back();
                        },
                        title: textCancel ?? 'Đóng',
                        height: 32,
                        borderRadius: 4,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: WidgetButton(
                        onClick: () {
                          Get.back(result: true);
                          if (onClickConfirm != null) {
                            return onClickConfirm();
                          }
                        },
                        title: textConfirm ?? 'Đồng ý',
                        bgColor: bgColorConfirm,
                        height: 32,
                        borderRadius: 4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        barrierDismissible: barrier,
      );

  Future<T?> popUpCustom<T>(
          {String? title,
          required Widget content,
          Widget? button,
          bool barrier = true,
          String? textCancel,
          String? textConfirm,
          Color? bgColorConfirm,
          Function? onClickConfirm,
          bool isCanBackConfirm = true}) async =>
      await Get.dialog<T>(
        Dialog(
          elevation: 0,
          backgroundColor: Get.find<AppThemeBase>().theme.grey80,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // title
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  title ?? 'Thông báo',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Get.find<AppThemeBase>().theme.green50),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  textScaleFactor: 1,
                ),
              ),
              Divider(
                height: 1,
                color: Get.find<AppThemeBase>().theme.grey10,
              ),
              // content
              Container(
                padding: const EdgeInsets.all(12),
                constraints: BoxConstraints(maxHeight: 0.6.getHeight),
                child: SingleChildScrollView(child: content),
              ),
              // button
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: button ??
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: WidgetButton(
                            typeButton: TypeButton.secondary,
                            onClick: () {
                              Get.back();
                            },
                            title: textCancel ?? 'Đóng',
                            height: 32,
                            borderRadius: 4,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: WidgetButton(
                            onClick: () {
                              if (isCanBackConfirm) {
                                Get.back(result: true);
                              }
                              if (onClickConfirm != null) {
                                return onClickConfirm();
                              }
                            },
                            title: textConfirm ?? 'Đồng ý',
                            bgColor: bgColorConfirm,
                            height: 32,
                            borderRadius: 4,
                          ),
                        ),
                      ],
                    ),
              ),
            ],
          ),
        ),
        barrierDismissible: barrier,
      );

  Future<T?> popUpCustom2<T>({
    required Widget content,
    bool barrier = true,
  }) async =>
      await Get.dialog<T>(
        Dialog(
            elevation: 0,
            backgroundColor: Get.find<AppThemeBase>().theme.grey80,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: content),
        barrierDismissible: barrier,
      );
}
