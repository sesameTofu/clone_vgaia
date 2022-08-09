import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/place_order/place_order_controller.dart';
import 'package:flutter_mobile/utils/text_formatter.dart';
import 'package:flutter_mobile/widgets/dropdow_box_select.dart';
import 'package:flutter_mobile/widgets/select_datetime/date_widget.dart';
import 'package:flutter_mobile/widgets/text_field/input_price.dart';

class InputPlaceOrderConditionWidget extends BaseWidget<PlaceOrderController> {
  InputPlaceOrderConditionWidget({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return ValueListenableBuilder<Select<PlaceOrderType>>(
        valueListenable: controller.placeOrderTypeSelect,
        builder: (_, Select<PlaceOrderType> value, __) {
          switch (value.value ?? PlaceOrderType.OrderNormal) {
            case PlaceOrderType.OrderNormal:
              return SizedBox();

            case PlaceOrderType.BeforeDay:
              return _buildBeforeDay();

            case PlaceOrderType.Tendency:
              return _buildTendency();

            case PlaceOrderType.TakeProfit:
              return _buildTakeProfit();

            case PlaceOrderType.StopLoss:
              return _buildTakeProfit();

            case PlaceOrderType.DisputePurchase:
              return _buildDisputePurchase();
          }
        });
  }

  Widget _buildBeforeDay() {
    return Column(
      children: <Widget>[
        _buildMatMethod,
        SizedBox(height: 8),
        _buildOrderPriceCondition,
        SizedBox(height: 8),
        _buildReferencePrice,
        SizedBox(height: 8),
        _buildDate
      ],
    );
  }

  Widget _buildTendency() {
    return Column(children: <Widget>[
      _buildMatMethod,
      SizedBox(height: 8),
      _buildSpreadsType,
      SizedBox(height: 8),
      _buildSpreadInput,
      SizedBox(height: 8),
      _buildTriggerInput,
      SizedBox(height: 8),
      _buildlowestAndHighestPrice,
      SizedBox(height: 8),
      _buildDate
    ]);
  }

  Widget _buildTakeProfit() {
    return Column(children: <Widget>[
      _buildMatMethod,
      SizedBox(height: 8),
      _buildAverage,
      SizedBox(height: 8),
      _buildDriffType,
      SizedBox(height: 8),
      _buildDriffInput,
      SizedBox(height: 8),
      _buildActivePrice,
      SizedBox(height: 8),
      _buildTriggerInput,
      SizedBox(height: 8),
      _buildOrderPirce,
      SizedBox(height: 8),
      _buildDate
    ]);
  }

  Widget _buildDisputePurchase() {
    return Column(
        children: <Widget>[_buildMatMethod, SizedBox(height: 8), _buildDate]);
  }

// Phức thức
  Widget get _buildMatMethod {
    return ValueListenableBuilder<Select<PlaceOrderType>>(
        valueListenable: controller.placeOrderTypeSelect,
        builder: (_, Select<PlaceOrderType> placeOrderType, __) =>
            ValueListenableBuilder<Select<MatMethod>>(
                valueListenable: controller.matchMathod,
                builder: (_, Select<MatMethod> value, __) => IgnorePointer(
                      ignoring: placeOrderType.value ==
                          PlaceOrderType.DisputePurchase,
                      child: DropdownBoxSelect<MatMethod>(
                          title: LocaleKeys.trading_page_method.tr,
                          datas: controller.listMatMethod,
                          initialValue: value,
                          selectedValue: controller.changeMatMethod),
                    )));
  }

// Điều kiện tham chiếu
  Widget get _buildOrderPriceCondition {
    return ValueListenableBuilder<Select<OrderPriceCondition>>(
        valueListenable: controller.orderPriceCondition,
        builder: (_, Select<OrderPriceCondition> value, __) =>
            DropdownBoxSelect<OrderPriceCondition>(
                title: LocaleKeys.trading_page_conditional.tr,
                datas: controller.listOrderPriceConditions,
                initialValue: value,
                selectedValue: controller.changeOrderPriceCondition));
  }

// Giá tham chiếu
  Widget get _buildReferencePrice {
    return ValueListenableBuilder<Select<OrderPriceCondition>>(
        valueListenable: controller.orderPriceCondition,
        builder: (_, Select<OrderPriceCondition> value, __) => Visibility(
            visible: value.value == OrderPriceCondition.referencePrice,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(LocaleKeys.trading_page_basic_price.tr,
                      style: textStyle.medium(color: color.grey0, size: 12)),
                  SizedBox(
                      width: .6.getWidth,
                      child: Row(children: <Widget>[
                        ValueListenableBuilder<Select<PriceCondition>>(
                          valueListenable: controller.priceCondition,
                          builder: (_, Select<PriceCondition> value, __) =>
                              DropdownBoxSelect<PriceCondition>(
                                  datas: controller.listPriceConditions,
                                  initialValue: value,
                                  width: 0.12.getHeight,
                                  selectedValue:
                                      controller.changeReferencePrice),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                            child: PriceWidget(
                                visible: false,
                                textEditingController:
                                    controller.referencePriceController,
                                focusNodeCurrent:
                                    controller.referencePriceFocusNode))
                      ]))
                ])));
  }

