import 'package:flutter_mobile/domain/model/place_order/prepare_order_model.dart';
import 'package:flutter_mobile/domain/model/place_order/prepare_order_rq.dart';
import 'package:flutter_mobile/import.dart';

class DialogInfoOrderWidget extends BaseWidget<BaseController> {
  DialogInfoOrderWidget({
    Key? key,
    required this.prepareOrderData,
    required this.prepareOrder,
  }) : super(key: key);
  final PrepareOrderData prepareOrderData;
  final PrepareSubmitOrder prepareOrder;
  @override
  Widget builder() => Column(
        children: <Widget>[
          _buildContent(
              LocaleKeys.goline_SubAccoNo.tr, prepareOrder.subAccoNo ?? ''),
          Divider(color: color.grey60),
          _buildContent(LocaleKeys.goline_SecCd.tr, prepareOrder.secCd ?? ''),
          Divider(color: color.grey60),
          _buildContent(
            '${LocaleKeys.buy.tr}/${LocaleKeys.sell.tr}',
            prepareOrderData.tradeType.titleType,
            textColor: prepareOrderData.tradeType.color(),
          ),
          Divider(color: color.grey60),
          _buildContent(LocaleKeys.price.tr,
              (prepareOrderData.ordPrice ?? 0).formatPrice(decimalDigits: 2)),
          Divider(color: color.grey60),
          _buildContent(LocaleKeys.mass.tr,
              (prepareOrderData.ordQty ?? 0).formatVolume()),
          Divider(color: color.grey60),
          _buildContent(LocaleKeys.trading_page_fee_value.tr,
              (prepareOrderData.ordFeeAmt ?? 0).formatPrice(decimalDigits: 0)),
          Divider(color: color.grey60),
          _buildContent(LocaleKeys.trading_page_total_trade_value.tr,
              (prepareOrderData.totalAmt ?? 0).formatPrice(decimalDigits: 0)),
        ],
      );

  Widget _buildContent(
    String title,
    String content, {
    Color? textColor,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: 2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: textStyle.regular(size: 13, color: color.grey40),
            ),
            Text(
              content,
              style:
                  textStyle.regular(size: 13, color: textColor ?? color.grey0),
            )
          ],
        ),
      );
}
