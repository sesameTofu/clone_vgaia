import 'package:flutter_mobile/base/base_page.dart';
import 'package:flutter_mobile/generated/locales.g.dart';
import 'package:flutter_mobile/pages/expand/settings/stock_transfer/stock_transfer_controller.dart';
import 'package:flutter_mobile/widgets/dropdow_box_select.dart';
import 'package:flutter_mobile/widgets/select_datetime/select_date.dart';

class TransferInfo extends BaseScreen<StockTransferController> {
  TransferInfo({Key? key}) : super(key: key);

  @override
  StockTransferController? putController() => StockTransferController();

  @override
  Widget builder() => Column(
        children: <Widget>[
          Obx(() => DropdownBoxSelect<String>(
              title: LocaleKeys.stock_transfer_subAccoNo.tr,
              datas: controller.listSubAccount,
              hint: '',
              initialValue: controller.subAccount.value,
              width: .55.getWidth,
              selectedValue: controller.selectAccount,
              hintStyle: textStyle.custom())),
          const SizedBox(height: 16),
          SelectDateTime(
            toDate: controller.toDate,
            fromDate: controller.fromDate,
            changeDate: controller.changeDate,
          ),
        ],
      );
}
