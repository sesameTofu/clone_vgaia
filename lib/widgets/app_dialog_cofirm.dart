import 'package:flutter_mobile/import.dart';

class AppDialogCofirmDialog with BaseMixin {
  Future<T?> show<T>(
      {required String content,
      bool barrierDismissible = true,
      Widget? contentWidget,
      VoidCallback? onCancel,
      void Function()? onConfirm}) async {
    return Get.defaultDialog<T?>(
        title: LocaleKeys.notice.tr,
        middleText: content,
        contentPadding: EdgeInsets.all(16.0),
        confirm: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(width: 16.width),
            SizedBox(
              width: 100.width,
              child: TextButton(
                  style: TextButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  onPressed: () {
                    if (onCancel != null) {
                      onCancel.call();
                    } else {
                      Get.back();
                    }
                  },
                  child: Text(LocaleKeys.cancel.tr)),
            ),
            SizedBox(width: 16.width),
            Visibility(
              visible: onConfirm != null,
              child: SizedBox(
                width: 100.width,
                child: TextButton(
                    style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      backgroundColor: color.primary,
                      primary: color.grey20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    onPressed: () {
                      if (onConfirm != null) {
                        return onConfirm();
                      } else {
                        Get.back();
                      }
                    },
                    child: Text(LocaleKeys.confirm.tr)),
              ),
            ),
          ],
        ),
        // cancelTextColor: appColor.theme.neutral1,
        // confirmTextColor: appColor.theme.neutral1,
        // buttonColor: appColor.theme.barBackgroundColor,
        barrierDismissible: barrierDismissible,
        radius: 16,
        content: contentWidget);
  }
}
