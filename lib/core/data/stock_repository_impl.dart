import 'package:flutter_mobile/config/config.dart';
import 'package:flutter_mobile/core/domain/reponsitory/stock_repository.dart';
import 'package:flutter_mobile/core/market_item_view_model.dart';
import 'package:flutter_mobile/core/model/match_model.dart';
import 'package:flutter_mobile/core/model/match_price_model.dart';
import 'package:flutter_mobile/core/model/match_volume.dart';
import 'package:flutter_mobile/core/model/stock_info_model.dart';
import 'package:flutter_mobile/core/model/stock_item_model.dart';
import 'package:flutter_mobile/core/model/stock_price.dart';
import 'package:flutter_mobile/core/repos/stock_repos.dart';
import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/core_support/enum/core_enum_helper.dart';
import 'package:flutter_mobile/data/source/dio/api/rest_client_base.dart';
import 'package:flutter_mobile/data/source/gprc/grpc_client.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pbgrpc.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_log.dart';
import 'package:flutter_mobile/global/enum_helper.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:grpc/grpc.dart';

class StockRepositoryImpl extends StockRepository {
  final StockRepos _stockRepos = StockRepos();
  final RestClientBase _client = RestClientBase();

  @override
  Future<void> setStocksWithOpenApp(List<MrktSecInfoItem> listSecInfo) async {
    //
    try {
      listSecInfo.sort(
          (MrktSecInfoItem a, MrktSecInfoItem b) => a.secCd.compareTo(b.secCd));

      for (final MrktSecInfoItem sec in listSecInfo) {
        if (isNotNullOrEmpty(sec.secCd)) {
          _stockRepos.addStockItem(StockItemViewModel(
              stockItem: StockItemModel(
            secID: sec.secCd,
            index: CoreEnumHelper.getIndex(sec.marketCd),
            sName: sec.secName,
            vName: sec.secName,
            eName: sec.secNameEn,
            secType: CoreEnumHelper.getSecType(sec.secType),
          )));
        }
      }
      // for (final Index element in Index.values) {
      _stockRepos
          .addMarketSessionItem(MarketItemViewModel(marketIndex: Index.HOSE));
      _stockRepos
          .addMarketSessionItem(MarketItemViewModel(marketIndex: Index.VN30));
      _stockRepos
          .addMarketSessionItem(MarketItemViewModel(marketIndex: Index.HNX));
      _stockRepos
          .addMarketSessionItem(MarketItemViewModel(marketIndex: Index.UPCOM));
      //  }
    } catch (e) {
      //
    }
  }

