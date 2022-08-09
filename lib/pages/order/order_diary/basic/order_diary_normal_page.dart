import 'package:flutter_mobile/domain/model/order_diary/order_list_model.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/order/order_diary/basic/order_diary_normal_controller.dart';
import 'package:flutter_mobile/pages/order/order_diary/widget/order_list_drop_down.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_mobile/widgets/app_button.dart';
import 'package:flutter_mobile/widgets/app_dialog_cofirm.dart';
import 'package:flutter_mobile/widgets/no_data.dart';
import 'package:flutter_mobile/widgets/table_horizontal/left_item_table_horizontal.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class OrderListNormalPage extends BaseScreen<OrderListNormalController> {
  OrderListNormalPage({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return Scaffold(
        body: Column(
      children: <Widget>[
        _headerFilter(),
        Expanded(child: _buildTableHorizontal()),
        _buildCancelOrder()
      ],
    ));
  }

  Widget _headerFilter() => SizedBox(
        height: 32.height,
        child: Row(
          children: <Widget>[
            SizedBox(width: 12.width),
            Obx(() => Expanded(
                    child: OrderListDropDown<OrderListType>(
                  listData: controller.listOrderType,
                  valueSelect: controller.orderTypeSelect.value,
                  onChanged: (Select<OrderListType> type) =>
                      controller.changeOrderType(type),
                ))),
            SizedBox(width: 8.width),
            Obx(() => Expanded(
                    child: OrderListDropDown<TradeType>(
                  listData: controller.listTradeType,
                  valueSelect: controller.tradeTypeSelect.value,
                  onChanged: (Select<TradeType> value) =>
                      controller.changeOrderTradeType(value),
                ))),
            SizedBox(width: 8.width),
            Obx(() => Expanded(
                child: OrderListDropDown<dynamic>(
                    listData: controller.orderListStatus,
                    valueSelect: controller.orderStatusSelect.value,
                    onChanged: (Select<dynamic> value) =>
                        controller.changeStatusOrder(value)))),
            SizedBox(width: 12.width),
          ],
        ),
      );
// Cancel
  Widget _buildCancelOrder() => Visibility(
        visible: false,
        child: Row(
          children: <Widget>[
            SizedBox(width: 16.width),
            Expanded(
              child: AppButton(
                margin: EdgeInsets.only(bottom: 2.height),
                title: LocaleKeys.cancel_all.tr,
                // colorTile: color.neutral1,
                // background: color.primaryActive,
                onTap: () => cancelOrderList(isCancelAll: true),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: AppButton(
                margin: EdgeInsets.only(bottom: 2.height),
                title: LocaleKeys.cancel_select.tr,
                onTap: () => cancelOrderList(),
              ),
            ),
            SizedBox(width: 16.width)
          ],
        ),
      );

  Widget _buildTableHorizontal() => Obx(
        () => Stack(
          children: <Widget>[
            HorizontalDataTable(
              leftHandSideColumnWidth:
                  // controller.traddingHomeController.isCancelOrder.value
                  //     ? 138.width
                  //:
                  100.width,
              horizontalScrollPhysics: ClampingScrollPhysics(),
              isFixedHeader: true,
              enablePullToRefresh: true,
              loadIndicator:
                  ClassicFooter(loadStyle: LoadStyle.ShowWhenLoading),
              enablePullToLoadNewData: true,
              refreshIndicator: const ClassicHeader(
                refreshStyle: RefreshStyle.UnFollow,
              ),
              htdRefreshController: controller.hdtRefreshController,
              onLoad: () => controller.onLoad(),
              onRefresh: () => controller.refeshData(),
              rightHandSideColumnWidth:
                  controller.orderListAbstract.widthRightTable.width,
              itemCount: controller.listData.length,
              leftSideItemBuilder: (BuildContext context, int index) =>
                  LeftItemTableHorizontal(
                      orderListModelAbstract: controller.listData[index],
                      isShow: false),
              rightSideItemBuilder: (BuildContext context, int index) =>
                  controller.orderListAbstract
                      .itemList(controller.listData[index]),
              headerWidgets: controller.orderListAbstract.headerTitle,
              verticalScrollbarStyle: const ScrollbarStyle(
                thumbColor: Colors.transparent,
                thickness: 0.0,
              ),
              horizontalScrollbarStyle: const ScrollbarStyle(
                  thickness: 0.0, thumbColor: Colors.transparent),
              rowSeparatorWidget: Divider(
                color: color.grey70,
                height: 1.0,
                thickness: 0.0,
              ),
              leftHandSideColBackgroundColor: color.grey80,
              rightHandSideColBackgroundColor: color.grey80,
            ),
            Visibility(
                visible: isNullOrEmpty(controller.listData) &&
                    !controller.isFirstCallData,
                child: Nodata()),
          ],
        ),
      );

  // Future<void> _openLogin() async {
  //   // ignore: always_specify_types
  //   final loginSuccues = await Get.toNamed(AppRouter.routerLogin);
  //   if (loginSuccues is bool) {
  //     if (loginSuccues) {
  //       controller.getOrderList();
  //     }
  //   }
  // }

  @override
  OrderListNormalController? putController() {
    return OrderListNormalController();
  }

  void cancelOrderList({bool isCancelAll = false}) {
    List<OrderListModelAbstract> listSelect = <OrderListModelAbstract>[];
    if (isCancelAll) {
      listSelect = controller.listData
          .where(
              (OrderListModelAbstract element) => element.isEditOrder == true)
          .toList();
    } else {
      listSelect = controller.listData
          .where((OrderListModelAbstract element) =>
              element.selectCancelOrder == true)
          .toList();
    }
    AppDialogCofirmDialog().show(
        content: isNotNullOrEmpty(listSelect)
            ? LocaleKeys.goline_ConfirmRemoveMsg.tr
            : LocaleKeys.validate_select.tr,
        onConfirm: () {
          Get.back();
          if (isNotNullOrEmpty(listSelect)) {
            controller.cancelOrderList(listSelect);
          }
        });
  }
}
