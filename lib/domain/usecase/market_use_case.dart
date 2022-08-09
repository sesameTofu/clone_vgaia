import 'package:flutter_mobile/core/data/market_repository_impl.dart';
import 'package:flutter_mobile/core/domain/reponsitory/market_repository.dart';
import 'package:flutter_mobile/core/market_item_view_model.dart';
import 'package:flutter_mobile/core/model/market_model.dart';
import 'package:flutter_mobile/core/model/match_data_index_model.dart';
import 'package:flutter_mobile/core/model/stock_info_model.dart';
import 'package:flutter_mobile/core/repos/stock_repos.dart';
import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/core_support/enum/core_enum_helper.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pb.dart';
import 'package:flutter_mobile/domain/usecase/stock_use_case.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/global/app_log.dart';
import 'package:get/get.dart';
import 'package:grpc/grpc.dart';

class MarketUseCase {
  final MarketRepository _marketRepository = MarketRepositoryImp();
  final StockUseCase stockUseCase = StockUseCase();
  final StockRepos _stockRepos = StockRepos();

  Future<void> findMarketIndex(
      List<MarketItemViewModel> listMarketItemViewModel,
      {required Function onSuccess,
      required Function onFailure}) async {
    try {
      final ResponseStream<MarketIndexInfo> stream =
          await _marketRepository.findMarketIndex(
              userID: '',
              indexCdList: listMarketItemViewModel
                  .map((MarketItemViewModel e) =>
                      e.marketIndex.marketCd().toString())
                  .toList());

      await for (final MarketIndexInfo e in stream) {
        for (final MarketItemViewModel element in listMarketItemViewModel) {
          if (e.indexCd == element.marketIndex.marketCd()) {
            element.updateStockInfo(MarketModel(
                    dataWithApi: true,
                    index: CoreEnumHelper.getIndex(e.indexCd),
                    state: CoreEnumHelper.getMarketSession(e.state.name),
                    // totalTrade: e.totalTrade,
                    totalAmt: e.totalAmt,
                    totalQty: e.totalQty,
                    // totalTradePt: e.totalTradePt,
                    // totalAmtPt: e.totalAmtPt,
                    // totalQtyPt: e.totalQtyPt,
                    marketIndex: e.marketIndex,
                    changeIndex: e.changeIndex,
                    changeIndexPercent: e.changePercent,
                    openIndex: e.openIndex,
                    highestIndex: e.highestIndex,
                    lowestIndex: e.lowestIndex,
                    advances: e.advances,
                    noChange: e.noChange,
                    declenes: e.declenes,
                    colorCode: e.colorCode.value,
                    marketMatchData: e.indexTime
                        .map((MarketIndexInfo_IndexTime e) =>
                            MatchDataIndexModel(
                                DateTime.fromMillisecondsSinceEpoch(
                                    e.time.toInt()),
                                e.val))
                        .toList(),
                    // floor: e.floor,
                    // ceiling: e.ceiling,
                    // totalBuy: e.totalBuy,
                    // totalSell: e.totalSell,
                    // totalBuyForeignQty: e.totalBuyForeignQty,
                    // totalSellForeignQty: e.totalSellForeignQty,
                    totalBuyForeignAmt: e.totalBuyForeignAmt,
                    totalSellForeignAmt: e.totalSellForeignAmt)
                .toFiledMarket());
          }
        }
      }

      onSuccess(listMarketItemViewModel);
    } catch (exception) {
      AppLog.log.printError(exception);

      onFailure(exception);
    }
  }

  Future<List<MarketWorldIndexInfo>> findWorldIndex() async {
    try {
      final ResponseStream<MarketWorldIndexInfo> _stream =
          await _marketRepository.findWorldIndex(userID: '');

      final List<MarketWorldIndexInfo> _marketQuotes = <MarketWorldIndexInfo>[];

      await _stream.forEach((MarketWorldIndexInfo element) {
        _marketQuotes.add(element);
      });

      return _marketQuotes;
    } catch (exception) {
      AppLog.log.printError(exception);

      return <MarketWorldIndexInfo>[];
    }
  }

  Future<MarketQuotesResponse_MarketQuotesInfo> findMarketQuotes(
      String indexCd) async {
    try {
      final ResponseStream<MarketQuotesResponse> _stream =
          await _marketRepository.findMarketQuotes(indexCd: indexCd);

      MarketQuotesResponse_MarketQuotesInfo _marketQuotes =
          MarketQuotesResponse_MarketQuotesInfo();

      await for (final MarketQuotesResponse e in _stream) {
        _marketQuotes = e.marketQuotesInfo;
      }

      return _marketQuotes;
    } catch (exception) {
      AppLog.log.printError(exception);

      return MarketQuotesResponse_MarketQuotesInfo();
    }
  }

