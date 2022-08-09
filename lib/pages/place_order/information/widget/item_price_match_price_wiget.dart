import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/place_order/information/widget/item_price_match_price_controller.dart';
import 'package:flutter_mobile/pages/place_order/information/widget/tripple_item_row.dart';
import 'package:rxdart/rxdart.dart' as rx;

class ItemMatchPriceCWWideget
    extends BaseScreen<ItemPriceMatchPriceController> {
  ItemMatchPriceCWWideget(this.secCd, {Key? key}) : super(key: key);
  final String secCd;
  @override
  Widget builder() {
    return StreamBuilder<List<dynamic>>(
        stream: rx.Rx.combineLatest2(
            controller.matchPriceStream,
            controller.mapSubjectChangeColor[Field.MATCH_PRICE]!,
            (_, __) => <dynamic>[]),
        builder: (_, __) => StatisticLabelValue(
            label: 'GIÁ CKCS',
            value1: controller.matchPrice.formatVolume(decimalDigits: 2),
            flickerValue1:
                controller.mapSubjectChangeColor[Field.MATCH_PRICE]?.value,
            mainAxisAlignment: MainAxisAlignment.end));
  }

  @override
  ItemPriceMatchPriceController? putController() {
    return ItemPriceMatchPriceController(secCd);
  }
}
