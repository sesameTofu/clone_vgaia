import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/expand/settings/setting_controller.dart';
import 'package:flutter_mobile/pages/expand/settings/views/widgets_detail.dart';
import 'package:flutter_mobile/widgets/button/switch_button_custom.dart';
import 'package:flutter_mobile/widgets/svg_icon.dart';

class SettingsPage extends BaseScreen<SettingsController> {
  SettingsPage({Key? key}) : super(key: key);

  @override
  SettingsController? putController() => SettingsController();
  @override
  Widget builder() {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  AppBar get _buildAppBar =>
      AppBar(title: Text(LocaleKeys.goline_Settings.tr), centerTitle: false);

  Widget get _buildBody => Container(
        color: color.background1,
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            _buildSmartOtp,
            _buildDivider,
            _buildSetUpTradingAccount,
            _buildDivider,
            _buildItemBiometric,
            _buildDivider,
            _buildItemChangePassword,
            _buildDivider,
            _buildItemTheme,
            _buildDivider,
            _buildItemLanguage,
          ],
        ),
      );

  Divider get _buildDivider => Divider(height: 1, color: color.grey80);

  Widget get _buildIconRight => iconSvg(
          path: AppPath.icArrowRight, height: 24, width: 24, color: color.grey0)
      .paddingOnly(left: 10);

  // Xác thực sinh trắc học
  Widget get _buildItemBiometric => ValueListenableBuilder<bool>(
      valueListenable: controller.isRegisterBio,
      builder: (_, bool value, Widget? widget) {
        return WidgetsDetail().itemSetting(
          pathIconLeading: AppPath.icFingerId,
          title: LocaleKeys.biometric_authen.tr,
          onClick: () {
            controller.onRegisterBio(true);
          },
        );
      });

  // Smart OTP
  Widget get _buildSmartOtp => ValueListenableBuilder<bool>(
      valueListenable: controller.isRegisterBio,
      builder: (_, bool value, Widget? widget) {
        return WidgetsDetail().itemSetting(
          pathIconLeading: AppPath.icOTP,
          title: LocaleKeys.goline_SmartOtp.tr,
          onClick: () {},
          iconAction: Row(children: <Widget>[
            Text('Chưa đăng ký',
                style: textStyle.custom(
                    size: 16.0, fontFamily: 'Roboto', color: color.red50)),
            Icon(
              Icons.keyboard_arrow_right,
              color: color.white,
              size: 20.0,
            )
          ]),
        );
      });

  // Thiết lập tài khoản giao dịch
  Widget get _buildSetUpTradingAccount => ValueListenableBuilder<bool>(
      valueListenable: controller.isRegisterBio,
      builder: (_, bool value, Widget? widget) {
        return WidgetsDetail().itemSetting(
            pathIconLeading: AppPath.icSchelude,
            title: LocaleKeys.goline_set_up_trading_account.tr,
            onClick: () {});
      });

  // Ngôn ngữ
  Widget get _buildItemLanguage => ValueListenableBuilder<String>(
      valueListenable: controller.currentLanguage,
      builder: (_, String value, Widget? widget) => WidgetsDetail().itemSetting(
          pathIconLeading: AppPath.icLanguage,
          title: LocaleKeys.goline_Language.tr,
          onClick: () {},
          widgetBottom: Container(
            margin: EdgeInsets.only(top: 10.0),
            alignment: Alignment.centerLeft,
            child: Row(
              children: <Widget>[
                CustomSwitch(
                  value:
                      // ignore: avoid_bool_literals_in_conditional_expressions
                      value != LocaleKeys.setting_page_selected_language_vi.tr
                          ? true
                          : false,
                  onChanged: (bool val) {
                    controller.onChnaglanguage(val);
                  },
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(value,
                    style: textStyle.custom(
                      size: 16.0,
                      fontFamily: 'Roboto',
                    )),
              ],
            ),
          )));

  // Thiết lập giao diện
  Widget get _buildItemTheme => ValueListenableBuilder<bool>(
      valueListenable: controller.isDarkTheme,
      builder: (_, bool value, Widget? widget) => WidgetsDetail().itemSetting(
          pathIconLeading: AppPath.icTheme,
          title: LocaleKeys.setting_theme.tr,
          onClick: () {},
          widgetBottom: Container(
            margin: EdgeInsets.only(top: 10.0),
            alignment: Alignment.centerLeft,
            child: Row(
              children: <Widget>[
                CustomSwitch(
                  value: value,
                  onChanged: (bool val) {
                    controller.onChangeTheme(val);
                  },
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(value ? LocaleKeys.dark.tr : LocaleKeys.light.tr,
                    style: textStyle.custom(
                      size: 16.0,
                      fontFamily: 'Roboto',
                    )),
              ],
            ),
          )));

  // Thiết lập thông báo
  // ignore: unused_element
  Widget get _buildItemNotification => WidgetsDetail().itemSetting(
      pathIconLeading: AppPath.icNotification,
      title: LocaleKeys.setting_notification.tr,
      onClick: controller.onSettingNotification,
      iconAction: _buildIconRight);

  // Xác thực mật khẩu cấp 2
  // ignore: unused_element
  Widget get _buildItemTwoAuthen => WidgetsDetail().itemSetting(
      pathIconLeading: AppPath.icOTP,
      title: LocaleKeys.setting_two_authen.tr,
      onClick: controller.onSettingTwoAuthen,
      iconAction: _buildIconRight);

  // Đăng ký xác thực mật khẩu cấp 2
  // ignore: unused_element
  Widget get _buildItemRegisterTwoAuthen => WidgetsDetail().itemSetting(
      pathIconLeading: AppPath.icPassword,
      title: LocaleKeys.register_two_authen.tr,
      onClick: controller.onRegisterTwoAuthen,
      iconAction: _buildIconRight);

  // Quản lý smart otp
  // ignore: unused_element
  Widget get _buildItemManagerOTP => WidgetsDetail().itemSetting(
      pathIconLeading: AppPath.icList,
      title: LocaleKeys.manager_otp.tr,
      onClick: controller.onManagerOtp,
      iconAction: _buildIconRight);

  // Đổi mật khẩu
  // ignore: unused_element
  Widget get _buildItemChangePassword => WidgetsDetail().itemSetting(
      pathIconLeading: AppPath.icPassword,
      title: LocaleKeys.goline_ChangePassword.tr,
      onClick: controller.onChangePassword);

  // //
  // Widget get _buildChangeLanguage => Padding(
  //       padding: const EdgeInsets.only(top: 8.0),
  //       child: Row(
  //         children: <Widget>[
  //           _buildIconLanguage(AppPath.viLang, AppConst.langVI),
  //           SizedBox(height: 10.0),
  //           _buildIconLanguage(AppPath.enLang, AppConst.langEN),
  //         ],
  //       ),
  //     );

  // Widget _buildIconLanguage(String path, String lang) => Expanded(
  //       child: Row(
  //         children: <Widget>[
  //           InkWell(
  //             onTap: () {
  //               controller.onChnaglanguage(lang);
  //             },
  //             child: Image.asset(
  //               path,
  //               width: 30,
  //               height: 30,
  //             ),
  //           ),
  //           SizedBox(width: 12),
  //           Text(
  //             controller.titleLang(lang),
  //             style: textStyle.regular(),
  //           )
  //         ],
  //       ),
  //     );
}
