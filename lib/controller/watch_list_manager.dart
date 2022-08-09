import 'package:flutter_mobile/controller/session_manager.dart';
import 'package:flutter_mobile/core/repos/stock_repos.dart';
import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/domain/model/watch_list/detail_stock_watch_list.dart';
import 'package:flutter_mobile/domain/model/watch_list/watch_list.dart';
import 'package:flutter_mobile/domain/model/watch_list/watch_list_detail.dart';
import 'package:flutter_mobile/domain/usecase/watch_list_use_case.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_mobile/widgets/dialog/dialog.dart';

class WatchListManager extends BaseController {
  factory WatchListManager() {
    return _singleton;
  }

  WatchListManager._internal();

  static final WatchListManager _singleton = WatchListManager._internal();
  final RxList<WatchList> listCatgorys = RxList<WatchList>(<WatchList>[]);
  final Rx<WatchList?> categorySelect = Rx<WatchList?>(null);
  final WatchListUseCase watchListUseCase = WatchListUseCase();
  final StockRepos _stockRepos = StockRepos();

  void init() {
    getListLocalCategories();
  }

  List<WatchList> getCategoryDefault() {
    final List<DetailStockWatchList> itemsCW = <DetailStockWatchList>[];
    final List<DetailStockWatchList> itemsETF = <DetailStockWatchList>[];
    final List<DetailStockWatchList> itemsVN30 = <DetailStockWatchList>[];
    final List<DetailStockWatchList> itemsHNX30 = <DetailStockWatchList>[];

    for (final StockItemViewModel element in _stockRepos.listStocks) {
      if (element.stockItem.secType == SecType.W) {
        itemsCW.add(DetailStockWatchList(
            secCd: element.stockItem.secID,
            priority: 1,
            status: 'Active',
            watchlistId: -99));
      }
      if (element.stockItem.secType == SecType.E) {
        itemsETF.add(DetailStockWatchList(
            secCd: element.stockItem.secID,
            priority: 1,
            status: 'Active',
            watchlistId: -98));
      }
    }

    for (final String element
        in _stockRepos.mapStocksWithIndex[Index.HNX30] ?? <String>[]) {
      itemsHNX30.add(DetailStockWatchList(
          secCd: element, priority: 1, status: 'Active', watchlistId: -97));
    }

    for (final String element
        in _stockRepos.mapStocksWithIndex[Index.VN30] ?? <String>[]) {
      itemsVN30.add(DetailStockWatchList(
          secCd: element, priority: 1, status: 'Active', watchlistId: -97));
    }

    return <WatchList>[
      WatchList(
          id: -99,
          userId: 'ALL',
          type: 'CW',
          code: 'CW',
          nameVi: LocaleKeys.listCW.tr,
          nameEn: LocaleKeys.listCW.tr,
          priority: 1,
          status: 'Active',
          listSecQuotesCode: itemsCW,
          viewOnly: true),
      WatchList(
          id: -98,
          userId: 'ALL',
          type: 'ETF',
          code: 'ETF',
          nameVi: 'ETF',
          nameEn: 'ETF',
          priority: 1,
          status: 'Active',
          listSecQuotesCode: itemsETF,
          viewOnly: true),
      WatchList(
          id: -96,
          userId: 'ALL',
          type: 'HNX30',
          code: 'HNX30',
          nameVi: 'HNX30',
          nameEn: 'HNX30',
          priority: 1,
          status: 'Active',
          listSecQuotesCode: itemsHNX30,
          viewOnly: true),
      WatchList(
          id: -97,
          userId: 'ALL',
          type: 'VN30',
          code: 'VN30',
          nameVi: 'VN30',
          nameEn: 'VN30',
          priority: 1,
          status: 'Active',
          listSecQuotesCode: itemsVN30,
          viewOnly: true)
    ];
  }

  Future<void> getListLocalCategories() async {
    final List<WatchList> res =
        await watchListUseCase.getAllWatchList(SessionManager().username);
    res.addAll(getCategoryDefault());
    res.sort((WatchList a, WatchList b) {
      return b.priority!.compareTo(a.priority!);
    });

    res.sort((WatchList a, WatchList b) {
      return (a.viewOnly ? 1 : -1).compareTo(b.viewOnly ? 1 : -1);
    });
    listCatgorys.value = res;
    categorySelect.value = listCatgorys.tryGet(0);
  }

  Future<WatchList?> createCategory(WatchListParams category) async {
    return watchListUseCase.createWatchList(watchList: category, accountID: '');
  }

