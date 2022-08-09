import 'package:flutter_mobile/controller/session_manager.dart';
import 'package:flutter_mobile/domain/model/notification/notification.dart'
    as ntf;
import 'package:flutter_mobile/domain/usecase/notification/notification_use_case.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PageNotificationController extends BaseController {
  PageNotificationController({
    required this.type,
    this.isShowAllSecondaryActions,
    this.isForcedRefresh,
  });

  final NotificationUseCase notificationUseCase = NotificationUseCase.share;

  final RxList<ntf.Notification> notifications = RxList<ntf.Notification>();

  final TypeNotification type;
  final RxBool? isShowAllSecondaryActions;
  final Rx<TypeNotification>? isForcedRefresh;

  int offset = 0;
  int limit = 20;

  @override
  void onInit() {
    super.onInit();

    initData();
  }

  Future<void> initData() async {
    // /// Show xoá all
    ever(isShowAllSecondaryActions!, (bool callback) {
      for (final ntf.Notification notify in notifications) {
        callback
            ? notify.key?.currentState
                ?.open(actionType: SlideActionType.secondary)
            : notify.key?.currentState?.close();
      }
    });

    /// force refresh
    ever(isForcedRefresh!, (TypeNotification callback) {
      if (callback == type) {
        for (final ntf.Notification element in notifications) {
          element.readState = 1;
        }

        notifications.refresh();
      }
    });

    getNotify();
  }

  Future<void> getNotify({bool loadmore = false}) async {
    if (loadmore) {
      offset += limit;
    } else {
      offset = 0;
    }

    final List<ntf.Notification> notifys = await notificationUseCase
        .getNotification(
            msAccount: SessionManager().accountId,
            type: type.toIndex,
            offset: offset,
            limit: limit)
      ..map((ntf.Notification notify) {
        return notify.key = GlobalKey<SlidableState>();
      }).toList();

    if (notifys.isNotEmpty) {
      loadmore ? notifications.addAll(notifys) : notifications.value = notifys;
    } else {
      if (offset > 0) {
        offset -= limit;
      }
    }
  }

  Future<void> deleteNotification(ntf.Notification notify) async {
    showLoading();

    await notificationUseCase.deleteNotification(
        msAccount: SessionManager().accountId,
        date: notify.date!,
        noticeId: notify.noticeId!,
        onSuccess: () {
          AppToast.showSuccess(LocaleKeys.notification_delete_success.tr);
          notifications.remove(notify);
        },
        onFailure: (Object error) {
          AppToast.showError(getError(error));
        });

    hideLoading();
  }
}
