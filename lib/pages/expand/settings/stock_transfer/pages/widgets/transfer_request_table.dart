import 'package:flutter_mobile/domain/model/stock_transfer/sec_balance_list_model.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/expand/settings/stock_transfer/pages/stock_transfer_request_controller.dart';
import 'package:flutter_mobile/pages/expand/settings/stock_transfer/pages/widgets/cell_item.dart';
import 'package:flutter_mobile/widgets/checkbox.dart';

class TransferRequestTable extends BaseWidget<StockTransferRequestController> {
  TransferRequestTable({Key? key}) : super(key: key);

  @override
  Widget builder() => Focus(
        onFocusChange: controller.changeStateKeyboard,
        child: Column(
          children: <Widget>[
            _buildTopTable(),
            _buildDataTable(),
          ],
        ),
      );

  Widget _buildTopTable() => Container(
        color: color.background3,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Obx(() => CheckBox(
                  value: controller.isSelectAll(controller.listAccSelect.value),
                  onPress: controller.setSelectAll,
                )),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: Text(LocaleKeys.stock_transfer_code.tr,
                        style: textStyle.semiBold(
                            color: color.grey40, size: 10.0)))),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: Text(LocaleKeys.stock_transfer_transferAvail.tr,
                        style: textStyle.semiBold(
                            color: color.grey40, size: 10.0)))),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: Text(LocaleKeys.stock_transfer_transferAmount.tr,
                        style: textStyle.semiBold(
                            color: color.grey40, size: 10.0))))
          ],
        ),
      );

  Widget _buildDataTable() => Obx(() => Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.listSecBalance.value.length,
          itemBuilder: (BuildContext context, int index) => _buildItemData(
              controller.listSecBalance.value.tryGet(index)!, index),
        ),
      ));
  Widget _buildItemData(SecBalanceListModel data, int index) {
    final bool isTickItem =
        controller.isSelect(index, controller.listAccSelect.value);
    final String inputValue = data.textEditingController!.text;
    return Obx(() => CellItem(
          buyAb: data,
          index: index,
          isTick: controller.isSelect(index, controller.listAccSelect.value),
          onPressTick: ([bool changeValue = true]) {
            if (changeValue &&
                !isTickItem &&
                (inputValue == '' || inputValue == '0')) {
              data.textEditingController!.text = data.secTransferAvail ?? '';
            }
            controller.setSelect(index);
          },
        ));
  }
}
