import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/login/login_controller.dart';
import 'package:flutter_mobile/pages/login/widget_gmc/login_input_widget.dart';
import 'package:flutter_mobile/pages/login/widget_gmc/login_theme_widget.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class LoginPage extends BaseScreen<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget builder() => KeyboardDismisser(
        gestures: const <GestureType>[
          GestureType.onTap,
          GestureType.onPanUpdateDownDirection
        ],
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: _buildBody(),
          ),
        ),
      );

  @override
  LoginController? putController() => LoginController();

  Widget _buildBody() => Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 32),
              _buildTheme(),
              Expanded(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 80),
                    //_buildLogo(),
                    SizedBox(height: 20),
                    _buildInput(),
                  ],
                ),
              ),
              _buildBuide(),
            ],
          ),
        ],
      );

  Widget _buildTheme() => LoginThemeWidget();

  // Widget _buildLogo() => Image.asset(
  //       color.logoGMC,
  //       width: 0.5.getWidth,
  //     );

  Widget _buildInput() => LoginInputWidget();

  Widget _buildBuide() => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildTextButton(LocaleKeys.login_rich.tr, controller.callRick),
            _buildDivider(),
            _buildTextButton(
                LocaleKeys.login_contact.tr, controller.functionContact),
            _buildDivider(),
            _buildTextButton(
                LocaleKeys.login_hotline.tr, controller.callHotline),
            _buildDivider(),
            _buildTextButton(
                LocaleKeys.login_guide.tr, controller.functionGuide),
          ],
        ),
      );

  Widget _buildDivider() => Container(
        width: 1.0,
        height: 20.0,
        color: color.grey10,
      );

  Widget _buildTextButton(
    String title,
    Function() onTap,
  ) =>
      InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: textStyle.custom(size: 12, color: color.grey10),
          ),
        ),
      );
}
