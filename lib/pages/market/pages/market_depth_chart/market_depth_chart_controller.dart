import 'package:flutter_mobile/domain/model/grpc/auto_trading.pb.dart';
import 'package:flutter_mobile/domain/usecase/market_use_case.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/maket_share_param.dart';

class MarketDepthChartController extends BaseController {
  MarketDepthChartController(this.marketUseCase);
  final MarketUseCase marketUseCase;
  Rx<MarketDepth> dataMarketDepth = MarketDepth().obs;

  @override
  void onInit() {
    super.onInit();

    MarketShareParam().addListener(() {
      findMarketDepth();
    });
    findMarketDepth();
  }

  Future<void> findMarketDepth() async {
    dataMarketDepth.value = await marketUseCase.findMarketDepth(
        MarketShareParam().selectedIndex.formatNumber().toInt());
  }

  int get sumDown =>
      dataMarketDepth.value.down7 +
      dataMarketDepth.value.down57 +
      dataMarketDepth.value.down35 +
      dataMarketDepth.value.down13 +
      dataMarketDepth.value.down01;

  int get sumUp =>
      dataMarketDepth.value.up7 +
      dataMarketDepth.value.up57 +
      dataMarketDepth.value.up35 +
      dataMarketDepth.value.up13 +
      dataMarketDepth.value.up01;
}