  Future<MarketDepth> findMarketDepth(int indexCd) async {
    try {
      final ResponseStream<MarketDepthResponse> _stream =
          await _marketRepository.findMarketDepth(userID: '', indexCd: indexCd);
      late final MarketDepth _marketDepth;
      await for (final MarketDepthResponse e in _stream) {
        _marketDepth = e.marketDepthInfo;
      }

      return _marketDepth;
    } catch (exception) {
      AppLog.log.printError(exception);
      return MarketDepth();
    }
  }

  Future<List<InternalMS>> findTopForeign(InternalMSInput foreignTrade) async {
    try {
      final ResponseStream<InternalMSResponse> _stream =
          await _marketRepository.findTopForeignTrade(param: foreignTrade);
      final List<InternalMS> _listInternal = <InternalMS>[];
      await for (final InternalMSResponse e in _stream) {
        _listInternal.addAll(e.internalMSList);
      }

      return _listInternal;
    } catch (exception) {
      AppLog.log.printError(exception);
      return <InternalMS>[];
    }
  }

  Future<List<StockItemViewModel>> findTopForeignTrade(
      InternalMSInput foreignTrade) async {
    try {
      final ResponseStream<InternalMSResponse> _stream =
          await _marketRepository.findTopForeignTrade(param: foreignTrade);
      final List<InternalMS> _listInternal = <InternalMS>[];
      await for (final InternalMSResponse e in _stream) {
        _listInternal.addAll(e.internalMSList);
      }

      final List<StockItemViewModel> _listItem = <StockItemViewModel>[];
      for (final InternalMS element in _listInternal) {
        stockUseCase.getItemViewModel(element.secCd,
            onSuccess: (StockItemViewModel stockItemView) {
          stockItemView
            ..updateStockInfo(
                StockInfoModel(
                        secID: element.secCd,
                        netForeignQty: element.netForeignQty,
                        netForeignAmt: element.netForeignAmt,
                        buyForeignAmt: element.buyForeignAmt,
                        sellForeignAmt: element.sellForeignAmt,
                        buyForeignQty: element.buyForeignQty,
                        sellForeignQty: element.sellForeignQty,
                        matchPrice: element.closePrice,
                        changePercent: element.changePercent,
                        colorCode: element.colorCode.value)
                    .toFiled(),
                fullInfor: false)
            ..haveSubcrible();
          _listItem.add(stockItemView);
        }, onFailure: (_) {});
      }

      return _listItem;
    } catch (exception) {
      AppLog.log.printError(exception);

      return <StockItemViewModel>[];
    }
  }

  Future<void> findTopSecUpDown(TopSecUpDownInput request,
      {required Function(List<StockItemViewModel>) onSuccess}) async {
    try {
      final ResponseStream<TopSecUpDownResponse> stream =
          await _marketRepository.findTopSecUpDown(request);

      final RxList<TopSecUpDownResponse_TopSecUpDownInfo> _topSec =
          RxList<TopSecUpDownResponse_TopSecUpDownInfo>(
              <TopSecUpDownResponse_TopSecUpDownInfo>[]);

      await for (final TopSecUpDownResponse e in stream) {
        _topSec.addAll(e.topSecUpDown
            .map((TopSecUpDownResponse_TopSecUpDownInfo e) => e)
            .toList()
            .obs);
      }

      final List<StockItemViewModel> listItem = <StockItemViewModel>[];
      for (final TopSecUpDownResponse_TopSecUpDownInfo element in _topSec) {
        stockUseCase.getItemViewModel(element.secCd,
            onSuccess: (StockItemViewModel stockItemView) {
          stockItemView
            ..updateStockInfo(
                StockInfoModel(
                        totalQty: element.totalQty,
                        matchPrice: element.closePrice,
                        changePoint: element.changePercent,
                        changePercent: element.changePercent,
                        changePercentNotDay: element.changePercent,
                        colorCode: element.colorCode.value)
                    .toFiled(),
                fullInfor: false)
            ..haveSubcrible();
          listItem.add(stockItemView);
        }, onFailure: (_) {});
      }

      onSuccess(listItem);
    } catch (exception) {
      AppLog.log.printError(exception);
    }
  }

