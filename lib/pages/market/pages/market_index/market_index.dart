import 'package:flutter_mobile/base/base_page.dart';
import 'package:flutter_mobile/core/market_item_view_model.dart';
import 'package:flutter_mobile/pages/market/pages/market_index/market_index_controller.dart';
import 'package:flutter_mobile/pages/watch_list/item/item_market_index.dart';
import 'package:flutter_mobile/widgets/app_loading.dart';
import 'package:flutter_mobile/widgets/no_data.dart';

class MarketIndex extends BaseScreen<MarketIndexController> {
  MarketIndex(this.marketIndexController, {Key? key}) : super(key: key);

  final MarketIndexController marketIndexController;

  @override
  MarketIndexController putController() {
    return marketIndexController;
  }

  @override
  Widget builder() {
    return Obx(() {
      if (controller.isLoadingCtrl.value) {
        return SizedBox(
          height: 200,
          child: appLoading,
        );
      }
      if (controller.listMarketIndexItemViewModel.isEmpty) {
        return SizedBox(height: 200, child: Nodata());
      }
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, int index) {
          return _buildTickerWatchingItem(
            marketIndexController.listMarketIndexItemViewModel[index],
            index,
          );
        },
        itemCount: marketIndexController.listMarketIndexItemViewModel.length,
      );
    });
  }

  Widget _buildTickerWatchingItem(
      MarketItemViewModel marketItemViewModel, int index) {
    return ItemMarketIndex(
      marketItemViewModel: marketItemViewModel,
      tagController: index.toString(),
    );
  }
}
