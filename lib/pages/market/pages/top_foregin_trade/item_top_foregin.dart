import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/watch_list/item/stock_item_controller.dart';
import 'package:rxdart/rxdart.dart' as rx;

class ItemTopForegin extends BaseScreen<StockItemController> {
  ItemTopForegin(this.stockItemViewModel, this.colorBg,
      {required this.type, required String tag, Key? key})
      : super(key: key, tag: tag);

  final StockItemViewModel stockItemViewModel;
  final Color? colorBg;
  final ForgeinTradeType type;

  @override
  Widget builder() {
    return GetBuilder<StockItemController>(
        id: tag,
        init: controller,
        tag: tag,
        dispose: (GetBuilderState<StockItemController> state) {
          Get.delete<StockItemController>(tag: tag, force: true);
        },
        didUpdateWidget: (GetBuilder<dynamic> oldWidget,
            GetBuilderState<StockItemController> state) async {},
        builder: (_) {
          return Container(
              height: 48.height,
              color: colorBg,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(children: <Widget>[
                _buildTicker(controller),
                _buildVolume(controller),
                _buildLastPrice(controller),
              ]));
        });
  }

  Expanded _buildTicker(StockItemController controller) => Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            StreamBuilder<String>(
                stream: controller.secCdStream,
                builder: (_, AsyncSnapshot<String> snapshot) {
                  return Text(controller.secCd,
                      maxLines: 1, style: textStyle.bold(color: color.grey0));
                }),
            SizedBox(height: 3.height),
            Text(controller.subTicker,
                style: textStyle.regular(size: 12, color: color.grey40),
                overflow: TextOverflow.ellipsis,
                maxLines: 1)
          ]));

  Widget _buildLastPrice(StockItemController controller) {
    return Expanded(
        child: StreamBuilder<List<num>>(
            stream: rx.Rx.combineLatest3(
                controller.matchPriceStream,
                controller.colorCodeStream,
                controller.changePercentStream,
                (num a, num b, num c) => <num>[a, b, c]),
            builder: (_, __) {
              return StreamBuilder<StatusFiled>(
                  stream: controller
                      .mapSubjectChangeColor[Field.MATCH_PRICE]?.stream,
                  builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
                    final Color _colorPrice = controller.getColorWithCode();
                    final Color? _bColorPrice = controller
                        .mapSubjectChangeColor[Field.MATCH_PRICE]!.value
                        .bChangedBColor(_colorPrice);
                    // LastPrice
                    final num _lastPrice = controller.matchPrice;
                    // Percent
                    final num _changePricePercent = controller.changePercent;

                    return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Text>[
                          Text(_lastPrice.formatPrice(),
                              style: textStyle
                                  .medium(color: _colorPrice)
                                  .copyWith(backgroundColor: _bColorPrice)),
                          Text(
                              '${_changePricePercent.getPrefix}${_changePricePercent.formatRate(2)}%',
                              style: textStyle
                                  .medium(color: _colorPrice)
                                  .copyWith(backgroundColor: _bColorPrice))
                        ]);
                  });
            }));
  }

  Widget _buildVolume(StockItemController controller) =>
      Expanded(child: _buildStreamQtyOrAmt);

  Widget get _buildStreamQtyOrAmt {
    switch (type) {
      case ForgeinTradeType.salePrice:
      case ForgeinTradeType.buyPrice:
        return StreamBuilder<num>(
            stream: controller.netForeignAmtStream,
            builder: (_, AsyncSnapshot<num> snapshot) {
              return Text(
                  // Giá trị đơn vị trả ra là Nghìn,muốn lên Triêu thì chiwa thêm 1000
                  (controller.netForeignAmt / 1000)
                      .formatVolume(decimalDigits: 2),
                  textAlign: TextAlign.right,
                  style:
                      textStyle.medium(color: controller.getColorWithCode()));
            });
      case ForgeinTradeType.buyQuantity:
        return StreamBuilder<num>(
            stream: controller.buyForeignStream,
            builder: (_, AsyncSnapshot<num> snapshot) {
              return Text(
                // KL muốn đơn vị Nghìn => /1000
                (controller.buyForeign / 1000).formatVolume(decimalDigits: 2),
                textAlign: TextAlign.right,
                style: textStyle.medium(
                  color: controller.getColorWithCode(),
                ),
              );
            });
      case ForgeinTradeType.saleQuantity:
        return StreamBuilder<num>(
            stream: controller.sellForeignStream,
            builder: (_, AsyncSnapshot<num> snapshot) {
              return Text(
                // KL muốn đơn vị Nghìn => /1000
                (controller.sellForeign / 1000).formatVolume(decimalDigits: 2),
                textAlign: TextAlign.right,
                style: textStyle.medium(
                  color: controller.getColorWithCode(),
                ),
              );
            });
      case ForgeinTradeType.valueBuy:
        return StreamBuilder<num>(
            stream: controller.buyForeignAmtStream,
            builder: (_, AsyncSnapshot<num> snapshot) {
              return Text(
                  // Giá trị đơn vị trả ra là Nghìn,muốn lên Triêu thì chiwa thêm 1000
                  (controller.buyForeignAmt / 1000)
                      .formatVolume(decimalDigits: 2),
                  textAlign: TextAlign.right,
                  style:
                      textStyle.medium(color: controller.getColorWithCode()));
            });
      case ForgeinTradeType.valueSale:
        return StreamBuilder<num>(
            stream: controller.sellForeignAmtStream,
            builder: (_, AsyncSnapshot<num> snapshot) {
              return Text(
                  // Giá trị đơn vị trả ra là Nghìn,muốn lên Triêu thì chiwa thêm 1000
                  (controller.sellForeignAmt / 1000)
                      .formatVolume(decimalDigits: 2),
                  textAlign: TextAlign.right,
                  style:
                      textStyle.medium(color: controller.getColorWithCode()));
            });
      default:
        return SizedBox();
    }
  }

  @override
  StockItemController? putController() {
    return StockItemController(
      itemViewModel: stockItemViewModel,
      canGetFullInfor: false,
    );
  }
}
