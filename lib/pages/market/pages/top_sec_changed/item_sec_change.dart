import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/pages/top_sec_changed/top_sec_changed_controller.dart';
import 'package:flutter_mobile/pages/watch_list/item/stock_item_controller.dart';
import 'package:rxdart/rxdart.dart' as rx;

class ItemSecChange extends BaseScreen<StockItemController> {
  ItemSecChange(this.stockItemViewModel, this.colorBg,
      {required String tag, Key? key, required this.topSecChangedController})
      : super(key: key, tag: tag);

  final StockItemViewModel stockItemViewModel;
  final Color? colorBg;
  final TopSecChangedController topSecChangedController;

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
              height: 52,
              color: colorBg,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(children: <Widget>[
                _buildTicker(controller),
                _buildLastPrice(controller),
                _buildChangePercent(controller),
                _buildVolume(controller)
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
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      StreamBuilder<num>(
          stream: controller.colorCodeStream,
          builder: (_, AsyncSnapshot<num> snapshot) {
            return StreamBuilder<List<num>>(
                stream: rx.Rx.combineLatest2(controller.matchPriceStream,
                    controller.colorCodeStream, (num a, num b) => <num>[a, b]),
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

                        return Text(_lastPrice.formatPrice(),
                            style: textStyle
                                .medium(color: _colorPrice)
                                .copyWith(backgroundColor: _bColorPrice));
                      });
                });
          })
    ]));
  }

  Widget _buildChangePercent(StockItemController controller) {
    return Expanded(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      StreamBuilder<num>(
          stream: controller.colorCodeStream,
          builder: (_, AsyncSnapshot<num> snapshot) {
            return StreamBuilder<num>(
                stream: controller.changePercentStream,
                builder: (_, AsyncSnapshot<num> snapshot) {
                  return StreamBuilder<StatusFiled>(
                      stream: controller
                          .mapSubjectChangeColor[Field.CHANGE_PERCENT]!.stream,
                      builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
                        final Color _colorPrice = controller.getColorWithCode();

                        final num _changePricePercent =
                            controller.changePercent;
                        final Color? _bColorPrice = controller
                            .mapSubjectChangeColor[Field.CHANGE_PERCENT]!.value
                            .bChangedBColor(_colorPrice);
                        return Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                                '${_changePricePercent.getPrefix}${_changePricePercent.formatRate(2)}%',
                                style: textStyle
                                    .medium(color: _colorPrice)
                                    .copyWith(backgroundColor: _bColorPrice)));
                      });
                });
          })
    ]));
  }

  Widget _buildVolume(StockItemController controller) {
    return Obx(() => Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
              () {
                switch (topSecChangedController.changedSelect.value.id) {
                  case 2:
                    return _buildFilterVolume;
                  case 3:
                    return _buildFilterChange;
                  case 1:
                  default:
                    return _buildFilterValue;
                }
              }()
            ])));
  }

  Widget get _buildFilterChange => StreamBuilder<num>(
      stream: controller.changeHighLowStream,
      builder: (_, AsyncSnapshot<num> snapshot) {
        return StreamBuilder<num>(
            stream: controller.colorCodeStream,
            builder: (_, AsyncSnapshot<num> snapshot) {
              return Row(children: <Widget>[
                Container(
                    alignment: Alignment.centerRight,
                    child: Text('${controller.changeHighLow.formatRate(2)}%',
                        style: textStyle.medium(
                            color: controller.getColorWithCode())))
              ]);
            });
      });

  Widget get _buildFilterValue => StreamBuilder<num>(
      stream: controller.totalAmtStream,
      builder: (_, AsyncSnapshot<num> snapshot) {
        return StreamBuilder<StatusFiled>(
            stream: controller.mapSubjectChangeColor[Field.TOTAl_AMT]!.stream,
            builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
              final StatusFiled _changedProperties =
                  controller.mapSubjectChangeColor[Field.TOTAl_AMT]!.value;
              return Row(children: <Widget>[
                Container(
                    alignment: Alignment.centerRight,
                    child: Text(controller.totalAmt.formatVolume(),
                        style: textStyle
                            .medium(
                                color: _changedProperties
                                    .textChangedColor(color.grey20))
                            .copyWith(
                                backgroundColor:
                                    _changedProperties.bgChangedColorGrey())))
              ]);
            });
      });

  Widget get _buildFilterVolume => StreamBuilder<num>(
      stream: controller.totalTradeQttyStream,
      builder: (_, AsyncSnapshot<num> snapshot) {
        return StreamBuilder<StatusFiled>(
            stream: controller.mapSubjectChangeColor[Field.TOTAL_QTTY]!.stream,
            builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
              final StatusFiled _changedProperties =
                  controller.mapSubjectChangeColor[Field.TOTAL_QTTY]!.value;
              return Row(children: <Widget>[
                Container(
                    alignment: Alignment.centerRight,
                    child: Text(controller.totalTradeQtty.formatVolume(),
                        style: textStyle
                            .medium(
                                color: _changedProperties
                                    .textChangedColor(color.grey20))
                            .copyWith(
                                backgroundColor:
                                    _changedProperties.bgChangedColorGrey())))
              ]);
            });
      });

  @override
  StockItemController? putController() {
    return StockItemController(
      itemViewModel: stockItemViewModel,
      canGetFullInfor: false,
    );
  }
}
