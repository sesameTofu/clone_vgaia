import 'package:flutter/cupertino.dart';
import 'package:flutter_mobile/domain/model/service_notice.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/expand/settings/setting_notification/setting_notification_controller.dart';
import 'package:flutter_mobile/pages/expand/settings/views/widgets_detail.dart';

class SettingNotificationPage
    extends BaseScreen<SettingNotificationController> {
  SettingNotificationPage({Key? key}) : super(key: key);

  @override
  SettingNotificationController putController() =>
      SettingNotificationController();
  @override
  Widget builder() {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  AppBar get _buildAppBar =>
      AppBar(title: Text(LocaleKeys.setting_notification.tr));

  Widget get _buildBody => ValueListenableBuilder<List<ServiceNotice>>(
        valueListenable: controller.listNotify,
        builder: (_, List<ServiceNotice> list, Widget? widget) =>
            ListView.separated(
          physics: ClampingScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (_, int index) =>
              _buildItemNotification(list[index], index),
          separatorBuilder: (_, __) => _buildDivider,
        ),
      );

  Divider get _buildDivider => Divider(height: 1, color: color.grey80);

  // item Thông báo
  Widget _buildItemNotification(ServiceNotice notice, int index) =>
      WidgetsDetail().itemSetting(
        // ignore: todo
        // TODO: check trường hợp ngôn ngữ Tiếng Anh
        title: (vn ? notice.serviceGroupName : notice.serviceGroupName) ?? '',
        onClick: () {},
        iconAction: CupertinoSwitch(
          activeColor: color.green50,
          value:
              notice.status != null && notice.status == 1, // 1: đã chọn, 0: hủy
          onChanged: (bool noti) {
            controller.updateStatusNotification(notice, index);
          },
        ).paddingOnly(left: 10),
      );
}
