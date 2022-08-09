import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/transfers/controller/history_transfer_controller.dart';
import 'package:flutter_mobile/pages/transfers/transfers_controller.dart';
import 'package:flutter_mobile/pages/transfers/widget/data_his_bank_widget.dart';
import 'package:flutter_mobile/pages/transfers/widget/data_his_internal_widget.dart';
import 'package:flutter_mobile/pages/transfers/widget/filter_history_widget.dart';

class HistoryTransferPage extends BaseScreen<HistoryTransferController> {
  HistoryTransferPage({Key? key, required this.controllerPage})
      : super(key: key);

  final TransferController controllerPage;
  @override
  Widget builder() => Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            _buildSelectDateTime(),
            SizedBox(height: 10.0),
            ValueListenableBuilder<Select<TypeMoneyTransfer>>(
              valueListenable: controller.typeTransfer,
              builder: (_, Select<TypeMoneyTransfer> type, __) {
                if (type.value == TypeMoneyTransfer.bankTransfer) {
                  return DataHisBankWidget();
                }

                if (type.value == TypeMoneyTransfer.internalTransfer) {
                  return DataHisInternalWidget();
                }
                return Container();
              },
            ),
          ],
        ),
      );

  @override
  HistoryTransferController? putController() =>
      HistoryTransferController(controllerPage);

  Widget _buildSelectDateTime() => FilterHistoryWidget();
}
