import 'package:flutter_mobile/controller/session_manager.dart';
import 'package:flutter_mobile/domain/model/notification/notification.dart'
    as ntf;
import 'package:flutter_mobile/domain/usecase/notification/notification_use_case.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';

class DetailNotificationController extends BaseController {
  DetailNotificationController(this.notification);

  final NotificationUseCase notificationUseCase = NotificationUseCase.share;

  final ntf.Notification notification;
  @override
  void onInit() {
    super.onInit();
    _markRead();
  }

  Future<void> _markRead() async {
    // readState == 0 => unRead
    // readState == 1 => read
    if (notification.readState == 0) {
      notificationUseCase.readNotification(
          msAccount: SessionManager().accountId,
          date: notification.date!,
          noticeId: notification.noticeId!,
          onFailure: (Object error) {},
          onSuccess: () {
            notification.readState = 1;
          });
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
          Get.back(result: true);
        },
        onFailure: (Object error) {
          AppToast.showError(getError(error));
          Get.back(result: false);
        });

    hideLoading();
  }
}
