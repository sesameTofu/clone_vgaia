///
//  Generated code. Do not modify.
//  source: auto_trading.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'auto_trading.pb.dart' as $0;
export 'auto_trading.pb.dart';

class MarketApiClient extends $grpc.Client {
  static final _$findWatchList =
      $grpc.ClientMethod<$0.WatchListInput, $0.SymbolTotalInfo>(
          '/market_api.MarketApi/findWatchList',
          ($0.WatchListInput value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SymbolTotalInfo.fromBuffer(value));
  static final _$findMarketDepth =
      $grpc.ClientMethod<$0.MarketDepthInput, $0.MarketDepthResponse>(
          '/market_api.MarketApi/findMarketDepth',
          ($0.MarketDepthInput value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MarketDepthResponse.fromBuffer(value));
  static final _$findMarketMatching =
      $grpc.ClientMethod<$0.MarketMatchingInput, $0.MarketMatchingResponse>(
          '/market_api.MarketApi/findMarketMatching',
          ($0.MarketMatchingInput value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MarketMatchingResponse.fromBuffer(value));
  static final _$findTimeSale =
      $grpc.ClientMethod<$0.TimeSaleInput, $0.TimeSaleResponse>(
          '/market_api.MarketApi/findTimeSale',
          ($0.TimeSaleInput value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.TimeSaleResponse.fromBuffer(value));
  static final _$findNetFlow =
      $grpc.ClientMethod<$0.NetFlowInput, $0.MarketNetFlowResponse>(
          '/market_api.MarketApi/findNetFlow',
          ($0.NetFlowInput value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MarketNetFlowResponse.fromBuffer(value));
  static final _$findMarketShare =
      $grpc.ClientMethod<$0.MarketShareInput, $0.MarketShareResponse>(
          '/market_api.MarketApi/findMarketShare',
          ($0.MarketShareInput value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MarketShareResponse.fromBuffer(value));
  static final _$findTopForeignTrade =
      $grpc.ClientMethod<$0.InternalMSInput, $0.InternalMSResponse>(
          '/market_api.MarketApi/findTopForeignTrade',
          ($0.InternalMSInput value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.InternalMSResponse.fromBuffer(value));
  static final _$findTopSecUpDown =
      $grpc.ClientMethod<$0.TopSecUpDownInput, $0.TopSecUpDownResponse>(
          '/market_api.MarketApi/findTopSecUpDown',
          ($0.TopSecUpDownInput value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.TopSecUpDownResponse.fromBuffer(value));
  static final _$findTopSecChanged =
      $grpc.ClientMethod<$0.TopSecChangedInput, $0.TopSecChangedResponse>(
          '/market_api.MarketApi/findTopSecChanged',
          ($0.TopSecChangedInput value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.TopSecChangedResponse.fromBuffer(value));
  static final _$findSecDividend =
      $grpc.ClientMethod<$0.SecDividendInput, $0.SecDividendResponse>(
          '/market_api.MarketApi/findSecDividend',
          ($0.SecDividendInput value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SecDividendResponse.fromBuffer(value));
  static final _$findMarketIndex =
      $grpc.ClientMethod<$0.MarketIndexInput, $0.MarketIndexInfo>(
          '/market_api.MarketApi/findMarketIndex',
          ($0.MarketIndexInput value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MarketIndexInfo.fromBuffer(value));
  static final _$findWorldIndex =
      $grpc.ClientMethod<$0.MarketWorldIndexInput, $0.MarketWorldIndexInfo>(
          '/market_api.MarketApi/findWorldIndex',
          ($0.MarketWorldIndexInput value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MarketWorldIndexInfo.fromBuffer(value));
  static final _$findSecQuotesDetail =
      $grpc.ClientMethod<$0.SecQuotesDetailInput, $0.SecQuotesDetailResponse>(
          '/market_api.MarketApi/findSecQuotesDetail',
          ($0.SecQuotesDetailInput value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SecQuotesDetailResponse.fromBuffer(value));
  static final _$findMarketQuotes =
      $grpc.ClientMethod<$0.MarketQuotesInput, $0.MarketQuotesResponse>(
          '/market_api.MarketApi/findMarketQuotes',
          ($0.MarketQuotesInput value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MarketQuotesResponse.fromBuffer(value));
  static final _$findSecIntraday =
      $grpc.ClientMethod<$0.SecIntradayInput, $0.SecIntradayResponse>(
          '/market_api.MarketApi/findSecIntraday',
          ($0.SecIntradayInput value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.SecIntradayResponse.fromBuffer(value));
  static final _$findIndicatorScreener =
      $grpc.ClientMethod<$0.ScreenerInput, $0.ScreenerResponse>(
          '/market_api.MarketApi/findIndicatorScreener',
          ($0.ScreenerInput value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ScreenerResponse.fromBuffer(value));
  static final _$getMarketInitData =
      $grpc.ClientMethod<$0.MarketInitDataParam, $0.MarketInitDataResponse>(
          '/market_api.MarketApi/getMarketInitData',
          ($0.MarketInitDataParam value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MarketInitDataResponse.fromBuffer(value));
  static final _$findTopMarketCap =
      $grpc.ClientMethod<$0.TopMarketCapInput, $0.TopMarketCapResponse>(
          '/market_api.MarketApi/findTopMarketCap',
          ($0.TopMarketCapInput value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.TopMarketCapResponse.fromBuffer(value));
  static final _$getAllMrktSecInfo =
      $grpc.ClientMethod<$0.MrktSecInfoParam, $0.MrktSecInfoResponse>(
          '/market_api.MarketApi/getAllMrktSecInfo',
          ($0.MrktSecInfoParam value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MrktSecInfoResponse.fromBuffer(value));
  static final _$getPutThrough =
      $grpc.ClientMethod<$0.PutThroughParam, $0.PutThroughResponse>(
          '/market_api.MarketApi/getPutThrough',
          ($0.PutThroughParam value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.PutThroughResponse.fromBuffer(value));
  static final _$getTopIndexContribution = $grpc.ClientMethod<
          $0.TopIndexContributionParam, $0.TopIndexContributionResponse>(
      '/market_api.MarketApi/getTopIndexContribution',
      ($0.TopIndexContributionParam value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.TopIndexContributionResponse.fromBuffer(value));
  static final _$getMarketBreadth =
      $grpc.ClientMethod<$0.MarketBreadthParam, $0.MarketBreadthResponse>(
          '/market_api.MarketApi/getMarketBreadth',
          ($0.MarketBreadthParam value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MarketBreadthResponse.fromBuffer(value));
  static final _$getMarketLiquidity =
      $grpc.ClientMethod<$0.MarketLiquidityParam, $0.MarketLiquidityResponse>(
          '/market_api.MarketApi/getMarketLiquidity',
          ($0.MarketLiquidityParam value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MarketLiquidityResponse.fromBuffer(value));
  static final _$getTopIndustriesTradeForeign = $grpc.ClientMethod<
          $0.TopIndustriesTradeForeignParam,
          $0.TopIndustriesTradeForeignResponse>(
      '/market_api.MarketApi/getTopIndustriesTradeForeign',
      ($0.TopIndustriesTradeForeignParam value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.TopIndustriesTradeForeignResponse.fromBuffer(value));
  static final _$getTopIndustriesContribution = $grpc.ClientMethod<
          $0.TopIndustriesContributionParam,
          $0.TopIndustriesContributionResponse>(
      '/market_api.MarketApi/getTopIndustriesContribution',
      ($0.TopIndustriesContributionParam value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.TopIndustriesContributionResponse.fromBuffer(value));
  static final _$getTopIndustriesTrade = $grpc.ClientMethod<
          $0.TopIndustriesTradeParam, $0.TopIndustriesTradeResponse>(
      '/market_api.MarketApi/getTopIndustriesTrade',
      ($0.TopIndustriesTradeParam value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.TopIndustriesTradeResponse.fromBuffer(value));
  static final _$getIndustriesHeatMap = $grpc.ClientMethod<
          $0.IndustriesHeatMapParam, $0.IndustriesHeatMapResponse>(
      '/market_api.MarketApi/getIndustriesHeatMap',
      ($0.IndustriesHeatMapParam value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.IndustriesHeatMapResponse.fromBuffer(value));

  MarketApiClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.SymbolTotalInfo> findWatchList(
      $0.WatchListInput request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$findWatchList, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.MarketDepthResponse> findMarketDepth(
      $0.MarketDepthInput request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$findMarketDepth, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.MarketMatchingResponse> findMarketMatching(
      $0.MarketMatchingInput request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$findMarketMatching, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.TimeSaleResponse> findTimeSale(
      $0.TimeSaleInput request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$findTimeSale, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.MarketNetFlowResponse> findNetFlow(
      $0.NetFlowInput request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$findNetFlow, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.MarketShareResponse> findMarketShare(
      $0.MarketShareInput request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$findMarketShare, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.InternalMSResponse> findTopForeignTrade(
      $0.InternalMSInput request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$findTopForeignTrade, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.TopSecUpDownResponse> findTopSecUpDown(
      $0.TopSecUpDownInput request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$findTopSecUpDown, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.TopSecChangedResponse> findTopSecChanged(
      $0.TopSecChangedInput request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$findTopSecChanged, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.SecDividendResponse> findSecDividend(
      $0.SecDividendInput request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$findSecDividend, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.MarketIndexInfo> findMarketIndex(
      $0.MarketIndexInput request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$findMarketIndex, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.MarketWorldIndexInfo> findWorldIndex(
      $0.MarketWorldIndexInput request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$findWorldIndex, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.SecQuotesDetailResponse> findSecQuotesDetail(
      $0.SecQuotesDetailInput request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$findSecQuotesDetail, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.MarketQuotesResponse> findMarketQuotes(
      $0.MarketQuotesInput request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$findMarketQuotes, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.SecIntradayResponse> findSecIntraday(
      $0.SecIntradayInput request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$findSecIntraday, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.ScreenerResponse> findIndicatorScreener(
      $0.ScreenerInput request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$findIndicatorScreener, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.MarketInitDataResponse> getMarketInitData(
      $0.MarketInitDataParam request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMarketInitData, request, options: options);
  }

  $grpc.ResponseStream<$0.TopMarketCapResponse> findTopMarketCap(
      $0.TopMarketCapInput request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$findTopMarketCap, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.MrktSecInfoResponse> getAllMrktSecInfo(
      $0.MrktSecInfoParam request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllMrktSecInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.PutThroughResponse> getPutThrough(
      $0.PutThroughParam request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPutThrough, request, options: options);
  }

  $grpc.ResponseFuture<$0.TopIndexContributionResponse> getTopIndexContribution(
      $0.TopIndexContributionParam request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTopIndexContribution, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.MarketBreadthResponse> getMarketBreadth(
      $0.MarketBreadthParam request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMarketBreadth, request, options: options);
  }

  $grpc.ResponseFuture<$0.MarketLiquidityResponse> getMarketLiquidity(
      $0.MarketLiquidityParam request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMarketLiquidity, request, options: options);
  }

  $grpc.ResponseFuture<$0.TopIndustriesTradeForeignResponse>
      getTopIndustriesTradeForeign($0.TopIndustriesTradeForeignParam request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTopIndustriesTradeForeign, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.TopIndustriesContributionResponse>
      getTopIndustriesContribution($0.TopIndustriesContributionParam request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTopIndustriesContribution, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.TopIndustriesTradeResponse> getTopIndustriesTrade(
      $0.TopIndustriesTradeParam request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTopIndustriesTrade, request, options: options);
  }

  $grpc.ResponseFuture<$0.IndustriesHeatMapResponse> getIndustriesHeatMap(
      $0.IndustriesHeatMapParam request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getIndustriesHeatMap, request, options: options);
  }
}

abstract class MarketApiServiceBase extends $grpc.Service {
  $core.String get $name => 'market_api.MarketApi';

  MarketApiServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.WatchListInput, $0.SymbolTotalInfo>(
        'findWatchList',
        findWatchList_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.WatchListInput.fromBuffer(value),
        ($0.SymbolTotalInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MarketDepthInput, $0.MarketDepthResponse>(
        'findMarketDepth',
        findMarketDepth_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.MarketDepthInput.fromBuffer(value),
        ($0.MarketDepthResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.MarketMatchingInput, $0.MarketMatchingResponse>(
            'findMarketMatching',
            findMarketMatching_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.MarketMatchingInput.fromBuffer(value),
            ($0.MarketMatchingResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TimeSaleInput, $0.TimeSaleResponse>(
        'findTimeSale',
        findTimeSale_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.TimeSaleInput.fromBuffer(value),
        ($0.TimeSaleResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.NetFlowInput, $0.MarketNetFlowResponse>(
        'findNetFlow',
        findNetFlow_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.NetFlowInput.fromBuffer(value),
        ($0.MarketNetFlowResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MarketShareInput, $0.MarketShareResponse>(
        'findMarketShare',
        findMarketShare_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.MarketShareInput.fromBuffer(value),
        ($0.MarketShareResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InternalMSInput, $0.InternalMSResponse>(
        'findTopForeignTrade',
        findTopForeignTrade_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.InternalMSInput.fromBuffer(value),
        ($0.InternalMSResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.TopSecUpDownInput, $0.TopSecUpDownResponse>(
            'findTopSecUpDown',
            findTopSecUpDown_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.TopSecUpDownInput.fromBuffer(value),
            ($0.TopSecUpDownResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.TopSecChangedInput, $0.TopSecChangedResponse>(
            'findTopSecChanged',
            findTopSecChanged_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.TopSecChangedInput.fromBuffer(value),
            ($0.TopSecChangedResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SecDividendInput, $0.SecDividendResponse>(
        'findSecDividend',
        findSecDividend_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.SecDividendInput.fromBuffer(value),
        ($0.SecDividendResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MarketIndexInput, $0.MarketIndexInfo>(
        'findMarketIndex',
        findMarketIndex_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.MarketIndexInput.fromBuffer(value),
        ($0.MarketIndexInfo value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.MarketWorldIndexInput, $0.MarketWorldIndexInfo>(
            'findWorldIndex',
            findWorldIndex_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.MarketWorldIndexInput.fromBuffer(value),
            ($0.MarketWorldIndexInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SecQuotesDetailInput,
            $0.SecQuotesDetailResponse>(
        'findSecQuotesDetail',
        findSecQuotesDetail_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.SecQuotesDetailInput.fromBuffer(value),
        ($0.SecQuotesDetailResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.MarketQuotesInput, $0.MarketQuotesResponse>(
            'findMarketQuotes',
            findMarketQuotes_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.MarketQuotesInput.fromBuffer(value),
            ($0.MarketQuotesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SecIntradayInput, $0.SecIntradayResponse>(
        'findSecIntraday',
        findSecIntraday_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.SecIntradayInput.fromBuffer(value),
        ($0.SecIntradayResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ScreenerInput, $0.ScreenerResponse>(
        'findIndicatorScreener',
        findIndicatorScreener_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.ScreenerInput.fromBuffer(value),
        ($0.ScreenerResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.MarketInitDataParam, $0.MarketInitDataResponse>(
            'getMarketInitData',
            getMarketInitData_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.MarketInitDataParam.fromBuffer(value),
            ($0.MarketInitDataResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.TopMarketCapInput, $0.TopMarketCapResponse>(
            'findTopMarketCap',
            findTopMarketCap_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.TopMarketCapInput.fromBuffer(value),
            ($0.TopMarketCapResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MrktSecInfoParam, $0.MrktSecInfoResponse>(
        'getAllMrktSecInfo',
        getAllMrktSecInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MrktSecInfoParam.fromBuffer(value),
        ($0.MrktSecInfoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PutThroughParam, $0.PutThroughResponse>(
        'getPutThrough',
        getPutThrough_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PutThroughParam.fromBuffer(value),
        ($0.PutThroughResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TopIndexContributionParam,
            $0.TopIndexContributionResponse>(
        'getTopIndexContribution',
        getTopIndexContribution_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.TopIndexContributionParam.fromBuffer(value),
        ($0.TopIndexContributionResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.MarketBreadthParam, $0.MarketBreadthResponse>(
            'getMarketBreadth',
            getMarketBreadth_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.MarketBreadthParam.fromBuffer(value),
            ($0.MarketBreadthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MarketLiquidityParam,
            $0.MarketLiquidityResponse>(
        'getMarketLiquidity',
        getMarketLiquidity_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MarketLiquidityParam.fromBuffer(value),
        ($0.MarketLiquidityResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TopIndustriesTradeForeignParam,
            $0.TopIndustriesTradeForeignResponse>(
        'getTopIndustriesTradeForeign',
        getTopIndustriesTradeForeign_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.TopIndustriesTradeForeignParam.fromBuffer(value),
        ($0.TopIndustriesTradeForeignResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TopIndustriesContributionParam,
            $0.TopIndustriesContributionResponse>(
        'getTopIndustriesContribution',
        getTopIndustriesContribution_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.TopIndustriesContributionParam.fromBuffer(value),
        ($0.TopIndustriesContributionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TopIndustriesTradeParam,
            $0.TopIndustriesTradeResponse>(
        'getTopIndustriesTrade',
        getTopIndustriesTrade_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.TopIndustriesTradeParam.fromBuffer(value),
        ($0.TopIndustriesTradeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.IndustriesHeatMapParam,
            $0.IndustriesHeatMapResponse>(
        'getIndustriesHeatMap',
        getIndustriesHeatMap_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.IndustriesHeatMapParam.fromBuffer(value),
        ($0.IndustriesHeatMapResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.SymbolTotalInfo> findWatchList_Pre(
      $grpc.ServiceCall call, $async.Future<$0.WatchListInput> request) async* {
    yield* findWatchList(call, await request);
  }

  $async.Stream<$0.MarketDepthResponse> findMarketDepth_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.MarketDepthInput> request) async* {
    yield* findMarketDepth(call, await request);
  }

  $async.Stream<$0.MarketMatchingResponse> findMarketMatching_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.MarketMatchingInput> request) async* {
    yield* findMarketMatching(call, await request);
  }

  $async.Stream<$0.TimeSaleResponse> findTimeSale_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TimeSaleInput> request) async* {
    yield* findTimeSale(call, await request);
  }

  $async.Stream<$0.MarketNetFlowResponse> findNetFlow_Pre(
      $grpc.ServiceCall call, $async.Future<$0.NetFlowInput> request) async* {
    yield* findNetFlow(call, await request);
  }

  $async.Stream<$0.MarketShareResponse> findMarketShare_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.MarketShareInput> request) async* {
    yield* findMarketShare(call, await request);
  }

  $async.Stream<$0.InternalMSResponse> findTopForeignTrade_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.InternalMSInput> request) async* {
    yield* findTopForeignTrade(call, await request);
  }

  $async.Stream<$0.TopSecUpDownResponse> findTopSecUpDown_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.TopSecUpDownInput> request) async* {
    yield* findTopSecUpDown(call, await request);
  }

  $async.Stream<$0.TopSecChangedResponse> findTopSecChanged_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.TopSecChangedInput> request) async* {
    yield* findTopSecChanged(call, await request);
  }

  $async.Stream<$0.SecDividendResponse> findSecDividend_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.SecDividendInput> request) async* {
    yield* findSecDividend(call, await request);
  }

  $async.Stream<$0.MarketIndexInfo> findMarketIndex_Pre($grpc.ServiceCall call,
      $async.Future<$0.MarketIndexInput> request) async* {
    yield* findMarketIndex(call, await request);
  }

  $async.Stream<$0.MarketWorldIndexInfo> findWorldIndex_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.MarketWorldIndexInput> request) async* {
    yield* findWorldIndex(call, await request);
  }

  $async.Stream<$0.SecQuotesDetailResponse> findSecQuotesDetail_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.SecQuotesDetailInput> request) async* {
    yield* findSecQuotesDetail(call, await request);
  }

  $async.Stream<$0.MarketQuotesResponse> findMarketQuotes_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.MarketQuotesInput> request) async* {
    yield* findMarketQuotes(call, await request);
  }

  $async.Stream<$0.SecIntradayResponse> findSecIntraday_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.SecIntradayInput> request) async* {
    yield* findSecIntraday(call, await request);
  }

  $async.Stream<$0.ScreenerResponse> findIndicatorScreener_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ScreenerInput> request) async* {
    yield* findIndicatorScreener(call, await request);
  }

  $async.Future<$0.MarketInitDataResponse> getMarketInitData_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.MarketInitDataParam> request) async {
    return getMarketInitData(call, await request);
  }

  $async.Stream<$0.TopMarketCapResponse> findTopMarketCap_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.TopMarketCapInput> request) async* {
    yield* findTopMarketCap(call, await request);
  }

  $async.Future<$0.MrktSecInfoResponse> getAllMrktSecInfo_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.MrktSecInfoParam> request) async {
    return getAllMrktSecInfo(call, await request);
  }

  $async.Future<$0.PutThroughResponse> getPutThrough_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PutThroughParam> request) async {
    return getPutThrough(call, await request);
  }

  $async.Future<$0.TopIndexContributionResponse> getTopIndexContribution_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.TopIndexContributionParam> request) async {
    return getTopIndexContribution(call, await request);
  }

  $async.Future<$0.MarketBreadthResponse> getMarketBreadth_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.MarketBreadthParam> request) async {
    return getMarketBreadth(call, await request);
  }

  $async.Future<$0.MarketLiquidityResponse> getMarketLiquidity_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.MarketLiquidityParam> request) async {
    return getMarketLiquidity(call, await request);
  }

  $async.Future<$0.TopIndustriesTradeForeignResponse>
      getTopIndustriesTradeForeign_Pre($grpc.ServiceCall call,
          $async.Future<$0.TopIndustriesTradeForeignParam> request) async {
    return getTopIndustriesTradeForeign(call, await request);
  }

  $async.Future<$0.TopIndustriesContributionResponse>
      getTopIndustriesContribution_Pre($grpc.ServiceCall call,
          $async.Future<$0.TopIndustriesContributionParam> request) async {
    return getTopIndustriesContribution(call, await request);
  }

  $async.Future<$0.TopIndustriesTradeResponse> getTopIndustriesTrade_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.TopIndustriesTradeParam> request) async {
    return getTopIndustriesTrade(call, await request);
  }

  $async.Future<$0.IndustriesHeatMapResponse> getIndustriesHeatMap_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.IndustriesHeatMapParam> request) async {
    return getIndustriesHeatMap(call, await request);
  }

  $async.Stream<$0.SymbolTotalInfo> findWatchList(
      $grpc.ServiceCall call, $0.WatchListInput request);
  $async.Stream<$0.MarketDepthResponse> findMarketDepth(
      $grpc.ServiceCall call, $0.MarketDepthInput request);
  $async.Stream<$0.MarketMatchingResponse> findMarketMatching(
      $grpc.ServiceCall call, $0.MarketMatchingInput request);
  $async.Stream<$0.TimeSaleResponse> findTimeSale(
      $grpc.ServiceCall call, $0.TimeSaleInput request);
  $async.Stream<$0.MarketNetFlowResponse> findNetFlow(
      $grpc.ServiceCall call, $0.NetFlowInput request);
  $async.Stream<$0.MarketShareResponse> findMarketShare(
      $grpc.ServiceCall call, $0.MarketShareInput request);
  $async.Stream<$0.InternalMSResponse> findTopForeignTrade(
      $grpc.ServiceCall call, $0.InternalMSInput request);
  $async.Stream<$0.TopSecUpDownResponse> findTopSecUpDown(
      $grpc.ServiceCall call, $0.TopSecUpDownInput request);
  $async.Stream<$0.TopSecChangedResponse> findTopSecChanged(
      $grpc.ServiceCall call, $0.TopSecChangedInput request);
  $async.Stream<$0.SecDividendResponse> findSecDividend(
      $grpc.ServiceCall call, $0.SecDividendInput request);
  $async.Stream<$0.MarketIndexInfo> findMarketIndex(
      $grpc.ServiceCall call, $0.MarketIndexInput request);
  $async.Stream<$0.MarketWorldIndexInfo> findWorldIndex(
      $grpc.ServiceCall call, $0.MarketWorldIndexInput request);
  $async.Stream<$0.SecQuotesDetailResponse> findSecQuotesDetail(
      $grpc.ServiceCall call, $0.SecQuotesDetailInput request);
  $async.Stream<$0.MarketQuotesResponse> findMarketQuotes(
      $grpc.ServiceCall call, $0.MarketQuotesInput request);
  $async.Stream<$0.SecIntradayResponse> findSecIntraday(
      $grpc.ServiceCall call, $0.SecIntradayInput request);
  $async.Stream<$0.ScreenerResponse> findIndicatorScreener(
      $grpc.ServiceCall call, $0.ScreenerInput request);
  $async.Future<$0.MarketInitDataResponse> getMarketInitData(
      $grpc.ServiceCall call, $0.MarketInitDataParam request);
  $async.Stream<$0.TopMarketCapResponse> findTopMarketCap(
      $grpc.ServiceCall call, $0.TopMarketCapInput request);
  $async.Future<$0.MrktSecInfoResponse> getAllMrktSecInfo(
      $grpc.ServiceCall call, $0.MrktSecInfoParam request);
  $async.Future<$0.PutThroughResponse> getPutThrough(
      $grpc.ServiceCall call, $0.PutThroughParam request);
  $async.Future<$0.TopIndexContributionResponse> getTopIndexContribution(
      $grpc.ServiceCall call, $0.TopIndexContributionParam request);
  $async.Future<$0.MarketBreadthResponse> getMarketBreadth(
      $grpc.ServiceCall call, $0.MarketBreadthParam request);
  $async.Future<$0.MarketLiquidityResponse> getMarketLiquidity(
      $grpc.ServiceCall call, $0.MarketLiquidityParam request);
  $async.Future<$0.TopIndustriesTradeForeignResponse>
      getTopIndustriesTradeForeign(
          $grpc.ServiceCall call, $0.TopIndustriesTradeForeignParam request);
  $async.Future<$0.TopIndustriesContributionResponse>
      getTopIndustriesContribution(
          $grpc.ServiceCall call, $0.TopIndustriesContributionParam request);
  $async.Future<$0.TopIndustriesTradeResponse> getTopIndustriesTrade(
      $grpc.ServiceCall call, $0.TopIndustriesTradeParam request);
  $async.Future<$0.IndustriesHeatMapResponse> getIndustriesHeatMap(
      $grpc.ServiceCall call, $0.IndustriesHeatMapParam request);
}
