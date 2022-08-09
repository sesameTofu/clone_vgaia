import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/place_order/information/stock_infor_widget.dart';
import 'package:flutter_mobile/pages/place_order/input_place_order/input_place_order_widget.dart';
import 'package:flutter_mobile/pages/place_order/place_order_controller.dart';
import 'package:flutter_mobile/pages/place_order/selection_account_widget.dart';
import 'package:flutter_mobile/widgets/button/widget_button.dart';

class PlaceOrderPage extends BaseScreen<PlaceOrderController> {
  PlaceOrderPage({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return GestureDetector(
        onTap: () {
          WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
        },
        child: Focus(
            onFocusChange: controller.changeStateKeyboard,
            child: _buildBody()));
  }

  @override
  PlaceOrderController? putController() {
    return PlaceOrderController();
  }

  Widget _buildBody() {
    return Stack(children: <Widget>[
      Container(
        color: color.background0,
        child: ListView(
          padding: EdgeInsets.only(bottom: 50.0),
          children: <Widget>[
            SizedBox(height: 4),
            StockInformationWidget(
              controller.stockInformationController!,
              (String price) {
                controller.changePriceOnTapPrice(price);
              },
              controllerPlaceOrder: controller,
              tagController: 'PlaceOrder',
            ),
            SizedBox(height: 4),
            SelectionAccountWidget(),
            SizedBox(height: 4),
            InputPlaceOrder(),
          ],
        ),
      ),
      ValueListenableBuilder<bool>(
          valueListenable: controller.isOpenKeyboard,
          builder: (BuildContext context, bool value, Widget? child) {
            if (value) {
              return Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: _changeFocus(),
              );
            }
            return Visibility(
                visible: !value,
                child: Positioned(
                    bottom: 8, right: 0, left: 0, child: _buildButtonSubmit()));
          })
    ]);
  }

  Widget _buildButtonSubmit() => Obx(() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: WidgetButton(
            isShowLoading: controller.loadingPlaceOrder.value,
            title: controller.tradeTypeSelect.value.title(),
            bgColor: controller.loadingPlaceOrder.value
                ? controller.tradeTypeSelect.value.color().withOpacity(0.5)
                : controller.tradeTypeSelect.value.color(),
            onClick: controller.placeOrder),
      ));

  Widget _changeFocus() => ValueListenableBuilder<FocusPlaceOrder>(
      valueListenable: controller.suggestionCtrl,
      builder: (BuildContext context, FocusPlaceOrder value, Widget? child) {
        if (value == FocusPlaceOrder.NONE) {
          return Container();
        }
        if (value == FocusPlaceOrder.SEARCH_STOCK) {
          return _buildStockSuggest();
        }

        return Container(
            height: 32.0,
            color: color.background1,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        if (value == FocusPlaceOrder.VOLUME) {
                          controller.priceFocusNode.requestFocus();
                          return;
                        }
                        if (value == FocusPlaceOrder.PRICE) {
                          controller.volumeFocusNode.requestFocus();
                          return;
                        }
                      },
                      child: SizedBox(
                          height: double.infinity,
                          width: 50,
                          child: Center(
                              child: Icon(
                                  value == FocusPlaceOrder.VOLUME
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: color.grey30)))),
                  Expanded(
                      child: ValueListenableBuilder<bool>(
                          valueListenable: controller.isShowVolumeSelect,
                          builder: (BuildContext context, bool valueVolume,
                              Widget? child) {
                            return ValueListenableBuilder<bool>(
                                valueListenable: controller.isShowOrderSelect,
                                builder: (BuildContext context, bool value,
                                    Widget? child) {
                                  return valueVolume
                                      ? _buildQuickVolume()
                                      : Visibility(
                                          visible: value &&
                                              controller.placeOrderTypeValue ==
                                                  PlaceOrderType.OrderNormal,
                                          child: _buildQuickOrder(),
                                        );
                                });
                          })),
                  InkWell(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                      },
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20.0),
                          child: Text(LocaleKeys.done.tr,
                              style: textStyle.medium(
                                  size: 12, color: color.primary))))
                ]));
      });

  Widget _buildQuickOrder() {
    return ValueListenableBuilder<List<String>>(
        valueListenable: controller.quickOrderSelect,
        builder: (BuildContext context, List<String>? value, Widget? child) {
          return ListView(
              padding: EdgeInsets.symmetric(vertical: 2),
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.horizontal,
              children: (value ?? <String>[])
                  .map((String e) => _buildItemQuickOrder(e))
                  .toList());
        });
  }

  Widget _buildQuickVolume() {
    return ListView(
        padding: EdgeInsets.symmetric(vertical: 2),
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        children: (controller.selectMassList)
            .map((num e) => _buildItemVolume(e))
            .toList());
  }

  Widget _buildStockSuggest() {
    return ValueListenableBuilder<List<StockItemViewModel>>(
        valueListenable: controller.listStockItem,
        builder: (_, List<StockItemViewModel> listStock, __) => Container(
              color: color.background1,
              height: 32,
              child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  shrinkWrap: true,
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  children: listStock
                      .map((StockItemViewModel e) => _buildStockSuggestItem(e))
                      .toList()),
            ));
  }

  Widget _buildStockSuggestItem(StockItemViewModel e) {
    return InkWell(
      onTap: () =>
          controller.changeStockFromSuggestion(e.stockItem.secID ?? ''),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.0),
          margin: EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
          decoration: BoxDecoration(
              color: color.grey70, borderRadius: BorderRadius.circular(4)),
          child: Center(
              child: Text(e.stockItem.secID ?? '',
                  style: textStyle.medium(size: 10)))),
    );
  }

  Widget _buildItemQuickOrder(String quickOrder) {
    return ValueListenableBuilder<String>(
        valueListenable: controller.quickOrder,
        builder: (BuildContext context, String? value, Widget? child) {
          final Color clBg = color.grey70;
          final Color clBorder =
              value == quickOrder ? color.secondary : color.grey70;
          final Color clText =
              value == quickOrder ? color.secondary : color.grey20;
          return InkWell(
              onTap: () {
                controller.selectQuickOrder(quickOrder);
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  margin: EdgeInsets.only(left: 4, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                      color: clBg,
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(color: clBorder)),
                  child: Center(
                      child: Text(quickOrder,
                          style: textStyle.medium(color: clText, size: 10)))));
        });
  }

  Widget _buildItemVolume(num quickOrder) {
    return ValueListenableBuilder<num?>(
        valueListenable: controller.quickVolume,
        builder: (BuildContext context, num? value, Widget? child) {
          final Color clBg = color.grey70;
          final Color clBorder =
              value == quickOrder ? color.secondary : color.grey70;
          final Color clText =
              value == quickOrder ? color.secondary : color.grey20;
          return InkWell(
              onTap: () {
                controller.selectVolume(quickOrder);
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  margin: EdgeInsets.only(left: 4, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                      color: clBg,
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(color: clBorder)),
                  child: Center(
                      child: Text(quickOrder.formatVolume(),
                          style: textStyle.medium(color: clText, size: 10)))));
        });
  }
}
