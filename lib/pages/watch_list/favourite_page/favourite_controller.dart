import 'package:flutter_mobile/controller/session_manager.dart';
import 'package:flutter_mobile/controller/watch_list_manager.dart';
import 'package:flutter_mobile/domain/model/watch_list/detail_stock_watch_list.dart';
import 'package:flutter_mobile/domain/model/watch_list/watch_list.dart';
import 'package:flutter_mobile/domain/model/watch_list/watch_list_detail.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';

class FavouriteController extends BaseController {
  FavouriteController(this.secId, this.listSecCd);

  final WatchListManager categoryManager = WatchListManager();
  final String secId;
  final List<String>? listSecCd;
  List<WatchList> get listCategory => categoryManager.listCatgorys
      .where((WatchList p0) => !p0.viewOnly)
      .toList();
  final RxSet<num> listWatchListSelected = <num>{}.obs;

  @override
  void onInit() {
    if (listSecCd == null && secId.isNotEmpty) {
      for (final WatchList wl in listCategory) {
        if (wl.listSecQuotesCode
                ?.any((DetailStockWatchList e) => e.secCd == secId) ??
            false) {
          listWatchListSelected.add(wl.id ?? 0);
        }
        // mapSelectWl[wl.id!] = (wl.listSecQuotesCode
        //             ?.any((DetailStockWatchList e) => e.secCd == secId) ??
        //         false)
        //     .obs;
      }
    }
    super.onInit();
  }

  Future<void> onSaveStockToCategory() async {
    showLoading();
    int i = 0;
    try {
      for (final WatchList wl in listCategory) {
        final bool v = wl.listSecQuotesCode
                ?.any((DetailStockWatchList e) => e.secCd == secId) ??
            false;
        // final bool v1 = mapSelectWl[wl.id!]?.value ?? false;
        final bool isWatchlistSelected = listWatchListSelected.contains(wl.id);
        if (listSecCd != null && listSecCd!.isNotEmpty) {
          if (isWatchlistSelected) {
            await categoryManager.addListTickerToWatchList(
                listSecCd: listSecCd!,
                idWatchList: wl.id.toString(),
                onSuccess: (List<DetailStockWatchList> listReq) {
                  i += 1;
                  // LitStock đang được chọn

                  // Xóa Stock Vị trí cũ
                  wl.listSecQuotesCode?.removeWhere(
                      (DetailStockWatchList local) => listReq.any(
                          (DetailStockWatchList req) => req.id == local.id));
                  // Add lại các SecQute mới
                  wl.listSecQuotesCode?.addAll(listReq);

                  // Category đang hiển thị
                  if (listReq.any((DetailStockWatchList e) =>
                      e.id == categoryManager.categorySelect.value?.id)) {
                    // check Có cần cập nhật List category Hiện tại đang được chọn Bên ngoài không
                    if (categoryManager
                                .categorySelect.value?.listSecQuotesCode !=
                            null &&
                        categoryManager.categorySelect.value!.listSecQuotesCode!
                            .isNotEmpty) {
                      // Xóa Stock Vị trí cũ
                      categoryManager.categorySelect.value?.listSecQuotesCode
                          ?.removeWhere((DetailStockWatchList local) =>
                              listReq.any((DetailStockWatchList req) =>
                                  req.id == local.id));
                    }
                    // Thêm mới vào List cũ
                    categoryManager.categorySelect.value?.listSecQuotesCode
                        ?.addAll(listReq);
                    // refresh
                    categoryManager.categorySelect.refresh();
                  }
                },
                onFailure: (dynamic e) {});
          }
        } else if (isWatchlistSelected != v) {
          if (isWatchlistSelected) {
            final DetailStockWatchList watchList =
                await categoryManager.addTickerToWatchList(
                    WatchListDetailParams()
                      ..id = wl.id
                      ..secCd = secId
                      ..watchlistId = wl.id,
                    accountID: SessionManager().username);
            wl.listSecQuotesCode?.addIf(
                // add mã không tông tại tronmg list
                !wl.listSecQuotesCode!.any((DetailStockWatchList element) =>
                    element.id == watchList.id),
                watchList);
            if (watchList.watchlistId ==
                    categoryManager.categorySelect.value?.id &&
                categoryManager.categorySelect.value?.listSecQuotesCode !=
                    null) {
              categoryManager.categorySelect.value!.listSecQuotesCode!.addIf(
                  // add mã không tông tại tronmg list
                  !categoryManager.categorySelect.value!.listSecQuotesCode!.any(
                      (DetailStockWatchList element) =>
                          element.id == watchList.id),
                  watchList);
              categoryManager.categorySelect.refresh();
            }
          } else {
            await categoryManager.deleteTickerFromWatchList(
                SessionManager().username,
                WatchListDetailParams()
                  ..id = wl.listSecQuotesCode
                          ?.where((DetailStockWatchList element) =>
                              element.secCd == secId)
                          .toList()
                          .tryGet(0)
                          ?.id ??
                      0
                  ..secCd = secId
                  ..watchlistId = wl.id);
            // Xóa mã trong tại trong list mã CK của Category trong List<Category>
            wl.listSecQuotesCode?.removeWhere(
                (DetailStockWatchList stock) => stock.secCd == secId);

            if (wl.id == categoryManager.categorySelect.value?.id) {
              // Xóa mã trong tại trong list mã CK của Category đang được chọn bên ngoài
              categoryManager.categorySelect.value?.listSecQuotesCode
                  ?.removeWhere(
                      (DetailStockWatchList stock) => stock.secCd == secId);
              categoryManager.categorySelect.refresh();
            }
          }
          i += 1;
        }
      }
      if (i > 0) {
        categoryManager.listCatgorys.refresh();
        AppToast.showSuccess(LocaleKeys.update_wl_success.tr);
        Get.back();
      } else {
        AppToast.showError(LocaleKeys.noti_category_exist_tock.tr);
      }

      hideLoading();
      Get.back();
      // Get.back();
    } catch (err) {
      hideLoading();
      debugPrint(err.toString());
    }
  }
}
