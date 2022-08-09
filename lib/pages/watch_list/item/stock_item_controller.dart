import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/core_ui/base_stock_item.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/place_order/information/stock_information_controller.dart';

class StockItemController extends BaseController with BaseStockItem {
  StockItemController(
      {required StockItemViewModel? itemViewModel,
      this.getChartData = false,
      this.getChartPrice = false,
      this.isGetStockPrice = false,
      this.canGetFullInfor = true}) {
    if (itemViewModel != null) {
      setStockItemViewModel = itemViewModel;
    }
  }
  late final StockInformationController stockInformationController;
  final bool getChartData;
  final bool canGetFullInfor;
  final bool isGetStockPrice;
  final bool getChartPrice;
  @override
  void onInit() {
    if (itemViewModel != null) {
      intBindData(
          getChartData: getChartData,
          canGetFullInfor: canGetFullInfor,
          getChartPrice: getChartPrice);
    }
    super.onInit();
  }

  @override
  void onClose() {
    clearData();

    super.onClose();
  }
}
