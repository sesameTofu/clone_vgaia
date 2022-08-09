import 'package:flutter_mobile/controller/watch_list_manager.dart';
import 'package:flutter_mobile/core/data/market_repository_impl.dart';
import 'package:flutter_mobile/core/domain/reponsitory/market_repository.dart';
import 'package:flutter_mobile/core/model/match_model.dart';
import 'package:flutter_mobile/core/model/match_price_model.dart';
import 'package:flutter_mobile/core/model/stock_info_model.dart';
import 'package:flutter_mobile/core/repos/stock_repos.dart';
import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pbgrpc.dart';
import 'package:flutter_mobile/domain/model/watch_list/detail_stock_watch_list.dart';
import 'package:flutter_mobile/domain/model/watch_list/watch_list.dart';
import 'package:flutter_mobile/domain/model/watch_list/watch_list_detail.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_log.dart';
import 'package:grpc/service_api.dart';

class StockUseCase {
  final StockRepos _stockReponsitory = StockRepos();
  final MarketRepository _marketRepository = MarketRepositoryImp();
  final WatchListManager _categoryManager = WatchListManager();

  List<StockItemViewModel> getQuotesForOrder(String textChange) {
    return _stockReponsitory.searchItems(textChange);
  }

  Future<bool> removeSecFromCurrentCategory(
      {required String accountID, required String secID}) async {
    try {
      await _categoryManager.deleteTickerFromWatchList(
          accountID,
          WatchListDetailParams()
            ..id = _categoryManager.categorySelect.value?.listSecQuotesCode
                    ?.where((DetailStockWatchList element) =>
                        element.secCd == secID)
                    .toList()[0]
                    .id ??
                0
            ..secCd = secID
            ..watchlistId = _categoryManager.categorySelect.value?.id);

      _categoryManager.categorySelect.value?.listSecQuotesCode =
          _categoryManager.categorySelect.value?.listSecQuotesCode
              ?.where((DetailStockWatchList element) => element.secCd != secID)
              .toList();
      _categoryManager.categorySelect.refresh();

      for (final WatchList element in _categoryManager.listCatgorys) {
        if (element.id == _categoryManager.categorySelect.value?.id) {
          element.listSecQuotesCode = element.listSecQuotesCode
              ?.where((DetailStockWatchList element) => element.secCd != secID)
              .toList();
        }
      }

      return true;
    } catch (ee) {
      return false;
    }
  }

  void getSockItemViewModel(String key,
      {required Function onSuccess, required Function onFailure}) {
    try {
      final StockItemViewModel? stockItemViewModel =
          _stockReponsitory.getStockItem(key);
      if (stockItemViewModel != null) {
        onSuccess(stockItemViewModel);
      }
    } catch (err) {
      onFailure(err);
    }
  }

  Future<void> getListItemViewModel(List<String> key,
      {required Function onSuccess, required Function onFailure}) async {
    try {
      final List<StockItemViewModel> stockItemViewModel =
          _stockReponsitory.getListStockItem(key);

      onSuccess(stockItemViewModel);

      return;
    } catch (err) {
      onFailure(err);
    }
  }

  Future<void> getItemViewModel(String key,
      {required Function onSuccess, required Function onFailure}) async {
    try {
      final StockItemViewModel? stockItemViewModel =
          _stockReponsitory.getStockItem(key);
      if (stockItemViewModel != null) {
        onSuccess(stockItemViewModel);
      } else {
        onFailure();
      }
      return;
    } catch (err) {
      onFailure(err);
    }
  }

  List<StockItemViewModel> sortListItemViewModel(SortState state, SortType type,
      List<StockItemViewModel> listStockItemViewModel) {
    final List<StockItemViewModel> listSort = <StockItemViewModel>[
      ...listStockItemViewModel
    ];
    listSort.sort((StockItemViewModel a, StockItemViewModel b) {
      final int factor = state == SortState.up ? 1 : -1;
      switch (type) {
        case SortType.ticker:
          return ((a.getStockInfomation()?.matchPrice ?? 0)
                  .compareTo(b.getStockInfomation()?.matchPrice ?? 0)) *
              factor;
        case SortType.changedPercent:
          return ((a.getStockInfomation()?.changePercent ?? 0)
                  .compareTo(b.getStockInfomation()?.changePercent ?? 0)) *
              factor;
        default:
          return 1;
      }
    });
    return listSort;
  }

  Future<List<StockItemViewModel>> getListViewModel(
      {required List<String> listSecId, required Function onSuccess}) async {
    try {
      if (listSecId.isEmpty) {
        return <StockItemViewModel>[];
      }
      return _stockReponsitory.getListStockItem(listSecId);
    } catch (exception) {
      return <StockItemViewModel>[];
    }
  }

