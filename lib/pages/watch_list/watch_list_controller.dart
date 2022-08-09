import 'dart:async';

import 'package:flutter_mobile/base/base_main_controller.dart';
import 'package:flutter_mobile/controller/session_manager.dart';
import 'package:flutter_mobile/controller/watch_list_manager.dart';
import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/domain/model/sort_model.dart';
import 'package:flutter_mobile/domain/model/watch_list/detail_stock_watch_list.dart';
import 'package:flutter_mobile/domain/model/watch_list/watch_list.dart';
import 'package:flutter_mobile/domain/usecase/stock_use_case.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/main/main_controller.dart';
import 'package:flutter_mobile/pages/watch_list/manager/category_cotroller.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WatchListController extends BaseMainController<int> {
  WatchListController()
      : super(
            currentPage: 0, indexPageChange: Get.find<MainController>().index);
  final SlidableController slidableController = SlidableController();
  final StockUseCase stockTestUseCase = StockUseCase();
  final WatchListManager categoryManager = WatchListManager();
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final RxBool isLoadingCtrl = RxBool(false);
  final ScrollController scrollController = ScrollController();
  final RxList<StockItemViewModel> listStockItemViewModel =
      <StockItemViewModel>[].obs;
  List<StockItemViewModel> listStockItemViewModelOrigin =
      <StockItemViewModel>[];
  final List<Sort> sorts = <Sort>[
    Sort(title: LocaleKeys.home_detail_index_symbol.tr, type: SortType.ticker),
    Sort(title: LocaleKeys.goline_Change.tr, type: SortType.changedPercent),
  ];
  Rxn<WatchList> category = Rxn<WatchList>();
  final Rx<SortState> sortState = Rx<SortState>(SortState.none);
  bool get isSort =>
      sortState.value != SortState.none && sortType.value != SortState.none;
  final Rx<SortType> sortType = Rx<SortType>(SortType.none);
  final CategoryController categoryController = CategoryController();
  final RxBool isDropdownOpened = false.obs;

  @override
  void initPage({bool? onInit = false}) {
    if (categoryManager.categorySelect.value != null) {
      getWatchList(categoryManager.categorySelect.value);
    }
    categoryManager.categorySelect.listen((WatchList? categorySelect) {
      getWatchList(categorySelect, clearSort: false);
    });
    super.initPage();
  }

  Future<void> getWatchList(WatchList? category,
      {bool clearSort = true}) async {
    if (clearSort) {
      resetSort();
    }
    this.category.value = category;
    this.category.refresh();

    // final WatchList? selected = categoryManager.categorySelect.value;
    // if (selected != null && selected.type != 'CW') {

    if (category != null && isNotNullOrEmpty(category.afterListSecQuotesCode)) {
      await getQuotesForOrder(category);
    } else {
      listStockItemViewModelOrigin = <StockItemViewModel>[];
      listStockItemViewModel.value = <StockItemViewModel>[];
    }
    // }
  }

  Future<void> getQuotesForOrder(WatchList? category) async {
    isLoadingCtrl.value = true;
    await stockTestUseCase.getListItemViewModel(
        category!.afterListSecQuotesCode!
            .map((DetailStockWatchList e) => e.secCd ?? '')
            .toList(), onSuccess: (List<StockItemViewModel> listStockItem) {
      //  listStockItemViewModel.value = listStockItem;

      getSecQuotesList(listStockItem);
    }, onFailure: () {
      isLoadingCtrl.value = false;
      refreshController.loadFailed();
    });
  }

  void getSecQuotesList(List<StockItemViewModel> listItem) {
    stockTestUseCase.findWatchList(listItem,
        onSuccess: (List<StockItemViewModel> listStockItem) {
      isLoadingCtrl.value = false;
      refreshController.refreshCompleted();
      listStockItemViewModelOrigin = listStockItem;
      if (!isSort) {
        listStockItemViewModel.value = listStockItem;
      } else {
        listStockItemViewModel.value = stockTestUseCase.sortListItemViewModel(
            sortState.value, sortType.value, listStockItem);
      }
    }, onFailure: (dynamic e) {
      listStockItemViewModelOrigin = <StockItemViewModel>[];
      listStockItemViewModel.value = <StockItemViewModel>[];
      isLoadingCtrl.value = false;
      refreshController.loadFailed();
    });
  }

  Future<void> removeSecFromCurrentCategory(
      StockItemViewModel stockItemViewModel) async {
    if (await stockTestUseCase.removeSecFromCurrentCategory(
        accountID: SessionManager().username,
        secID: stockItemViewModel.stockItem.secID ?? '')) {
      listStockItemViewModel.remove(stockItemViewModel);
    }
  }

  void sortWatchList(SortState state, SortType type) {
    if (state == SortState.none) {
      //  getWatchList(stockTestUseCase.currentCategory.value);
      listStockItemViewModel.value = listStockItemViewModelOrigin;
    } else {
      listStockItemViewModel.value = stockTestUseCase.sortListItemViewModel(
          state, type, listStockItemViewModel);
    }
    sortState(state);
    sortType(type);
  }

  Future<void> onRefesh() async {
    await getWatchList(categoryManager.categorySelect.value);
  }

  void resetSort() {
    sortState(SortState.none);
    sortType(SortType.none);
  }

  // void changeSelectCategory(Category category) {
  //   // slidableController.activeState?.close();
  //   // getWatchList(category);
  // }
}
