import 'package:flutter_mobile/domain/model/grpc/auto_trading.pbgrpc.dart';
import 'package:flutter_mobile/domain/model/screener/screener_model.dart';
import 'package:flutter_mobile/domain/usecase/market_use_case.dart';
import 'package:flutter_mobile/domain/usecase/screeener/screener_use_case.dart';
import 'package:flutter_mobile/global/app_router.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/screener/creater_screener/enum_filter.dart';
import 'package:flutter_mobile/pages/screener/creater_screener/widget_view.dart';
import 'package:flutter_mobile/utils/functs.dart';

class CreateScreenerController extends BaseController with BaseMixin {
  final ScreenerUsecase _screenerUsecase = ScreenerUsecase();
  final MarketUseCase _marketUseCase = MarketUseCase();

  RxBool isShowSave = false.obs;
  late List<ScreenerOption> initListIndustries;
  // current filter
  // Sàn
  RxList<ScreenerOption> marketFilter = <ScreenerOption>[].obs;

  // Ngành
  RxList<ScreenerOption> industriesFilter = <ScreenerOption>[].obs;

  // Quotes
  RxList<ScreenerOption> quotesFilter = <ScreenerOption>[].obs;

  // Financia
  RxList<ScreenerOption> financiaFilter = <ScreenerOption>[].obs;

  // Technical
  RxList<ScreenerOption> technicalFilter = <ScreenerOption>[].obs;

  //
  bool _haveRefreshData = false;

  @override
  void onInit() {
    super.onInit();
    //
    _initData();
    //
    _listenFilter();
  }

  //
  Future<void> _initData() async {
    // Lấy danh sách Ngành từ local

    final MarketInitDataItem? _data = _marketUseCase.getMarketInitDataItem();
    final List<MrktindustriesItem> _listIndustries =
        _data?.mrktindustriesList.itemMrktindustries ?? <MrktindustriesItem>[];
    if (_listIndustries.isNotEmpty) {
      initListIndustries = _listIndustries
          .map((MrktindustriesItem e) => ScreenerOption(
              id: e.id.toString(), nameEN: e.nameEn, nameVI: e.nameVn))
          .toList();
      vn
          ? initListIndustries.sort(
              (ScreenerOption industry1, ScreenerOption industry2) =>
                  industry1.nameVI!.compareTo(industry2.nameVI!))
          : initListIndustries.sort(
              (ScreenerOption industry1, ScreenerOption industry2) =>
                  industry1.nameEN!.compareTo(industry2.nameEN!));
    } else {
      initListIndustries = <ScreenerOption>[];
    }
  }

  //
  void _listenFilter() {
    marketFilter.listen((_) => isShowSave.value = haveFilter);
    industriesFilter.listen((_) => isShowSave.value = haveFilter);
    quotesFilter.listen((_) => isShowSave.value = haveFilter);
    financiaFilter.listen((_) => isShowSave.value = haveFilter);
    technicalFilter.listen((_) => isShowSave.value = haveFilter);
  }

  //
  bool get haveFilter =>
      marketFilter.isNotEmpty ||
      industriesFilter.isNotEmpty ||
      quotesFilter.isNotEmpty ||
      financiaFilter.isNotEmpty ||
      technicalFilter.isNotEmpty;

  //
  void onViewResult() {
    if (!isShowSave.value) {
      return;
    }
    Get.toNamed(AppRouter.routerResultScreenerPage,
        arguments: ScreenerModel()
          ..marketCds = marketFilter
          ..industries = industriesFilter
          ..financialIndicators = financiaFilter
          ..quotesIndicators = quotesFilter
          ..technicalIndicators = technicalFilter);
  }

  // Lưu Filter
  Future<void> onSaveScreener() async {
    WidgetView().popupNameNewScreener().then((String? value) async {
      if (value != null) {
        showLoading();
        await _screenerUsecase.createScreener(
            ScreenerModel()
              ..nameFilter = value
              ..marketCds = marketFilter
              ..industries = industriesFilter
              ..financialIndicators = financiaFilter
              ..quotesIndicators = quotesFilter
              ..technicalIndicators = technicalFilter, onSuccess: () {
          _haveRefreshData = true;
          AppToast.showSuccess(LocaleKeys.screener_noti_save_success.tr);
        }, onFail: (dynamic e) {
          AppToast.showError(getError(e));
        }).whenComplete(() => hideLoading());
      }
    });
  }

