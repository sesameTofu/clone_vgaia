import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/place_order/input_place_order/input_place_order_condition.dart';
import 'package:flutter_mobile/pages/place_order/place_order_controller.dart';
import 'package:flutter_mobile/utils/text_formatter.dart';
import 'package:flutter_mobile/widgets/dropdow_box_select.dart';
import 'package:flutter_mobile/widgets/text_field/input_price.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class InputPlaceOrder extends BaseWidget<PlaceOrderController> {
  InputPlaceOrder({Key? key}) : super(key: key);

  @override
  Widget builder() => Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        decoration: BoxDecoration(
            color: color.background1,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0))),
        child: _buildBody(),
      );

  Widget _buildBody() => Column(children: <Widget>[
        _buildPriceInput(),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(LocaleKeys.mass.tr,
                  style: textStyle.medium(color: color.grey0, size: 12)),
              PriceWidget(
                  decimalDigits: 0,
                  formatter: ThousandsFormatter(),
                  onTapCalculator: (TypeCalcalator type) {
                    controller.onTapIncrementAndDecrementVolume(
                        type, controller.volumeController);
                  },
                  textEditingController: controller.volumeController,
                  focusNodeCurrent: controller.volumeFocusNode,
                  width: 0.6.getWidth,
                  scrollPadding: 70.0)
            ]),
        SizedBox(height: 8.0),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(LocaleKeys.goline_LoaiLenh.tr,
                  style: textStyle.medium(color: color.grey0, size: 12)),
              _buildOrderType
            ]),
        SizedBox(height: 8),
        InputPlaceOrderConditionWidget(),
        SizedBox(height: 12.0),
        Image.asset(AppPath.line, width: 1.getWidth, fit: BoxFit.fill),
        SizedBox(height: 12.0),
        _buildValuePlace(),
        SizedBox(height: 12.0)
      ]);

  Widget _buildPriceInput() => ValueListenableBuilder<Select<PlaceOrderType>>(
      valueListenable: controller.placeOrderTypeSelect,
      builder: (_, Select<PlaceOrderType> value, __) => Visibility(
            visible: value.value == PlaceOrderType.OrderNormal ||
                value.value == PlaceOrderType.BeforeDay,
            child: Column(children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(LocaleKeys.price.tr,
                        style: textStyle.medium(color: color.grey0, size: 12)),
                    PriceWidget(
                        formatter: ReplaceFormatter(),
                        onTapCalculator: (TypeCalcalator type) {
                          controller.onTapIncrementAndDecrementPrice(
                              type, controller.priceController);
                        },
                        textEditingController: controller.priceController,
                        focusNodeCurrent: controller.priceFocusNode,
                        width: 0.6.getWidth,
                        scrollPadding: 110.0)
                  ]),
              SizedBox(height: 8.0)
            ]),
          ));

  Widget _buildValuePlace() => Obx(() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Column(
            children: <Widget>[
              _buildContent(
                  '${LocaleKeys.buy_power.tr} : ',
                  (controller.buyingPowerData.value?.buyingPower ?? 0)
                      .formatVolume()),
              SizedBox(height: 4.0),
              _buildContent(controller.tradeTypeSelect.value.titleMaxQuantity(),
                  (controller.maxBuyQuantity.value ?? 0).formatVolume(),
                  onTap: () {
                if ((controller.maxBuyQuantity.value ?? 0) != 0) {
                  if ((controller.maxBuyQuantity.value ?? 0) > 100) {
                    controller.selectVolume(controller.maxBuyQuantity.value! -
                        (controller.maxBuyQuantity.value! % 100));
                  } else {}
                }
              })
            ],
          )),
          SizedBox(width: 12),
          Expanded(
              child: _buildContent(
                  '${LocaleKeys.margin_rate.tr} : ',
                  (controller.buyingPowerData.value?.marginRate ?? 0)
                      .formatVolume()))
        ],
      ));
  Widget _buildContent(String title, String content, {Function()? onTap}) =>
      Row(children: <Widget>[
        Text(title, style: textStyle.regular(size: 12, color: color.grey20)),
        SizedBox(width: 2),
        Expanded(
            child: onTap != null
                ? InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      onTap();
                    },
                    child: Text(content,
                        textAlign: TextAlign.right,
                        style:
                            textStyle.semiBold(size: 12, color: color.grey0)),
                  )
                : Text(content,
                    textAlign: TextAlign.right,
                    style: textStyle.semiBold(size: 12, color: color.grey0)))
      ]);

  Widget get _buildOrderType {
    return ValueListenableBuilder<Select<PlaceOrderType>>(
        valueListenable: controller.placeOrderTypeSelect,
        builder: (_, Select<PlaceOrderType> value, __) =>
            DropdownBoxSelect<PlaceOrderType>(
                datas: controller.listOrderType,
                initialValue: value,
                selectedValue: controller.changePlaceOrder));
  }
}