  Future<bool> createWatchList({required WatchList watchList}) async {
    try {
      final String? _name = watchList.nameVi;
      if (isNullOrEmpty(_name?.trim())) {
        await _dialogNameCategoryEmpty;
        return false;
      }
      showLoading();

      final WatchList? _watchList = await watchListUseCase.createWatchList(
        watchList: WatchListParams()
          ..nameEn = _name!
          ..nameVi = _name,
        accountID: SessionManager().username,
      );

      if (_watchList == null) {
        AppToast.showError(LocaleKeys.add_wl_fail.tr);
        return false;
      }
      if (listCatgorys.isEmpty) {
        categorySelect.value = _watchList;
      }
      listCatgorys.add(_watchList);

      listCatgorys.sort((WatchList a, WatchList b) {
        return (a.viewOnly ? 1 : -1).compareTo(b.viewOnly ? 1 : -1);
      });
      AppToast.showSuccess(LocaleKeys.add_wl_success.tr);
      return true;
    } catch (exception) {
      AppToast.showError(LocaleKeys.add_wl_fail.tr);
      return false;
    } finally {
      hideLoading();
    }
  }

  Future<bool> updateWatchList({required WatchList watchList}) async {
    try {
      final String? _name = watchList.nameVi;
      if (isNullOrEmpty(_name?.trim())) {
        await _dialogNameCategoryEmpty;
        return false;
      }
      showLoading();

      await watchListUseCase.updateWatchList(
          SessionManager().username,
          WatchListParams()
            ..id = watchList.id
            ..nameEn = _name!
            ..nameVi = _name
            ..priority = watchList.priority);

      listCatgorys.value = listCatgorys.map((WatchList element) {
        if (element.id == watchList.id) {
          element.nameVi = _name;
          element.nameEn = _name;
          return element;
        }
        return element;
      }).toList();
      if (watchList.id == categorySelect.value?.id) {
        categorySelect.value?.nameVi = _name;
        categorySelect.value?.nameEn = _name;
        categorySelect.refresh();
      }

      listCatgorys.refresh();

      AppToast.showSuccess(LocaleKeys.update_wl_success.tr);
      return true;
    } catch (error) {
      AppToast.showError(LocaleKeys.update_wl_fail.tr);
      //  AppToast.showError(Utils.getError(error));
      return false;
    } finally {
      hideLoading();
    }
  }

  Future<void> changeSelectCategory(
    WatchList category,
  ) async {
    WatchList? watchList;
    if (category.type == 'OWNER') {
      watchList =
          await watchListUseCase.watchListOwner(SessionManager().username);
    } else if (category.type == 'CW' ||
        category.type == 'HNX30' ||
        category.type == 'ETF' ||
        category.type == 'VN30') {
      watchList = category;
    } else {
      watchList = await watchListUseCase.getWatchListDetail(
          SessionManager().username, category.id.toString());
    }

    if (watchList != null) {
      categorySelect.value = watchList;
    }
  }

  Future<bool> deleteWatchList(WatchList watchListId) async {
    try {
      showLoading();

      await watchListUseCase.deleteWatchList(
          SessionManager().username, watchListId.id.toString());

      listCatgorys.remove(watchListId);

      if (watchListId.id == categorySelect.value?.id) {
        categorySelect.value =
            listCatgorys.isNotEmpty ? listCatgorys[0] : WatchList();
      }

      AppToast.showSuccess(LocaleKeys.delete_wl_success.tr);
      return true;
    } catch (error) {
      AppToast.showError(getError(error));
      return false;
    } finally {
      hideLoading();
    }
  }

  Future<void> priorityWatchList(List<WatchList> wls) async {
    try {
      await watchListUseCase.priorityWatchList(SessionManager().username,
          wls.map((WatchList e) => '${e.id}').toList());
      listCatgorys.value = <WatchList>[
        ...wls,
        ...listCatgorys.where((WatchList wl) => wl.viewOnly).toList()
      ];
      categorySelect.value = listCatgorys.tryGet(0);
    } catch (exception) {
      listCatgorys.refresh();
    }
  }

  Future<void> deleteTickerFromWatchList(
      String userId, WatchListDetailParams params) async {
    return watchListUseCase.deleteTickerFromWatchList(userId, params);
  }

  Future<DetailStockWatchList> addTickerToWatchList(
      WatchListDetailParams params,
      {required String accountID}) async {
    return watchListUseCase.addTickerToWatchList(accountID, params);
  }

  Future<void> addListTickerToWatchList(
      {required List<String> listSecCd,
      required String idWatchList,
      required Function(List<DetailStockWatchList>) onSuccess,
      required Function(dynamic) onFailure}) async {
    return watchListUseCase.addListTickerToWatchList(listSecCd, idWatchList,
        onSuccess: onSuccess, onFailure: onFailure);
  }

  Future<List<DetailStockWatchList>> copyTickerToWatchList(String userId,
      String watchlistId, List<WatchListDetailParams> params) async {
    return watchListUseCase.copyTickerToWatchList(userId, watchlistId, params);
  }

  Future<void> get _dialogNameCategoryEmpty => Get.dialog(
        CTSAlertDialog(
            title: LocaleKeys.notificaiton.tr,
            description: LocaleKeys.noti_category_empty.tr,
            onAccept: () => Get.back(),
            acceptText: LocaleKeys.close.tr,
            showTwoButton: false),
      );

  void clear() {
    categorySelect.value = null;
    listCatgorys.clear();
  }
}
