import 'package:flutter_mobile/config/config.dart';
import 'package:flutter_mobile/controller/refresh_manager.dart';
import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pbgrpc.dart';
import 'package:flutter_mobile/domain/model/market/filter_market.dart';
import 'package:flutter_mobile/domain/usecase/market_use_case.dart';
import 'package:flutter_mobile/domain/usecase/stock_use_case.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/maket_share_param.dart';
import 'package:flutter_mobile/widgets/refesh/smart_load_list_controller.dart';

class TopForeginTradeController extends BaseController
    with SmartLoadListController {
  TopForeginTradeController(this.marketUseCase, this.isDetail,
      {int offset = 0}) {
    _offset = offset;
    _limit = isDetail ? 20 : 5;
  }
  final bool isDetail;

  final StockUseCase stockTestUseCase = StockUseCase();

  final MarketUseCase marketUseCase;

  final List<FilterType<ForgeinTradeType>> listFilter =
      <FilterType<ForgeinTradeType>>[
    FilterType<ForgeinTradeType>(
        type: ForgeinTradeType.buyPrice,
        id: ForgeinTradeType.buyPrice.value,
        label: ForgeinTradeType.buyPrice.stringValue),
    FilterType<ForgeinTradeType>(
        type: ForgeinTradeType.salePrice,
        id: ForgeinTradeType.salePrice.value,
        label: ForgeinTradeType.salePrice.stringValue),
    FilterType<ForgeinTradeType>(
        type: ForgeinTradeType.buyQuantity,
        id: ForgeinTradeType.buyQuantity.value,
        label: ForgeinTradeType.buyQuantity.stringValue),
    FilterType<ForgeinTradeType>(
        type: ForgeinTradeType.saleQuantity,
        id: ForgeinTradeType.saleQuantity.value,
        label: ForgeinTradeType.saleQuantity.stringValue),
    FilterType<ForgeinTradeType>(
        type: ForgeinTradeType.valueBuy,
        id: ForgeinTradeType.valueBuy.value,
        label: ForgeinTradeType.valueBuy.stringValue),
    FilterType<ForgeinTradeType>(
        type: ForgeinTradeType.valueSale,
        id: ForgeinTradeType.valueSale.value,
        label: ForgeinTradeType.valueSale.stringValue),
  ];

  late Rx<FilterType<ForgeinTradeType>> currentFilter;

  final RxList<StockItemViewModel> listInternalMSModel =
      <StockItemViewModel>[].obs;

  late int _offset;
  late int _limit;

  @override
  void onInit() {
    super.onInit();

    _bind();
    ever(currentFilter, (FilterType<ForgeinTradeType> value) {
      findTopForeginTrade();
    });
    MarketShareParam().addListener(() {
      findTopForeginTrade();
    });
  }

  void _bind() {
    currentFilter = listFilter.first.obs;

    findTopForeginTrade(isRefesh: true);
  }

  int valueOrderFieldType(ForgeinTradeType type) {
    switch (type) {
      case ForgeinTradeType.salePrice:
        return 3;

      case ForgeinTradeType.buyPrice:
        return 2;

      case ForgeinTradeType.buyQuantity:
        return 4;

      case ForgeinTradeType.saleQuantity:
        return 5;

      case ForgeinTradeType.valueBuy:
        return 6;

      case ForgeinTradeType.valueSale:
        return 7;
      case ForgeinTradeType.all:
      default:
        return 1;
    }
  }

  Future<void> findTopForeginTrade(
      {bool loadMore = false, bool isRefesh = false}) async {
    if (_offset == 0 && isRefesh) {
      isLoadingPage.value = true;
    }
    final List<StockItemViewModel> _listItem =
        await marketUseCase.findTopForeignTrade(InternalMSInput(
            authenCode: AppConfig.config.authenCode,
            userID: NullableString(data: MarketShareParam().userDefault),
            side: currentFilter.value.id,
            orderFieldType: valueOrderFieldType(
                currentFilter.value.type as ForgeinTradeType),
            type: 1,
            orderType: ORDER_TYPE.ORDER_DEFAULT,
            indexCdStr: MarketShareParam().selectedIndex,
            limit: _limit,
            offset: loadMore ? _offset + _limit : 0));

    if (_listItem.isNotEmpty) {
      // xét lại `_offset` khi thành công
      _offset = loadMore ? _offset + _limit : 0;
    }
    loadMore
        ? listInternalMSModel.addAll(_listItem)
        : listInternalMSModel.value = _listItem.take(_limit).toList();

    isLoadingPage.value = false;
    refreshController.refreshCompleted();
    refreshController.loadComplete();
    if (isDetail) {
      RefeshManager().subReresh('TopForeginTrade', () {
        findTopForeginTrade(isRefesh: true);
      });
    }
  }

  @override
  Future<void> onLoadMore() async => findTopForeginTrade(loadMore: true);

  void onChangrFiltrer(FilterType<ForgeinTradeType> filter) {
    if (currentFilter.value != filter) {
      currentFilter.value = filter;
    }
  }

  @override
  void onRefresh() {
    _offset = 0;
    findTopForeginTrade();
  }

  @override
  void onClose() {
    RefeshManager().unsubReresh(
      'TopForeginTrade',
    );
    super.onClose();
  }
}
