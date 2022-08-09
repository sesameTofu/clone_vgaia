import 'package:flutter_mobile/controller/session_manager.dart';
import 'package:flutter_mobile/controller/watch_list_manager.dart';
import 'package:flutter_mobile/domain/model/watch_list/detail_stock_watch_list.dart';
import 'package:flutter_mobile/domain/model/watch_list/watch_list.dart';
import 'package:flutter_mobile/domain/model/watch_list/watch_list_detail.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_mobile/widgets/dialog/dialog.dart';

class CategoryController extends BaseController {
  final WatchListManager categoryManager = WatchListManager();

  List<WatchList> listCategorys({TypeBottom? typeBottom}) =>
      categoryManager.listCatgorys
          .where((WatchList p0) =>
              !p0.viewOnly &&
              !(typeBottom == TypeBottom.COPY_WATCHLIST &&
                  p0.id == categoryManager.categorySelect.value?.id))
          .toList();

  Future<void> removeCategory(WatchList category) async {
    final dynamic res = await _showConfirmDeleteWatchList;

    if (res != null && res is bool && res) {
      final bool? isSucess = await categoryManager.deleteWatchList(category);

      if (isSucess ?? false) {
        // Get.back();
      }
    }
  }

  Future<dynamic> get _showConfirmDeleteWatchList => Get.dialog(
        CTSAlertDialog(
          title: LocaleKeys.confirm.tr,
          description: LocaleKeys.confirm_delete_watch_list.tr,
          onAccept: () {
            return Get.back<bool>(result: true);
          },
          onCancel: () {
            return Get.back<bool>(result: false);
          },
        ),
      );

  Future<void> saveCategorys(List<WatchList> wls) async {
    return categoryManager.priorityWatchList(wls);
  }

  Future<void> changeSelectCategory(WatchList? category) async {
    if (category == null ||
        category.id == categoryManager.categorySelect.value?.id) {
      return;
    }

    return categoryManager.changeSelectCategory(category);
  }

  Future<void> copyWatchList(WatchList category) async {
    final bool? res = await Get.dialog(CTSAlertDialog(
        title: LocaleKeys.confirm.tr,
        description: LocaleKeys.copy_to_watch_list.tr.trArgs(<String>[
          (categoryManager.categorySelect.value?.getCategoryName ?? '')
              .toUpperCase(),
          (category.getCategoryName ?? '').toUpperCase()
        ]),
        onAccept: () {
          return Get.back<bool>(result: true);
        },
        onCancel: () {
          return Get.back<bool>(result: false);
        }));

    if (res != null && res) {
      try {
        showLoading();

        final List<DetailStockWatchList> details =
            await categoryManager.copyTickerToWatchList(
                SessionManager().username,
                '${category.id}',
                (categoryManager.categorySelect.value?.listSecQuotesCode ??
                        <DetailStockWatchList>[])
                    .map((DetailStockWatchList e) =>
                        WatchListDetailParams()..secCd = e.secCd!)
                    .toList());

        category.listSecQuotesCode = details;
        categoryManager.listCatgorys.refresh();

        AppToast.showSuccess(LocaleKeys.wl_copy_success.tr);
        Get.back();
      } catch (error) {
        AppToast.showError(getError(error));
      } finally {
        hideLoading();
      }
    }
  }
}
