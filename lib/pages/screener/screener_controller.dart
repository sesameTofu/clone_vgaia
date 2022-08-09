import 'package:flutter_mobile/domain/model/screener/screener_model.dart';
import 'package:flutter_mobile/domain/usecase/screeener/screener_use_case.dart';
import 'package:flutter_mobile/global/app_router.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ScreenerController extends BaseController {
  final ScreenerUsecase _screenerUsecase = ScreenerUsecase();
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  RxList<ScreenerModel> listScreeener = <ScreenerModel>[].obs;

  @override
  void onReady() {
    super.onReady();
    getListFilter();
  }

  //
  Future<void> getListFilter() async {
    showLoading();
    // call APi
    await _getScreeenrs()
        .whenComplete(() => refreshController.refreshCompleted());
    hideLoading();
  }

  Future<void> _getScreeenrs() async {
    await _screenerUsecase.getScreeners(onSuccess: (List<ScreenerModel> list) {
      listScreeener.value = list;
    }, onFail: (dynamic e) {
      AppToast.showError(getError(e));
    });
  }

  //
  Future<void> onRemoveScreener(ScreenerModel screener) async {
    // CAll Api xoa ==> load lai list
    await _screenerUsecase.deleteScreener(screener.idFilter!, onSuccess: () {
      listScreeener.removeWhere(
          (ScreenerModel element) => element.idFilter == screener.idFilter);
    }, onFail: (dynamic e) {
      AppToast.showError(getError(e));
    });
  }

  //
  void onTapScreener(ScreenerModel screener) {
    Get.toNamed(AppRouter.routerResultScreenerPage, arguments: screener);
  }

  //
  Future<void> onCreateNewScreener() async {
    final dynamic _isRefresh =
        await Get.toNamed(AppRouter.routerCreateScreenerPage);
    if (_isRefresh != null && _isRefresh is bool && _isRefresh) {
      getListFilter();
    }
  }
}

// // test
// class ScreenerModel {
//   ScreenerModel({
//     this.idFilter,
//     this.nameFilter,
//     this.marketCd,
//     this.industries,
//     this.quotesIndicators,
//     this.financialIndicators,
//     this.technicalIndicators,
//   });

//   String? idFilter;
//   String? nameFilter;
//   String? marketCd;
//   String? industries;
//   String? quotesIndicators;
//   String? financialIndicators;
//   String? technicalIndicators;
// }
