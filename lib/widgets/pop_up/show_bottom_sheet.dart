import 'package:flutter_mobile/base/base_mixin.dart';

class ShowBottomSheet with BaseMixin {
  Future<T?> showBottomSheetScale<T>({
    required Widget Function(ScrollController) content,
    String? title,
    Widget? widgetBottom,
    EdgeInsets? paddingContent,
    double initHeight = 0.9,
    double minHeight = 0.4,
    double maxHeight = 0.95,
  }) =>
      Get.bottomSheet<T>(
        Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                color: Color.fromRGBO(0, 0, 0, 0.001),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: initHeight,
              minChildSize: minHeight,
              maxChildSize: maxHeight,
              builder: (BuildContext context, ScrollController controller) {
                return Column(
                  children: <Widget>[
                    //
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: color.grey60,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    //
                    Expanded(
                      child: Container(
                        padding: paddingContent ??
                            EdgeInsets.symmetric(horizontal: 32),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: color.grey90,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(8),
                            topRight: const Radius.circular(8),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            if (title != null)
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Container(
                                    color: color.grey80,
                                    child: Text(
                                      title,
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: textStyle.custom(
                                          color: color.grey0,
                                          size: 16,
                                          fontWeight: FontWeight.w500),
                                    ).paddingOnly(top: 12, bottom: 12),
                                  ),
                                  Divider(
                                    color: color.grey40,
                                    height: 2,
                                  )
                                ],
                              )
                            else
                              SizedBox(),
                            Expanded(
                              child: content(controller),
                            ),
                            widgetBottom ?? SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
      );
}
