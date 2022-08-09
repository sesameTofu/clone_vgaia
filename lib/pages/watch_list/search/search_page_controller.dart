import 'package:flutter_mobile/controller/session_manager.dart';
import 'package:flutter_mobile/controller/watch_list_manager.dart';
import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/domain/model/watch_list/detail_stock_watch_list.dart';
import 'package:flutter_mobile/domain/model/watch_list/watch_list.dart';
import 'package:flutter_mobile/domain/model/watch_list/watch_list_detail.dart';
import 'package:flutter_mobile/domain/usecase/search_use_case.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/watch_list/favourite_page/bottom_sheet_category_add.dart';
import 'package:flutter_mobile/pages/watch_list/favourite_page/favourite_controller.dart';
import 'package:flutter_mobile/pages/watch_list/manager/bottom_sheet.dart';

class SearchStockController extends BaseController {
  SearchStockController({required this.categoryId});

  final SearchUseCase searchUseCase = SearchUseCase();
  final WatchListManager _categoryManager = WatchListManager();

  final TextEditingController searchController = TextEditingController();

  RxList<StockItemViewModel> selectStock =
      RxList<StockItemViewModel>(<StockItemViewModel>[]);

  RxMap<String, StockItemViewModel> selectStockMap =
      <String, StockItemViewModel>{}.obs;
  RxBool showButtonClean = RxBool(false);

  // list SexQuotes is selected
  final Set<String> _listSecIdSelect = <String>{};

  // dùng cho TH add trước tiếp vào Danh mục đang đc chọn
  num? categoryId;

  @override
  void onInit() {
    _setListStockSelected();
    _getStocks();
    _getAll();
    //
    _listenChangeStockCategory();
    super.onInit();
  }

  // listen sự thay đổi của việc chọn/hủy mã CK
  void _listenChangeStockCategory() {
    ever<List<WatchList>>(_categoryManager.listCatgorys,
        (List<WatchList> listCAtegory) {
      _setListStockSelected();
      _getAll();
      _getStocks();
    });
  }

  void _setListStockSelected() {
    _listSecIdSelect.clear();
    if (categoryId != null) {
      for (final WatchList category in _categoryManager.listCatgorys) {
        _listSecIdSelect.addAllIf(
            category.listSecQuotesCode != null && category.id == categoryId,
            category.listSecQuotesCode!
                .map((DetailStockWatchList e) => e.secCd ?? '')
                .toList());
      }
    } else {
      // lấy list Mã đang đc chọn
      for (final WatchList category in _categoryManager.listCatgorys
          .where((WatchList p0) => !p0.viewOnly)
          .toList()) {
        _listSecIdSelect.addAllIf(
            category.listSecQuotesCode != null,
            category.listSecQuotesCode!
                .map((DetailStockWatchList e) => e.secCd ?? '')
                .toList());
      }
    }
  }

  Future<void> _getStocks() async {
    _searchListItem();
  }

  void searchKeyWord(String keyWord) {
    _searchListItem(text: keyWord.toUpperCase());

    if (keyWord.trim().isEmpty) {
      showButtonClean.value = false;
    } else if (keyWord.trim().isNotEmpty && !showButtonClean.value) {
      showButtonClean.value = true;
    }
  }

  Future<void> _searchListItem({String? text}) async {
    selectStock.value = await searchUseCase
        .searchListItem(_listSecIdSelect.toList(), text: text);
  }

  Future<void> _getAll() async {
    final List<StockItemViewModel> listALl =
        await searchUseCase.searchListItem(_listSecIdSelect.toList(), text: '');
    selectStockMap.clear();
    for (final StockItemViewModel element in listALl) {
      selectStockMap[element.stockItem.secID ?? ''] = element;
    }
  }

  void clean() {
    searchController.clear();
    showButtonClean.value = false;
    _searchListItem();
  }

