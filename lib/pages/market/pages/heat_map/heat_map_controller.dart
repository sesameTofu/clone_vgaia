import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pb.dart';
import 'package:flutter_mobile/domain/usecase/market_use_case.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/maket_share_param.dart';

class HeatMapController extends BaseController {
  final MarketUseCase _marketUseCase = MarketUseCase();

  List<Index> listFilterMarket = <Index>[Index.HOSE, Index.HNX, Index.UPCOM];

  Rx<Index> currentIndexCd = Index.HOSE.obs;

  RxList<TopIndexContributionItem> listMarketCap =
      <TopIndexContributionItem>[].obs;
  @override
  void onInit() {
    super.onInit();
    getDataMarketCap();
  }

  void getDataMarketCap() {
    _marketUseCase.getTopIndexContribution(currentIndexCd.value.marketCd(),
        onsuccess: (List<TopIndexContributionItem> listResponse) {
      listResponse.sort(
          (TopIndexContributionItem a, TopIndexContributionItem b) =>
              (b.contributePercent.abs()).compareTo(a.contributePercent.abs()));
      listMarketCap.value = listResponse;
    });
  }

  void onClickFilter(Index maketID) {
    currentIndexCd.value = maketID;
    switch (maketID) {
      case Index.HOSE:
        MarketShareParam().selectedIndex = '100';
        break;
      case Index.HNX:
        MarketShareParam().selectedIndex = '200';
        break;
      case Index.UPCOM:
        MarketShareParam().selectedIndex = '300';
        break;
      default:
        MarketShareParam().selectedIndex = '200';
    }
    getDataMarketCap();
  }
}