// chọn type khoảng dừng
  Widget get _buildSpreadsType {
    return ValueListenableBuilder<Select<SpreadsType>>(
        valueListenable: controller.spreadsType,
        builder: (_, Select<SpreadsType> value, __) =>
            DropdownBoxSelect<SpreadsType>(
                title: LocaleKeys.trading_page_spread.tr,
                datas: controller.listspreadsType,
                initialValue: value,
                selectedValue: controller.changeSpreadsType));
  }

// Khoảng dừng
  Widget get _buildSpreadInput {
    return ValueListenableBuilder<Select<SpreadsType>>(
        valueListenable: controller.spreadsType,
        builder: (_, Select<SpreadsType> value, __) {
          final String title =
              value.value == SpreadsType.value ? 'Giá trị' : '%';
          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(title,
                    style: textStyle.medium(color: color.grey0, size: 12)),
                PriceWidget(
                    decimalDigits: 1,
                    formatter: ReplaceFormatter(),
                    onTapCalculator: (TypeCalcalator type) {
                      controller.onTapIncrementAndDecrementPriceCodition(
                          type, controller.spreadValueController);
                    },
                    textEditingController: controller.spreadValueController,
                    focusNodeCurrent: controller.spreadValueFocusNode,
                    width: 0.6.getWidth,
                    scrollPadding: 110.0)
              ]);
        });
  }

// Giá chênh lệch
  Widget get _buildTriggerInput {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(LocaleKeys.trading_page_trigger_price.tr,
            style: textStyle.medium(color: color.grey0, size: 12)),
        PriceWidget(
          decimalDigits: 1,
          formatter: ReplaceFormatter(),
          onTapCalculator: (TypeCalcalator type) {
            controller.onTapIncrementAndDecrementPriceCodition(
                type, controller.triggerPriceController);
          },
          textEditingController: controller.triggerPriceController,
          focusNodeCurrent: controller.triggerPriceFocusNode,
          width: 0.6.getWidth,
          scrollPadding: 110.0,
        )
      ],
    );
  }

