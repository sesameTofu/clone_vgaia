import 'package:flutter_mobile/base/base_page.dart';
import 'package:flutter_mobile/domain/model/notification/notification.dart'
    as ntf;
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/pages/notification/pages/detail/detail_notification.dart';
import 'package:flutter_mobile/pages/notification/widget/item_notification.dart';
import 'package:flutter_mobile/widgets/smart_load_list.dart';
import 'package:flutter_mobile/widgets/svg_icon.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grouped_list/grouped_list.dart';

import 'page_notification_controller.dart';

class PageNotification extends BaseScreen<PageNotificationController>
    with SmartLoadList {
  PageNotification(this.pageNotificationController, String _tag,
      {Key? key, required this.onReadedSuccess})
      : super(key: key, tag: _tag);

  final PageNotificationController pageNotificationController;
  final Function(TypeNotification) onReadedSuccess;

  @override
  PageNotificationController? putController() => pageNotificationController;

  @override
  Future<void> onLoading() async {
    super.onLoading();

    await controller.getNotify(loadmore: true);

    refreshController.loadComplete();
  }

  @override
  Future<void> onRefresh() async {
    super.onRefresh();

    await controller.getNotify();

    refreshController.refreshCompleted();
  }

  @override
  Widget builder() {
    return Column(
      children: <Widget>[
        Obx(() =>
            buildSmartListExpanded(enablePullDown: true, enablePullUp: true)),
      ],
    );
  }

  @override
  Widget get listViewLoad => SingleChildScrollView(
        child: GroupedListView<ntf.Notification, int>(
          shrinkWrap: true,
          // ignore: invalid_use_of_protected_member
          elements: controller.notifications.value,
          groupBy: (ntf.Notification notify) => notify.date!,
          groupComparator: (int date1, int date2) => date2.compareTo(date1),
          order: GroupedListOrder.ASC,
          groupSeparatorBuilder: (int date) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              date.formatDMMYYYY(),
              textAlign: TextAlign.center,
              style: textStyle.regular(
                color: color.grey40,
                size: 13,
              ),
            ),
          ),
          itemBuilder: (_, ntf.Notification notify) {
            return Slidable(
              key: notify.key,
              direction: Axis.horizontal,
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              secondaryActions: <Widget>[
                SlideAction(
                  onTap: () {
                    // DELETE
                    controller.deleteNotification(notify);
                  },
                  child:
                      iconSvg(path: AppPath.icDeleteRed, color: color.grey40),
                )
              ],
              child: InkWell(
                onTap: () async {
                  final dynamic result =
                      await Get.to(() => DetailNotification(notify));

                  if (result != null && result is bool && result) {
                    // xoá thành công thì xoá item trên list đi nhé
                    controller.notifications.remove(notify);
                  } else {
                    controller.notifications.refresh();
                  }

                  // If read all notify => callback remove (icon red)
                  if (!controller.notifications.any(
                      (ntf.Notification notify) => notify.readState == 0)) {
                    onReadedSuccess(controller.type);
                  }
                },
                child: ItemNotification(notification: notify),
              ),
            );
          },
        ),
      );
}
