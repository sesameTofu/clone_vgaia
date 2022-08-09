import 'package:flutter_mobile/core/market_item_view_model.dart';
import 'package:flutter_mobile/core_ui/base_market_item.dart';
import 'package:flutter_mobile/import.dart';

class ItemMarketIndexController extends BaseController with BaseMarketItem {
  ItemMarketIndexController({
    required MarketItemViewModel? marketViewModel,
  }) {
    if (marketViewModel != null) {
      setMarketItemViewModel = marketViewModel;
    }
  }
  @override
  void onInit() {
    if (marketViewModel != null) {
      intBindMarket();
    }
    super.onInit();
  }

  @override
  void onClose() {
    clearDataMarket();

    super.onClose();
  }
}