// Gía bán và mua cao nhất
  Widget get _buildlowestAndHighestPrice {
    return Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(controller.tradeTypeSelect.value.titleTendency,
                  style: textStyle.medium(color: color.grey0, size: 12)),
              PriceWidget(
                  decimalDigits: 1,
                  formatter: ReplaceFormatter(),
                  onTapCalculator: (TypeCalcalator type) {
                    controller.onTapIncrementAndDecrementPriceCodition(
                        type, controller.lowestAndHighesPriceController);
                  },
                  textEditingController:
                      controller.lowestAndHighesPriceController,
                  focusNodeCurrent: controller.lowestAndHighesPriceFocusNode,
                  width: 0.6.getWidth,
                  scrollPadding: 110.0)
            ]));
  }

  Widget get _buildDate => Row(
        children: <Widget>[
          Expanded(
            child: Text('Ngày kích hoạt',
                style: textStyle.medium(color: color.grey0, size: 12)),
          ),
          SizedBox(
              width: 0.6.getWidth,
              child: ValueListenableBuilder<DateTime>(
                valueListenable: controller.toDate,
                builder: (_, DateTime value, __) => DateTimeWidget(
                    date: value,
                    changeDate: (DateTime date) =>
                        controller.changeDate(date: date)),
              )),
        ],
      );

// Giá bình quân
  Widget get _buildAverage =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Text(LocaleKeys.trading_page_average_price.tr,
            style: textStyle.medium(color: color.grey0, size: 12)),
        PriceWidget(
            enabled: false,
            visible: false,
            textEditingController: controller.averageController,
            focusNodeCurrent: FocusNode(),
            width: 0.6.getWidth,
            scrollPadding: 110.0)
      ]);

// chọn type chenh lech
  Widget get _buildDriffType {
    return ValueListenableBuilder<Select<PriceDiffsType>>(
        valueListenable: controller.priceDiffsType,
        builder: (_, Select<PriceDiffsType> value, __) =>
            DropdownBoxSelect<PriceDiffsType>(
                title: LocaleKeys.trading_page_price_diff.tr,
                datas: controller.listPriceDiffsType,
                initialValue: value,
                selectedValue: controller.changeDriffType));
  }

  // chenh lech gia theo type (gia tri hoac %)
  Widget get _buildDriffInput {
    return ValueListenableBuilder<Select<PriceDiffsType>>(
        valueListenable: controller.priceDiffsType,
        builder: (_, Select<PriceDiffsType> value, __) {
          final String title =
              value.value == PriceDiffsType.value ? 'Giá trị' : '%';
          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(title,
                    style: textStyle.medium(color: color.grey0, size: 12)),
                PriceWidget(
                    decimalDigits: 1,
                    onTapCalculator: (TypeCalcalator type) {
                      controller.onTapIncrementAndDecrementPriceCodition(
                          type, controller.priceDiffController);
                    },
                    formatter: ReplaceFormatter(),
                    textEditingController: controller.priceDiffController,
                    focusNodeCurrent: controller.priceDiffFocusNode,
                    width: 0.6.getWidth,
                    scrollPadding: 110.0)
              ]);
        });
  }

// kich hoat neu = gia
  Widget get _buildActivePrice =>
      ValueListenableBuilder<Select<PlaceOrderType>>(
          valueListenable: controller.placeOrderTypeSelect,
          builder: (_, Select<PlaceOrderType> value, __) {
            final String title = LocaleKeys.trading_page_trigger_with_price
                .trArgs(<String>[
              if (value.value == PlaceOrderType.TakeProfit) '>=' else '<='
            ]);
            return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: Text(title,
                          style:
                              textStyle.medium(color: color.grey0, size: 12))),
                  PriceWidget(
                      enabled: false,
                      visible: false,
                      textEditingController: controller.activePriceController,
                      focusNodeCurrent: FocusNode(),
                      width: 0.6.getWidth,
                      scrollPadding: 110.0)
                ]);
          });

// Giá dat
  Widget get _buildOrderPirce =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Text(LocaleKeys.trading_page_order_price.tr,
            style: textStyle.medium(color: color.grey0, size: 12)),
        PriceWidget(
            enabled: false,
            visible: false,
            textEditingController: controller.orderPriceController,
            focusNodeCurrent: FocusNode(),
            width: 0.6.getWidth,
            scrollPadding: 110.0)
      ]);
}
