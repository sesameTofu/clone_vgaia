import 'package:flutter_mobile/core/model/match_model.dart';
import 'package:flutter_mobile/core/model/match_volume.dart';
import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/watch_list/sec_quote_detail/sec_quote_detail_controller.dart';
import 'package:flutter_mobile/widgets/app_loading.dart';

class TimeAndSaleWidget extends BaseWidget<SecQuoteDetailController> {
  TimeAndSaleWidget({
    this.tagController,
    Key? key,
  }) : super(key: key, tag: tagController);
  final String? tagController;

  @override
  Widget builder() {
    return ValueListenableBuilder<bool>(
        valueListenable: controller.stockInformationController.itemViewModel
            ?.mapLoadingApi[API_STOCK_VIEW_MODEL.MATCH_DATA]! as RxNotify<bool>,
        builder: (_, bool? isLoading, __) {
          if (isLoading! == true) {
            return SizedBox(height: 200, child: appLoading);
          } else {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              height: 350,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildTileList,
                  Expanded(
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          // Lịch sử khớp
                          Expanded(
                            flex: 5,
                            child: ValueListenableBuilder<List<MatchModel>>(
                              valueListenable: controller.listMatchQuantity,
                              builder:
                                  (_, List<MatchModel> listMatchQuantity, ___) {
                                if (listMatchQuantity.isEmpty) {
                                  return SizedBox();
                                }
                                return ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  padding: EdgeInsets.only(bottom: 12),
                                  itemBuilder: (_, int indexTime) =>
                                      _buildTime(listMatchQuantity[indexTime]),
                                  itemCount: listMatchQuantity.length,
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 24),
                          // Phân tích KL
                          Expanded(
                            flex: 4,
                            child: ValueListenableBuilder<List<MatchVolume>>(
                              valueListenable: controller.listSale,
                              builder: (_, List<MatchVolume> listSale, ___) {
                                if (listSale.isEmpty) {
                                  return SizedBox();
                                }
                                return ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  padding: EdgeInsets.only(bottom: 12),
                                  itemBuilder: (_, int indexSale) =>
                                      _buildSalesRow(listSale[indexSale]),
                                  itemCount: listSale.length,
                                );
                              },
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            );
          }
        });
  }

  Widget get _buildTileList => Row(children: <Widget>[
        Expanded(
            flex: 5,
            child: Text(LocaleKeys.history_match_order.tr,
                style: textStyle.custom(
                  size: 13,
                  fontWeight: FontWeight.w500,
                  color: color.grey0,
                ))),
        SizedBox(width: 12),
        Expanded(
            flex: 4,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(LocaleKeys.analysis_vol.tr,
                      style: textStyle.custom(
                        size: 13,
                        fontWeight: FontWeight.w500,
                        color: color.grey0,
                      )),
                ),
                _buildTimeFilter,
              ],
            )),
      ]);

  Widget get _buildTimeFilter => Obx(() => DropdownButton<Select<int>>(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        underline: SizedBox(),
        alignment: Alignment.center,
        elevation: 0,
        borderRadius: BorderRadius.circular(12),
        icon: SizedBox(),
        value: controller.currentTimeFilter.value,
        dropdownColor: color.grey70,
        onChanged: (Select<int>? value) {
          if (value != null) {
            controller.currentTimeFilter.value = value;
          }
        },
        items: controller.listTimeFilter.map((Select<int> item) {
          return DropdownMenuItem<Select<int>>(
              value: item,
              child: _buildItemTimeFilter(
                  item, controller.currentTimeFilter.value == item));
        }).toList(),
      ));

  Widget _buildItemTimeFilter(Select<int> option, bool isSelected) => Container(
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            color: color.grey70,
            border: Border.all(color: color.grey60),
            borderRadius: BorderRadius.circular(4)),
        height: 24,
        width: 24,
        child: Text(
          option.title!,
          style: textStyle.custom(
            color: isSelected ? color.primary : color.grey40,
          ),
        ),
      );

  Widget _buildTime(MatchModel matchTime) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Expanded(
            flex: 3,
            child: Text(matchTime.matTime,
                textAlign: TextAlign.left,
                maxLines: 1,
                style: textStyle.regular(color: color.grey40, size: 12))),
        Expanded(
            flex: 2,
            child: Text(matchTime.matPrice.formatPrice(),
                textAlign: TextAlign.right,
                style: textStyle.regular(
                    color: controller.stockInformationController
                        .getLastColor(matchTime.matPrice),
                    size: sized.fontSmallest))),
        Expanded(
            flex: 4,
            child: Text((matchTime.matQtty * 10).formatVolume(),
                textAlign: TextAlign.right,
                style: textStyle.regular(
                    color: controller.stockInformationController
                        .getLastColor(matchTime.matPrice),
                    size: sized.fontSmallest))),
        SizedBox(width: 8),
        Container(
            width: 10,
            alignment: Alignment.center,
            child: Text(matchTime.tradeType.titleMatch(),
                textAlign: TextAlign.left,
                style: textStyle.regular(
                    color: matchTime.tradeType.color(),
                    size: sized.fontSmallest)))
      ]),
    );
  }

  Widget _buildSalesRow(MatchVolume matchSale) {
    ///
    final int _percentShow =
        (((matchSale.percentByTotal ?? 1) / controller.maxPercentListSale) *
                100)
            .round();
    final int _buyFlex = matchSale.totalQty == 0
        ? 0
        : (((matchSale.buyQty ?? 0) / (matchSale.totalQty ?? 1)) * 100).round();
    final int _sellFlex = matchSale.totalQty == 0
        ? 0
        : (((matchSale.sellQty ?? 0) / (matchSale.totalQty ?? 1)) * 100)
            .round();
    final int _neutralFlex = matchSale.totalQty == 0
        ? 0
        : ((((matchSale.totalQty ?? 0) -
                        (matchSale.buyQty ?? 0) -
                        (matchSale.sellQty ?? 0)) /
                    (matchSale.totalQty ?? 1)) *
                100)
            .round();

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
              width: 56,
              child: Text((matchSale.matPrice ?? 0).formatPrice(),
                  style: textStyle.regular(
                      color: controller.stockInformationController
                          .getLastColor(matchSale.matPrice ?? 0),
                      size: sized.fontSmallest))),
          Expanded(
            flex: _percentShow < 1 ? 1 : _percentShow,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (_buyFlex > 0)
                    Expanded(
                        flex: _buyFlex,
                        child: Container(height: 10, color: color.green50)),
                  if (_sellFlex > 0)
                    Expanded(
                        flex: _sellFlex,
                        child: Container(height: 10, color: color.red50)),
                  if (_neutralFlex > 0)
                    Expanded(
                        flex: _neutralFlex,
                        child: Container(height: 10, color: color.secondary))
                ]),
          ),
          if ((100 - _percentShow) > 0) Spacer(flex: 100 - _percentShow),
          SizedBox(
              width: 56,
              child: Text('${(matchSale.percentByTotal ?? 0).formatRate(2)}%',
                  textAlign: TextAlign.end,
                  style: textStyle.regular(
                      color: color.grey20, size: sized.fontSmallest)))
        ],
      ),
    );
  }
}
