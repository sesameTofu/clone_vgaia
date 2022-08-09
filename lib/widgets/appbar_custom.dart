import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_svg/svg.dart';

class AppBarCustom extends BaseWidget<BaseController> {
  AppBarCustom({
    Key? key,
    this.titleAppBar = '',
    this.widgetTitle,
    this.widgetBottom,
    this.centerTitle = true,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.callBack,
    this.backgroundColor,
  }) : super(key: key);

  final String titleAppBar;
  final Widget? widgetTitle;
  final PreferredSize? widgetBottom;
  final bool centerTitle;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final VoidCallback? callBack;
  final Color? backgroundColor;

  @override
  Widget builder() {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: <Widget>[
        ...actions ?? <Widget>[],
        SizedBox(width: 12),
      ],
      bottom: widgetBottom ??
          PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Container(color: color.grey80, height: 1)),
      backgroundColor: backgroundColor ?? color.grey90,
      centerTitle: centerTitle,
      leading: _buildLeading(),
      title: widgetTitle ??
          Text(titleAppBar, style: textStyle.medium(size: sized.fontMedium)),
    );
  }

  Widget? _buildLeading() {
    if (!automaticallyImplyLeading) {
      return null;
    }
    return IconButton(
      onPressed: () {
        if (callBack != null) {
          callBack!();
        } else {
          Get.back();
        }
      },
      icon: SvgPicture.asset(AppPath.left, height: 30, color: color.grey0),
    );
  }

  @override
  String? screenName() => null;
}