  void onGetBack() {
    Get.back(result: _haveRefreshData);
  }

  // Select Filter
  void onChangeScreener(TypeScreenerView type, {ScreenerOption? optionRange}) {
    switch (type) {
      case TypeScreenerView.market:
        WidgetView()
            .popupListOption(
                type, marketFilter.toList(), TypeScreenerView.market.listData)
            .then((Set<ScreenerOption>? value) {
          if (value != null) {
            marketFilter.clear();
            marketFilter.addAll(value);
          }
        });
        break;
      // Tách ra như này cho rõ
      case TypeScreenerView.industries:
        WidgetView()
            .popupListOption(
                type, industriesFilter.toList(), initListIndustries)
            .then((Set<ScreenerOption>? value) {
          if (value != null) {
            industriesFilter.clear();
            industriesFilter.addAll(value.toSet());
          }
        });
        break;
      //
      case TypeScreenerView.quotes:
        {
          if (optionRange == null) {
            return;
          }
          // check đã có trogn filter chưa
          final ScreenerOption? _optionSelected =
              quotesFilter.firstWhereCanNull(
                  (ScreenerOption element) => element.id == optionRange.id);
          //
          WidgetView()
              .popupRangeOption(ScreenerOption(
                  id: optionRange.id,
                  maxValue: optionRange.maxValue,
                  minValue: optionRange.minValue,
                  fromPrice: _optionSelected?.fromPrice,
                  toPrice: _optionSelected?.toPrice,
                  nameEN: optionRange.nameEN,
                  nameVI: optionRange.nameVI,
                  unitEN: optionRange.unitEN,
                  unitVI: optionRange.unitVI))
              .then((ScreenerOption? value) {
            if (value != null) {
              if (quotesFilter
                  .any((ScreenerOption element) => element.id == value.id)) {
                quotesFilter.removeWhere(
                    (ScreenerOption element) => element.id == value.id);
              }
              quotesFilter.add(value);
            }
          });
        }
        break;
      //
      case TypeScreenerView.financia:
        {
          if (optionRange == null) {
            return;
          }

          // check đã có trogn filter chưa
          final ScreenerOption? _optionSelected =
              financiaFilter.firstWhereCanNull(
                  (ScreenerOption element) => element.id == optionRange.id);
          //
          WidgetView()
              .popupRangeOption(ScreenerOption(
                  id: optionRange.id,
                  maxValue: optionRange.maxValue,
                  minValue: optionRange.minValue,
                  fromPrice: _optionSelected?.fromPrice,
                  toPrice: _optionSelected?.toPrice,
                  nameEN: optionRange.nameEN,
                  nameVI: optionRange.nameVI,
                  unitEN: optionRange.unitEN,
                  unitVI: optionRange.unitVI))
              .then((ScreenerOption? value) {
            if (value != null) {
              if (financiaFilter
                  .any((ScreenerOption element) => element.id == value.id)) {
                financiaFilter.removeWhere(
                    (ScreenerOption element) => element.id == value.id);
              }
              financiaFilter.add(value);
            }
          });
        }
        break;
      //
      case TypeScreenerView.technical:
        {
          if (optionRange == null ||
              technicalFilter.any(
                  (ScreenerOption element) => element.id == optionRange.id)) {
            return;
          }
          technicalFilter.add(optionRange);
        }
        break;
      default:
        return;
    }
  }

  // Remove Filter
  void onRemoveScreener(TypeScreenerView type, {ScreenerOption? option}) {
    switch (type) {
      case TypeScreenerView.market:
        marketFilter.clear();
        break;
      // Tách ra như này cho rõ
      case TypeScreenerView.industries:
        industriesFilter.clear();
        break;
      case TypeScreenerView.quotes:
        {
          quotesFilter.removeWhere(
              (ScreenerOption element) => element.id == option?.id);
        }
        break;
      case TypeScreenerView.financia:
        {
          financiaFilter.removeWhere(
              (ScreenerOption element) => element.id == option?.id);
        }
        break;
      case TypeScreenerView.technical:
        technicalFilter
            .removeWhere((ScreenerOption element) => element.id == option?.id);
        break;
      default:
        return;
    }
  }
}
