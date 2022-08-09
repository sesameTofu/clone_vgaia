import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/domain/model/recommend/recommend_buy.dart';
import 'package:flutter_mobile/domain/model/recommend/recommend_buy_param.dart';
import 'package:flutter_mobile/domain/model/recommend/recommend_sell.dart';
import 'package:flutter_mobile/domain/model/recommend/recommend_sell_param.dart';
import 'package:flutter_mobile/domain/usecase/recommend/recommend_use_case.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RecommendController extends BaseController with BaseMixin {
  final RxNotify<int> indexPage = 0.objective;

  final PageController pageController = PageController(initialPage: 0.round());

  final RecommendUseCase _useCase = RecommendUseCase();

  final RxListNotify<RecommendBuy> recommendBuys = <RecommendBuy>[].objective;

  final RxListNotify<RecommendSell> recommendSells =
      <RecommendSell>[].objective;

  final RefreshController refreshSellController =
      RefreshController(initialRefresh: false);

  final RefreshController refreshBuyController =
      RefreshController(initialRefresh: false);

  @override
  void onInit() {
    findFrontRecommendBuy();
    indexPage.addListener(() {
      if (indexPage.value == 0) {
        findFrontRecommendBuy();
      } else {
        findFrontRecommendSell();
      }
    });
    super.onInit();
  }

  void onChangePage(int? value) {
    if (indexPage.value != value) {
      indexPage.value = value!;

      pageController.jumpToPage(indexPage.value);
    }
  }

  Future<void> findFrontRecommendBuy() async {
    _useCase.findFrontRecommendBuy(
      param: RecommendBuyParam(
        id: 0,
        entryDate: 0,
        secCd: '',
        status: 1,
        top: 0,
      ),
      onSuccess: (List<RecommendBuy> data) {
        recommendBuys.value = data;
        refreshBuyController.refreshCompleted();
      },
      onFailure: (dynamic error) {
        AppToast.showError(getError(error));
        refreshBuyController.refreshFailed();
      },
    );
  }

  Future<void> findFrontRecommendSell() async {
    _useCase.findFrontRecommendSell(
      param: RecommendSellParam(
        entryDate: 0,
        secCd: '',
        top: 5,
      ),
      onSuccess: (List<RecommendSell> data) {
        recommendSells.value = data;
        refreshSellController.refreshCompleted();
      },
      onFailure: (dynamic error) {
        AppToast.showError(getError(error));
        refreshSellController.refreshFailed();
      },
    );
  }

  String priceValue(num price) {
    if (price == 0) {
      return '0.00';
    } else if (price > 0) {
      return price.formatPrice();
    } else {
      return price.formatPrice();
    }
  }

  Color priceColor(num price) {
    if (price == 0) {
      return color.grey40;
    } else if (price > 0) {
      return color.green50;
    } else {
      return color.red50;
    }
  }
}
