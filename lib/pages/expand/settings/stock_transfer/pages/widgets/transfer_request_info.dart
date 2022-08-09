import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/expand/settings/stock_transfer/pages/stock_transfer_request_controller.dart';
import 'package:flutter_mobile/widgets/dropdow_box_select.dart';

class TransferRequestInfo extends BaseWidget<StockTransferRequestController> {
  TransferRequestInfo({Key? key}) : super(key: key);

  @override
  Widget builder() => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Obx(() => DropdownBoxSelect<String>(
                  title: LocaleKeys.stock_transfer_transfer_from.tr,
                  datas: controller.listSubAccount,
                  initialValue: controller.subAccount.value,
                  width: .55.getWidth,
                  selectedValue: controller.selectAccount,
                  hintStyle: textStyle.custom(
                      fontWeight: FontWeight.w300, color: color.grey0),
                )),
            SizedBox(height: 12.0),
            Obx(() => DropdownBoxSelect<String>(
                  title: LocaleKeys.stock_transfer_transfer_to.tr,
                  datas: controller.listReceiveAccount,
                  initialValue: controller.subReceiveAccount.value,
                  width: .55.getWidth,
                  selectedValue: controller.selectReceiveAccount,
                  hintStyle: textStyle.custom(
                      fontWeight: FontWeight.w300, color: color.grey0),
                )),
          ],
        ),
      );
}