  Future<void> findWatchList(
    List<StockItemViewModel> listItem, {
    required Function onSuccess,
    required Function onFailure,
    bool getChart = true,
  }) async {
    try {
      final ResponseStream<SymbolTotalInfo> stream =
          await _marketRepository.findWatchList(
              getChart: getChart,
              secList: listItem
                  .map((StockItemViewModel element) =>
                      element.stockItem.secID ?? '')
                  .toList());
      num? basicPrice;
      num? floorPrice;
      num? ceilingPrice;
      await for (final SymbolTotalInfo e in stream) {
        for (final StockItemViewModel element in listItem) {
          if (element.stockItem.secID == e.secDetailInfo.secCd) {
            basicPrice = e.secDetailInfo.basePrice;
            floorPrice = e.secDetailInfo.floorPrice;
            ceilingPrice = e.secDetailInfo.ceilingPrice;
            element.updateStockInfo(StockInfoModel(
                    secID: e.secDetailInfo.secCd,
                    floorPrice: e.secDetailInfo.floorPrice,
                    ceilingPrice: e.secDetailInfo.ceilingPrice,
                    basicPrice: e.secDetailInfo.basicPrice,
                    matchPrice: e.secDetailInfo.lastPrice,
                    changePercent: e.secDetailInfo.changePercent,
                    changePoint: e.secDetailInfo.changePoint,
                    totalQty: e.secDetailInfo.totalQty,
                    totalAmt: e.secDetailInfo.totalAmt,
                    openPrice: e.secDetailInfo.lastPrice,
                    closePrice: e.secDetailInfo.lastPrice,
                    highestPrice: e.secDetailInfo.highestPrice,
                    lowestPrice: e.secDetailInfo.lowestPrice,
                    sellForeignQty: e.secDetailInfo.sellForeignQty,
                    buyForeignQty: e.secDetailInfo.buyForeignQty,
                    currentRoom: e.secDetailInfo.currentRoom,
                    best1BidPriceStr: e.secDetailInfo.best1BidPriceStr,
                    best1BidPrice: e.secDetailInfo.best1BidPrice,
                    best1BidQty: e.secDetailInfo.best1BidQty,
                    best2BidPrice: e.secDetailInfo.best2BidPrice,
                    best2BidQty: e.secDetailInfo.best2BidQty,
                    best3BidPrice: e.secDetailInfo.best3BidPrice,
                    best3BidQty: e.secDetailInfo.best3BidQty,
                    best1OfferPriceStr: e.secDetailInfo.best1OfferPriceStr,
                    best1OfferPrice: e.secDetailInfo.best1OfferPrice,
                    best1OfferQty: e.secDetailInfo.best1OfferQty,
                    best2OfferPrice: e.secDetailInfo.best2OfferPrice,
                    best2OfferQty: e.secDetailInfo.best2OfferQty,
                    best3OfferPrice: e.secDetailInfo.best3OfferPrice,
                    best3OfferQty: e.secDetailInfo.best3OfferQty,
                    avgPrice: e.secDetailInfo.avgPrice,
                    dataWithApi: true,
                    bookValue: e.secDetailInfo.bookValue,
                    tradePercent: e.secDetailInfo.tradePercent,
                    // range: e.secDetailInfo.range,
                    // turnoverRate: e.secDetailInfo.turnoverRate,
                    range: e.secDetailInfo.range,
                    turnoverRate: e.secDetailInfo.turnoverRate,
                    esp: e.secDetailInfo.esp,
                    listedQty: e.secDetailInfo.listedQty,
                    pb: e.secDetailInfo.pb,
                    pe: e.secDetailInfo.pe,
                    ps: e.secDetailInfo.ps,
                    w52Low: e.secDetailInfo.w52Low,
                    w52Hight: e.secDetailInfo.w52High,
                    basePrice: e.secDetailInfo.basePrice,
                    baseSecCdData: e.secDetailInfo.baseSecCd.data,
                    issuerData: e.secDetailInfo.issuer.data,
                    execPrice: e.secDetailInfo.execPrice,
                    lastTradeDate: e.secDetailInfo.lastTradeDate,
                    execRatio: e.secDetailInfo.execRatio.data)
                .toFiled());
            if (getChart) {
              final List<MatchModel> match = <MatchModel>[];

              num min = 0;
              num max = 0;

              for (final PriceInfo element in e.priceInfoList) {
                match.add(MatchModel(
                    matTime: DateTime.fromMillisecondsSinceEpoch(
                            element.time.toInt())
                        .formatHHMMSS(),
                    matPrice: element.price,
                    matQtty: element.qty,
                    tradeType: TradeType.NONE));
              }

              if (match.length >= 2) {
                min = match
                    .reduce((MatchModel a, MatchModel b) =>
                        a.matPrice < b.matPrice ? a : b)
                    .matPrice;
                max = match
                    .reduce((MatchModel a, MatchModel b) =>
                        a.matPrice > b.matPrice ? a : b)
                    .matPrice;
              } else if (match.length == 1) {
                min = max = match.first.matPrice;
              }
              element.updateMatchPriceData(MatchPriceModel(
                  match: match,
                  basicPrice: basicPrice,
                  ceilingPrice: ceilingPrice,
                  floorPrice: floorPrice)
                ..min = min
                ..max = max);
            }
          }
        }
      }

      onSuccess(listItem);

      // final List<StockItemViewModel> listItem = <StockItemViewModel>[];
      // for (final StockInfoModel element in _secQuotes) {
      //   getItemViewModel(element.secID ?? '',
      //       onSuccess: (StockItemViewModel stockItemView) {
      //     // Map<String, dynamic> map = element.toJson();
      //     // map.addAll();

      //     // stockItemView.updateStockInfo(element.toJson());
      //     //  listItem.add(stockItemView..getStockInfomation());
      //     listItem.add(stockItemView..getStockInfomation());
      //   }, onFailure: (_) {});
      // }

      // // return listItem;
      // onSuccess(listItem);
      //  return;
    } catch (exception) {
      AppLog.log.printError(exception);

      onFailure(exception);
      // return;

      //   return <StockItemViewModel>[];
    }
  }
}
