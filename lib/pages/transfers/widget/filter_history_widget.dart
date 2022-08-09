import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/transfers/controller/history_transfer_controller.dart';
import 'package:flutter_mobile/widgets/dropdow_box_select.dart';
import 'package:flutter_mobile/widgets/select_datetime/select_date.dart';

class FilterHistoryWidget extends BaseWidget<HistoryTransferController> {
  FilterHistoryWidget({Key? key}) : super(key: key);

  @override
  Widget builder() => Column(
        children: <Widget>[
          _buildFromToDate(),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              _buildSelectAccount(),
              Expanded(child: SizedBox()),
              _buildSelectTypeMoneyTransfer(),
            ],
          )
        ],
      );

  Widget _buildFromToDate() => SelectDateTime(
        toDate: controller.toDate,
        fromDate: controller.fromDate,
        changeDate: controller.changeDate,
      );

  Widget _buildSelectAccount() => ValueListenableBuilder<List<Select<String>>>(
        valueListenable: controller.listSubAccount,
        builder: (BuildContext context, List<Select<String>> value, _) {
          return DropdownBoxSelect<String>(
            datas: value,
            hint: '',
            initialValue: controller.subAccount,
            width: .45.getWidth,
            selectedValue: controller.selectAccount,
            hintStyle: textStyle.custom(
                fontWeight: FontWeight.w300, color: color.grey0),
          );
        },
      );

  Widget _buildSelectTypeMoneyTransfer() =>
      DropdownBoxSelect<TypeMoneyTransfer>(
        datas: controller.listTypeMoneyTransfer,
        hint: '',
        initialValue: controller.typeTransfer.value,
        width: .45.getWidth,
        selectedValue: controller.selectTypeMoneyTransfer,
        hintStyle:
            textStyle.custom(fontWeight: FontWeight.w300, color: color.grey0),
      );
}
