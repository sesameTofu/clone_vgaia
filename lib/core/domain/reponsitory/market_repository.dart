import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pbgrpc.dart';
import 'package:grpc/grpc.dart';

abstract class MarketRepository {
  Future<ResponseStream<SymbolTotalInfo>> findWatchList({
    String? userID,
    required List<String> secList,
    String? authenCode,
    bool? getChart,
  });

  Future<ResponseStream<MarketWorldIndexInfo>> findWorldIndex(
      {required String userID});

  Future<ResponseStream<MarketIndexInfo>> findMarketIndex({
    required String userID,
    required List<String> indexCdList,
    String? authenCode,
  });

  Future<ResponseStream<MarketQuotesResponse>> findMarketQuotes(
      {required String indexCd});

  Future<Map<Field, dynamic>?> getMarketInfor(String marketCd);

  Future<ResponseStream<MarketDepthResponse>> findMarketDepth(
      {required String userID, required int indexCd, String? authenCode});

  Future<ResponseStream<InternalMSResponse>> findTopForeignTrade(
      {required InternalMSInput param});

  Future<ResponseStream<TopSecUpDownResponse>> findTopSecUpDown(
      TopSecUpDownInput request);

  Future<ResponseStream<TopSecChangedResponse>> findTopSecChanged(
      TopSecChangedInput request);

  Future<ResponseStream<MarketNetFlowResponse>> findNetFlow(
      NetFlowInput request);

  Future<ResponseStream<SecQuotesDetailResponse>> findSecQuotesDetail(
      SecQuotesDetailInput request);

  Future<ResponseStream<SecDividendResponse>> findSecDividend(
      SecDividendInput request);

  Future<ResponseStream<TimeSaleResponse>> findTimeSale(TimeSaleInput request);

  Future<ResponseStream<SecIntradayResponse>> findSecIntraday(
      SecIntradayInput request);

  Future<ResponseFuture<MrktSecInfoResponse>> getAllMrktSecInfo();

  Future<ResponseFuture<MarketInitDataResponse>> getMarketInitData();

  Future<TopIndustriesTradeForeignResponse> getTopIndustriesTradeForeign(
      TopIndustriesTradeForeignParam request);

  Future<ResponseStream<TopMarketCapResponse>> findTopMarketCap(
      {required String marketCd});

  Future<ResponseFuture<TopIndexContributionResponse>> getTopIndexContribution(
      {required int marketCd});

  Future<ResponseFuture<MarketLiquidityResponse>> getMarketLiquidity(
      {required int marketCd});

  Future<TopIndustriesTradeResponse> getTopIndustriesTrade(
      {required int marketCd});

  Future<TopIndustriesContributionResponse> getTopIndustriesContribution(
      {required int marketCd});

  Future<IndustriesHeatMapResponse> getIndustriesHeatMap(
      {required int industriesId});
}
