import 'package:flutter_mobile/base/base_page.dart';
import 'package:flutter_mobile/generated/locales.g.dart';
import 'package:flutter_mobile/pages/expand/settings/stock_transfer/stock_transfer_controller.dart';
import 'package:flutter_mobile/pages/expand/settings/stock_transfer/widgets/transfer_history.dart';
import 'package:flutter_mobile/pages/expand/settings/stock_transfer/widgets/transfer_info.dart';
import 'package:flutter_mobile/widgets/appbar_custom.dart';

class StockTransferPage extends BaseScreen<StockTransferController> {
  StockTransferPage({Key? key}) : super(key: key);

  @override
  StockTransferController? putController() => StockTransferController();

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

  Widget get _buildBody => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          children: <Widget>[
            TransferInfo(),
            TransferHistory(),
          ],
        ),
      );
}
