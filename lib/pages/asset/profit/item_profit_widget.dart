import 'package:flutter_mobile/controller/stock_manager.dart';
import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/domain/model/portfolio/customer_portfolio_model.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/asset/profit/item_profit_controller.dart';
import 'package:flutter_mobile/pages/watch_list/sec_quote_detail/sec_quote_detail_page.dart';
import 'package:flutter_mobile/widgets/button/widget_button.dart';
import 'package:flutter_mobile/widgets/expansion/expansion_item.dart';

class ItemProfitWidget extends BaseScreen<ItemProfitController> {
  ItemProfitWidget(this.index, {Key? key, required this.listValue})
      : super(key: key, tag: listValue.value[index].secCd);

  final RxListNotify<CustomerPortfolio> listValue;
  final int index;
  @override
  Widget builder() {
    return ExpansionItem(
        children: <Widget>[_buildExpand()],
        title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(children: <Widget>[
              SizedBox(height: 4),
              _firstLine(),
              SizedBox(height: 2),
              _secondLine()
            ])));
  }

  Widget _firstLine() {
    return Row(children: <Widget>[
      Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Text(listValue.value[index].secCd ?? '',
              textAlign: TextAlign.left, style: textStyle.custom())),
      Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Text(
              '${listValue.value[index].remainQty?.formatVolume() ?? 0.0}',
              textAlign: TextAlign.center,
              softWrap: true,
              maxLines: 1,
              style: textStyle.custom())),
      Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Text(
              '${listValue.value[index].avgPrice?.formatPrice() ?? 0.0}',
              textAlign: TextAlign.center,
              style: textStyle.custom())),
      Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: StreamBuilder<StatusFiled>(
              stream: controller.stockInformationController
                  .mapSubjectChangeColor[Field.MATCH_PRICE]!.stream,
              builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
                final Color _textLastPriceColor = controller
                            .stockInformationController
                            .mapSubjectChangeColor[Field.MATCH_PRICE]!
                            .value ==
                        StatusFiled.NONE
                    ? _getProfitColor(listValue.value[index].percentProfit)
                    : controller
                        .stockInformationController
                        .mapSubjectChangeColor[Field.MATCH_PRICE]!
                        .value
                        .bgChangedColor;
                return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 4.0),
                    child: Text(
                      '${listValue.value[index].percentProfit.formatRate(2)}%',
                      textAlign: TextAlign.center,
                      style: textStyle.custom(),
                    ),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                        color: _textLastPriceColor));
              }))
    ]);
  }

  Color _getProfitColor(num profit) {
    return profit > 0
        ? color.green60
        : (profit < 0 ? color.red60 : color.yellow60);
  }

  Color _getProfitTextColor(num profit) {
    return profit > 0
        ? color.green50
        : (profit < 0 ? color.red50 : color.yellow50);
  }

  Widget _secondLine() {
    return StreamBuilder<StatusFiled>(
        stream: controller.stockInformationController
            .mapSubjectChangeColor[Field.MATCH_PRICE]!.stream,
        builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
          final Color _colorPrice = controller.stockInformationController
              .getLastColor(listValue.value[index].currentPrice ?? 0);
          // LastPrice
          final Color _textLastPriceColor = controller
              .stockInformationController
              .mapSubjectChangeColor[Field.MATCH_PRICE]!
              .value
              .textChangedColor(_colorPrice);
          final Color _bgColor = controller.stockInformationController
              .mapSubjectChangeColor[Field.MATCH_PRICE]!.value.bgChangedColor;

          final Color textColoPprofitAmtAcm = controller
              .stockInformationController
              .mapSubjectChangeColor[Field.MATCH_PRICE]!
              .value
              .textChangedColor(
                  _getProfitTextColor(listValue.value[index].calProfitAmtAcm));
          return Row(children: <Widget>[
            Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Row(children: <Widget>[
                  Text(LocaleKeys.goline_GiaHienTai.tr,
                      textAlign: TextAlign.left,
                      style: textStyle.custom(size: 12)),
                  const SizedBox(width: 4.0),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: _bgColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                          (listValue.value[index].currentPrice ?? 0)
                              .formatPrice(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textStyle.custom(
                              fontWeight: FontWeight.w700,
                              size: 12,
                              color: _textLastPriceColor)))
                ])),
            Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                            color: _bgColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                              listValue.value[index].calProfitAmtAcm
                                  .formatPrice(decimalDigits: 0),
                              textAlign: TextAlign.end,
                              style: textStyle.custom(
                                  color: textColoPprofitAmtAcm)))
                    ]))
          ]);
        });
  }

  Widget _buildExpand() {
    return Column(children: <Widget>[
      Row(children: <Widget>[
        Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: color.grey70,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(children: <Widget>[
                  const SizedBox(height: 8.0),
                  Text(
                    LocaleKeys.goline_GTDauTu.tr,
                    style: textStyle.custom(),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                      listValue.value[index].investmentAmt
                              ?.formatPrice(decimalDigits: 0) ??
                          '',
                      style: textStyle.custom()),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(color: color.grey70, height: 1.0),
                  ),
                  const SizedBox(height: 8.0),
                  Text(LocaleKeys.goline_GTHienTai.tr,
                      style: textStyle.custom()),
                  const SizedBox(height: 8.0),
                  Text(
                      listValue.value[index].calInvesmentAmtInDay
                          .formatPrice(decimalDigits: 0),
                      style: textStyle.custom()),
                  const SizedBox(height: 8.0)
                ]))),
        const SizedBox(width: 12.0),
        Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: color.grey70,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(children: <Widget>[
                  const SizedBox(height: 8.0),
                  Text(LocaleKeys.goline_THQTM.tr, style: textStyle.custom()),
                  const SizedBox(height: 8.0),
                  Text(
                      listValue.value[index].rightAmt
                              ?.formatPrice(decimalDigits: 0) ??
                          '',
                      style: textStyle.custom()),
                  const SizedBox(height: 8.0),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        color: color.grey70,
                        height: 1.0,
                      )),
                  const SizedBox(height: 8.0),
                  Text(LocaleKeys.goline_THQCK.tr, style: textStyle.custom()),
                  const SizedBox(height: 8.0),
                  Text(listValue.value[index].rightQty?.formatVolume() ?? '',
                      style: textStyle.custom()),
                  const SizedBox(height: 8.0)
                ])))
      ]),
      SizedBox(height: 8),
      Row(children: <Widget>[
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: WidgetButton(
              title: LocaleKeys.goline_Mua.tr,
              onClick: () {
                StockManager().moveStock(
                    secCd: listValue.value[index].secCd,
                    tradeType: TradeType.BUY);
              }),
        ),
        const SizedBox(width: 8.0),
        Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: WidgetButton(
                bgColor: color.background2,
                title: LocaleKeys.goline_Detail.tr,
                onClick: () {
                  Get.to(() =>
                      SecQuoteDetailPage(listValue.value[index].secCd ?? ''));
                })),
        const SizedBox(width: 8.0),
        Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: WidgetButton(
                bgColor: color.red50,
                title: LocaleKeys.goline_Ban.tr,
                onClick: () {
                  StockManager().moveStock(
                      secCd: listValue.value[index].secCd,
                      tradeType: TradeType.SELL);
                })),
      ]),
      SizedBox(height: 8),
    ]);
  }

  @override
  ItemProfitController? putController() {
    return ItemProfitController(
      index,
      listValue: listValue,
    );
  }
}
