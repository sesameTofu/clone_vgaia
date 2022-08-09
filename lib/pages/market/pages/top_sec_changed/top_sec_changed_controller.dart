import 'package:flutter_mobile/config/config.dart';
import 'package:flutter_mobile/controller/refresh_manager.dart';
import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pb.dart';
import 'package:flutter_mobile/domain/model/market/filter_market.dart';
import 'package:flutter_mobile/domain/usecase/market_use_case.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/maket_share_param.dart';
import 'package:flutter_mobile/widgets/refesh/smart_load_list_controller.dart';

class TopSecChangedController extends BaseController
    with SmartLoadListController {
  TopSecChangedController({int offset = 0, this.isDetail = false}) {
    _offset = offset;
    _limit = isDetail ? 20 : 5;
  }
  final bool isDetail;
  final MarketUseCase marketUseCase = MarketUseCase();

  final RxList<StockItemViewModel> listTopSecChange =
      <StockItemViewModel>[].obs;

  final List<Filter> changedFilter = <Filter>[
    Filter(
        id: 2, // changedType
        label: LocaleKeys.topSecChanged_filter_mass.tr,
        labelHeaderTable: LocaleKeys.topSecChanged_filter_mass.tr,
        orderFieldType: 2),
    Filter(
        id: 1, //changedType
        label: LocaleKeys.topSecChanged_filter_value.tr,
        labelHeaderTable: LocaleKeys.topSecChanged_filter_value.tr,
        orderFieldType: 3),
    Filter(
        id: 3, // changedType
        label: LocaleKeys.topSecChanged_filter_volatility.tr,
        labelHeaderTable: LocaleKeys.topSecChanged_filter_volatility.tr,
        orderFieldType: 7), // orderFieldType
  ];

  late Rx<Filter> changedSelect;

  late int _offset;
  late int _limit;

  @override
  void onInit() {
    super.onInit();

    _bind();
    MarketShareParam().addListener(() {
      findTopSecChanged();
    });
  }

  void _bind() {
    changedSelect = changedFilter[0].obs;

    findTopSecChanged(isRefesh: true);
  }

  Future<void> findTopSecChanged(
      {bool loadMore = false, bool isRefesh = false}) async {
    final TopSecChangedInput filters = TopSecChangedInput(
      authenCode: AppConfig.config.authenCode,
      userID: MarketShareParam().userDefault,
      orderType: ORDER_TYPE
          .ORDER_DEFAULT, //0: None (default) 1: Tăng dần, 2: Giảm dần,
      orderFieldType: changedSelect.value.orderFieldType,
      changedType: changedSelect.value.id,
      marketCd: MarketShareParam().selectedIndex,
      periodType: 1, // Default 1 day
      limit: _limit,
    );

    // Refresh
    _offset = loadMore ? _offset += _limit : 0;
    if (_offset == 0 && isRefesh) {
      isLoadingPage.value = true;
    }
    final List<StockItemViewModel> listItem =
        await marketUseCase.findTopSecChanged(filters..offset = _offset);
    isLoadingPage.value = false;
    if (isDetail) {
      RefeshManager().subReresh('topSecChange', () {
        findTopSecChanged(isRefesh: true);
      });
    }
    isLoadingPage.value = false;
    refreshController.loadComplete();
    refreshController.refreshCompleted();
    if (filters.offset != 0 && listTopSecChange.length < _offset) {
      refreshController.loadComplete();
      return;
    }
    loadMore
        ? listTopSecChange.addAll(listItem)
        : listTopSecChange.value = listItem;
    return;
  }

  Future<void> onRefesh() async {
    _offset = 0;
    return await findTopSecChanged(isRefesh: true);
  }

  @override
  Future<void> onLoadMore() async => findTopSecChanged(loadMore: true);

  void onPress(Filter filter) {
    if (filter != changedSelect.value) {
      changedSelect.value = filter;
      findTopSecChanged(isRefesh: true);
    }
  }

  @override
  Future<void> onRefresh() async {
    _offset = 0;
    await findTopSecChanged();
  }

  @override
  void onClose() {
    RefeshManager().unsubReresh(
      'topSecChange',
    );
    super.onClose();
  }
}
