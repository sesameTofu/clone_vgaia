import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/place_order/information/stock_information_controller.dart';
import 'package:flutter_mobile/utils/functs.dart';

class AskBidWidget extends BaseScreen<StockInformationController> {
  AskBidWidget(this._getValue, this.stockInformationController,
      {String? tag, Key? key})
      : super(key: key, tag: tag);
  final Function(String) _getValue;
  final StockInformationController? stockInformationController;

  @override
  StockInformationController? putController() {
    return stockInformationController;
  }

  @override
  Widget builder() => _buildBody();

  Widget _buildBody() => Column(children: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
            child: Row(children: <Widget>[
              Expanded(child: _buildBid()),
              SizedBox(width: 8),
              Expanded(child: _buildAsk())
            ])),
        _buildPercentBidAsk()
      ]);

  Widget _buildBid() {
    return Column(children: <Widget>[
      _buildItemBidAsk(
          priceStream: controller.bPrice1Stream,
          priceStreamString: controller.bPriceString1Stream,
          qTTYStream: controller.bQtty1Stream,
          percent: controller.bPercent1,
          colorPercent: color.green50,
          statusFiledPrice:
              controller.mapSubjectChangeColor[Field.BPRICE1]!.stream,
          statusFiledVolume:
              controller.mapSubjectChangeColor[Field.BQTTY1]!.stream),
      SizedBox(height: 4.0),
      _buildItemBidAsk(
          priceStream: controller.bPrice2Stream,
          qTTYStream: controller.bQtty2Stream,
          percent: controller.bPercent2,
          colorPercent: color.green50,
          statusFiledPrice:
              controller.mapSubjectChangeColor[Field.BPRICE2]!.stream,
          statusFiledVolume:
              controller.mapSubjectChangeColor[Field.BQTTY2]!.stream),
      SizedBox(height: 4.0),
      _buildItemBidAsk(
          priceStream: controller.bPrice3Stream,
          qTTYStream: controller.bQtty3Stream,
          percent: controller.bPercent3,
          colorPercent: color.green50,
          statusFiledPrice:
              controller.mapSubjectChangeColor[Field.BPRICE3]!.stream,
          statusFiledVolume:
              controller.mapSubjectChangeColor[Field.BQTTY3]!.stream)
    ]);
  }

  Widget _buildAsk() {
    return Column(
      children: <Widget>[
        _buildItemBidAsk(
            priceStream: controller.sPrice1Stream,
            priceStreamString: controller.sPriceString1Stream,
            qTTYStream: controller.sQtty1Stream,
            percent: controller.sPercent1,
            colorPercent: color.red50,
            textDirection: TextDirection.rtl,
            statusFiledPrice:
                controller.mapSubjectChangeColor[Field.SPRICE1]!.stream,
            statusFiledVolume:
                controller.mapSubjectChangeColor[Field.SQTTY1]!.stream),
        SizedBox(height: 4.0),
        _buildItemBidAsk(
            priceStream: controller.sPrice2Stream,
            qTTYStream: controller.sQtty2Stream,
            percent: controller.sPercent2,
            colorPercent: color.red50,
            textDirection: TextDirection.rtl,
            statusFiledPrice:
                controller.mapSubjectChangeColor[Field.SPRICE2]!.stream,
            statusFiledVolume:
                controller.mapSubjectChangeColor[Field.SQTTY2]!.stream),
        SizedBox(height: 4.0),
        _buildItemBidAsk(
            priceStream: controller.sPrice3Stream,
            qTTYStream: controller.sQtty3Stream,
            percent: controller.sPercent3,
            colorPercent: color.red50,
            textDirection: TextDirection.rtl,
            statusFiledPrice:
                controller.mapSubjectChangeColor[Field.SPRICE3]!.stream,
            statusFiledVolume:
                controller.mapSubjectChangeColor[Field.SQTTY3]!.stream),
      ],
    );
  }

  Widget _buildItemBidAsk({
    required Stream<num> priceStream,
    Stream<String>? priceStreamString,
    required Stream<StatusFiled> statusFiledPrice,
    required Stream<num> qTTYStream,
    required Stream<StatusFiled> statusFiledVolume,
    required RxNotify<num> percent,
    required Color colorPercent,
    TextDirection? textDirection,
  }) =>
      SizedBox(
          height: 18,
          child: Stack(children: <Widget>[
            _buildPercent(textDirection, percent, colorPercent),
            Center(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.0.width),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        textDirection: textDirection,
                        children: <Widget>[
                          StreamBuilder<num>(
                            stream: qTTYStream,
                            builder: (BuildContext context,
                                AsyncSnapshot<num> snapshot) {
                              String value = '';
                              if (snapshot.data != 0) {
                                value =
                                    ((snapshot.data ?? 0) * 10).formatVolume();
                              }

                              return StreamBuilder<StatusFiled>(
                                  stream: statusFiledVolume,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<StatusFiled> snapshot) {
                                    return Container(
                                      color: snapshot.data.bgChangedColorGrey(),
                                      child: Text(value,
                                          style: textStyle.regular(
                                              size: 12, color: color.grey0)),
                                    );
                                  });
                            },
                          ),
                          if (priceStreamString == null)
                            StreamBuilder<num>(
                                stream: priceStream,
                                builder: (BuildContext context,
                                    AsyncSnapshot<num> snapshot) {
                                  String value = '';
                                  if (snapshot.data != 0) {
                                    value = snapshot.data?.formatPrice() ?? '';
                                  }

                                  return InkWell(
                                      onTap: () {
                                        _getValue(value);
                                      },
                                      child: StreamBuilder<StatusFiled>(
                                          stream: statusFiledPrice,
                                          builder: (BuildContext context,
                                              AsyncSnapshot<StatusFiled>
                                                  snapshot1) {
                                            return Container(
                                              color: snapshot1.data
                                                  .bgChangedColorGrey(),
                                              child: Text(value,
                                                  style: textStyle.regular(
                                                      size: 12,
                                                      color: controller
                                                          .getLastColor(
                                                              snapshot.data ??
                                                                  0))),
                                            );
                                          }));
                                })
                          else
                            StreamBuilder<String>(
                                stream: priceStreamString,
                                builder: (BuildContext context,
                                    AsyncSnapshot<String> snapshot1) {
                                  return StreamBuilder<num>(
                                      stream: priceStream,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<num> snapshot) {
                                        String value = '';
                                        if (isNotNullOrEmpty(snapshot1.data)) {
                                          if (snapshot1.data.isString) {
                                            value = snapshot1.data!;
                                          }
                                        }

                                        if (snapshot.data != 0) {
                                          value =
                                              snapshot.data?.formatPrice() ??
                                                  '';
                                        }
                                        // else if ((snapshot1.data as String)
                                        //     .isString) {
                                        //   value = snapshot1.data ?? '';
                                        // }

                                        return InkWell(
                                            onTap: () {
                                              _getValue(value);
                                            },
                                            child: StreamBuilder<StatusFiled>(
                                                stream: statusFiledPrice,
                                                builder: (BuildContext context,
                                                    AsyncSnapshot<StatusFiled>
                                                        snapshot1) {
                                                  return Container(
                                                      color: snapshot1.data
                                                          .bgChangedColorGrey(),
                                                      child: Text(value,
                                                          style: textStyle.regular(
                                                              size: 12,
                                                              color: controller
                                                                  .getLastColor(
                                                                      value
                                                                          .formatNumber()))));
                                                }));
                                      });
                                })
                        ])))
          ]));

  Widget _buildPercent(
    TextDirection? textDirection,
    RxNotify<num> percent,
    Color colorPercent,
  ) {
    return ValueListenableBuilder<num>(
        valueListenable: percent,
        builder: (BuildContext context, num value, Widget? child) {
          final num valuePercent = value;
          return Row(
              mainAxisAlignment: textDirection == TextDirection.rtl
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
              children: <Widget>[
                AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: valuePercent * (0.5.getWidth - 12.width - 4.width),
                    height: 18,
                    decoration:
                        BoxDecoration(color: colorPercent.withOpacity(0.2)))
              ]);
        });
  }

  Widget _buildPercentBidAsk() => ValueListenableBuilder<num>(
      valueListenable: controller.totalBidAsk,
      builder: (BuildContext context, num value, Widget? child) {
        final num total = value;
        final num percentAsk = total == 0 ? 0.5 : controller.totalAsk / total;
        final num percentBid = 1 - percentAsk;

        return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(LocaleKeys.buy.tr.toUpperCase(),
                        style: textStyle.regular(
                            size: sized.fontSmallest, color: color.grey0)),
                    Spacer(),
                    Text(LocaleKeys.sell.tr.toUpperCase(),
                        style: textStyle.regular(
                            size: sized.fontSmallest, color: color.grey0)),
                  ]),
              SizedBox(height: 2),
              Container(
                  height: 20,
                  width: 1.getWidth,
                  foregroundDecoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  decoration: BoxDecoration(
                      color: color.green50,
                      borderRadius: BorderRadius.circular(4)),
                  child: Stack(children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          if (percentAsk != 1)
                            Container(
                                width: 2, height: 20, color: color.background1),
                          AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              width: percentAsk *
                                  ((1.getWidth - 26) -
                                      (percentAsk != 1 ? 2 : 1)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(4),
                                      bottomRight: Radius.circular(4)),
                                  color: color.red50))
                        ]),
                    Center(
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                      '${(total == 0 ? 0 : percentBid * 100).formatPrice(decimalDigits: 2, trimZero: true)}%',
                                      style: textStyle.medium(
                                          size: 12, color: color.grey0)),
                                  Text(
                                      '${(total == 0 ? 0 : percentAsk * 100).formatPrice(decimalDigits: 2, trimZero: true)}%',
                                      style: textStyle.medium(
                                          size: 12, color: color.grey0))
                                ])))
                  ]))
            ]));
      });
}