  @override
  Future<Map<Field, dynamic>?> getStockInfor({required String secCd}) async {
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    final SecQuotesDetailInput request = SecQuotesDetailInput(
        secCd: secCd,
        userID: 'ADMIN ',
        authenCode: AppConfig.config.authenCode);

    AppLog.log.info('findSecQuotesDetail: $request');

    final ResponseStream<SecQuotesDetailResponse> result =
        _client.findSecQuotesDetail(request);

    late SecQuotesDetailResponse_SecDetailInfo secDetailInfo;
    await for (final SecQuotesDetailResponse e in result) {
      secDetailInfo = e.secDetailInfo;
    }
    return StockInfoModel(
            basicPrice: secDetailInfo.basicPrice,
            floorPrice: secDetailInfo.floorPrice,
            ceilingPrice: secDetailInfo.ceilingPrice,
            // marketStatusSessionWithIndex: stockPrice?.sessionid,
            matchPrice: secDetailInfo.lastPrice,
            changePercent: secDetailInfo.changePercent,
            changePoint: secDetailInfo.changePoint,
            totalQty: secDetailInfo.totalQty,
            openPrice: secDetailInfo.openPrice,
            closePrice: secDetailInfo.basicPrice,
            highestPrice: secDetailInfo.highestPrice,
            lowestPrice: secDetailInfo.lowestPrice,
            sellForeignQty: secDetailInfo.sellForeignQty,
            buyForeignQty: secDetailInfo.buyForeignQty,
            currentRoom: secDetailInfo.currentRoom,
            best1BidPriceStr: secDetailInfo.best1BidPriceStr,
            best1BidPrice: secDetailInfo.best1BidPrice,
            best2BidPrice: secDetailInfo.best2BidPrice,
            best3BidPrice: secDetailInfo.best3BidPrice,
            best1BidQty: secDetailInfo.best1BidQty,
            best2BidQty: secDetailInfo.best2BidQty,
            best3BidQty: secDetailInfo.best3BidQty,
            best1OfferPriceStr: secDetailInfo.best1OfferPriceStr,
            best1OfferPrice: secDetailInfo.best1OfferPrice,
            best2OfferPrice: secDetailInfo.best2OfferPrice,
            best3OfferPrice: secDetailInfo.best3OfferPrice,
            best1OfferQty: secDetailInfo.best1OfferQty,
            best2OfferQty: secDetailInfo.best2OfferQty,
            best3OfferQty: secDetailInfo.best3OfferQty,
            avgPrice: secDetailInfo.avgPrice,
            dataWithApi: true,
            secID: secDetailInfo.secCd,
            bookValue: secDetailInfo.bookValue,
            range: secDetailInfo.range,
            turnoverRate: secDetailInfo.turnoverRate,
            esp: secDetailInfo.esp,
            listedQty: secDetailInfo.listedQty,
            pb: secDetailInfo.pb,
            pe: secDetailInfo.pe,
            ps: secDetailInfo.ps,
            tradePercent: secDetailInfo.tradePercent,
            w52Low: secDetailInfo.w52Low,
            w52Hight: secDetailInfo.w52High,
            basePrice: secDetailInfo.basePrice,
            baseSecCdData: secDetailInfo.baseSecCd.data,
            issuerData: secDetailInfo.issuer.data,
            execPrice: secDetailInfo.execPrice,
            lastTradeDate: secDetailInfo.lastTradeDate,
            marketCap: secDetailInfo.marketCap,
            execRatio: secDetailInfo.execRatio.data)
        .toFiled();
  }

  @override
  Future<List<MatchModel>> findSecIntraday(String secCd) async {
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    final SecIntradayInput request = SecIntradayInput(
        secCd: secCd,
        userID: 'ADMIN ',
        offset: 0,
        limit: AppConfig.config.limitSizeMatchIntraDay,
        authenCode: AppConfig.config.authenCode);

    AppLog.log.info('findSecIntraday: $request');

    final ResponseStream<SecIntradayResponse> result =
        _client.findSecIntraday(request);

    late List<SecIntradayResponse_SecIntradayInfo>
        secIntradayResponseSecIntradayInfo;
    await for (final SecIntradayResponse e in result) {
      secIntradayResponseSecIntradayInfo = e.secIntradayInfo;
    }

    final List<MatchModel> match = <MatchModel>[];

    for (final SecIntradayResponse_SecIntradayInfo element
        in secIntradayResponseSecIntradayInfo) {
      match.add(MatchModel(
          matTime: element.time,
          matPrice: element.price,
          matQtty: element.qty,
          tradeType: EnumHelper.getTradeType(
              element.side.data.formatNumber().toInt())));
    }

    return match.where((MatchModel element) => element.matQtty > 0).toList();
  }

