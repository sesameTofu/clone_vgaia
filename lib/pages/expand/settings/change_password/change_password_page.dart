import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/expand/settings/change_password/change_password_controller.dart';
import 'package:flutter_mobile/pages/expand/settings/views/segment_tab_password.dart';
import 'package:flutter_mobile/widgets/button/widget_button.dart';
import 'package:flutter_mobile/widgets/text_field/build_input_text.dart';

class ChangePasswordPage extends BaseScreen<ChangePasswordController> {
  ChangePasswordPage({Key? key}) : super(key: key);

  @override
  ChangePasswordController putController() => ChangePasswordController();

  @override
  Widget builder() {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: _buildAppBar,
        body: _buildBody,
      ),
    );
  }

  AppBar get _buildAppBar =>
      AppBar(title: Text(LocaleKeys.goline_ChangePassword.tr));

  Widget get _buildBody => ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          SizedBox(height: 18),
          _buildSegment,
          SizedBox(height: 18),
          _buildInputCurrentPassword,
          SizedBox(height: 18),
          _buildInputNewPassword,
          SizedBox(height: 18),
          _buildInputConfirmPassword,
          SizedBox(height: 18),
          _buildButtonChange
        ],
      ).paddingSymmetric(horizontal: 18);

  //
  Widget get _buildSegment => SegmentTabPassword(
        titileTab1: LocaleKeys.goline_LoginPassword.tr,
        titileTab2: LocaleKeys.goline_OrderPassword.tr,
        onClick: (int p0) => controller.onChangeSegmant(p0),
      );

  // Mật khẩu cũ
  Widget get _buildInputCurrentPassword => BuildInputText(
        hintText: LocaleKeys.goline_OldPassword.tr,
        controller: controller.currentPasswordCtrl,
        currentNode: controller.currentNode,
        obscureText: true,
        fillColor: color.background1,
      );

  // Mật khẩu mới
  Widget get _buildInputNewPassword => BuildInputText(
        hintText: LocaleKeys.goline_NewPassword.tr,
        controller: controller.newPasswordCtrl,
        currentNode: controller.newNode,
        obscureText: true,
        fillColor: color.background1,
      );

  // Nhập lại mật khẩu Mới
  Widget get _buildInputConfirmPassword => BuildInputText(
        hintText: LocaleKeys.goline_ReEnterNewPassword.tr,
        controller: controller.confirmPasswordCtrl,
        currentNode: controller.confirmNode,
        obscureText: true,
        iconNextTextInputAction: TextInputAction.done,
        submitFunc: () => controller.onChangePassword(),
        fillColor: color.background1,
      );

  // button
  Widget get _buildButtonChange => ValueListenableBuilder<bool>(
        valueListenable: controller.isCanClick,
        builder: (_, bool isActive, Widget? widget) => WidgetButton(
            onClick: controller.onChangePassword,
            title: LocaleKeys.goline_ChangePassword.tr,
            bgColor: isActive ? color.green50 : color.green60.withOpacity(0.5)),
      );
}
