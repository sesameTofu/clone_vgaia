import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/place_order/information/stock_information_controller.dart';

class LastPriceWidget extends BaseWidget<StockInformationController> {
  LastPriceWidget(this._getValue, {Key? key, String? tag})
      : super(key: key, tag: tag);
  final Function(String value) _getValue;
  @override
  Widget builder() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: _buildPrice,
      );

  // giá

  Widget get _buildPrice => IntrinsicHeight(
          child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          StreamBuilder<num>(
            stream: controller.matchPriceStream,
            builder: (BuildContext context, AsyncSnapshot<num> value) {
              return StreamBuilder<StatusFiled>(
                  stream: controller.mapSubjectChangeColor[Field.MATCH_PRICE],
                  builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
                    final StatusFiled? status = snapshot.data;
                    final Color? bg = status?.bgChangedColor;
                    final Color lastColor =
                        controller.getLastColor(value.data ?? 0);
                    return InkWell(
                      onTap: () {
                        _getValue(controller.matchPrice.formatPrice());
                      },
                      child: Container(
                        color: bg,
                        child: Text(
                            controller.matchPrice.formatPrice(decimalDigits: 2),
                            style: textStyle.bold(
                                color: status?.textChangedColor(lastColor),
                                size: 32)),
                      ),
                    );
                  });
            },
          ),
          SizedBox(width: 8),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<num>(
                stream: controller.changePointStream,
                builder: (BuildContext context, AsyncSnapshot<num> value) {
                  return StreamBuilder<StatusFiled>(
                      stream:
                          controller.mapSubjectChangeColor[Field.CHANGE_POINT],
                      builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
                        final StatusFiled? status = snapshot.data;
                        final Color? bg = status?.bgChangedColor;

                        String text = '';
                        if (value.data == null) {
                          text = '0.00';
                        } else {
                          text =
                              '${value.data! > 0 ? '+' : ''}${value.data!.formatVolume(decimalDigits: 2)}';
                        }
                        return Container(
                            color: bg,
                            child: Text(text,
                                style: textStyle.medium(
                                  color: status
                                      ?.textChangedColor(controller.lastColor),
                                  size: 12,
                                )));
                      });
                },
              ),
              StreamBuilder<num>(
                stream: controller.changePercentStream,
                builder: (BuildContext context, AsyncSnapshot<num> value) {
                  return StreamBuilder<StatusFiled>(
                      stream: controller
                          .mapSubjectChangeColor[Field.CHANGE_PERCENT],
                      builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
                        final StatusFiled? status = snapshot.data;
                        final Color? bg = status?.bgChangedColor;

                        String text = '';
                        if (value.data == null) {
                          text = '0.00%';
                        } else {
                          text =
                              '${value.data! > 0 ? '+' : ''}${value.data!.formatVolume(decimalDigits: 2)}%';
                        }

                        return Container(
                          color: bg,
                          child: Text(text,
                              style: textStyle.medium(
                                  color: status
                                      ?.textChangedColor(controller.lastColor),
                                  size: 12)),
                        );
                      });
                },
              ),
            ],
          ),
          Spacer(),
          _buildTotalQtty,
          SizedBox(width: 8),
          StreamBuilder<num>(
            stream: controller.ceilingPriceStream,
            builder: (BuildContext context, AsyncSnapshot<num> value) {
              final String text = (value.data ?? 0).formatPrice();
              return _buildBox(
                label: LocaleKeys.celling.tr,
                value: text,
                onPress: () => _getValue(text),
                textCl: color.violet50,
              );
            },
          ),
          SizedBox(width: 8),
          StreamBuilder<num>(
            stream: controller.basicPriceStream,
            builder: (BuildContext context, AsyncSnapshot<num> value) {
              final String text =
                  (value.data ?? 0).formatVolume(decimalDigits: 2);
              return _buildBox(
                label: LocaleKeys.price_tc.tr,
                value: text,
                onPress: () => _getValue(text),
                textCl: color.yellow50,
              );
            },
          ),
          SizedBox(width: 8),
          StreamBuilder<num>(
            stream: controller.floorPriceSubjectStream,
            builder: (BuildContext context, AsyncSnapshot<num> value) {
              final String text = (value.data ?? 0).formatPrice();
              return _buildBox(
                label: LocaleKeys.floor.tr,
                value: text,
                onPress: () => _getValue(text),
                textCl: color.blue50,
              );
            },
          ),
          SizedBox(width: 5),
        ],
      ));
  void onTapPrice(double price) {
    // if (function != null) {
    //   function!(price.toString());
    // }
  }

  Widget get _buildTotalQtty {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Spacer(),
          Text(
            LocaleKeys.total_qty.tr,
            style: textStyle
                .custom(
                    fontWeight: FontWeight.w600,
                    size: sized.font10,
                    color: color.grey40)
                .copyWith(height: 1.2),
          ),
          Spacer(),
          StreamBuilder<num>(
              stream: controller.totalTradeQttyStream,
              builder: (_, AsyncSnapshot<num> snapshot) {
                return StreamBuilder<StatusFiled>(
                    stream: controller
                        .mapSubjectChangeColor[Field.TOTAL_QTTY]!.stream,
                    builder: (_, AsyncSnapshot<StatusFiled> snapshot) {
                      final StatusFiled _changedProperties = controller
                          .mapSubjectChangeColor[Field.TOTAL_QTTY]!.value;
                      return Row(children: <Widget>[
                        Container(
                            color: _changedProperties.bgChangedColorGrey(),
                            child: Text(
                                controller.totalTradeQtty.formatVolume(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textStyle.custom(
                                    size: 12,
                                    color: _changedProperties
                                        .textChangedColor(color.grey20))))
                      ]);
                    });
              }),
          Spacer(),
        ]);
  }

  Widget _buildBox({
    required String label,
    required String value,
    required Function() onPress,
    required Color textCl,
  }) {
    return InkWell(
      onTap: onPress,
      child: SizedBox(
        //width: 36.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Spacer(),
            Text(
              label,
              style: textStyle
                  .custom(
                      fontWeight: FontWeight.w600,
                      size: sized.font10,
                      color: color.grey40)
                  .copyWith(height: 1.2),
            ),
            Spacer(),
            Text(
              value,
              style: textStyle
                  .custom(
                    fontWeight: FontWeight.w600,
                    size: 12,
                    color: textCl,
                  )
                  .copyWith(height: 1.2),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  int decimalDigits(num price) {
    if (price != 0 && price >= 50) {
      return 1;
    } else {
      return 2;
    }
  }
}