  @override
  Future<List<MatchVolume>> findTimeSale(String secCd, {int tn = 0}) async {
    try {
      final MarketApiClient _client = MarketApiClient(
        GrpcClient.share.client,
        options: GrpcClient.share.options,
      );

      final TimeSaleInput request = TimeSaleInput(
          secCd: secCd,
          tn: tn,
          userID: NullableString(data: 'ADMIN'),
          authenCode: AppConfig.config.authenCode);

      AppLog.log.info('findTimeSale: $request');

      final ResponseStream<TimeSaleResponse> result =
          _client.findTimeSale(request);

      late List<SecTimeSalePro> timeSale;
      await for (final TimeSaleResponse e in result) {
        timeSale = e.secTimeSaleList;
      }
      final List<MatchVolume> list = <MatchVolume>[];
      for (final SecTimeSalePro element in timeSale) {
        list.add(MatchVolume(
          tradeDate: element.tradeDate,
          secCd: element.secCd,
          matPrice: element.matPrice,
          buyQty: element.buyQty,
          buyAmt: element.buyAmt,
          buyPercent: element.buyPercent,
          sellQty: element.sellQty,
          sellAmt: element.sellAmt,
          sellPercent: element.sellPercent,
          totalQty: element.totalQty,
          totalAmt: element.totalAmt,
          percentByTotal: element.percentByTotal * 100,
        ));
      }

      list.sort((MatchVolume a, MatchVolume b) =>
          ((a.percentByTotal ?? 0).compareTo(b.percentByTotal ?? 0)) * -1);
      return list;
    } catch (eee) {
      AppLog.log.info('findTimeSale: $eee');
      return <MatchVolume>[];
    }
  }

  @override
  MarketItemViewModel? getMarketItemViewModel(Index? index) {
    return _stockRepos.getMarketSessionItem(index);
  }

  @override
  Future<StockPrice> getStockPrice({required String symbol}) async {
    final dynamic response = await _client.get(
      'FSS/customers/getstockprice',
      queryParameters: <String, dynamic>{
        'symbol': symbol,
      },
    );

    return StockPrice.fromJson(response['data'][0] as Map<String, dynamic>);
  }

  @override
  Future<MatchPriceModel> findWatchList(
    String secCd,
  ) async {
    try {
      final MarketApiClient _client = MarketApiClient(
        GrpcClient.share.client,
        options: GrpcClient.share.options,
      );

      final WatchListInput request = WatchListInput()
        ..authenCode = AppConfig.config.authenCode
        ..userID = NullableString(data: 'ADMIN')
        ..secList = secCd
        ..isIntraday = NullableString(data: 'true');

      AppLog.log.info('findWatchList: $request');

      final ResponseStream<SymbolTotalInfo> result =
          _client.findWatchList(request);

      //  final List<StockInfoModel> _secQuotes = <StockInfoModel>[];
      final List<MatchModel> match = <MatchModel>[];
      //  3.seconds.delay(() {});
      num min = 0;
      num max = 0;
      num? basicPrice;
      num? floorPrice;
      num? ceilingPrice;

      await for (final SymbolTotalInfo element in result) {
        basicPrice = element.secDetailInfo.basicPrice;
        floorPrice = element.secDetailInfo.floorPrice;
        ceilingPrice = element.secDetailInfo.ceilingPrice;
        for (final PriceInfo element in element.priceInfoList) {
          match.add(MatchModel(
              matTime: DateTime.fromMillisecondsSinceEpoch(element.time.toInt())
                  .formatHHMMSS(),
              matPrice: element.price,
              matQtty: element.qty,
              tradeType: TradeType.NONE));
        }
      }
      if (match.length >= 2) {
        min = match
            .reduce(
                (MatchModel a, MatchModel b) => a.matPrice < b.matPrice ? a : b)
            .matPrice;
        max = match
            .reduce(
                (MatchModel a, MatchModel b) => a.matPrice > b.matPrice ? a : b)
            .matPrice;
      } else if (match.length == 1) {
        min = max = match.first.matPrice;
      }
      return MatchPriceModel(
          match: match,
          basicPrice: basicPrice,
          ceilingPrice: ceilingPrice,
          floorPrice: floorPrice)
        ..min = min
        ..max = max;
    } catch (exception) {
      AppLog.log.printError(exception);

      return MatchPriceModel(match: <MatchModel>[]);
      // return;

      //   return <StockItemViewModel>[];
    }
  }

  @override
  void setMarketInitDataItem(MarketInitDataItem? marketInitDataItem) {
    _stockRepos.setMarketInitDataItem = marketInitDataItem;
  }
}
