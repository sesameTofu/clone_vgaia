import 'package:flutter_mobile/controller/account_manager.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pb.dart';
import 'package:flutter_mobile/domain/usecase/market_use_case.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/screener/creater_screener/widget_view.dart';
import 'package:flutter_mobile/widgets/pop_up/show_bottom_sheet.dart';

class IndustriesHeatMapController extends BaseController with BaseMixin {
  final MarketUseCase _marketUseCase = MarketUseCase();

  RxList<MrktindustriesItem> listIndustries = <MrktindustriesItem>[].obs;

  Rx<MrktindustriesItem> currentIndustries = MrktindustriesItem().obs;

  RxList<IndustriesHeatMapItem> listIndustriesHeatMap =
      <IndustriesHeatMapItem>[].obs;
  @override
  void onInit() {
    super.onInit();
    _setListInsdustry();
  }

  Future<void> _setListInsdustry() async {
    final MarketInitDataItem? _data = _marketUseCase.getMarketInitDataItem();
    if (_data != null &&
        _data.mrktindustriesList.itemMrktindustries.isNotEmpty) {
      // danh sách ngành
      listIndustries.value = _data.mrktindustriesList.itemMrktindustries;
      final List<MrktindustriesItem> listCache = listIndustries
          .where((MrktindustriesItem element) =>
              element.id == AccountManager().userLocalModel.industriesId)
          .toList();
      if (listCache.isNotEmpty) {
        // Ngành đc chọn
        currentIndustries.value = listCache.first;
      } else {
        // Ngành đc chọn
        currentIndustries.value = listIndustries.first;
      }

      //
      ever<MrktindustriesItem>(currentIndustries,
          (MrktindustriesItem newValue) {
        getIndustriesHeatMap();
      });
      // lấy thông tin HeatMap
      getIndustriesHeatMap();
    }
  }

  void getIndustriesHeatMap() {
    _marketUseCase.getIndustriesHeatMap(currentIndustries.value.id,
        onSuccess: (List<IndustriesHeatMapItem> listResponse) {
          listResponse.sort(
              (IndustriesHeatMapItem a, IndustriesHeatMapItem b) =>
                  (b.changePercent.abs()).compareTo(a.changePercent.abs()));
          listIndustriesHeatMap.value = listResponse;
        },
        onFail: () => listIndustriesHeatMap.value = <IndustriesHeatMapItem>[]);
  }

  Future<void> popupListOption() async {
    return await ShowBottomSheet().showBottomSheetScale<void>(
        title: LocaleKeys.industries.tr,
        content: (ScrollController scroll) => ListView.separated(
              controller: scroll,
              itemCount: listIndustries.length,
              itemBuilder: (_, int index) => InkWell(
                onTap: () {
                  currentIndustries.value = listIndustries[index];
                  AccountManager().saveAccount(AccountManager().userLocalModel
                    ..industriesId = currentIndustries.value.id);
                  Get.back();
                },
                child: WidgetView().buildItemCheckBox(
                    listIndustries[index].id == currentIndustries.value.id,
                    vn
                        ? listIndustries[index].nameVn
                        : listIndustries[index].nameEn),
              ),
              separatorBuilder: (_, __) =>
                  Divider(color: color.grey50, height: 1),
            ),
        paddingContent: EdgeInsets.zero);
  }
}
