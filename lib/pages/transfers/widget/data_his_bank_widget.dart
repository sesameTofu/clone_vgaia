import 'package:flutter_mobile/domain/model/money_transfer/transfer_bank.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/transfers/controller/history_transfer_controller.dart';
import 'package:flutter_mobile/pages/transfers/widget/item_history_widget.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_mobile/widgets/app_loading.dart';
import 'package:flutter_mobile/widgets/no_data.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DataHisBankWidget extends BaseWidget<HistoryTransferController> {
  DataHisBankWidget({Key? key}) : super(key: key);

  @override
  Widget builder() => _buildDataBank();

  Widget _buildDataBank() => Expanded(
        child: ValueListenableBuilder<bool>(
          valueListenable: controller.loadingPage,
          builder: (_, bool loading, __) {
            if (loading) {
              return Expanded(child: appLoading);
            }
            return _buildListDataBank();
          },
        ),
      );

  Widget _buildListDataBank() => ValueListenableBuilder<List<TransferBank>>(
      valueListenable: controller.listDataBankTransfer,
      builder: (_, List<TransferBank> data, __) {
        if (isNullOrEmpty(data)) {
          return Nodata();
        }

        return SmartRefresher(
            enablePullDown: true,
            controller: controller.refreshController,
            onRefresh: () => controller.findData(),
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 10.0),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) =>
                  ItemDataHistoryWidget(bank: data.tryGet(index)),
            ));
      });
}
