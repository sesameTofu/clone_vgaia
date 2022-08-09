import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/watch_list/item/stock_item_controller.dart';
import 'package:flutter_mobile/pages/watch_list/sec_quote_detail/sec_quote_detail_page.dart';

class ItemTable extends BaseScreen<StockItemController> with BaseMixin {
  ItemTable(this.detailInfo, {required String tag, Key? key})
      : super(key: key, tag: tag);
  final StockItemViewModel detailInfo;

  @override
  StockItemController putController() =>
      StockItemController(itemViewModel: detailInfo);

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
      builder: (_) => InkWell(
        onTap: () => Get.to<bool>(
            () => SecQuoteDetailPage(detailInfo.stockItem.secID ?? '')),
        child: Container(
          height: 48.0,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: color.grey60, width: 0.4),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Price
              StreamBuilder<num>(
                  stream: controller.matchPriceStream,
                  builder: (_, AsyncSnapshot<num> snapshot) {
                    return StreamBuilder<StatusFiled>(
                        stream: controller
                            .mapSubjectChangeColor[Field.MATCH_PRICE]?.stream,
                        builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
                          final Color _colorPrice = controller.lastColor;

                          // LastPrice
                          final num _lastPrice = controller.matchPrice;
                          final Color _textLastPriceColor = controller
                              .mapSubjectChangeColor[Field.MATCH_PRICE]!.value
                              .textChangedColor(_colorPrice);

                          final Color _bgLastPriceColor = controller
                              .mapSubjectChangeColor[Field.MATCH_PRICE]!
                              .value
                              .bgChangedColor;
                          return _buildDetail(_lastPrice.formatPrice(),
                              width: 90,
                              bgColor: _bgLastPriceColor,
                              textColor: _textLastPriceColor);
                        });
                  }),

              // Change %
              StreamBuilder<num>(
                  stream: controller.changePercentStream,
                  builder: (_, AsyncSnapshot<num> snapshot) {
                    return StreamBuilder<StatusFiled>(
                        stream: controller
                            .mapSubjectChangeColor[Field.CHANGE_PERCENT]!
                            .stream,
                        builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
                          final Color _colorPrice = controller.lastColor;

                          // Price Percent
                          final StatusFiled _changedPropertiesPercent =
                              controller
                                  .mapSubjectChangeColor[Field.CHANGE_PERCENT]!
                                  .value;
                          final num _changePricePercent =
                              controller.changePercent;

                          return _buildDetail(
                            '${_changePricePercent.getPrefix}${_changePricePercent.formatRate(2)}',
                            width: 90,
                            bgColor: _changedPropertiesPercent.bgChangedColor,
                            textColor: _changedPropertiesPercent
                                .textChangedColor(_colorPrice),
                          );
                        });
                  }),

              // Market Cap
              _buildDetail(
                  detailInfo.stockInfor?.marketCap == null
                      ? '-'
                      : detailInfo.stockInfor!.marketCap!
                          .formatVolume(decimalDigits: 2),
                  width: 100),
              // P/E=B
              _buildDetail(
                  detailInfo.stockInfor?.pb == null
                      ? '-'
                      : detailInfo.stockInfor!.pb!.formatVolume(),
                  width: 90),
              // P/E
              _buildDetail(
                  detailInfo.stockInfor?.pe == null
                      ? '-'
                      : detailInfo.stockInfor!.pe!.formatVolume(),
                  width: 90),
              // Net Mag
              _buildDetail(
                  detailInfo.stockInfor?.netSale == null
                      ? '-'
                      : detailInfo.stockInfor!.netSale!.formatVolume(),
                  width: 90),
              // ROA
              _buildDetail(
                  detailInfo.stockInfor?.roa == null
                      ? '-'
                      : detailInfo.stockInfor!.roa!
                          .formatVolume(decimalDigits: 2),
                  width: 90),
              // ROE
              _buildDetail(
                  detailInfo.stockInfor?.roe == null
                      ? '-'
                      : detailInfo.stockInfor!.roe!
                          .formatVolume(decimalDigits: 2),
                  width: 90),
              // EPS
              _buildDetail(
                  detailInfo.stockInfor?.esp == null
                      ? '-'
                      : detailInfo.stockInfor!.esp!.formatVolume(),
                  width: 100,
                  paddingContent: EdgeInsets.only(right: 12)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetail(
    String title, {
    required double width,
    Color? textColor,
    Color? bgColor,
    Alignment alignment = Alignment.centerRight,
    EdgeInsets paddingContent = const EdgeInsets.only(right: 8),
  }) =>
      Container(
        color: bgColor,
        width: width,
        alignment: alignment,
        padding: paddingContent,
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: textStyle.custom(
              size: 14,
              fontWeight: FontWeight.w400,
              color: textColor,
              backgroundColor: bgColor),
        ),
      );
}
