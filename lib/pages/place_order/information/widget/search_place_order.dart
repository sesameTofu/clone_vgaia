import 'package:flutter/services.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/place_order/information/stock_information_controller.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_mobile/utils/text_formatter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchWidget extends BaseWidget<StockInformationController> {
  SearchWidget({
    Key? key,
    String? tag,
  }) : super(tag: tag, key: key) {
    _ticker.value = controller.searchController.text;
    controller.searchStockWhenTextChange(_ticker.value);
    controller.searchController.addListener(() {
      _ticker.value = controller.searchController.text;
    });
  }
  final RxString _ticker = ''.obs;

  @override
  Widget builder() {
    return ValueListenableBuilder<bool>(
        valueListenable: controller.isFoucus,
        builder: (_, bool isFoucus, ___) {
          return Container(
              height: 32,
              margin: EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color.grey80,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 1,
                  color: isFoucus ? color.primary : color.grey70,
                ),
              ),
              child: IntrinsicHeight(
                  child: Row(children: <Widget>[
                SizedBox(width: 12),
                SvgPicture.asset(AppPath.icSearch, color: color.grey40),
                SizedBox(width: 8),
                Expanded(
                    child: Stack(children: <Widget>[
                  Obx(() => isNotNull(controller.stockCache.value)
                      ? Positioned(
                          left: _getSizeText(_ticker.value),
                          top: 0,
                          bottom: 0,
                          child: Container(
                              height: 32,
                              alignment: Alignment.center,
                              child: StreamBuilder<MarketStatusSession>(
                                  stream: controller.stockCache.value
                                      ?.getMarketViewModel()
                                      ?.marketStatusSessionStream,
                                  builder: (_, __) => Text(
                                      _getSuffixTicker(
                                          marketStatusSession: controller
                                              .stockCache.value
                                              ?.getMarketViewModel()
                                              ?.marketStatusSession),
                                      style: textStyle.regular(
                                          color: color.grey40)))))
                      : SizedBox()),
                  TextField(
                      controller: controller.searchController,
                      focusNode: controller.searchFousNode,
                      style: textStyle.regular(),
                      cursorColor: color.primary,
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.visiblePassword,
                      autocorrect: false,
                      textInputAction: TextInputAction.search,
                      inputFormatters: <TextInputFormatter>[
                        UpperCaseTextFormatter()
                      ],
                      decoration: InputDecoration(
                          fillColor: color.red50,
                          border: InputBorder.none,
                          hintText: LocaleKeys.search_stock_code.tr,
                          contentPadding:
                              EdgeInsets.only(top: 8.0, bottom: 8.0),
                          isDense: true,
                          hintStyle: textStyle.regular(color: color.grey40)))
                ])),
                SizedBox(width: 8),
                _buildButtonClear(),
                SizedBox(width: 4)
              ])));
        });
  }

  double _getSizeText(String value) {
    return (TextPainter(
      text: TextSpan(text: value, style: textStyle.regular()),
      maxLines: 1,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      textDirection: TextDirection.ltr,
    )..layout())
        .size
        .width;
  }

  Widget _buildButtonClear() => Obx(
        () => Visibility(
          visible: isNotNullOrEmpty(_ticker.value),
          child: InkWell(
            onTap: () {
              controller.searchController.clear();
              controller.searchFousNode.requestFocus();
              controller.clearData();
            },
            child: SizedBox(
                width: 32,
                height: 32,
                child: Icon(Icons.cancel, color: Colors.grey, size: 16)),
          ),
        ),
      );

  String _getSuffixTicker({MarketStatusSession? marketStatusSession}) {
    final Index? _index = controller.stockCache.value?.stockItem.index;

    return '\u0020(${_index?.name}\u0020-\u0020${marketStatusSession?.title})';
  }
}
