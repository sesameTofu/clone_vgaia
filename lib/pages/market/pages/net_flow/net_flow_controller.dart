import 'package:flutter_mobile/base/base_controller.dart';
import 'package:flutter_mobile/config/config.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pbgrpc.dart';
import 'package:flutter_mobile/domain/model/market/filter_market.dart';
import 'package:flutter_mobile/domain/usecase/market_use_case.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/pages/market/maket_share_param.dart';

class NetFlowController extends BaseController {
  NetFlowController(this.marketUseCase);

  final MarketUseCase marketUseCase;

  RxList<MarketNetFlow> netFlow = RxList<MarketNetFlow>(<MarketNetFlow>[]);

  final List<Filter> tnFilter = <Filter>[
    Filter(id: 0, label: 'T'),
    Filter(id: 1, label: 'T-1'),
    Filter(id: 2, label: 'T-2'),
    Filter(id: 3, label: 'T-3'),
    Filter(id: 4, label: 'T-4'),
    Filter(id: 5, label: 'T-5'),
  ];

  late Rx<Filter> tnSelect;

  @override
  void onInit() {
    super.onInit();
    MarketShareParam().addListener(() {
      findNetFlow();
    });

    tnSelect = tnFilter[0].obs;

    findNetFlow();
  }

  Future<void> findNetFlow() async {
    final NetFlowInput input = NetFlowInput()
      ..authenCode = AppConfig.config.authenCode
      ..userId = NullableString(data: AppConfig.config.grpcUserId)
      ..indexCd = MarketShareParam().selectedIndex.formatNumber().toInt()
      ..tn = tnSelect.value.id;

    netFlow.value = await marketUseCase.findNetFlow(input);
  }

  void onPress(Filter filter) {
    tnSelect.value = filter;
    findNetFlow();
  }
}
