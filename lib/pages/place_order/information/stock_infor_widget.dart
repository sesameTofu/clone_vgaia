import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/place_order/information/stock_information_controller.dart';
import 'package:flutter_mobile/pages/place_order/information/widget/last_price_widget.dart';
import 'package:flutter_mobile/pages/place_order/information/widget/search_place_order.dart';
import 'package:flutter_mobile/pages/place_order/information/widget/statistics_expanded.dart';
import 'package:flutter_mobile/pages/place_order/information/widget/stock_more_widget.dart';
import 'package:flutter_mobile/pages/place_order/place_order_controller.dart';
import 'package:flutter_mobile/widgets/button/buy_sell_widget.dart';

class StockInformationWidget extends BaseScreen<StockInformationController> {
  StockInformationWidget(
    this.stockInformationController,
    this._getValue, {
    this.showRowWhenCollap = 1,
    this.controllerPlaceOrder,
    this.tagController,
    Key? key,
  }) : super(key: key, tag: tagController);

  final StockInformationController? stockInformationController;
  final PlaceOrderController? controllerPlaceOrder;
  final Function(String) _getValue;
  final String? tagController;
  final int showRowWhenCollap;

  bool get isPlaceOrder => controllerPlaceOrder != null;
  @override
  Widget builder() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (isPlaceOrder)
            Column(children: <Widget>[
              SizedBox(height: 12),
              SearchWidget(tag: tagController)
            ]),
          SizedBox(height: 4.0),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Visibility(
                  visible: isPlaceOrder,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, right: 12, left: 12),
                    child: _buildNameTicker(),
                  ),
                ),
                SizedBox(height: 8.0),
                LastPriceWidget(_getValue, tag: tagController),
                SizedBox(height: 8.0),
                InfoStatisticsExpanded(tagController,
                    showRowWhenCollap: showRowWhenCollap),
                ValueListenableBuilder<bool>(
                    valueListenable: controller.showAllInforStock,
                    builder: (BuildContext context, bool value, Widget? child) {
                      return Visibility(
                          visible: value,
                          child: InkWell(
                              onTap: () {
                                controller.showAllInforStock.value = !value;
                              },
                              child: StockMoreWidget(
                                tag: tagController,
                              )));
                    }),
                SizedBox(height: 16),
                if (controllerPlaceOrder != null) _buildBuySell()
              ]),
          SizedBox(height: 12),
        ]);
  }

  //mã - khối lượng
  Widget _buildNameTicker() {
    return StreamBuilder<String>(
        stream: controller.secCdStream,
        builder: (_, AsyncSnapshot<String> snapshot) {
          return controller.secCd.isEmpty
              ? SizedBox()
              : Text(vn ? controller.subTicker : controller.subTickerEN,
                  maxLines: 2, style: textStyle.custom());
        });
  }

  @override
  StockInformationController? putController() {
    return stockInformationController;
  }

  Widget _buildBuySell() => Obx(() => BuySellWidget(
        initValue: controllerPlaceOrder!.tradeTypeSelect.value,
        onclick: controllerPlaceOrder!.selectTradeType,
      ));
}