  Future<void> addStockCategory(String? secID) async {
    // if (_categoryManager.categorySelect.value == null) {
    //   return;
    // }
    // final Category category = _categoryManager.categorySelect.value!;

    // Đang đc chọn, hoặc đang mở Categoty ko đc thêm mới
    //if (category.cellRemovable) {
    // await Get.to(
    //     () => FavouritePage(FavouriteController(item.stockItem.secID ?? '')));
    if (secID == null) {
      return;
    }
    if (categoryId != null) {
      // thêm họăc xóa mã CK nếu đi vào từ Danh mục
      showLoading();
      if (_listSecIdSelect.any((String stock) => stock == secID)) {
        // nếu tôn tại thì thực hiện hàm xóa
        await _categoryManager
            .deleteTickerFromWatchList(
                SessionManager().username,
                WatchListDetailParams()
                  ..id = _categoryManager
                      .categorySelect.value?.listSecQuotesCode
                      ?.firstWhere(
                          (DetailStockWatchList stock) => stock.secCd == secID)
                      .id
                  ..secCd = secID
                  ..watchlistId = categoryId)
            .whenComplete(() => hideLoading());
        AppToast.showSuccess(LocaleKeys.remove_secCD_success_from_category.tr);

        // Xóa mã trong tại trong list mã CK của Category trong List<Category>
        _categoryManager.listCatgorys
            .firstWhereCanNull(
                (WatchList category) => category.id == categoryId)
            ?.listSecQuotesCode
            ?.removeWhere((DetailStockWatchList stock) => stock.secCd == secID);

        if (categoryId == _categoryManager.categorySelect.value?.id) {
          // Xóa mã trong tại trong list mã CK của Category đang được chọn bên ngoài
          _categoryManager.categorySelect.value?.listSecQuotesCode?.removeWhere(
              (DetailStockWatchList stock) => stock.secCd == secID);
          _categoryManager.categorySelect.refresh();
        }
      } else {
        // nếu chưa tồn tại thì thêm vào luôn
        final DetailStockWatchList _watchList = await _categoryManager
            .addTickerToWatchList(
                WatchListDetailParams()
                  ..id = categoryId
                  ..secCd = secID
                  ..watchlistId = categoryId,
                accountID: SessionManager().username)
            .whenComplete(() => hideLoading());
        AppToast.showSuccess(LocaleKeys.add_secCD_success_from_category.tr);

        // Líst Category
        List<DetailStockWatchList>? _listStockofCategory = _categoryManager
            .listCatgorys
            .firstWhereCanNull(
                (WatchList watchListLocal) => watchListLocal.id == categoryId)
            ?.listSecQuotesCode;
        if (_listStockofCategory == null) {
          _listStockofCategory = <DetailStockWatchList>[_watchList];
        } else {
          _listStockofCategory.addIf(
              // add mã không tông tại tronmg list
              !_listStockofCategory.any((DetailStockWatchList element) =>
                  element.id == _watchList.id),
              _watchList);
        }

        // Líst đang Hiển thị
        if (_categoryManager.categorySelect.value?.listSecQuotesCode != null) {
          _categoryManager.categorySelect.value?.listSecQuotesCode?.addIf(
              // add mã không tông tại tronmg list
              !_categoryManager.categorySelect.value!.listSecQuotesCode!.any(
                  (DetailStockWatchList stock) => stock.id == _watchList.id),
              _watchList);
        }
      }
      _categoryManager.categorySelect.refresh();
      _categoryManager.listCatgorys.refresh();
    } else {
      await Get.bottomSheet(
        BottomSheetCustom(
          height: 0.4.getHeight,
          padding: EdgeInsets.zero,
          content: BottomSheetCategoryAdd(
            secCd: secID,
            title: LocaleKeys.my_watch_list.tr,
          ),
        ),
        isScrollControlled: true,
        enableDrag: false,
        backgroundColor: Colors.transparent,
      );
      Get.delete<FavouriteController>();
    }

    // Chưa được thêm vào category nào
    // Add only [currentCategory]
    // else {
    //   if ((_categoryManager.categorySelect.value?.listSecQuotesCode ??
    //           <String>[])
    //       .where((String element) => element == item.stockItem.secID)
    //       .toList()
    //       .isEmpty) {
    //     _categoryManager.addSecToCurrentCategory(item.stockItem.secID ?? '');
    //   }

    //   Get.back();
    // }
  }
}
