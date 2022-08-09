import 'package:flutter_mobile/config/config.dart';
import 'package:flutter_mobile/core/domain/reponsitory/market_repository.dart';
import 'package:flutter_mobile/core/model/market_model.dart';
import 'package:flutter_mobile/core/model/match_data_index_model.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/core_support/enum/core_enum_helper.dart';
import 'package:flutter_mobile/data/source/gprc/grpc_client.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pbgrpc.dart';
import 'package:flutter_mobile/global/app_log.dart';
import 'package:grpc/grpc.dart';

class MarketRepositoryImp extends MarketRepository {
  @override
  Future<Map<Field, dynamic>?> getMarketInfor(String marketCd) async {
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    final MarketIndexInput request = MarketIndexInput()
      ..authenCode = AppConfig.config.authenCode
      ..indexCdList = marketCd
      ..userID = 'ADMIN';
    AppLog.log.info('xxxxxgetMarketInfor: $request');
    late final MarketModel marketModel;
    final ResponseStream<MarketIndexInfo> result =
        _client.findMarketIndex(request);
    await for (final MarketIndexInfo e in result) {
      marketModel = MarketModel(
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
              .map((MarketIndexInfo_IndexTime e) => MatchDataIndexModel(
                  DateTime.fromMillisecondsSinceEpoch(e.time.toInt()), e.val))
              .toList(),
          dataWithApi: true,
          // floor: e.floor,
          // ceiling: e.ceiling,
          // totalBuy: e.totalBuy,
          // totalSell: e.totalSell,
          // totalBuyForeignQty: e.totalBuyForeignQty,
          // totalSellForeignQty: e.totalSellForeignQty,
          totalBuyForeignAmt: e.totalBuyForeignAmt,
          totalSellForeignAmt: e.totalSellForeignAmt);
    }
    return marketModel.toFiledMarket();
  }

  @override
  Future<ResponseStream<SymbolTotalInfo>> findWatchList({
    String? userID,
    required List<String> secList,
    String? authenCode,
    bool? getChart,
  }) async {
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    final WatchListInput request = WatchListInput()
      ..authenCode = AppConfig.config.authenCode
      ..userID = NullableString(data: userID)
      ..secList = secList.join(',')
      ..isIntraday = NullableString(data: '${getChart ?? true}');

    AppLog.log.info('findWatchList: $request');

    final ResponseStream<SymbolTotalInfo> result =
        _client.findWatchList(request);

    return result;
  }

  @override
  Future<ResponseStream<MarketIndexInfo>> findMarketIndex({
    required String userID,
    required List<String> indexCdList,
    String? authenCode,
  }) async {
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    final MarketIndexInput request = MarketIndexInput()
      ..authenCode = AppConfig.config.authenCode
      ..userID = userID
      ..indexCdList = indexCdList.join(',');

    AppLog.log.info('findMarketIndex: $request');

    final ResponseStream<MarketIndexInfo> result =
        _client.findMarketIndex(request);

    return result;
  }

  @override
  Future<ResponseStream<MarketWorldIndexInfo>> findWorldIndex(
      {required String userID}) async {
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );
    final MarketWorldIndexInput request = MarketWorldIndexInput()
      ..authenCode = AppConfig.config.authenCode
      ..userID = userID;

    AppLog.log.info('findMarketIndex: $request');

    final ResponseStream<MarketWorldIndexInfo> _result =
        _client.findWorldIndex(request);

