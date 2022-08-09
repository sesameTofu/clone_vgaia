import 'package:flutter_mobile/domain/model/local/user_local_model.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/login/login_controller.dart';
import 'package:flutter_mobile/widgets/button/widget_button.dart';
import 'package:flutter_mobile/widgets/svg_icon.dart';
import 'package:flutter_mobile/widgets/text_field/build_input_text.dart';
import 'package:local_auth/local_auth.dart';

class LoginInputWidget extends BaseWidget<LoginController> {
  LoginInputWidget({Key? key}) : super(key: key);

  @override
  Widget builder() => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildInputUserName(),
            SizedBox(height: 10.0),
            _buildInputPass(),
            // _buildCheckSavePassW(),
            SizedBox(height: 27.0),
            _buildButtonLogin(),
            SizedBox(height: 16.0),
            _buildNode(),
          ],
        ),
      );

  Widget _buildInputUserName() => BuildInputText(
        currentNode: controller.focusUserName,
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
        hintText: LocaleKeys.hint_account_login.tr,
        controller: controller.accountCtrl,
        widgetLeading: iconSvg(
          path: AppPath.profile,
          width: 24.width,
          height: 24.width,
          color: color.grey40,
        ),
        hintStyle: textStyle.regular(color: color.grey40),
        suffixIcon: PopupMenuButton<UserLocalModel>(
          color: color.grey80,
          elevation: 2,
          padding: EdgeInsets.only(top: 10.0),
          onSelected: controller.changeAccount,
          itemBuilder: (BuildContext context) {
            return controller.listAccountLocal.map((UserLocalModel account) {
              return PopupMenuItem<UserLocalModel>(
                value: account,
                child: Text(
                  account.userName ?? '',
                  style: textStyle.regular(color: color.grey20),
                ),
              );
            }).toList();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Icon(
              Icons.arrow_drop_down,
              color: color.grey10,
              size: 30,
            ),
          ),
        ),
      );

  Widget _buildInputPass() => BuildInputText(
        hintText: LocaleKeys.password.tr,
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
        controller: controller.passwordCtrl,
        obscureText: true,
        hintStyle: textStyle.regular(color: color.grey40),
        widgetLeading: iconSvg(
          path: AppPath.lock,
          width: 24.width,
          height: 24.width,
          color: color.grey40,
        ),
      );

  // Widget _buildCheckSavePassW() => Obx(() => Padding(
  //       padding: EdgeInsets.symmetric(vertical: 12.0),
  //       child: CheckBox(
  //         value: controller.isSavePassW.value,
  //         onPress: (bool? value) {
  //           controller.changeIsSavePassW();
  //         },
  //         title: 'Lưu tài khoản đăng nhập',
  //         titleColor: color.grey40,
  //         mainAxisAlignment: MainAxisAlignment.start,
  //       ),
  //     ));

  Widget _buildButtonLogin() => Row(
        children: <Widget>[
          Expanded(
              child: Obx(
            () => WidgetButton(
                title: LocaleKeys.login_login.tr,
                width: double.infinity,
                bgColor: controller.isShowButtonLogin.value
                    ? color.primary
                    : color.grey60,
                textColor: color.grey0,
                onClick: () {
                  WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
                  controller.login();
                }),
          )),
          _buildBiometric(),
        ],
      );

  Widget _buildBiometric() => ValueListenableBuilder<BiometricType>(
        valueListenable: controller.biometricType,
        builder: (BuildContext context, BiometricType value, Widget? child) {
          return IconButton(
            onPressed: () {
              controller.loginBiometric();
            },
            padding: EdgeInsets.zero,
            icon: iconSvg(
              path: value.path,
              color: color.primary,
              width: 30,
              height: 30,
            ),
          );
        },
      );

  Widget _buildNode() => Obx(() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // if (GlobalDataManager().showRegister.value)
            //   InkWell(
            //     onTap: () {
            //       Get.toNamed(AppRouter.routerEkyc);
            //     },
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Text(
            //         LocaleKeys.login_open_account.tr,
            //         style: textStyle.medium(color: color.primary),
            //       ),
            //     ),
            //   )
            // else
            //   SizedBox(),
            InkWell(
              onTap: () {
                //Get.toNamed(AppRouter.routerForgotPassword);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  LocaleKeys.login_fogot_pass.tr,
                  style: textStyle.medium(color: color.grey40),
                ),
              ),
            ),
          ],
        ),
      ));
}
