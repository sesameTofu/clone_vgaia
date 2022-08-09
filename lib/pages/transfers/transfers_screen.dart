import 'package:flutter/cupertino.dart';
import 'package:flutter_mobile/global/app_router.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/transfers/page/history_transfer_page.dart';
import 'package:flutter_mobile/pages/transfers/page/money_transfer_page.dart';
import 'package:flutter_mobile/pages/transfers/transfers_controller.dart';
import 'package:flutter_mobile/widgets/appbar_custom.dart';

class TransferScreen extends BaseScreen<TransferController> {
  TransferScreen({Key? key}) : super(key: key);

  @override
  String? screenName() => AppRouter.routerMoneyTransfer;

  @override
  Widget builder() {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarCustom(
            widgetTitle: ValueListenableBuilder<int>(
              valueListenable: controller.indexPage,
              builder: (BuildContext context, int index, Widget? child) =>
                  CupertinoSlidingSegmentedControl<int>(
                children: <int, Widget>{
                  0: _buildSwitchTabChild(
                      title: LocaleKeys.transfers_transfers.tr, type: 0),
                  1: _buildSwitchTabChild(
                      title: LocaleKeys.transfers_history.tr, type: 1),
                },
                onValueChanged: controller.onChangePage,
                thumbColor: color.grey70,
                backgroundColor: color.grey100,
                groupValue: controller.indexPage.value,
              ),
            ),
          ),
        ),
        body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            children: <Widget>[
              MoneyTransferPage(controllerPage: controller),
              HistoryTransferPage(controllerPage: controller)
            ]),
      ),
    );
  }

  Widget _buildSwitchTabChild({required int type, required String title}) =>
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
        padding: EdgeInsets.symmetric(horizontal: 16.width, vertical: 4),
        child: Text(
          title,
          style: textStyle.custom(
            color: controller.indexPage.value == type
                ? color.grey10
                : color.grey40,
            size: 12,
            fontWeight: controller.indexPage.value == type
                ? FontWeight.w600
                : FontWeight.w400,
          ),
        ),
      );

  @override
  TransferController? putController() {
    return TransferController();
  }
}
