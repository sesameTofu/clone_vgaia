import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/domain/model/screener/screener_model.dart';
import 'package:flutter_mobile/domain/usecase/screeener/screener_use_case.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/screener/creater_screener/create_screener_controller.dart';
import 'package:flutter_mobile/pages/watch_list/favourite_page/bottom_sheet_category_add.dart';
import 'package:flutter_mobile/pages/watch_list/favourite_page/favourite_controller.dart';
import 'package:flutter_mobile/pages/watch_list/manager/bottom_sheet.dart';
import 'package:flutter_mobile/pages/watch_list/sec_quote_detail/sec_quote_detail_page.dart';
import 'package:flutter_mobile/utils/functs.dart';

class ResultScreenerController extends BaseController {
  final ScreenerUsecase _screenerUsecase = ScreenerUsecase();
  ScrollController scrollControllerTable = ScrollController();
  static const double _endReachedThreshold = 200;
  // `_isGetingData` dùng để check Scroll=> loadmore trong màn hình
  bool _isGetingData = false;

  Rx<ScreenerModel> filterModel = ScreenerModel().obs;
  //
  int offset = 0;
  RxList<StockItemViewModel> listResult = <StockItemViewModel>[].obs;
  RxInt totalRecords = 0.obs;

  RxSet<String> listSelected = <String>{}.obs;

  final Rx<SortState> sortState = Rx<SortState>(SortState.none);

  final Rx<SortType> sortType = Rx<SortType>(SortType.none);

  // HHiển thị nút chọn Item
  RxBool isExpand = false.obs;

  @override
  void onInit() {
    super.onInit();
    final dynamic _agr = Get.arguments;
    if (_agr != null && _agr is ScreenerModel) {
      filterModel.value = _agr;
    }
    scrollControllerTable.addListener(() => _onScroll());
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    showLoading();
    await getResultScreener();
    hideLoading();
  }

  Future<void> _onScroll() async {
    // Chỉ chạy những dòng dưới nếu như controller đã được mount vào widget và đang không loading
    if (!scrollControllerTable.hasClients || _isGetingData) {
      return;
    }

    // Check xem đã đạt tới _endReachedThreshold chưa
    final bool _thresholdReached =
        scrollControllerTable.position.extentAfter < _endReachedThreshold;

    if (_thresholdReached) {
      await getResultScreener(isLoadMore: true);
    }
  }

  //K
  Future<void> getResultScreener({bool isLoadMore = false}) async {
    _isGetingData = true;
    await _screenerUsecase
        .findWorldIndex(isLoadMore ? (offset + 1) : 0, filterModel.value,
            onSuccess: (List<StockItemViewModel> response, int? total) {
      totalRecords.value = total ?? 0;
      if (isLoadMore) {
        offset += 1;
        listResult.addAll(response);
      } else {
        offset = 0;
        listResult.value = response;
      }
    }, onFail: (dynamic e) {
      AppToast.showError(getError(e));
    });
    _isGetingData = false;
  }

  String get strTotalSelect => !isExpand.value
      ? ' (${totalRecords.value})'
      : '(${listSelected.length}/${totalRecords.value})';

  // butto Save Screener
  void onSaveScreener() {
    Get.find<CreateScreenerController>().onSaveScreener();
  }

  // header short
  void onShortChange(SortState state, SortType type) {
    sortState.value = state;
    sortType.value = type;
    // update model ddeer call API, vaf loadMore
    filterModel.value
      ..orderFieldType = type.getOrderFieldTypeByEnum
      ..orderType = state.getOderTypeByEnum;
    //
    // if (type == SortType.symbol) {
    //   // saeps xếp list hiện tại =/= Loadmore thì lại khác (có model trên)
    //   listResult.sort(
    //       (ScreenerResponse_SecDetailInfo a, ScreenerResponse_SecDetailInfo b) {
    //     if (state == SortState.up) {
    //       return b.secCd.toLowerCase().compareTo(a.secCd.toLowerCase());
    //     }
    //     return a.secCd.toLowerCase().compareTo(b.secCd.toLowerCase());
    //   });
    // } else {
    // call Api
    getResultScreener();
    // }
  }

  // button add
  Future<void> onAddtoWatchlist() async {
    // Hiển thịn cho phép chọn Ađ to WatchList
    if (!isExpand.value) {
      isExpand.toggle();
      return;
    }
    // Add WatchList
    if (listSelected.isEmpty) {
      AppToast.showWarning(LocaleKeys.screener_noti_non_slelect.tr);
      return;
    } else {
      await Get.bottomSheet(
        BottomSheetCustom(
          height: 0.4.getHeight,
          padding: EdgeInsets.zero,
          content: BottomSheetCategoryAdd(
            listSecCd: listSelected.toList(),
            title: 'Chọn danh mục',
          ),
        ),
        isScrollControlled: true,
        enableDrag: false,
        backgroundColor: Colors.transparent,
      ).whenComplete(() => Get.delete<FavouriteController>());
    }
  }

  // button cancel
  void onCancelAdd() {
    // ẩn button
    isExpand.value = false;
    // clear danh sách chọn
    listSelected.clear();
  }

  // select item
  void onSelectIterm(StockItemViewModel item) {
    if (isExpand.value) {
      // chọn danh sách Watchlist
      if (listSelected
          .any((String element) => element == item.stockItem.secID)) {
        listSelected.remove(item.stockItem.secID);
      } else {
        listSelected.add(item.stockItem.secID ?? '');
      }
    } else {
      // chuyển qua màn chi tiết mã
      Get.to<bool>(() => SecQuoteDetailPage(item.stockItem.secID ?? ''));
    }
  }
}

// test
class ScreeenerModel {
  String? idFilter;
  String? nameFilter;
  String? tilter1;
  String? tilter2;
  String? tilter3;
  String? tilter4;
}
