import 'package:flutter_mobile/domain/model/smart_otp/smart_otp_device_data.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/expand/settings/manager_otp/manager_otp_controller.dart';
import 'package:flutter_mobile/widgets/button/widget_button.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ManagerOtpPage extends BaseScreen<ManagerOtpController> {
  ManagerOtpPage({Key? key}) : super(key: key);

  @override
  ManagerOtpController putController() => ManagerOtpController();

  @override
  Widget builder() {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  AppBar get _buildAppBar => AppBar(title: Text(LocaleKeys.manager_otp.tr));

  Widget get _buildBody => Column(
        children: <Widget>[
          _buildTitle,
          _buildDivider,
          Expanded(
            child: SmartRefresher(
              controller: controller.refreshController,
              onRefresh: controller.getData,
              child: ValueListenableBuilder<List<SmartOtpDeviceData>>(
                  valueListenable: controller.listDevice,
                  builder: (_, List<SmartOtpDeviceData> list, Widget? widget) =>
                      ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (_, int index) =>
                              _buildItem(list[index], index),
                          separatorBuilder: (_, int index) => _buildDivider,
                          itemCount: list.length)),
            ),
          )
        ],
      );

  Divider get _buildDivider => Divider(height: 1, color: color.grey80);

  Widget get _buildTitle => Container(
        padding: EdgeInsets.all(18),
        color: color.background1,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Text(
                LocaleKeys.goline_SmartOtpDeviceInfo.tr,
                style: textStyle.regular(),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                LocaleKeys.goline_NgayKichHoat.tr,
                style: textStyle.regular(),
              ),
            ),
            SizedBox(
              width: 80,
            )
          ],
        ),
      );

  //
  Widget _buildItem(SmartOtpDeviceData inforDevice, int index) => Row(
        children: <Widget>[
          Expanded(
              flex: 5,
              child: Text(
                inforDevice.deviceInfo ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: textStyle.regular(),
              ).paddingAll(18)),
          Expanded(
              flex: 2,
              child: Text(
                inforDevice.activeDate == null
                    ? ''
                    : DateTime.parse(inforDevice.activeDate!).formatDDMMYYY,
                style: textStyle.regular(),
              )),
          SizedBox(
            width: 80,
            child: WidgetButton(
              onClick: () => controller.onCancelDevice(inforDevice, index),
              title: LocaleKeys.cancel.tr,
              bgColor: color.red50,
            ).paddingOnly(right: 8),
          )
        ],
      );
}
