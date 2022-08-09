import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/place_order/information/stock_information_controller.dart';
import 'package:flutter_mobile/pages/place_order/information/widget/item_price_match_price_wiget.dart';
import 'package:flutter_mobile/pages/place_order/information/widget/tripple_item_row.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rxdart/rxdart.dart' as rx;

class InfoStatisticsExpanded extends BaseWidget<StockInformationController> {
  InfoStatisticsExpanded(
    String? tag, {
    Key? key,
    this.showRowWhenCollap = 1,
  }) : super(key: key, tag: tag);

  final ValueNotifier<bool> _isCollapsed = ValueNotifier<bool>(false);
  final int showRowWhenCollap;

  List<Widget> get _getListViewExpanded =>
      controller.itemViewModel?.stockItem.secType == SecType.W
          ? _listExpandedCW
          : _getStatisticsExpandedBasic;

  @override
  Widget builder() {
    return _buildStatisticsExpanded;
  }

  Widget get _buildStatisticsExpanded => ValueListenableBuilder<bool>(
      valueListenable: _isCollapsed,
      builder: (_, bool value, __) {
        return InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () => _isCollapsed.value = !value,
            child: Column(children: <Widget>[
              Column(
                      children: _getListViewExpanded
                          .take(value
                              ? _getListViewExpanded.length
                              : showRowWhenCollap)
                          .toList())
                  .paddingOnly(left: 12, right: 12),
              SizedBox(height: showRowWhenCollap != 0 && !value ? 12 : 0),
              Container(
                  width: 1.getWidth,
                  height: 24,
                  decoration: BoxDecoration(
                      color: color.grey80,
                      border: Border(
                          top: BorderSide(width: 1, color: color.grey70),
                          bottom: BorderSide(width: 1, color: color.grey70))),
                  child: RotatedBox(
                    quarterTurns: value ? 90 : 0,
                    child: SvgPicture.asset(
                      AppPath.icArrowDown,
                      color: value ? color.grey40 : color.grey50,
                    ),
                  ))
            ]));
      });

  List<Widget> get _getStatisticsExpandedBasic => <Widget>[
        // Row 1
        buildStatisticsTripleItemsRow(
          left: StreamBuilder<List<dynamic>>(
              stream: rx.Rx.combineLatest4(
                  controller.openPriceStream,
                  controller.totalTradeQttyStream,
                  controller.mapSubjectChangeColor[Field.OPEN_PRICE]!,
                  controller.mapSubjectChangeColor[Field.AVG_PRICE]!,
                  (num a, num b, StatusFiled c, StatusFiled d) =>
                      <dynamic>[a, b, c, d]),
              builder: (_, __) => StatisticLabelValue(
                    label: LocaleKeys.openAvg.tr,
                    value1: controller.openPrice.formatPrice(),
                    value2: controller.avgPrice.formatPrice(),
                    separator: '/ ',
                    flickerValue1: controller
                        .mapSubjectChangeColor[Field.OPEN_PRICE]?.value,
                    flickerValue2: controller
                        .mapSubjectChangeColor[Field.AVG_PRICE]?.value,
                  )),
          middle: StreamBuilder<List<dynamic>>(
              stream: rx.Rx.combineLatest4(
                  controller.lowestPriceStream,
                  controller.highestPriceStream,
                  controller.mapSubjectChangeColor[Field.LOWEST_PRICE]!,
                  controller.mapSubjectChangeColor[Field.HIGHEST_PRICE]!,
                  (num a, num b, StatusFiled c, StatusFiled d) =>
                      <dynamic>[a, b, c, d]),
              builder: (_, __) => StatisticLabelValue(
                    label: LocaleKeys.dayRange.tr,
                    value1: controller.lowestPrice.formatPrice(),
                    value2: controller.highestPrice.formatPrice(),
                    separator: ' - ',
                    flickerValue1: controller
                        .mapSubjectChangeColor[Field.LOWEST_PRICE]?.value,
                    flickerValue2: controller
                        .mapSubjectChangeColor[Field.HIGHEST_PRICE]?.value,
                  )),
          right: StreamBuilder<List<dynamic>>(
            stream: rx.Rx.combineLatest2(
                controller.totalTradeQttyStream,
                controller.mapSubjectChangeColor[Field.TOTAL_QTTY]!,
                (_, __) => <dynamic>[]),
            builder: (_, __) => StatisticLabelValue(
              label: LocaleKeys.turnover.tr,
              value1: controller.totalTradeQtty.formatVolume(),
              flickerValue1:
                  controller.mapSubjectChangeColor[Field.TOTAL_QTTY]?.value,
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ),
        ),
        SizedBox(height: 12),

        // Row 2
        buildStatisticsTripleItemsRow(
            left: StreamBuilder<List<dynamic>>(
              stream: rx.Rx.combineLatest2(
                  controller.buyForeignStream,
                  controller.mapSubjectChangeColor[Field.BUY_FOREIGN_QTTY]!,
                  (_, __) => <dynamic>[]),
              builder: (_, __) => StatisticLabelValue(
                label: LocaleKeys.kLNNBuy.tr,
                value1: controller.buyForeign.formatVolume(),
                flickerValue1: controller
                    .mapSubjectChangeColor[Field.BUY_FOREIGN_QTTY]?.value,
              ),
            ),
            middle: StreamBuilder<List<dynamic>>(
              stream: rx.Rx.combineLatest2(
                  controller.sellForeignStream,
                  controller.mapSubjectChangeColor[Field.SELL_FOREIGN_QTTY]!,
                  (_, __) => <dynamic>[]),
              builder: (_, __) => StatisticLabelValue(
                label: LocaleKeys.kLNNSell.tr,
                value1: controller.sellForeign.formatVolume(),
                flickerValue1: controller
                    .mapSubjectChangeColor[Field.SELL_FOREIGN_QTTY]?.value,
              ),
            ),
            right: StreamBuilder<List<dynamic>>(
                stream: rx.Rx.combineLatest2(
                    controller.currentRoomStream,
                    controller.mapSubjectChangeColor[Field.CURRENT_ROOM]!,
                    (_, __) => <dynamic>[]),
                builder: (_, __) => StatisticLabelValue(
                      label: LocaleKeys.roomNN.tr,
                      value1: controller.currentRoom.formatVolume(),
                      flickerValue1: controller
                          .mapSubjectChangeColor[Field.CURRENT_ROOM]?.value,
                      mainAxisAlignment: MainAxisAlignment.end,
                      separator: '',
                    ))),

        SizedBox(height: 12),

        // Row 3
        buildStatisticsTripleItemsRow(
          left: StreamBuilder<num>(
            stream: controller.marketCapStream,
            builder: (_, __) => StatisticLabelValue(
              label: LocaleKeys.marketCap.tr,
              value1: 'N/A', //controller.marketCap.formatVolume(),
            ),
          ),
          middle: StreamBuilder<List<num>>(
              stream: rx.Rx.combineLatest2(controller.w52LowStream,
                  controller.w52HightStream, (_, __) => <num>[]),
              builder: (_, __) => StatisticLabelValue(
                    label: LocaleKeys.trading_week.tr,
                    value1: '${controller.w52Low} - ${controller.w52Hight} ',
                  )),
          right: StreamBuilder<num>(
            stream: controller.rangeStream,
            builder: (_, __) => StatisticLabelValue(
              label: LocaleKeys.percentRange.tr,
              value1: controller.range.formatRate(2),
              separator: '%',
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ),
        ),
        SizedBox(height: 12),

        // Row 4
        buildStatisticsTripleItemsRow(
          left: StreamBuilder<num>(
              stream: controller.listedQtyStream,
              builder: (_, __) => StatisticLabelValue(
                    label: LocaleKeys.shareOutstanding.tr,
                    value1: controller.listedQty.formatVolume(),
                  )),
          middle: StreamBuilder<num>(
              stream: controller.tradePercentStream,
              builder: (_, __) => StatisticLabelValue(
                    label: LocaleKeys.percentTurnover.tr,
                    value1: controller.turnOverRate.formatRate(2),
                    separator: '%',
                  )),
          right: StreamBuilder<num>(
              stream: controller.rangeStream,
              builder: (_, __) => StatisticLabelValue(
                    label: LocaleKeys.eps.tr,
                    value1: controller.esp.formatVolume(),
                    mainAxisAlignment: MainAxisAlignment.end,
                  )),
        ),
        SizedBox(height: 12),

        // Row 5
        buildStatisticsTripleItemsRow(
          left: StreamBuilder<num>(
              stream: controller.peStream,
              builder: (_, __) => StatisticLabelValue(
                    label: LocaleKeys.pe.tr,
                    value1: '${controller.pe}',
                  )),
          middle: StreamBuilder<num>(
              stream: controller.pbStream,
              builder: (_, __) => StatisticLabelValue(
                    label: LocaleKeys.pb.tr,
                    value1: '${controller.pb}',
                  )),
          right: StreamBuilder<num>(
              stream: controller.psStream,
              builder: (_, __) => StatisticLabelValue(
                    label: LocaleKeys.ps.tr,
                    value1: '${controller.ps}',
                    mainAxisAlignment: MainAxisAlignment.end,
                  )),
        ),

        SizedBox(height: 12),
      ];

  List<Widget> get _listExpandedCW => <Widget>[
        // Row 1
        buildStatisticsTripleItemsRow(
          // MỞ CỬA/TB
          left: StreamBuilder<List<dynamic>>(
            stream: rx.Rx.combineLatest4(
                controller.openPriceStream,
                controller.totalTradeQttyStream,
                controller.mapSubjectChangeColor[Field.OPEN_PRICE]!,
                controller.mapSubjectChangeColor[Field.AVG_PRICE]!,
                (num a, num b, StatusFiled c, StatusFiled d) =>
                    <dynamic>[a, b, c, d]),
            builder: (_, __) => StatisticLabelValue(
              label: LocaleKeys.openAvg.tr,
              value1: controller.openPrice.formatPrice(),
              value2: controller.avgPrice.formatPrice(),
              separator: '/ ',
              flickerValue1:
                  controller.mapSubjectChangeColor[Field.OPEN_PRICE]?.value,
              flickerValue2:
                  controller.mapSubjectChangeColor[Field.AVG_PRICE]?.value,
            ),
          ),
          // THẤP/CAO
          middle: StreamBuilder<List<dynamic>>(
            stream: rx.Rx.combineLatest4(
                controller.lowestPriceStream,
                controller.highestPriceStream,
                controller.mapSubjectChangeColor[Field.LOWEST_PRICE]!,
                controller.mapSubjectChangeColor[Field.HIGHEST_PRICE]!,
                (num a, num b, StatusFiled c, StatusFiled d) =>
                    <dynamic>[a, b, c, d]),
            builder: (_, __) => StatisticLabelValue(
              label: LocaleKeys.dayRange.tr,
              value1: controller.lowestPrice.formatPrice(),
              value2: controller.highestPrice.formatPrice(),
              separator: ' - ',
              flickerValue1:
                  controller.mapSubjectChangeColor[Field.LOWEST_PRICE]?.value,
              flickerValue2:
                  controller.mapSubjectChangeColor[Field.HIGHEST_PRICE]?.value,
            ),
          ),
          // TỔNG KL
          right: StreamBuilder<List<dynamic>>(
            stream: rx.Rx.combineLatest2(
                controller.totalTradeQttyStream,
                controller.mapSubjectChangeColor[Field.TOTAL_QTTY]!,
                (_, __) => <dynamic>[]),
            builder: (_, __) => StatisticLabelValue(
              label: LocaleKeys.turnover.tr,
              value1: controller.totalTradeQtty.formatVolume(),
              flickerValue1:
                  controller.mapSubjectChangeColor[Field.TOTAL_QTTY]?.value,
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ),
        ),
        SizedBox(height: 12),
        // Row 2
        buildStatisticsTripleItemsRow(
          // KLNN MUA
          left: StreamBuilder<List<dynamic>>(
            stream: rx.Rx.combineLatest2(
                controller.buyForeignStream,
                controller.mapSubjectChangeColor[Field.BUY_FOREIGN_QTTY]!,
                (_, __) => <dynamic>[]),
            builder: (_, __) => StatisticLabelValue(
              label: LocaleKeys.kLNNBuy.tr,
              value1: controller.buyForeign.formatVolume(),
              flickerValue1: controller
                  .mapSubjectChangeColor[Field.BUY_FOREIGN_QTTY]?.value,
            ),
          ),
          // KLNN BÁN
          middle: StreamBuilder<List<dynamic>>(
            stream: rx.Rx.combineLatest2(
                controller.sellForeignStream,
                controller.mapSubjectChangeColor[Field.SELL_FOREIGN_QTTY]!,
                (_, __) => <dynamic>[]),
            builder: (_, __) => StatisticLabelValue(
              label: LocaleKeys.kLNNSell.tr,
              value1: controller.sellForeign.formatVolume(),
              flickerValue1: controller
                  .mapSubjectChangeColor[Field.SELL_FOREIGN_QTTY]?.value,
            ),
          ),
          // ROOM NN
          right: StreamBuilder<List<dynamic>>(
            stream: rx.Rx.combineLatest2(
                controller.currentRoomStream,
                controller.mapSubjectChangeColor[Field.CURRENT_ROOM]!,
                (_, __) => <dynamic>[]),
            builder: (_, __) => StatisticLabelValue(
              label: LocaleKeys.roomNN.tr,
              value1: controller.currentRoom.formatVolume(),
              flickerValue1:
                  controller.mapSubjectChangeColor[Field.CURRENT_ROOM]?.value,
              mainAxisAlignment: MainAxisAlignment.end,
              separator: '',
            ),
          ),
        ),
        SizedBox(height: 12),
        // Row 3
        buildStatisticsTripleItemsRow(
          // NGÀY GD CUỐI
          left: StreamBuilder<num>(
            stream: controller.lastTradeDateStream,
            builder: (_, __) => StatisticLabelValue(
              label: 'NGÀY GD CUỐI',
              value1: controller.lastTradeDate,
            ),
          ),
          // GIÁ THỰC HIỆN
          middle: StreamBuilder<num>(
            stream: controller.execPriceStream,
            builder: (_, __) => StatisticLabelValue(
              label: 'GIÁ THỰC HIỆN',
              value1: controller.execPrice.formatVolume(decimalDigits: 2),
            ),
          ),
          // TL CHUYỂN ĐỔI
          right: StreamBuilder<String>(
            stream: controller.execRatioStream,
            builder: (_, __) => StatisticLabelValue(
              label: 'TL CHUYỂN ĐỔI',
              value1: controller.execRatio,
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ),
        ),
        SizedBox(height: 12),
        // Row 4
        buildStatisticsTripleItemsRow(
          // TCPH
          left: StreamBuilder<String>(
            stream: controller.issuerDataStream,
            builder: (_, __) => StatisticLabelValue(
              label: LocaleKeys.goline_BondIssuer.tr,
              value1: controller.issuerData,
            ),
          ),
          // MÃ CKCS
          middle: StreamBuilder<String>(
            stream: controller.baseSecCdDataStream,
            builder: (_, __) => StatisticLabelValue(
              label: 'MÃ CKCS',
              value1: controller.baseSecCdData,
            ),
          ),
          // GIÁ CKCS
          right: StreamBuilder<String>(
            stream: controller.baseSecCdDataStream,
            builder: (_, __) => isNotNullOrEmpty(controller.baseSecCdData)
                ? ItemMatchPriceCWWideget(controller.baseSecCdData)
                : SizedBox(),
          ),
        ),
        SizedBox(height: 12),
      ];
}
