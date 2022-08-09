import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/widgets/app_loading.dart';
import 'package:flutter_mobile/widgets/appbar_custom.dart';
import 'package:flutter_mobile/widgets/svg_icon.dart';
import 'package:uuid/uuid.dart';

import 'notification_controller.dart';
import 'pages/page_notification/page_notification.dart';
import 'pages/page_notification/page_notification_controller.dart';
import 'widget/tab_notification.dart';

class Notification extends BaseScreen<NotificationController> {
  Notification({Key? key}) : super(key: key);

  @override
  NotificationController putController() => NotificationController();

  @override
  Widget builder() {
    return Scaffold(
      appBar: _buildAppBar,
      body: Obx(() => controller.isLoading.value ? appLoading : _buildBody),
    );
  }

  PreferredSizeWidget get _buildAppBar => PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarCustom(
          titleAppBar: LocaleKeys.notification.tr,
          centerTitle: true,
          actions: <Widget>[
            InkWell(
              onTap: () {
                controller.readAllNotification();
              },
              child: iconSvg(
                path: AppPath.icMark,
                width: 24,
                height: 24,
              ),
            ),
            SizedBox(width: 8),
            InkWell(
              onTap: () {
                controller.isShowAllSecondaryActions.toggle();
              },
              child: iconSvg(
                path: AppPath.icDeleteRed,
                width: 24,
                height: 24,
              ),
            ),
            SizedBox(width: 4),
          ],
        ),
      );

  Widget get _buildBody => Column(
        children: <Widget>[
          _buildTabBar,
          _buildPage,
        ],
      );

  Widget get _buildTabBar => Container(
        height: 40,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: color.grey70,
            ),
            bottom: BorderSide(
              color: color.grey70,
            ),
          ),
        ),
        child: TabBar(
          controller: controller.tabController,
          tabs: controller.tabNotification,
          labelColor: color.primary,
          unselectedLabelColor: color.grey40,
          isScrollable: true,
          padding: EdgeInsets.all(0),
          indicator: BoxDecoration(
            color: color.grey80,
            border: Border(
              bottom: BorderSide(color: color.primary, width: 2.0),
            ),
          ),
          onTap: controller.selectedTabIndex,
        ),
      );

  Widget get _buildPage => Expanded(
        child: ColoredBox(
          color: color.grey100,
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            children: listTabNotification,
          ),
        ),
      );

  List<PageNotification> get listTabNotification {
    return controller.tabNotification
        .map((TabNotification e) => PageNotification(
            PageNotificationController(
              type: e.type!,
              isShowAllSecondaryActions: controller.isShowAllSecondaryActions,
              isForcedRefresh: controller.isForcedRefresh,
            ),
            Uuid().v4(),
            onReadedSuccess: controller.hasReadAllNotification))
        .toList();
  }
}
