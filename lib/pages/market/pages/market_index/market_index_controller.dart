import 'package:flutter_mobile/core/market_item_view_model.dart';
import 'package:flutter_mobile/core/repos/stock_repos.dart';
import 'package:flutter_mobile/domain/usecase/market_use_case.dart';
import 'package:flutter_mobile/import.dart';

class MarketIndexController extends BaseController {
  final MarketUseCase marketUserCase = MarketUseCase();
  final RxList<MarketItemViewModel> listMarketIndexItemViewModel =
      <MarketItemViewModel>[].obs;
  final RxBool isLoadingCtrl = RxBool(false);

  @override
  void onInit() {
    _getMarketIndex();
    super.onInit();
  }

  void onRefresh() {
    _getMarketIndex();
  }

  void _getMarketIndex() {
    if (!isLoadingCtrl.value) {
      isLoadingCtrl.value = true;
      final List<MarketItemViewModel> list =
          StockRepos().getListMarketSession();

      marketUserCase.findMarketIndex(list,
          onSuccess: (List<MarketItemViewModel> listMarketItem) {
        isLoadingCtrl.value = false;
        listMarketIndexItemViewModel.value = listMarketItem;
        isLoadingCtrl.value = false;
      }, onFailure: (dynamic e) {
        isLoadingCtrl.value = false;
      });
    }
  }
}
