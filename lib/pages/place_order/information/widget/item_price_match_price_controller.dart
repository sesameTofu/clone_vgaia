import 'package:flutter_mobile/base/import_base.dart';
import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/core_ui/base_stock_item.dart';
import 'package:flutter_mobile/domain/usecase/stock_use_case.dart';

class ItemPriceMatchPriceController extends BaseController with BaseStockItem {
  ItemPriceMatchPriceController(this.secCdValue);
  final String secCdValue;
  @override
  void onInit() {
    StockUseCase().getItemViewModel(secCdValue,
        onSuccess: (StockItemViewModel item) {
      setStockItemViewModel = item;
      intBindData();
    }, onFailure: () {
      // searchFaiure();
    });
    super.onInit();
  }

  @override
  void onClose() {
    clearData();
    super.onClose();
  }
}
