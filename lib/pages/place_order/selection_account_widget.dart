import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/place_order/place_order_controller.dart';
import 'package:flutter_mobile/widgets/account/account_mixi_widget.dart';

class SelectionAccountWidget extends BaseWidget<PlaceOrderController>
    with AccountMixiWidget {
  SelectionAccountWidget({Key? key}) : super(key: key);

  @override
  Widget builder() => Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        decoration: BoxDecoration(
            color: color.background1,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: buildAccountTitle(controller),
      );
}