  Future<List<StockItemViewModel>> findTopSecChanged(
      TopSecChangedInput request) async {
    try {
      final ResponseStream<TopSecChangedResponse> stream =
          await _marketRepository.findTopSecChanged(request);

      final List<TopSecChangedResponse_TopSecChangedInfo> _topSec =
          <TopSecChangedResponse_TopSecChangedInfo>[];

      await for (final TopSecChangedResponse e in stream) {
        _topSec.addAll(e.topSecChanged
            .map<TopSecChangedResponse_TopSecChangedInfo>(
                (TopSecChangedResponse_TopSecChangedInfo e) => e)
            .toList());
      }

      final List<StockItemViewModel> listItem = <StockItemViewModel>[];
      for (final TopSecChangedResponse_TopSecChangedInfo element in _topSec) {
        stockUseCase.getItemViewModel(element.secCd,
            onSuccess: (StockItemViewModel stockItemView) {
          stockItemView
            ..updateStockInfo(
                StockInfoModel(
                        changeHighLow: element.changeHighLow,
                        totalQty: element.totalQty,
                        totalAmt: element.totalAmt,
                        matchPrice: element.closePrice,
                        changePoint: element.changePercent,
                        changePercent: element.changePercent,
                        colorCode: element.colorCode.value)
                    .toFiled(),
                fullInfor: false)
            ..haveSubcrible();
          listItem.add(stockItemView);
        }, onFailure: (_) {});
      }

      return listItem;
    } catch (exception) {
      AppLog.log.printError(exception);

      return <StockItemViewModel>[];
    }
  }

  Future<RxList<MarketNetFlow>> findNetFlow(NetFlowInput request) async {
    try {
      final ResponseStream<MarketNetFlowResponse> stream =
          await _marketRepository.findNetFlow(request);

      final RxList<MarketNetFlow> netFlowList =
          RxList<MarketNetFlow>(<MarketNetFlow>[]);

      await for (final MarketNetFlowResponse e in stream) {
        netFlowList.addAll(e.marketNetFlowList);
      }

      return netFlowList;
    } catch (exception) {
      AppLog.log.printError(exception);

      return RxList<MarketNetFlow>(<MarketNetFlow>[]);
    }
  }

  Future<SecQuotesDetailResponse_SecDetailInfo> findSecQuotesDetail(
      SecQuotesDetailInput request) async {
    try {
      final ResponseStream<SecQuotesDetailResponse> stream =
          await _marketRepository.findSecQuotesDetail(request);

      late SecQuotesDetailResponse_SecDetailInfo secQuotesDetail;

      await for (final SecQuotesDetailResponse e in stream) {
        secQuotesDetail = e.secDetailInfo;
      }

      return secQuotesDetail;
    } catch (exception) {
      AppLog.log.printError(exception);

      return SecQuotesDetailResponse_SecDetailInfo();
    }
  }

  Future<SecDividendInfo> findSecDividend(SecDividendInput request) async {
    try {
      final ResponseStream<SecDividendResponse> stream =
          await _marketRepository.findSecDividend(request);

      late SecDividendInfo secDividendInfo;

      await for (final SecDividendResponse e in stream) {
        secDividendInfo = e.secDividendInfo;
      }

      return secDividendInfo;
    } catch (exception) {
      AppLog.log.printError(exception);

      return SecDividendInfo();
    }
  }

  Future<RxList<SecTimeSalePro>> findTimeSale(TimeSaleInput request) async {
    try {
      final ResponseStream<TimeSaleResponse> stream =
          await _marketRepository.findTimeSale(request);

      final RxList<SecTimeSalePro> secTimeSale =
          RxList<SecTimeSalePro>(<SecTimeSalePro>[]);

      await for (final TimeSaleResponse e in stream) {
        secTimeSale.addAll(e.secTimeSaleList);
      }

      return secTimeSale;
    } catch (exception) {
      AppLog.log.printError(exception);

      return <SecTimeSalePro>[].obs;
    }
  }

  Future<RxList<SecIntradayResponse_SecIntradayInfo>> findSecIntraday(
      SecIntradayInput request) async {
    try {
      final ResponseStream<SecIntradayResponse> stream =
          await _marketRepository.findSecIntraday(request);

      final RxList<SecIntradayResponse_SecIntradayInfo> secIntraday =
          RxList<SecIntradayResponse_SecIntradayInfo>(
              <SecIntradayResponse_SecIntradayInfo>[]);

      await for (final SecIntradayResponse e in stream) {
        secIntraday.addAll(e.secIntradayInfo);
      }

      return secIntraday;
    } catch (exception) {
      AppLog.log.printError(exception);

      return <SecIntradayResponse_SecIntradayInfo>[].obs;
    }
  }

