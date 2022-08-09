import 'package:flutter_mobile/domain/model/notification/notification.dart'
    as ntf;
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/notification/widget/item_notification.dart';
import 'package:flutter_mobile/widgets/appbar_custom.dart';
import 'package:flutter_mobile/widgets/svg_icon.dart';

import 'detail_notification_controller.dart';

class DetailNotification extends BaseScreen<DetailNotificationController> {
  DetailNotification(this.notification, {Key? key}) : super(key: key);

  final ntf.Notification notification;

  @override
  DetailNotificationController putController() {
    return DetailNotificationController(notification);
  }

  @override
  Widget builder() {
    return Scaffold(
      appBar: _buildAppBar,
      body: ItemNotification(
        notification: notification,
      ),
    );
  }

  PreferredSizeWidget get _buildAppBar => PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: AppBarCustom(
        titleAppBar: LocaleKeys.notificaiton.tr,
        actions: <Widget>[
          SizedBox(width: 8),
          InkWell(
            onTap: () => controller.deleteNotification(notification),
            child: iconSvg(
              path: AppPath.icDeleteRed,
              width: 24,
              height: 24,
            ),
          ),
          SizedBox(width: 4),
        ],
      ));
}
