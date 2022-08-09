import 'package:flutter_mobile/domain/model/grpc/auto_trading.pbgrpc.dart';
import 'package:flutter_mobile/domain/model/market/filter_market.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/pages/foreign_trade/foreign_trade_controller.dart';
import 'package:flutter_mobile/pages/market/widget/widgets.dart';
import 'package:flutter_mobile/widgets/checkbox.dart';
import 'package:flutter_svg/flutter_svg.dart';

mixin ForeignTradeChart on BaseMixin {
  ForeignTradeController get controller;

  Widget get popupFilter => PopupMenu(
        childPopup: _buildFilter,
        child: Container(
          color: Colors.transparent,
          alignment: Alignment.centerRight,
          child: SvgPicture.asset(AppPath.icFilter),
        ),
      ).paddingOnly(right: 16.width);

  Container _buildFilter(Function dissmiss) => Container(
        padding: EdgeInsets.only(
          left: 8.width,
          right: 8.width,
          bottom: 16.height,
          top: 8.height,
        ),
        decoration: BoxDecoration(
          color: color.background2,
          borderRadius: BorderRadius.circular(16),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IntrinsicWidth(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ...controller.listFilterSecCd
                      .map((Filter e) => Obx(
                            () => CheckBox(
                              onPress: (_) => controller.onClickFilter(
                                  typeFilter: TypeFilter.secCd, value: e),
                              title: e.label,
                              value: controller.currentIndexCd.contains(e),
                            ).paddingOnly(top: 8.height),
                          ))
                      .toList(),
                  // do API chưa có Param
                  // Divider(
                  //   height: 1,
                  //   thickness: 2,
                  //   color: Colors.grey[600],
                  // ).paddingOnly(
                  //     top: sized.padding16, bottom: sized.paddingVerySmall),
                  // ...controller.listFilterQty
                  //     .map(
                  //       (Filter e) => Obx(
                  //         () => CheckBoxTitle(
                  //           onPress: () => controller.onClickFilter(
                  //               typeFilter: TypeFilter.totalQty, value: e),
                  //           title: e.lable,
                  //           value: e.id == controller.currentQty.value.id,
                  //         ).paddingOnly(top: sized.paddingVerySmall.height),
                  //       ),
                  //     )
                  //     .toList()
                ]),
              ),
              VerticalDivider(color: color.grey40).paddingOnly(
                  right: sized.paddingVerySmall,
                  top: sized.paddingVerySmall.height),
              Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ...controller.listFilterPeriod
                        .map(
                          (Filter e) => Obx(
                            () => CheckBox(
                              onPress: (_) => controller.onClickFilter(
                                  typeFilter: TypeFilter.period, value: e),
                              title: e.label,
                              value: e.id == controller.currentPeriod.value.id,
                            ).paddingOnly(top: sized.paddingVerySmall.height),
                          ),
                        )
                        .toList(),
                  ]),
            ],
          ),
        ),
      );

  Obx buildForeignTrade({bool isDetailPage = false}) => Obx(
        () => controller.isDataEmpty
            ? Container(
                height: 200.height,
                alignment: Alignment.center,
                child: Text(
                  LocaleKeys.goline_NoDataFound.tr,
                  style: textStyle.custom(
                    color: color.grey40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            : _buildChart(isDetailPage).paddingAll(sized.paddingVerySmall),
      );

  ColoredBox buildTitleChart() => ColoredBox(
        color: color.background1,
        child: Row(
          children: <Widget>[
            _buildTextTitle(
                title: LocaleKeys.buy.tr, textColor: color.textColorGreen),
            _buildTextTitle(
                title: LocaleKeys.sell.tr, textColor: color.textColorRed),
          ],
        ),
      );

  Row _buildChart(bool isDetailPage) {
    final double _sizeShowPipe = Get.width * 0.25;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildChartDetail(controller.listBuy,
            sizeShow: _sizeShowPipe, isDetailPage: isDetailPage),
        SizedBox(width: sized.paddingSmall),
        _buildChartDetail(
          controller.listSell,
          sizeShow: _sizeShowPipe,
          isDetailPage: isDetailPage,
          isBuy: false,
        ),
      ],
    );
  }

  Widget _buildChartDetail(List<InternalMS> dataChart,
      {bool isDetailPage = false,
      bool isBuy = true,
      required double sizeShow}) {
    return Expanded(
      child: Column(
        crossAxisAlignment:
            isBuy ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          ...dataChart.take(controller.lengthListShow).toList().map(
                (InternalMS e) =>
                    _buildPipeChart(e, sizeShow: sizeShow, isBuy: isBuy),
              ),
        ],
      ),
    );
  }

  Directionality _buildPipeChart(InternalMS internal,
          {required double sizeShow, bool isBuy = true}) =>
      Directionality(
        textDirection: isBuy ? TextDirection.ltr : TextDirection.rtl,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              flex: 30,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  internal.netForeignQty.abs().toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: textStyle.custom(
                      color: color.grey40,
                      fontWeight: FontWeight.w500,
                      size: sized.font10),
                ),
              ),
            ),
            Flexible(
              flex: 70,
              child: Container(
                width: internal.netForeignQty.abs() *
                    sizeShow /
                    controller.maxValue.value,
                height: sized.height8.height,
                color: isBuy ? color.textColorGreen : color.textColorRed,
              ).paddingSymmetric(horizontal: sized.padding6),
            ),
            SizedBox(
              width: sized.iconSize_24,
              child: Text(
                internal.secCd.toUpperCase(),
                textAlign: TextAlign.right,
                style: textStyle.custom(
                    color: color.grey40,
                    fontWeight: FontWeight.w500,
                    size: sized.font10),
              ),
            )
          ],
        ).paddingOnly(bottom: sized.paddingSmall),
      );

  Expanded _buildTextTitle({required String title, required Color textColor}) =>
      Expanded(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: textStyle.custom(
              fontWeight: FontWeight.w500,
              size: sized.fontSmallest,
              color: textColor),
        ).paddingSymmetric(vertical: sized.paddingVerySmall),
      );
}
