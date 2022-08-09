import 'package:flutter_mobile/global/app_const.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/login/login_controller.dart';
import 'package:flutter_mobile/widgets/svg_icon.dart';

class LoginThemeWidget extends BaseWidget<LoginController> {
  LoginThemeWidget({Key? key}) : super(key: key);

  @override
  Widget builder() => Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildChangeLang(),
            _buildChangeTheme(),
          ],
        ),
      );

  Widget _buildChangeLang() => IconButton(
        onPressed: () {
          controller.changeLang(vn ? AppConst.langEN : AppConst.langVI);
        },
        padding: EdgeInsets.zero,
        icon: Text(
          (vn ? 'VIE' : 'ENG').toUpperCase(),
          style: textStyle.custom(size: 16),
        ),
      );

  Widget _buildChangeTheme() => IconButton(
      onPressed: () => controller.changeTheme(),
      padding: EdgeInsets.zero,
      icon: iconSvg(path: AppPath.theme));
}