    return _result;
  }

  @override
  Future<ResponseStream<TopSecUpDownResponse>> findTopSecUpDown(
      TopSecUpDownInput request) async {
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    AppLog.log.info('findTopSecUpDown: $request');

    final ResponseStream<TopSecUpDownResponse> result =
        _client.findTopSecUpDown(request);

    return result;
  }

  @override
  Future<ResponseStream<TopSecChangedResponse>> findTopSecChanged(
      TopSecChangedInput request) async {
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    AppLog.log.info('findTopSecChanged: $request');

    final ResponseStream<TopSecChangedResponse> result =
        _client.findTopSecChanged(request);

    return result;
  }

  @override
  Future<ResponseStream<MarketDepthResponse>> findMarketDepth(
      {required String userID,
      required int indexCd,
      String? authenCode}) async {
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    final MarketDepthInput _params = MarketDepthInput()
      ..authenCode = AppConfig.config.authenCode
      ..userID = userID
      ..indexCd = indexCd;

    AppLog.log.info('findMarketDepth: $_params');

    final ResponseStream<MarketDepthResponse> _result =
        _client.findMarketDepth(_params);

    return _result;
  }

  @override
  Future<ResponseStream<InternalMSResponse>> findTopForeignTrade(
      {required InternalMSInput param}) async {
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    AppLog.log.info('findTopForeignTrade: $param');

    final ResponseStream<InternalMSResponse> _result =
        _client.findTopForeignTrade(param);

    return _result;
  }

  @override
  Future<ResponseStream<MarketNetFlowResponse>> findNetFlow(
      NetFlowInput request) async {
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    AppLog.log.info('findNetFlow: $request');

    final ResponseStream<MarketNetFlowResponse> result =
        _client.findNetFlow(request);

    return result;
  }

  @override
  Future<ResponseStream<SecQuotesDetailResponse>> findSecQuotesDetail(
      SecQuotesDetailInput request) async {
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    AppLog.log.info('findSecQuotesDetail: $request');

    final ResponseStream<SecQuotesDetailResponse> result =
        _client.findSecQuotesDetail(request);

    return result;
  }

  @override
  Future<ResponseStream<SecDividendResponse>> findSecDividend(
      SecDividendInput request) async {
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    AppLog.log.info('findSecDividend: $request');

    final ResponseStream<SecDividendResponse> result =
        _client.findSecDividend(request);

    return result;
  }

  @override
  Future<ResponseStream<TimeSaleResponse>> findTimeSale(
      TimeSaleInput request) async {
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    AppLog.log.info('findTimeSale: $request');

    final ResponseStream<TimeSaleResponse> result =
        _client.findTimeSale(request);

    return result;
  }

  @override
  Future<ResponseStream<SecIntradayResponse>> findSecIntraday(
      SecIntradayInput request) async {
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    AppLog.log.info('findTimeSale: $request');

    final ResponseStream<SecIntradayResponse> result =
        _client.findSecIntraday(request);

    return result;
  }

  @override
  Future<ResponseStream<MarketQuotesResponse>> findMarketQuotes(
      {required String indexCd}) async {
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    final MarketQuotesInput _params = MarketQuotesInput()
      ..authenCode = AppConfig.config.authenCode
      ..userID = ''
      ..indexCd = indexCd;

    AppLog.log.info('findMarketQuotes: $_params');

    final ResponseStream<MarketQuotesResponse> result =
        _client.findMarketQuotes(_params);

    return result;
  }

  @override
  Future<ResponseFuture<MrktSecInfoResponse>> getAllMrktSecInfo() async {
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    final MrktSecInfoParam _params = MrktSecInfoParam()
      ..authenCode = AppConfig.config.authenCode;

    AppLog.log.info('getAllMrktSecInfo');

    final ResponseFuture<MrktSecInfoResponse> result =
        _client.getAllMrktSecInfo(_params);

    return result;
  }

  @override
  Future<ResponseFuture<MarketInitDataResponse>> getMarketInitData() async {
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    final MarketInitDataParam _params = MarketInitDataParam()
      ..authenCode = AppConfig.config.authenCode
      ..channel = 2; //1: web, 2: app

    AppLog.log.info('getMarketInitData');

    final ResponseFuture<MarketInitDataResponse> result =
        _client.getMarketInitData(_params);

    return result;
  }

  @override
  Future<TopIndustriesTradeForeignResponse> getTopIndustriesTradeForeign(
      TopIndustriesTradeForeignParam request) async {
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    AppLog.log.info('getTopIndustriesTradeForeign: $request');

    final ResponseFuture<TopIndustriesTradeForeignResponse> result =
        _client.getTopIndustriesTradeForeign(request);

    return await result;
  }

  @override
  Future<ResponseStream<TopMarketCapResponse>> findTopMarketCap(
      {required String marketCd}) async {
    final TopMarketCapInput _topMarketCapInput = TopMarketCapInput()
      ..authenCode = AppConfig.config.authenCode
      ..marketCd = marketCd
      ..userID = 'ADMIN'
      ..offset = 0
      ..limit = 50;
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    AppLog.log.info('findTopMarketCap: $_topMarketCapInput');

    final ResponseStream<TopMarketCapResponse> _result =
        _client.findTopMarketCap(_topMarketCapInput);

    return _result;
  }

  @override
  Future<ResponseFuture<TopIndexContributionResponse>> getTopIndexContribution(
      {required int marketCd}) async {
    final TopIndexContributionParam _topIndexContributionParam =
        TopIndexContributionParam()
          ..authenCode = AppConfig.config.authenCode
          ..marketCd = marketCd;
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    AppLog.log.info('getTopIndexContribution: $_topIndexContributionParam');

    final ResponseFuture<TopIndexContributionResponse> _result =
        _client.getTopIndexContribution(_topIndexContributionParam);

    return _result;
  }

  @override
  Future<ResponseFuture<MarketLiquidityResponse>> getMarketLiquidity(
      {required int marketCd}) async {
    final MarketLiquidityParam _topMarketCapInput = MarketLiquidityParam()
      ..authenCode = AppConfig.config.authenCode
      ..marketCd = marketCd;
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    AppLog.log.info('findTopMarketCap: $_topMarketCapInput');

    final ResponseFuture<MarketLiquidityResponse> _result =
        _client.getMarketLiquidity(_topMarketCapInput);

    return _result;
  }

  //getTopIndustriesTrade - Top giao dịch theo ngành
  @override
  Future<TopIndustriesTradeResponse> getTopIndustriesTrade(
      {required int marketCd}) async {
    final TopIndustriesTradeParam _topMarketCapInput = TopIndustriesTradeParam()
      ..authenCode = AppConfig.config.authenCode
      ..marketCd = marketCd;

    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    AppLog.log.info('getTopIndustriesTrade: $_topMarketCapInput');

    final ResponseFuture<TopIndustriesTradeResponse> _result =
        _client.getTopIndustriesTrade(_topMarketCapInput);

    return await _result;
  }

  //getTopIndustriesContribution - Top đóng góp index theo ngành
  @override
  Future<TopIndustriesContributionResponse> getTopIndustriesContribution(
      {required int marketCd}) async {
    final TopIndustriesContributionParam _topMarketCapInput =
        TopIndustriesContributionParam()
          ..authenCode = AppConfig.config.authenCode
          ..marketCd = marketCd;
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    AppLog.log.info('getTopIndustriesContribution: $_topMarketCapInput');

    final ResponseFuture<TopIndustriesContributionResponse> _result =
        _client.getTopIndustriesContribution(_topMarketCapInput);

    return await _result;
  }

  @override
  Future<IndustriesHeatMapResponse> getIndustriesHeatMap(
      {required int industriesId}) async {
    final IndustriesHeatMapParam _topMarketCapInput = IndustriesHeatMapParam()
      ..authenCode = AppConfig.config.authenCode
      ..industriesId = industriesId;
    final MarketApiClient _client = MarketApiClient(
      GrpcClient.share.client,
      options: GrpcClient.share.options,
    );

    AppLog.log.info('getIndustriesHeatMap: $_topMarketCapInput');

    final IndustriesHeatMapResponse _result =
        await _client.getIndustriesHeatMap(_topMarketCapInput);

    return _result;
  }
}
