import 'package:flutter_mobile/base/import_base.dart';
import 'package:flutter_mobile/controller/notification_controller.dart';
import 'package:flutter_mobile/generated/locales.g.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/global/app_router.dart';
import 'package:flutter_mobile/pages/expand/expand_controller.dart';
import 'package:flutter_mobile/widgets/appbar_custom.dart';
import 'package:flutter_mobile/widgets/button/widget_button.dart';
import 'package:flutter_mobile/widgets/svg_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExpandPage extends BaseScreen<ExpandController> {
  ExpandPage({Key? key}) : super(key: key);

  @override
  ExpandController? putController() => ExpandController();

  @override
  Widget builder() {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  PreferredSize get _buildAppBar => PreferredSize(
        child: AppBarCustom(
          titleAppBar: LocaleKeys.goline_Addition.tr,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Get.find<NotifyController>().setClearNewNotify();
                Get.toNamed(AppRouter.routerNotification);
              },
              icon: Obx(() => Stack(
                    children: <Widget>[
                      SvgPicture.asset(
                        AppPath.icNotification,
                        color: color.grey0,
                        width: 16,
                        height: 20,
                      ),
                      if (Get.find<NotifyController>().hasNewNotification.value)
                        Positioned(
                          right: 0,
                          child: iconSvg(path: AppPath.icRedDot),
                        )
                    ],
                  )),
            )
          ],
          automaticallyImplyLeading: false,
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      );

  Widget get _buildBody => ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          WidgetButton(
            onClick: controller.onClickSettings,
            title: LocaleKeys.setup.tr,
          ),
          SizedBox(height: 10.0),
          WidgetButton(
              onClick: () {
                Get.toNamed(AppRouter.routerMoneyTransfer);
              },
              title: LocaleKeys.transfers_transfers.tr),
          SizedBox(height: 10.0),
          WidgetButton(
            onClick: controller.onClickStatement,
            title: LocaleKeys.setting_page_statement_report.tr,
          ),
          SizedBox(height: 10.0),
          WidgetButton(
              onClick: () {
                Get.toNamed(AppRouter.routerRecommend);
              },
              title: LocaleKeys.setting_page_recommendations.tr),
          SizedBox(height: 10.0),
          WidgetButton(
            onClick: controller.onLogOut,
            title: LocaleKeys.logout.tr,
          ),
          SizedBox(height: 10.0),
          WidgetButton(
            onClick: controller.onClickStockTransfer,
            title: LocaleKeys.stock_transfer_stock_transfer.tr,
          )
        ],
      );
}
