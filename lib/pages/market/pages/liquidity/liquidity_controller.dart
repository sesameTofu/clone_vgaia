import 'package:flutter_mobile/base/import_base.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pb.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/domain/usecase/market_use_case.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/pages/market/pages/liquidity/const/liquidity_const.dart';

class LiquidityController extends BaseController with BaseMixin {
  // chọn sàn
  final RxList<Select<String>> listCode =
      RxList<Select<String>>(<Select<String>>[]);

  final Rx<Select<String>?> codeSelect = Rx<Select<String>?>(null);

  void selectCode(Select<String>? select) {
    codeSelect.value = select;
  }

  //==
  final MarketUseCase _marketUseCase = MarketUseCase();
  final RxList<MarketLiquidityItem> listDataChart =
      RxList<MarketLiquidityItem>(<MarketLiquidityItem>[]);

  @override
  void onInit() {
    _listen();
    _init();
    super.onInit();
  }

  void _listen() {
    listCode.listen((List<Select<String>> value) {
      codeSelect.value = value.tryGet(0);
    });

    codeSelect.listen((Select<String>? value) {
      if (value != null) {
        getData();
      }
    });
  }

  void _init() {
    listCode.value = listCodeConst
        .map((String e) => Select<String>(title: e, value: e))
        .toList();
  }

  Future<void> getData() async {
    listDataChart.value = await _marketUseCase
        .getMarketLiquidity(numberCode(codeSelect.value?.value ?? ''));

    // listDataChart.value = fakeData();
  }
}
