import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/watch_list/item/stock_item_controller.dart';

class ItemTopPrice extends BaseScreen<StockItemController> {
  ItemTopPrice(
      {Key? key,
      required String tag,
      required this.isDay,
      required this.stockItemViewModel,
      this.colorBg,
      required this.onPress})
      : super(
          key: key,
          tag: tag,
        );

  final StockItemViewModel stockItemViewModel;
  final Color? colorBg;
  final Function() onPress;
  final bool isDay;

  @override
  StockItemController? putController() {
    return StockItemController(
        itemViewModel: stockItemViewModel, canGetFullInfor: false);
  }

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
          return InkWell(
            onTap: () {
              onPress();
            },
            child: Container(
              height: 48.height,
              color: colorBg,
              padding: EdgeInsets.symmetric(horizontal: 12.width),
              child: Row(
                children: <Widget>[
                  _buildTicker(controller),
                  _buildLastPrice(controller),
                  _buildChangePercent(controller),
                  // _buildVolume(_),
                ],
              ),
            ),
          );
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
            Text(
              controller.subTicker,
              style: textStyle.regular(size: 12, color: color.grey40),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )
          ],
        ),
      );

  Widget _buildLastPrice(StockItemController controller) {
    return Expanded(
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        StreamBuilder<num>(
            stream: controller.colorCodeStream,
            builder: (_, AsyncSnapshot<num> snapshot) {
              return StreamBuilder<num>(
                  stream: controller.matchPriceStream,
                  builder: (_, AsyncSnapshot<num> snapshot) {
                    return StreamBuilder<StatusFiled>(
                        stream: controller
                            .mapSubjectChangeColor[Field.MATCH_PRICE]!.stream,
                        builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
                          final Color _colorPrice =
                              controller.getColorWithCode();
                          // LastPrice
                          final num _lastPrice = controller.matchPrice;
                          final Color? _bcolorPrice = controller
                              .mapSubjectChangeColor[Field.MATCH_PRICE]!.value
                              .bChangedBColor(_colorPrice);
                          return Container(
                              color: _bcolorPrice,
                              child: Text(_lastPrice.formatPrice(),
                                  style: textStyle.medium(
                                    color: _colorPrice,
                                  )));
                        });
                  });
            })
      ]),
    );
  }

  Widget _buildChangePercent(StockItemController controller) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          if (isDay)
            StreamBuilder<num>(
                stream: controller.colorCodeStream,
                builder: (_, AsyncSnapshot<num> snapshot) {
                  return StreamBuilder<num>(
                      stream: controller.changePercentStream,
                      builder: (_, AsyncSnapshot<num> snapshot) {
                        return StreamBuilder<StatusFiled>(
                            stream: controller
                                .mapSubjectChangeColor[Field.CHANGE_PERCENT]!
                                .stream,
                            builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
                              final Color _colorPrice =
                                  controller.getColorWithCode();
                              // Price Percent

                              final num _changePricePercent =
                                  controller.changePercent;
                              final Color? _bColorPrice = controller
                                  .mapSubjectChangeColor[Field.MATCH_PRICE]!
                                  .value
                                  .bChangedBColor(_colorPrice);
                              return Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${_changePricePercent.getPrefix}${_changePricePercent.formatRate(2)}%',
                                  style: textStyle
                                      .medium(color: _colorPrice)
                                      .copyWith(backgroundColor: _bColorPrice),
                                ),
                              );
                            });
                      });
                })
          else
            StreamBuilder<num>(
                stream: controller.changePercentNotDayStream,
                builder: (_, AsyncSnapshot<num> snapshot) {
                  return StreamBuilder<num>(
                      stream: controller.colorCodeStream,
                      builder: (_, AsyncSnapshot<num> snapshot) {
                        final Color _colorPrice = controller.getColorWithCode();
                        // Price Percent

                        final num _changePricePercent =
                            controller.changePercentNotDay;

                        return Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${_changePricePercent.getPrefix}${_changePricePercent.formatRate(2)}%',
                            style: textStyle.medium(color: _colorPrice),
                          ),
                        );
                      });
                }),
        ],
      ),
    );
  }
}
