import 'package:flutter_mobile/config/config.dart';
import 'package:flutter_mobile/controller/refresh_manager.dart';
import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pbgrpc.dart';
import 'package:flutter_mobile/domain/model/market/filter_market.dart';
import 'package:flutter_mobile/domain/usecase/market_use_case.dart';
import 'package:flutter_mobile/domain/usecase/stock_use_case.dart';
import 'package:flutter_mobile/global/app_common.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/maket_share_param.dart';
import 'package:flutter_mobile/widgets/refesh/smart_load_list_controller.dart';

class TopSecUpDownController extends BaseController
    with SmartLoadListController {
  TopSecUpDownController(this.marketUseCase,
      {int offset = 0, this.isDetail = false}) {
    _offset = offset;
    _limit = isDetail ? 20 : 5;
  }

  bool isTopSecUp = true;
  final StockUseCase stockTestUseCase = StockUseCase();
  final bool isDetail;

  final MarketUseCase marketUseCase;

  late List<Filter> topFilter = <Filter>[
    Filter(id: 1, label: LocaleKeys.top_increases.tr),
    Filter(id: 2, label: LocaleKeys.top_decreased.tr)
  ];
  late List<Filter> periodFilter;

  late Rx<Filter> topSelect;
  late Rx<Filter> periodSelect;

  final RxList<StockItemViewModel> listStockItemViewModel =
      <StockItemViewModel>[].obs;

  late int _offset;
  late int _limit;

  RxBool canLoadMore = true.obs;

  @override
  void onInit() {
    super.onInit();

    _bind();
    // ever(filters, (TopSecUpDownInput value) {
    //   findTopSecUpDown();
    // });
    ever<Filter>(periodSelect, (Filter value) {
      findTopSecUpDown();
    });
    MarketShareParam().addListener(() {
      isLoadingPage.value = true;
      findTopSecUpDown();
    });
  }

  void _bind() {
    topSelect = isTopSecUp ? topFilter[0].obs : topFilter[1].obs;

    periodFilter = AppCommon.listTimer;

    periodSelect = periodFilter[0].obs;

    findTopSecUpDown(isRefesh: true);
  }

  Future<void> findTopSecUpDown(
      {bool loadMore = false, bool isRefesh = false}) async {
    final TopSecUpDownInput filters = TopSecUpDownInput(
        authenCode: AppConfig.config.authenCode,
        orderFieldType: 3,
        userID: MarketShareParam().userDefault,
        topType: topSelect.value.id,
        marketCd: MarketShareParam().selectedIndex,
        periodType: periodSelect.value.id,
        limit: _limit,
        offset: loadMore ? (_offset + _limit) : 0);

    if (filters.offset == 0 && isRefesh) {
      isLoadingPage.value = true;
    }
    marketUseCase.findTopSecUpDown(filters,
        onSuccess: (List<StockItemViewModel> listData) {
      // Tăng khi thành công
      _offset = loadMore ? _offset += _limit : 0;

      // Ko cho LoadMore khi lần cuối ko cso data
      canLoadMore.value = listData.isNotEmpty;

      if (filters.offset != 0 && listStockItemViewModel.length < _offset) {
        return;
      }

      loadMore
          ? listStockItemViewModel.addAll(listData)
          : listStockItemViewModel.value = listData;
    }).whenComplete(() {
      isLoadingPage.value = false;
      refreshController.refreshCompleted();
      refreshController.loadComplete();
      if (isDetail) {
        RefeshManager().subReresh('topSecChange', () {
          findTopSecUpDown(isRefesh: true);
        });
      }
    });
  }

  void onPress({required TypeFilter type, required Filter filter}) {
    if (type == TypeFilter.top) {
      topSelect.value = filter;
    } else if (type == TypeFilter.period) {
      periodSelect.value = filter;
    }
    findTopSecUpDown(isRefesh: true);
  }

  @override
  Future<void> onLoadMore() async => findTopSecUpDown(loadMore: true);

  @override
  Future<void> onRefresh() async {
    _offset = 0;
    return await findTopSecUpDown();
  }
}
