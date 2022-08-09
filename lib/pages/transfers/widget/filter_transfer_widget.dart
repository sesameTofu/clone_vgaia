import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/transfers/controller/money_transfer_controller.dart';
import 'package:flutter_mobile/widgets/dropdow_box_select.dart';

class FilterTransferWidget extends BaseWidget<MoneyTransferController> {
  FilterTransferWidget({Key? key}) : super(key: key);

  @override
  Widget builder() => Column(
        children: <Widget>[
          SizedBox(height: 12.0),
          _buildSelectionAccount(),
          SizedBox(height: 4.0),
          _buildSelectTypeMoneyTransfer(),
          SizedBox(height: 4.0),
          _buildReceiveAccountInfo(),
        ],
      );

  Widget _buildSelectionAccount() =>
      ValueListenableBuilder<List<Select<String>>>(
        valueListenable: controller.listSubAccount,
        builder: (BuildContext context, List<Select<String>> value, _) {
          return DropdownBoxSelect<String>(
            title: LocaleKeys.goline_TKChuyen.tr,
            datas: value,
            initialValue: controller.subAccount,
            width: .55.getWidth,
            selectedValue: controller.selectAccount,
            hintStyle: textStyle.custom(
                fontWeight: FontWeight.w300, color: color.grey0),
          );
        },
      );

  Widget _buildSelectTypeMoneyTransfer() =>
      DropdownBoxSelect<TypeMoneyTransfer>(
        title: LocaleKeys.transfers_type_transfer.tr,
        datas: controller.listTypeMoneyTransfer,
        initialValue: controller.typeTransfer.value,
        width: .55.getWidth,
        selectedValue: controller.selectTypeMoneyTransfer,
        hintStyle:
            textStyle.custom(fontWeight: FontWeight.w300, color: color.grey0),
      );

  Widget _buildReceiveAccountInfo() =>
      ValueListenableBuilder<List<Select<String>>>(
        valueListenable: controller.listReceiveAccount,
        builder: (BuildContext context, List<Select<String>> value, _) {
          return DropdownBoxSelect<String>(
            title: LocaleKeys.goline_TKNhan.tr,
            datas: value,
            initialValue: controller.receiveAccount,
            width: .55.getWidth,
            selectedValue: controller.selectReceiveAccount,
            hintStyle: textStyle.custom(
                fontWeight: FontWeight.w300, color: color.grey0),
          );
        },
      );
}
