import 'dart:math' as math;

import 'package:flutter_mobile/config/config.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pb.dart';
import 'package:flutter_mobile/domain/model/market/filter_market.dart';
import 'package:flutter_mobile/domain/usecase/market_use_case.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';

class ForeignTradeController extends BaseController {
  ForeignTradeController(this.marketUseCase, {int limit = 5}) {
    _limit = limit;
  }
  final MarketUseCase marketUseCase;
  late int _limit;
  int _offset = 0;

  //filter
  late RxSet<Filter> currentIndexCd;
  late Rx<Filter> currentQty;
  late Rx<Filter> currentPeriod;

  late List<Filter> listFilterSecCd;
  late List<Filter> listFilterQty;
  late List<Filter> listFilterPeriod;

  late Rx<InternalMSInput> foreignTradeFilter;

  // list Buy/Sell
  RxList<InternalMS> listBuy = <InternalMS>[].obs;
  RxList<InternalMS> listSell = <InternalMS>[].obs;
  RxDouble maxValue = 0.0.obs;
  int _lengthListShow = 0;

  @override
  void onInit() {
    _bind();
    _getDataForeignTrade();

    ever(foreignTradeFilter, (InternalMSInput value) {
      _getDataForeignTrade();
    });

    super.onInit();
  }

  void _bind() {
    // set list Filter
    listFilterSecCd = <Filter>[
      Filter(id: 100, label: 'HOSE'),
      Filter(id: 200, label: 'HNX'),
      Filter(id: 300, label: 'UPCOM')
    ];

    listFilterQty = <Filter>[
      Filter(id: 1, label: LocaleKeys.total_qty.tr),
      Filter(id: 2, label: LocaleKeys.goline_Value.tr),
    ];

    listFilterPeriod = <Filter>[
      Filter(id: 1, label: 'Hôm nay'),
      Filter(id: 2, label: '1 tuần'),
      Filter(id: 3, label: '1 tháng'),
      Filter(id: 4, label: '3 tháng'),
      Filter(id: 5, label: '6 tháng'),
      Filter(id: 6, label: '1 năm'),
    ];

    currentIndexCd = <Filter>{listFilterSecCd[0]}.obs;
    currentQty = listFilterQty[0].obs;
    currentPeriod = listFilterPeriod[0].obs;
    foreignTradeFilter = InternalMSInput(
            userID: NullableString(data: AppConfig.config.grpcUserId),
            indexCdStr: listFilterSecCd[0].id.toString(),
            type: currentPeriod.value.id,
            offset: 0,
            limit: _limit,
            authenCode: AppConfig.config.authenCode)
        .obs;
  }

  Future<void> _getDataForeignTrade({bool isLoadMore = false}) async {
    // LoadMore tăng offset
    _offset = isLoadMore ? _offset += _limit : 0;

    final InternalMSInput _inputBuy = InternalMSInput(
        authenCode: foreignTradeFilter.value.authenCode,
        indexCdStr: foreignTradeFilter.value.indexCdStr,
        industryIDStr: foreignTradeFilter.value.industryIDStr,
        limit: foreignTradeFilter.value.limit,
        offset: _offset,
        side: 2,
        type: foreignTradeFilter.value.type,
        userID: foreignTradeFilter.value.userID);

    final InternalMSInput _inputSell = InternalMSInput(
        authenCode: foreignTradeFilter.value.authenCode,
        indexCdStr: foreignTradeFilter.value.indexCdStr,
        industryIDStr: foreignTradeFilter.value.industryIDStr,
        limit: foreignTradeFilter.value.limit,
        offset: _offset,
        side: 1,
        type: foreignTradeFilter.value.type,
        userID: foreignTradeFilter.value.userID);

    Future.wait(<Future<List<InternalMS>>>[
      // mua
      marketUseCase.findTopForeign(_inputBuy),
      // bán
      marketUseCase.findTopForeign(_inputSell)
    ])
      ..then((List<List<InternalMS>> value) {
        if (value.isNotEmpty && value.length == 2) {
          if (_offset == 0) {
            // set max maxvalue
            if (value[0].isNotEmpty && value[1].isNotEmpty) {
              // Sang bao
              maxValue.value = math.max(
                  value[0].first.netForeignQty, value[1].first.netForeignQty);
            } else if (value[0].isEmpty && value[1].isEmpty) {
              listBuy.value = value[0];
              listSell.value = value[1];
            } else {
              maxValue.value = value[0].isNotEmpty
                  ? value[0].first.netForeignQty
                  : value[1].first.netForeignQty;
            }
          }
          // set min length Show
          if (value[0].isNotEmpty && value[1].isNotEmpty) {
            _lengthListShow = math.min(listBuy.length + value[0].length,
                listSell.length + value[1].length);
          }

          // set data
          if (isLoadMore) {
            listBuy.addAll(value[0]);
            listSell.addAll(value[1]);
          } else {
            listBuy.value = value[0];
            listSell.value = value[1];
          }
        } else {
          // LoadMore không đúng dữ liệu, reset lại offset cũ
          _offset = isLoadMore ? _offset -= _limit : 0;
        }
      })
      ..catchError((_) {
        // LoadMore không đúng dữ liệu, reset lại offset cũ
        _offset = isLoadMore ? _offset -= _limit : 0;
      });
  }

  Future<void> onLoadMore() async => _getDataForeignTrade(isLoadMore: true);

  Future<void> onRefresh() async => _getDataForeignTrade();

  void onClickFilter({required TypeFilter typeFilter, required Filter value}) {
    if (typeFilter == TypeFilter.period) {
      currentPeriod.value = value;
      foreignTradeFilter.update((InternalMSInput? val) {
        val?.type = value.id;
      });
    } else if (typeFilter == TypeFilter.totalQty) {
      currentQty.value = value;
      // do api chưa có param
      // foreignTradeFilter.update((InternalMSInput? val) {
      //   val?. = value.id;
      // });
    } else if (typeFilter == TypeFilter.secCd) {
      if (currentIndexCd.length >= 2) {
        if (currentIndexCd.contains(value)) {
          currentIndexCd.removeWhere((Filter element) => element == value);
        } else {
          currentIndexCd.add(value);
        }
      } else {
        currentIndexCd.add(value);
      }
      foreignTradeFilter.update((InternalMSInput? val) {
        val?.indexCdStr = currentIndexCd
            .map((Filter element) => element.id)
            .toList()
            .join(',');
      });
    }
  }

  bool get isDataEmpty => listSell.isEmpty && listBuy.isEmpty;

  int get lengthListShow => _lengthListShow;
}