  Future<List<MrktSecInfoItem>> getAllMrktSecInfo() async {
    List<MrktSecInfoItem> data = <MrktSecInfoItem>[];
    try {
      final ResponseFuture<MrktSecInfoResponse> future =
          await _marketRepository.getAllMrktSecInfo();

      data = (await future).data;

      return data;
    } catch (exception) {
      AppLog.log.printError(exception);
      return data;
    }
  }

  Future<MarketInitDataItem?> getMarketInitData() async {
    try {
      final ResponseFuture<MarketInitDataResponse> future =
          await _marketRepository.getMarketInitData();

      return (await future).items;
    } catch (exception) {
      AppLog.log.printError(exception);
      return null;
    }
  }

  Future<void> findTopMarketCap(String marketCd,
      {required Function(List<TopMarketCapResponse_TopMarketCapInfo>)
          onsuccess}) async {
    try {
      final ResponseStream<TopMarketCapResponse> _stream =
          await _marketRepository.findTopMarketCap(marketCd: marketCd);
      final List<TopMarketCapResponse_TopMarketCapInfo> _listInternal =
          <TopMarketCapResponse_TopMarketCapInfo>[];
      await for (final TopMarketCapResponse e in _stream) {
        _listInternal.addAll(e.topMarketCapInfo);
      }

      onsuccess(_listInternal);
    } catch (exception) {
      AppLog.log.printError(exception);
    }
  }

  Future<void> getTopIndexContribution(int marketCd,
      {required Function(List<TopIndexContributionItem>) onsuccess}) async {
    try {
      final ResponseFuture<TopIndexContributionResponse> _stream =
          await _marketRepository.getTopIndexContribution(marketCd: marketCd);

      final List<TopIndexContributionItem> _listResult =
          <TopIndexContributionItem>[];

      if ((await _stream).data.topDecrease.isNotEmpty) {
        _listResult.addAll((await _stream).data.topDecrease);
      }
      if ((await _stream).data.topIncrease.isNotEmpty) {
        _listResult.addAll((await _stream).data.topIncrease);
      }
      onsuccess(_listResult);
    } catch (exception) {
      AppLog.log.printError(exception);
    }
  }

  Future<TopIndustriesTradeForeignResponse?> getTopIndustriesTradeForeign(
      TopIndustriesTradeForeignParam request) async {
    try {
      final TopIndustriesTradeForeignResponse future =
          await _marketRepository.getTopIndustriesTradeForeign(request);

      return future;
    } catch (exception) {
      AppLog.log.printError(exception);
      return null;
    }
  }

  Future<TopIndustriesTradeResponse?> getTopIndustriesTrade(
      {required int marketCd}) async {
    try {
      final TopIndustriesTradeResponse future =
          await _marketRepository.getTopIndustriesTrade(marketCd: marketCd);

      return future;
    } catch (exception) {
      AppLog.log.printError(exception);
      return null;
    }
  }

  Future<TopIndustriesContributionResponse?> getTopIndustriesContribution(
      {required int marketCd}) async {
    try {
      final TopIndustriesContributionResponse future = await _marketRepository
          .getTopIndustriesContribution(marketCd: marketCd);

      return future;
    } catch (exception) {
      AppLog.log.printError(exception);
      return null;
    }
  }

  Future<List<MarketLiquidityItem>> getMarketLiquidity(int marketCd) async {
    try {
      final ResponseFuture<MarketLiquidityResponse> future =
          await _marketRepository.getMarketLiquidity(marketCd: marketCd);

      return (await future).data;
    } catch (exception) {
      AppLog.log.printError(exception);
      return <MarketLiquidityItem>[];
    }
  }

  Future<void> getIndustriesHeatMap(int industriesId,
      {required Function(List<IndustriesHeatMapItem>) onSuccess,
      required Function onFail}) async {
    try {
      final IndustriesHeatMapResponse _response = await _marketRepository
          .getIndustriesHeatMap(industriesId: industriesId);
      onSuccess(_response.data);
    } catch (exception) {
      AppLog.log.printError(exception);
      onFail();
    }
  }

  Future<List<StockItemViewModel>> getListStockEKT() async {
    return _stockRepos.getListStockSecType(type: SecType.E);
  }

  MarketInitDataItem? getMarketInitDataItem() {
    return _stockRepos.marketInitDataItem;
  }
}
