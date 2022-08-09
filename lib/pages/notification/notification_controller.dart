import 'package:flutter_mobile/controller/session_manager.dart';
import 'package:flutter_mobile/domain/model/notification/notification_unread.dart';
import 'package:flutter_mobile/domain/usecase/notification/notification_use_case.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';

import 'widget/tab_notification.dart';

class NotificationController extends BaseController
    with GetTickerProviderStateMixin {
  final NotificationUseCase notificationUseCase = NotificationUseCase.share;

  late TabController tabController;
  PageController pageController = PageController();

  List<TabNotification> tabNotification = <TabNotification>[];

  final RxBool isLoading = RxBool(true);

  /// Show all delete notification item list
  final RxBool isShowAllSecondaryActions = RxBool(false);

  /// Forced refresh list notify
  final Rx<TypeNotification> isForcedRefresh =
      Rx<TypeNotification>(TypeNotification.NONE);

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(
      length: 4,
      vsync: this,
    );

    _initData();
  }

  void selectedTabIndex(int index) {
    pageController.jumpToPage(index);
  }

  Future<void> _initData() async {
    for (final TypeNotification e in TypeNotification.values) {
      final List<NotificationUnread> total =
          await notificationUseCase.totalUnreadNotification(
              msAccount: SessionManager().accountId, type: e.toIndex);

      switch (e) {
        case TypeNotification.ORDER:
          tabNotification.add(createTab(LocaleKeys.notification_order.tr,
              TypeNotification.ORDER, total, 0));

          break;
        case TypeNotification.SUPPORT:
          tabNotification.add(createTab(LocaleKeys.notification_support.tr,
              TypeNotification.SUPPORT, total, 1));

          break;
        case TypeNotification.SUGGESTION:
          tabNotification.add(createTab(LocaleKeys.notification_suggesstion.tr,
              TypeNotification.SUGGESTION, total, 2));

          break;
        case TypeNotification.NOTIFY:
          tabNotification.add(createTab(LocaleKeys.notification_notify.tr,
              TypeNotification.NOTIFY, total, 3));
          break;
        default:
      }
    }

    isLoading.value = false;
  }

  TabNotification createTab(String text, TypeNotification type,
      List<NotificationUnread> total, int index) {
    return TabNotification(
      text: text,
      type: type,
      showUnRead: ValueNotifier<bool>(
          total.tryGet(0) != null && total.tryGet(0)!.countUnread! > 0),
    );
  }

  Future<void> readAllNotification() async {
    showLoading();

    await notificationUseCase.readAllNotification(
        msAccount: SessionManager().accountId,
        type: tabNotification[tabController.index].type!.toIndex,
        onSuccess: () {
          tabNotification[tabController.index].showUnRead.value = false;

          /// Forced reresh list notify when mark all read
          isForcedRefresh.value = tabNotification[tabController.index].type!;
          Future<void>.delayed(Duration(seconds: 1), () {
            isForcedRefresh.value = TypeNotification.NONE;
          });

          AppToast.showSuccess(LocaleKeys.notification_mark_read.tr);
        },
        onFailure: (Object error) {
          AppToast.showError(getError(error));
        });

    hideLoading();
  }

  Future<void> hasReadAllNotification(TypeNotification type) async {
    if (tabNotification[tabController.index].showUnRead.value) {
      tabNotification[tabController.index].showUnRead.value = false;
    }
  }
}
