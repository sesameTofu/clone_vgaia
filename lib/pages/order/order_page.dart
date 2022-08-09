import 'package:flutter/cupertino.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/order/order_controller.dart';
import 'package:flutter_mobile/pages/order/order_diary/basic/order_diary_normal_page.dart';
import 'package:flutter_mobile/pages/place_order/place_order_page.dart';
import 'package:flutter_mobile/widgets/appbar_custom.dart';

class OrderPage extends BaseScreen<OrderController> {
  OrderPage({Key? key}) : super(key: key);

  @override
  OrderController? putController() {
    return OrderController();
  }

  @override
  Widget builder() {
    return GestureDetector(
        onTap: () {
          WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: AppBarCustom(
                automaticallyImplyLeading: false,
                widgetBottom: PreferredSize(
                    preferredSize: Size.fromHeight(0.5),
                    child: Container(color: color.grey80, height: 0.5)),
                widgetTitle:
                    Obx(() => CupertinoSlidingSegmentedControl<TypePageOrder>(
                        onValueChanged: (TypePageOrder? newValue) {
                          controller.switchPage(
                              type: newValue ?? TypePageOrder.PlaceOrder);
                        },
                        padding: EdgeInsets.all(4),
                        children: <TypePageOrder, Widget>{
                          TypePageOrder.PlaceOrder: _buildSwitchTabChild(
                              type: TypePageOrder.PlaceOrder),
                          TypePageOrder.OrderDiary: _buildSwitchTabChild(
                              type: TypePageOrder.OrderDiary)
                        },
                        thumbColor: color.grey70,
                        backgroundColor: color.grey100,
                        groupValue: controller.typePage.value)),
              ),
            ),
            body: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                children: <Widget>[PlaceOrderPage(), OrderListNormalPage()])));
  }

  Widget _buildSwitchTabChild({required TypePageOrder type}) => Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Text(type.title,
          style: textStyle.custom(
              color: controller.typePage.value == type
                  ? color.grey0
                  : color.grey40,
              size: 12,
              fontWeight: controller.typePage.value == type
                  ? FontWeight.w600
                  : FontWeight.w400)));
}
