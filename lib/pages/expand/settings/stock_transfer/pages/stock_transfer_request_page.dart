import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/expand/settings/stock_transfer/pages/stock_transfer_request_controller.dart';
import 'package:flutter_mobile/pages/expand/settings/stock_transfer/pages/widgets/transfer_request_content.dart';
import 'package:flutter_mobile/pages/expand/settings/stock_transfer/pages/widgets/transfer_request_table.dart';
import 'package:flutter_mobile/widgets/appbar_custom.dart';

import 'widgets/transfer_request_info.dart';

class StockTransferRequestPage
    extends BaseScreen<StockTransferRequestController> {
  StockTransferRequestPage({Key? key}) : super(key: key);

  @override
  StockTransferRequestController? putController() =>
      StockTransferRequestController();

  @override
  Widget builder() {
    return Scaffold(
      backgroundColor: color.background0,
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  PreferredSizeWidget get _buildAppBar => PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarCustom(
          backgroundColor: color.background0,
          titleAppBar: LocaleKeys.stock_transfer_stock_transfer.tr,
          centerTitle: false,
        ),
      );

  Widget get _buildBody => Column(
        children: <Widget>[
          TransferRequestInfo(),
          Expanded(child: TransferRequestTable()),
          TransferRequestContent(),
        ],
      );
}
