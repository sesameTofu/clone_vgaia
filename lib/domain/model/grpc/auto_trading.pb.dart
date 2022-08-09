///
//  Generated code. Do not modify.
//  source: auto_trading.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'auto_trading.pbenum.dart';
import 'google/protobuf/struct.pbenum.dart' as $1;

export 'auto_trading.pbenum.dart';

class WatchListInput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'WatchListInput', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOM<NullableString>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userID', protoName: 'userID', subBuilder: NullableString.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secList', protoName: 'secList')
    ..aOM<NullableString>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isIntraday', protoName: 'isIntraday', subBuilder: NullableString.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..hasRequiredFields = false
  ;

  WatchListInput._() : super();
  factory WatchListInput({
    NullableString? userID,
    $core.String? secList,
    NullableString? isIntraday,
    $core.String? authenCode,
  }) {
    final _result = create();
    if (userID != null) {
      _result.userID = userID;
    }
    if (secList != null) {
      _result.secList = secList;
    }
    if (isIntraday != null) {
      _result.isIntraday = isIntraday;
    }
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    return _result;
  }
  factory WatchListInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WatchListInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WatchListInput clone() => WatchListInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WatchListInput copyWith(void Function(WatchListInput) updates) => super.copyWith((message) => updates(message as WatchListInput)) as WatchListInput; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WatchListInput create() => WatchListInput._();
  WatchListInput createEmptyInstance() => create();
  static $pb.PbList<WatchListInput> createRepeated() => $pb.PbList<WatchListInput>();
  @$core.pragma('dart2js:noInline')
  static WatchListInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WatchListInput>(create);
  static WatchListInput? _defaultInstance;

  @$pb.TagNumber(1)
  NullableString get userID => $_getN(0);
  @$pb.TagNumber(1)
  set userID(NullableString v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);
  @$pb.TagNumber(1)
  NullableString ensureUserID() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get secList => $_getSZ(1);
  @$pb.TagNumber(2)
  set secList($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecList() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecList() => clearField(2);

  @$pb.TagNumber(3)
  NullableString get isIntraday => $_getN(2);
  @$pb.TagNumber(3)
  set isIntraday(NullableString v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsIntraday() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsIntraday() => clearField(3);
  @$pb.TagNumber(3)
  NullableString ensureIsIntraday() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get authenCode => $_getSZ(3);
  @$pb.TagNumber(4)
  set authenCode($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAuthenCode() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuthenCode() => clearField(4);
}

class SymbolTotalInfo_SecDetailInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SymbolTotalInfo.SecDetailInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', protoName: 'marketCd')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secName', protoName: 'secName')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secType', $pb.PbFieldType.O3, protoName: 'secType')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'basicPrice', $pb.PbFieldType.OD, protoName: 'basicPrice')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ceilingPrice', $pb.PbFieldType.OD, protoName: 'ceilingPrice')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'floorPrice', $pb.PbFieldType.OD, protoName: 'floorPrice')
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'highestPrice', $pb.PbFieldType.OD, protoName: 'highestPrice')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lowestPrice', $pb.PbFieldType.OD, protoName: 'lowestPrice')
    ..a<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avgPrice', $pb.PbFieldType.OD, protoName: 'avgPrice')
    ..a<$core.double>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastPrice', $pb.PbFieldType.OD, protoName: 'lastPrice')
    ..a<$core.double>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastQty', $pb.PbFieldType.OD, protoName: 'lastQty')
    ..a<$core.double>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalQty', $pb.PbFieldType.OD, protoName: 'totalQty')
    ..a<$core.double>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalAmt', $pb.PbFieldType.OD, protoName: 'totalAmt')
    ..a<$core.double>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalPtQty', $pb.PbFieldType.OD, protoName: 'totalPtQty')
    ..a<$core.double>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalPtAmt', $pb.PbFieldType.OD, protoName: 'totalPtAmt')
    ..a<$core.double>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellForeignQty', $pb.PbFieldType.OD, protoName: 'sellForeignQty')
    ..a<$core.double>(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyForeignQty', $pb.PbFieldType.OD, protoName: 'buyForeignQty')
    ..a<$core.double>(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePoint', $pb.PbFieldType.OD, protoName: 'changePoint')
    ..a<$core.double>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePercent', $pb.PbFieldType.OD, protoName: 'changePercent')
    ..a<$core.double>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalRoom', $pb.PbFieldType.OD, protoName: 'totalRoom')
    ..a<$core.double>(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currentRoom', $pb.PbFieldType.OD, protoName: 'currentRoom')
    ..a<$core.double>(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'w52High', $pb.PbFieldType.OD, protoName: 'w52High')
    ..a<$core.double>(24, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'w52Low', $pb.PbFieldType.OD, protoName: 'w52Low')
    ..aOS(25, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best1BidPriceStr', protoName: 'best1BidPriceStr')
    ..a<$core.double>(26, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best1BidPrice', $pb.PbFieldType.OD, protoName: 'best1BidPrice')
    ..a<$core.double>(27, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best1BidQty', $pb.PbFieldType.OD, protoName: 'best1BidQty')
    ..a<$core.double>(28, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best2BidPrice', $pb.PbFieldType.OD, protoName: 'best2BidPrice')
    ..a<$core.double>(29, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best2BidQty', $pb.PbFieldType.OD, protoName: 'best2BidQty')
    ..a<$core.double>(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best3BidPrice', $pb.PbFieldType.OD, protoName: 'best3BidPrice')
    ..a<$core.double>(31, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best3BidQty', $pb.PbFieldType.OD, protoName: 'best3BidQty')
    ..a<$core.double>(32, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best4BidQty', $pb.PbFieldType.OD, protoName: 'best4BidQty')
    ..aOS(33, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best1OfferPriceStr', protoName: 'best1OfferPriceStr')
    ..a<$core.double>(34, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best1OfferPrice', $pb.PbFieldType.OD, protoName: 'best1OfferPrice')
    ..a<$core.double>(35, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best1OfferQty', $pb.PbFieldType.OD, protoName: 'best1OfferQty')
    ..a<$core.double>(36, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best2OfferPrice', $pb.PbFieldType.OD, protoName: 'best2OfferPrice')
    ..a<$core.double>(37, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best2OfferQty', $pb.PbFieldType.OD, protoName: 'best2OfferQty')
    ..a<$core.double>(38, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best3OfferPrice', $pb.PbFieldType.OD, protoName: 'best3OfferPrice')
    ..a<$core.double>(39, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best3OfferQty', $pb.PbFieldType.OD, protoName: 'best3OfferQty')
    ..a<$core.double>(40, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best4OfferQty', $pb.PbFieldType.OD, protoName: 'best4OfferQty')
    ..a<$core.double>(41, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'listedQty', $pb.PbFieldType.OD, protoName: 'listedQty')
    ..a<$core.double>(42, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tradeQty', $pb.PbFieldType.OD, protoName: 'tradeQty')
    ..a<$core.double>(43, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tradePercent', $pb.PbFieldType.OD, protoName: 'tradePercent')
    ..a<$core.double>(44, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'esp', $pb.PbFieldType.OD)
    ..a<$core.double>(45, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pe', $pb.PbFieldType.OD)
    ..a<$core.double>(46, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pb', $pb.PbFieldType.OD)
    ..a<$core.double>(47, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ps', $pb.PbFieldType.OD)
    ..a<$core.double>(48, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bookValue', $pb.PbFieldType.OD, protoName: 'bookValue')
    ..a<$core.double>(49, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dividendAmt', $pb.PbFieldType.OD, protoName: 'dividendAmt')
    ..a<$core.double>(50, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dividendRate', $pb.PbFieldType.OD, protoName: 'dividendRate')
    ..aOS(51, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secNameEn', protoName: 'secNameEn')
    ..aOM<NullableString>(52, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'baseSecCd', protoName: 'baseSecCd', subBuilder: NullableString.create)
    ..aOM<NullableString>(53, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'issuer', subBuilder: NullableString.create)
    ..a<$core.double>(54, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'basePrice', $pb.PbFieldType.OD, protoName: 'basePrice')
    ..a<$core.double>(55, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'execPrice', $pb.PbFieldType.OD, protoName: 'execPrice')
    ..a<$core.double>(56, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'basePriceCp', $pb.PbFieldType.OD, protoName: 'basePriceCp')
    ..a<$core.double>(57, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bfPrice', $pb.PbFieldType.OD, protoName: 'bfPrice')
    ..a<$core.double>(58, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bbPrice', $pb.PbFieldType.OD, protoName: 'bbPrice')
    ..a<$core.double>(59, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bcPrice', $pb.PbFieldType.OD, protoName: 'bcPrice')
    ..a<$core.int>(60, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastTradeDate', $pb.PbFieldType.O3, protoName: 'lastTradeDate')
    ..a<$core.double>(61, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'turnoverRate', $pb.PbFieldType.OD, protoName: 'turnoverRate')
    ..a<$core.double>(62, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'range', $pb.PbFieldType.OD)
    ..e<STOCK_COLOR_CODE>(63, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'baseSecPriceColor', $pb.PbFieldType.OE, protoName: 'baseSecPriceColor', defaultOrMaker: STOCK_COLOR_CODE.BASIC_PRICE, valueOf: STOCK_COLOR_CODE.valueOf, enumValues: STOCK_COLOR_CODE.values)
    ..a<$core.int>(64, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasRightExec', $pb.PbFieldType.O3, protoName: 'hasRightExec')
    ..aOM<NullableString>(65, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'execRatio', protoName: 'execRatio', subBuilder: NullableString.create)
    ..a<$core.double>(66, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roe', $pb.PbFieldType.OD)
    ..a<$core.double>(67, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roa', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  SymbolTotalInfo_SecDetailInfo._() : super();
  factory SymbolTotalInfo_SecDetailInfo({
    $core.String? marketCd,
    $core.String? secCd,
    $core.String? secName,
    $core.int? secType,
    $core.double? basicPrice,
    $core.double? ceilingPrice,
    $core.double? floorPrice,
    $core.double? highestPrice,
    $core.double? lowestPrice,
    $core.double? avgPrice,
    $core.double? lastPrice,
    $core.double? lastQty,
    $core.double? totalQty,
    $core.double? totalAmt,
    $core.double? totalPtQty,
    $core.double? totalPtAmt,
    $core.double? sellForeignQty,
    $core.double? buyForeignQty,
    $core.double? changePoint,
    $core.double? changePercent,
    $core.double? totalRoom,
    $core.double? currentRoom,
    $core.double? w52High,
    $core.double? w52Low,
    $core.String? best1BidPriceStr,
    $core.double? best1BidPrice,
    $core.double? best1BidQty,
    $core.double? best2BidPrice,
    $core.double? best2BidQty,
    $core.double? best3BidPrice,
    $core.double? best3BidQty,
    $core.double? best4BidQty,
    $core.String? best1OfferPriceStr,
    $core.double? best1OfferPrice,
    $core.double? best1OfferQty,
    $core.double? best2OfferPrice,
    $core.double? best2OfferQty,
    $core.double? best3OfferPrice,
    $core.double? best3OfferQty,
    $core.double? best4OfferQty,
    $core.double? listedQty,
    $core.double? tradeQty,
    $core.double? tradePercent,
    $core.double? esp,
    $core.double? pe,
    $core.double? pb,
    $core.double? ps,
    $core.double? bookValue,
    $core.double? dividendAmt,
    $core.double? dividendRate,
    $core.String? secNameEn,
    NullableString? baseSecCd,
    NullableString? issuer,
    $core.double? basePrice,
    $core.double? execPrice,
    $core.double? basePriceCp,
    $core.double? bfPrice,
    $core.double? bbPrice,
    $core.double? bcPrice,
    $core.int? lastTradeDate,
    $core.double? turnoverRate,
    $core.double? range,
    STOCK_COLOR_CODE? baseSecPriceColor,
    $core.int? hasRightExec,
    NullableString? execRatio,
    $core.double? roe,
    $core.double? roa,
  }) {
    final _result = create();
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (secName != null) {
      _result.secName = secName;
    }
    if (secType != null) {
      _result.secType = secType;
    }
    if (basicPrice != null) {
      _result.basicPrice = basicPrice;
    }
    if (ceilingPrice != null) {
      _result.ceilingPrice = ceilingPrice;
    }
    if (floorPrice != null) {
      _result.floorPrice = floorPrice;
    }
    if (highestPrice != null) {
      _result.highestPrice = highestPrice;
    }
    if (lowestPrice != null) {
      _result.lowestPrice = lowestPrice;
    }
    if (avgPrice != null) {
      _result.avgPrice = avgPrice;
    }
    if (lastPrice != null) {
      _result.lastPrice = lastPrice;
    }
    if (lastQty != null) {
      _result.lastQty = lastQty;
    }
    if (totalQty != null) {
      _result.totalQty = totalQty;
    }
    if (totalAmt != null) {
      _result.totalAmt = totalAmt;
    }
    if (totalPtQty != null) {
      _result.totalPtQty = totalPtQty;
    }
    if (totalPtAmt != null) {
      _result.totalPtAmt = totalPtAmt;
    }
    if (sellForeignQty != null) {
      _result.sellForeignQty = sellForeignQty;
    }
    if (buyForeignQty != null) {
      _result.buyForeignQty = buyForeignQty;
    }
    if (changePoint != null) {
      _result.changePoint = changePoint;
    }
    if (changePercent != null) {
      _result.changePercent = changePercent;
    }
    if (totalRoom != null) {
      _result.totalRoom = totalRoom;
    }
    if (currentRoom != null) {
      _result.currentRoom = currentRoom;
    }
    if (w52High != null) {
      _result.w52High = w52High;
    }
    if (w52Low != null) {
      _result.w52Low = w52Low;
    }
    if (best1BidPriceStr != null) {
      _result.best1BidPriceStr = best1BidPriceStr;
    }
    if (best1BidPrice != null) {
      _result.best1BidPrice = best1BidPrice;
    }
    if (best1BidQty != null) {
      _result.best1BidQty = best1BidQty;
    }
    if (best2BidPrice != null) {
      _result.best2BidPrice = best2BidPrice;
    }
    if (best2BidQty != null) {
      _result.best2BidQty = best2BidQty;
    }
    if (best3BidPrice != null) {
      _result.best3BidPrice = best3BidPrice;
    }
    if (best3BidQty != null) {
      _result.best3BidQty = best3BidQty;
    }
    if (best4BidQty != null) {
      _result.best4BidQty = best4BidQty;
    }
    if (best1OfferPriceStr != null) {
      _result.best1OfferPriceStr = best1OfferPriceStr;
    }
    if (best1OfferPrice != null) {
      _result.best1OfferPrice = best1OfferPrice;
    }
    if (best1OfferQty != null) {
      _result.best1OfferQty = best1OfferQty;
    }
    if (best2OfferPrice != null) {
      _result.best2OfferPrice = best2OfferPrice;
    }
    if (best2OfferQty != null) {
      _result.best2OfferQty = best2OfferQty;
    }
    if (best3OfferPrice != null) {
      _result.best3OfferPrice = best3OfferPrice;
    }
    if (best3OfferQty != null) {
      _result.best3OfferQty = best3OfferQty;
    }
    if (best4OfferQty != null) {
      _result.best4OfferQty = best4OfferQty;
    }
    if (listedQty != null) {
      _result.listedQty = listedQty;
    }
    if (tradeQty != null) {
      _result.tradeQty = tradeQty;
    }
    if (tradePercent != null) {
      _result.tradePercent = tradePercent;
    }
    if (esp != null) {
      _result.esp = esp;
    }
    if (pe != null) {
      _result.pe = pe;
    }
    if (pb != null) {
      _result.pb = pb;
    }
    if (ps != null) {
      _result.ps = ps;
    }
    if (bookValue != null) {
      _result.bookValue = bookValue;
    }
    if (dividendAmt != null) {
      _result.dividendAmt = dividendAmt;
    }
    if (dividendRate != null) {
      _result.dividendRate = dividendRate;
    }
    if (secNameEn != null) {
      _result.secNameEn = secNameEn;
    }
    if (baseSecCd != null) {
      _result.baseSecCd = baseSecCd;
    }
    if (issuer != null) {
      _result.issuer = issuer;
    }
    if (basePrice != null) {
      _result.basePrice = basePrice;
    }
    if (execPrice != null) {
      _result.execPrice = execPrice;
    }
    if (basePriceCp != null) {
      _result.basePriceCp = basePriceCp;
    }
    if (bfPrice != null) {
      _result.bfPrice = bfPrice;
    }
    if (bbPrice != null) {
      _result.bbPrice = bbPrice;
    }
    if (bcPrice != null) {
      _result.bcPrice = bcPrice;
    }
    if (lastTradeDate != null) {
      _result.lastTradeDate = lastTradeDate;
    }
    if (turnoverRate != null) {
      _result.turnoverRate = turnoverRate;
    }
    if (range != null) {
      _result.range = range;
    }
    if (baseSecPriceColor != null) {
      _result.baseSecPriceColor = baseSecPriceColor;
    }
    if (hasRightExec != null) {
      _result.hasRightExec = hasRightExec;
    }
    if (execRatio != null) {
      _result.execRatio = execRatio;
    }
    if (roe != null) {
      _result.roe = roe;
    }
    if (roa != null) {
      _result.roa = roa;
    }
    return _result;
  }
  factory SymbolTotalInfo_SecDetailInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SymbolTotalInfo_SecDetailInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SymbolTotalInfo_SecDetailInfo clone() => SymbolTotalInfo_SecDetailInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SymbolTotalInfo_SecDetailInfo copyWith(void Function(SymbolTotalInfo_SecDetailInfo) updates) => super.copyWith((message) => updates(message as SymbolTotalInfo_SecDetailInfo)) as SymbolTotalInfo_SecDetailInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SymbolTotalInfo_SecDetailInfo create() => SymbolTotalInfo_SecDetailInfo._();
  SymbolTotalInfo_SecDetailInfo createEmptyInstance() => create();
  static $pb.PbList<SymbolTotalInfo_SecDetailInfo> createRepeated() => $pb.PbList<SymbolTotalInfo_SecDetailInfo>();
  @$core.pragma('dart2js:noInline')
  static SymbolTotalInfo_SecDetailInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SymbolTotalInfo_SecDetailInfo>(create);
  static SymbolTotalInfo_SecDetailInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get marketCd => $_getSZ(0);
  @$pb.TagNumber(1)
  set marketCd($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMarketCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearMarketCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get secCd => $_getSZ(1);
  @$pb.TagNumber(2)
  set secCd($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecCd() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get secName => $_getSZ(2);
  @$pb.TagNumber(3)
  set secName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSecName() => $_has(2);
  @$pb.TagNumber(3)
  void clearSecName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get secType => $_getIZ(3);
  @$pb.TagNumber(4)
  set secType($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSecType() => $_has(3);
  @$pb.TagNumber(4)
  void clearSecType() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get basicPrice => $_getN(4);
  @$pb.TagNumber(5)
  set basicPrice($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBasicPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearBasicPrice() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get ceilingPrice => $_getN(5);
  @$pb.TagNumber(6)
  set ceilingPrice($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCeilingPrice() => $_has(5);
  @$pb.TagNumber(6)
  void clearCeilingPrice() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get floorPrice => $_getN(6);
  @$pb.TagNumber(7)
  set floorPrice($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasFloorPrice() => $_has(6);
  @$pb.TagNumber(7)
  void clearFloorPrice() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get highestPrice => $_getN(7);
  @$pb.TagNumber(8)
  set highestPrice($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasHighestPrice() => $_has(7);
  @$pb.TagNumber(8)
  void clearHighestPrice() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get lowestPrice => $_getN(8);
  @$pb.TagNumber(9)
  set lowestPrice($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLowestPrice() => $_has(8);
  @$pb.TagNumber(9)
  void clearLowestPrice() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get avgPrice => $_getN(9);
  @$pb.TagNumber(10)
  set avgPrice($core.double v) { $_setDouble(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAvgPrice() => $_has(9);
  @$pb.TagNumber(10)
  void clearAvgPrice() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get lastPrice => $_getN(10);
  @$pb.TagNumber(11)
  set lastPrice($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasLastPrice() => $_has(10);
  @$pb.TagNumber(11)
  void clearLastPrice() => clearField(11);

  @$pb.TagNumber(12)
  $core.double get lastQty => $_getN(11);
  @$pb.TagNumber(12)
  set lastQty($core.double v) { $_setDouble(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasLastQty() => $_has(11);
  @$pb.TagNumber(12)
  void clearLastQty() => clearField(12);

  @$pb.TagNumber(13)
  $core.double get totalQty => $_getN(12);
  @$pb.TagNumber(13)
  set totalQty($core.double v) { $_setDouble(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasTotalQty() => $_has(12);
  @$pb.TagNumber(13)
  void clearTotalQty() => clearField(13);

  @$pb.TagNumber(14)
  $core.double get totalAmt => $_getN(13);
  @$pb.TagNumber(14)
  set totalAmt($core.double v) { $_setDouble(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasTotalAmt() => $_has(13);
  @$pb.TagNumber(14)
  void clearTotalAmt() => clearField(14);

  @$pb.TagNumber(15)
  $core.double get totalPtQty => $_getN(14);
  @$pb.TagNumber(15)
  set totalPtQty($core.double v) { $_setDouble(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasTotalPtQty() => $_has(14);
  @$pb.TagNumber(15)
  void clearTotalPtQty() => clearField(15);

  @$pb.TagNumber(16)
  $core.double get totalPtAmt => $_getN(15);
  @$pb.TagNumber(16)
  set totalPtAmt($core.double v) { $_setDouble(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasTotalPtAmt() => $_has(15);
  @$pb.TagNumber(16)
  void clearTotalPtAmt() => clearField(16);

  @$pb.TagNumber(17)
  $core.double get sellForeignQty => $_getN(16);
  @$pb.TagNumber(17)
  set sellForeignQty($core.double v) { $_setDouble(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasSellForeignQty() => $_has(16);
  @$pb.TagNumber(17)
  void clearSellForeignQty() => clearField(17);

  @$pb.TagNumber(18)
  $core.double get buyForeignQty => $_getN(17);
  @$pb.TagNumber(18)
  set buyForeignQty($core.double v) { $_setDouble(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasBuyForeignQty() => $_has(17);
  @$pb.TagNumber(18)
  void clearBuyForeignQty() => clearField(18);

  @$pb.TagNumber(19)
  $core.double get changePoint => $_getN(18);
  @$pb.TagNumber(19)
  set changePoint($core.double v) { $_setDouble(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasChangePoint() => $_has(18);
  @$pb.TagNumber(19)
  void clearChangePoint() => clearField(19);

  @$pb.TagNumber(20)
  $core.double get changePercent => $_getN(19);
  @$pb.TagNumber(20)
  set changePercent($core.double v) { $_setDouble(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasChangePercent() => $_has(19);
  @$pb.TagNumber(20)
  void clearChangePercent() => clearField(20);

  @$pb.TagNumber(21)
  $core.double get totalRoom => $_getN(20);
  @$pb.TagNumber(21)
  set totalRoom($core.double v) { $_setDouble(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasTotalRoom() => $_has(20);
  @$pb.TagNumber(21)
  void clearTotalRoom() => clearField(21);

  @$pb.TagNumber(22)
  $core.double get currentRoom => $_getN(21);
  @$pb.TagNumber(22)
  set currentRoom($core.double v) { $_setDouble(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasCurrentRoom() => $_has(21);
  @$pb.TagNumber(22)
  void clearCurrentRoom() => clearField(22);

  @$pb.TagNumber(23)
  $core.double get w52High => $_getN(22);
  @$pb.TagNumber(23)
  set w52High($core.double v) { $_setDouble(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasW52High() => $_has(22);
  @$pb.TagNumber(23)
  void clearW52High() => clearField(23);

  @$pb.TagNumber(24)
  $core.double get w52Low => $_getN(23);
  @$pb.TagNumber(24)
  set w52Low($core.double v) { $_setDouble(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasW52Low() => $_has(23);
  @$pb.TagNumber(24)
  void clearW52Low() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get best1BidPriceStr => $_getSZ(24);
  @$pb.TagNumber(25)
  set best1BidPriceStr($core.String v) { $_setString(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasBest1BidPriceStr() => $_has(24);
  @$pb.TagNumber(25)
  void clearBest1BidPriceStr() => clearField(25);

  @$pb.TagNumber(26)
  $core.double get best1BidPrice => $_getN(25);
  @$pb.TagNumber(26)
  set best1BidPrice($core.double v) { $_setDouble(25, v); }
  @$pb.TagNumber(26)
  $core.bool hasBest1BidPrice() => $_has(25);
  @$pb.TagNumber(26)
  void clearBest1BidPrice() => clearField(26);

  @$pb.TagNumber(27)
  $core.double get best1BidQty => $_getN(26);
  @$pb.TagNumber(27)
  set best1BidQty($core.double v) { $_setDouble(26, v); }
  @$pb.TagNumber(27)
  $core.bool hasBest1BidQty() => $_has(26);
  @$pb.TagNumber(27)
  void clearBest1BidQty() => clearField(27);

  @$pb.TagNumber(28)
  $core.double get best2BidPrice => $_getN(27);
  @$pb.TagNumber(28)
  set best2BidPrice($core.double v) { $_setDouble(27, v); }
  @$pb.TagNumber(28)
  $core.bool hasBest2BidPrice() => $_has(27);
  @$pb.TagNumber(28)
  void clearBest2BidPrice() => clearField(28);

  @$pb.TagNumber(29)
  $core.double get best2BidQty => $_getN(28);
  @$pb.TagNumber(29)
  set best2BidQty($core.double v) { $_setDouble(28, v); }
  @$pb.TagNumber(29)
  $core.bool hasBest2BidQty() => $_has(28);
  @$pb.TagNumber(29)
  void clearBest2BidQty() => clearField(29);

  @$pb.TagNumber(30)
  $core.double get best3BidPrice => $_getN(29);
  @$pb.TagNumber(30)
  set best3BidPrice($core.double v) { $_setDouble(29, v); }
  @$pb.TagNumber(30)
  $core.bool hasBest3BidPrice() => $_has(29);
  @$pb.TagNumber(30)
  void clearBest3BidPrice() => clearField(30);

  @$pb.TagNumber(31)
  $core.double get best3BidQty => $_getN(30);
  @$pb.TagNumber(31)
  set best3BidQty($core.double v) { $_setDouble(30, v); }
  @$pb.TagNumber(31)
  $core.bool hasBest3BidQty() => $_has(30);
  @$pb.TagNumber(31)
  void clearBest3BidQty() => clearField(31);

  @$pb.TagNumber(32)
  $core.double get best4BidQty => $_getN(31);
  @$pb.TagNumber(32)
  set best4BidQty($core.double v) { $_setDouble(31, v); }
  @$pb.TagNumber(32)
  $core.bool hasBest4BidQty() => $_has(31);
  @$pb.TagNumber(32)
  void clearBest4BidQty() => clearField(32);

  @$pb.TagNumber(33)
  $core.String get best1OfferPriceStr => $_getSZ(32);
  @$pb.TagNumber(33)
  set best1OfferPriceStr($core.String v) { $_setString(32, v); }
  @$pb.TagNumber(33)
  $core.bool hasBest1OfferPriceStr() => $_has(32);
  @$pb.TagNumber(33)
  void clearBest1OfferPriceStr() => clearField(33);

  @$pb.TagNumber(34)
  $core.double get best1OfferPrice => $_getN(33);
  @$pb.TagNumber(34)
  set best1OfferPrice($core.double v) { $_setDouble(33, v); }
  @$pb.TagNumber(34)
  $core.bool hasBest1OfferPrice() => $_has(33);
  @$pb.TagNumber(34)
  void clearBest1OfferPrice() => clearField(34);

  @$pb.TagNumber(35)
  $core.double get best1OfferQty => $_getN(34);
  @$pb.TagNumber(35)
  set best1OfferQty($core.double v) { $_setDouble(34, v); }
  @$pb.TagNumber(35)
  $core.bool hasBest1OfferQty() => $_has(34);
  @$pb.TagNumber(35)
  void clearBest1OfferQty() => clearField(35);

  @$pb.TagNumber(36)
  $core.double get best2OfferPrice => $_getN(35);
  @$pb.TagNumber(36)
  set best2OfferPrice($core.double v) { $_setDouble(35, v); }
  @$pb.TagNumber(36)
  $core.bool hasBest2OfferPrice() => $_has(35);
  @$pb.TagNumber(36)
  void clearBest2OfferPrice() => clearField(36);

  @$pb.TagNumber(37)
  $core.double get best2OfferQty => $_getN(36);
  @$pb.TagNumber(37)
  set best2OfferQty($core.double v) { $_setDouble(36, v); }
  @$pb.TagNumber(37)
  $core.bool hasBest2OfferQty() => $_has(36);
  @$pb.TagNumber(37)
  void clearBest2OfferQty() => clearField(37);

  @$pb.TagNumber(38)
  $core.double get best3OfferPrice => $_getN(37);
  @$pb.TagNumber(38)
  set best3OfferPrice($core.double v) { $_setDouble(37, v); }
  @$pb.TagNumber(38)
  $core.bool hasBest3OfferPrice() => $_has(37);
  @$pb.TagNumber(38)
  void clearBest3OfferPrice() => clearField(38);

  @$pb.TagNumber(39)
  $core.double get best3OfferQty => $_getN(38);
  @$pb.TagNumber(39)
  set best3OfferQty($core.double v) { $_setDouble(38, v); }
  @$pb.TagNumber(39)
  $core.bool hasBest3OfferQty() => $_has(38);
  @$pb.TagNumber(39)
  void clearBest3OfferQty() => clearField(39);

  @$pb.TagNumber(40)
  $core.double get best4OfferQty => $_getN(39);
  @$pb.TagNumber(40)
  set best4OfferQty($core.double v) { $_setDouble(39, v); }
  @$pb.TagNumber(40)
  $core.bool hasBest4OfferQty() => $_has(39);
  @$pb.TagNumber(40)
  void clearBest4OfferQty() => clearField(40);

  @$pb.TagNumber(41)
  $core.double get listedQty => $_getN(40);
  @$pb.TagNumber(41)
  set listedQty($core.double v) { $_setDouble(40, v); }
  @$pb.TagNumber(41)
  $core.bool hasListedQty() => $_has(40);
  @$pb.TagNumber(41)
  void clearListedQty() => clearField(41);

  @$pb.TagNumber(42)
  $core.double get tradeQty => $_getN(41);
  @$pb.TagNumber(42)
  set tradeQty($core.double v) { $_setDouble(41, v); }
  @$pb.TagNumber(42)
  $core.bool hasTradeQty() => $_has(41);
  @$pb.TagNumber(42)
  void clearTradeQty() => clearField(42);

  @$pb.TagNumber(43)
  $core.double get tradePercent => $_getN(42);
  @$pb.TagNumber(43)
  set tradePercent($core.double v) { $_setDouble(42, v); }
  @$pb.TagNumber(43)
  $core.bool hasTradePercent() => $_has(42);
  @$pb.TagNumber(43)
  void clearTradePercent() => clearField(43);

  @$pb.TagNumber(44)
  $core.double get esp => $_getN(43);
  @$pb.TagNumber(44)
  set esp($core.double v) { $_setDouble(43, v); }
  @$pb.TagNumber(44)
  $core.bool hasEsp() => $_has(43);
  @$pb.TagNumber(44)
  void clearEsp() => clearField(44);

  @$pb.TagNumber(45)
  $core.double get pe => $_getN(44);
  @$pb.TagNumber(45)
  set pe($core.double v) { $_setDouble(44, v); }
  @$pb.TagNumber(45)
  $core.bool hasPe() => $_has(44);
  @$pb.TagNumber(45)
  void clearPe() => clearField(45);

  @$pb.TagNumber(46)
  $core.double get pb => $_getN(45);
  @$pb.TagNumber(46)
  set pb($core.double v) { $_setDouble(45, v); }
  @$pb.TagNumber(46)
  $core.bool hasPb() => $_has(45);
  @$pb.TagNumber(46)
  void clearPb() => clearField(46);

  @$pb.TagNumber(47)
  $core.double get ps => $_getN(46);
  @$pb.TagNumber(47)
  set ps($core.double v) { $_setDouble(46, v); }
  @$pb.TagNumber(47)
  $core.bool hasPs() => $_has(46);
  @$pb.TagNumber(47)
  void clearPs() => clearField(47);

  @$pb.TagNumber(48)
  $core.double get bookValue => $_getN(47);
  @$pb.TagNumber(48)
  set bookValue($core.double v) { $_setDouble(47, v); }
  @$pb.TagNumber(48)
  $core.bool hasBookValue() => $_has(47);
  @$pb.TagNumber(48)
  void clearBookValue() => clearField(48);

  @$pb.TagNumber(49)
  $core.double get dividendAmt => $_getN(48);
  @$pb.TagNumber(49)
  set dividendAmt($core.double v) { $_setDouble(48, v); }
  @$pb.TagNumber(49)
  $core.bool hasDividendAmt() => $_has(48);
  @$pb.TagNumber(49)
  void clearDividendAmt() => clearField(49);

  @$pb.TagNumber(50)
  $core.double get dividendRate => $_getN(49);
  @$pb.TagNumber(50)
  set dividendRate($core.double v) { $_setDouble(49, v); }
  @$pb.TagNumber(50)
  $core.bool hasDividendRate() => $_has(49);
  @$pb.TagNumber(50)
  void clearDividendRate() => clearField(50);

  @$pb.TagNumber(51)
  $core.String get secNameEn => $_getSZ(50);
  @$pb.TagNumber(51)
  set secNameEn($core.String v) { $_setString(50, v); }
  @$pb.TagNumber(51)
  $core.bool hasSecNameEn() => $_has(50);
  @$pb.TagNumber(51)
  void clearSecNameEn() => clearField(51);

  @$pb.TagNumber(52)
  NullableString get baseSecCd => $_getN(51);
  @$pb.TagNumber(52)
  set baseSecCd(NullableString v) { setField(52, v); }
  @$pb.TagNumber(52)
  $core.bool hasBaseSecCd() => $_has(51);
  @$pb.TagNumber(52)
  void clearBaseSecCd() => clearField(52);
  @$pb.TagNumber(52)
  NullableString ensureBaseSecCd() => $_ensure(51);

  @$pb.TagNumber(53)
  NullableString get issuer => $_getN(52);
  @$pb.TagNumber(53)
  set issuer(NullableString v) { setField(53, v); }
  @$pb.TagNumber(53)
  $core.bool hasIssuer() => $_has(52);
  @$pb.TagNumber(53)
  void clearIssuer() => clearField(53);
  @$pb.TagNumber(53)
  NullableString ensureIssuer() => $_ensure(52);

  @$pb.TagNumber(54)
  $core.double get basePrice => $_getN(53);
  @$pb.TagNumber(54)
  set basePrice($core.double v) { $_setDouble(53, v); }
  @$pb.TagNumber(54)
  $core.bool hasBasePrice() => $_has(53);
  @$pb.TagNumber(54)
  void clearBasePrice() => clearField(54);

  @$pb.TagNumber(55)
  $core.double get execPrice => $_getN(54);
  @$pb.TagNumber(55)
  set execPrice($core.double v) { $_setDouble(54, v); }
  @$pb.TagNumber(55)
  $core.bool hasExecPrice() => $_has(54);
  @$pb.TagNumber(55)
  void clearExecPrice() => clearField(55);

  @$pb.TagNumber(56)
  $core.double get basePriceCp => $_getN(55);
  @$pb.TagNumber(56)
  set basePriceCp($core.double v) { $_setDouble(55, v); }
  @$pb.TagNumber(56)
  $core.bool hasBasePriceCp() => $_has(55);
  @$pb.TagNumber(56)
  void clearBasePriceCp() => clearField(56);

  @$pb.TagNumber(57)
  $core.double get bfPrice => $_getN(56);
  @$pb.TagNumber(57)
  set bfPrice($core.double v) { $_setDouble(56, v); }
  @$pb.TagNumber(57)
  $core.bool hasBfPrice() => $_has(56);
  @$pb.TagNumber(57)
  void clearBfPrice() => clearField(57);

  @$pb.TagNumber(58)
  $core.double get bbPrice => $_getN(57);
  @$pb.TagNumber(58)
  set bbPrice($core.double v) { $_setDouble(57, v); }
  @$pb.TagNumber(58)
  $core.bool hasBbPrice() => $_has(57);
  @$pb.TagNumber(58)
  void clearBbPrice() => clearField(58);

  @$pb.TagNumber(59)
  $core.double get bcPrice => $_getN(58);
  @$pb.TagNumber(59)
  set bcPrice($core.double v) { $_setDouble(58, v); }
  @$pb.TagNumber(59)
  $core.bool hasBcPrice() => $_has(58);
  @$pb.TagNumber(59)
  void clearBcPrice() => clearField(59);

  @$pb.TagNumber(60)
  $core.int get lastTradeDate => $_getIZ(59);
  @$pb.TagNumber(60)
  set lastTradeDate($core.int v) { $_setSignedInt32(59, v); }
  @$pb.TagNumber(60)
  $core.bool hasLastTradeDate() => $_has(59);
  @$pb.TagNumber(60)
  void clearLastTradeDate() => clearField(60);

  @$pb.TagNumber(61)
  $core.double get turnoverRate => $_getN(60);
  @$pb.TagNumber(61)
  set turnoverRate($core.double v) { $_setDouble(60, v); }
  @$pb.TagNumber(61)
  $core.bool hasTurnoverRate() => $_has(60);
  @$pb.TagNumber(61)
  void clearTurnoverRate() => clearField(61);

  @$pb.TagNumber(62)
  $core.double get range => $_getN(61);
  @$pb.TagNumber(62)
  set range($core.double v) { $_setDouble(61, v); }
  @$pb.TagNumber(62)
  $core.bool hasRange() => $_has(61);
  @$pb.TagNumber(62)
  void clearRange() => clearField(62);

  @$pb.TagNumber(63)
  STOCK_COLOR_CODE get baseSecPriceColor => $_getN(62);
  @$pb.TagNumber(63)
  set baseSecPriceColor(STOCK_COLOR_CODE v) { setField(63, v); }
  @$pb.TagNumber(63)
  $core.bool hasBaseSecPriceColor() => $_has(62);
  @$pb.TagNumber(63)
  void clearBaseSecPriceColor() => clearField(63);

  @$pb.TagNumber(64)
  $core.int get hasRightExec => $_getIZ(63);
  @$pb.TagNumber(64)
  set hasRightExec($core.int v) { $_setSignedInt32(63, v); }
  @$pb.TagNumber(64)
  $core.bool hasHasRightExec() => $_has(63);
  @$pb.TagNumber(64)
  void clearHasRightExec() => clearField(64);

  @$pb.TagNumber(65)
  NullableString get execRatio => $_getN(64);
  @$pb.TagNumber(65)
  set execRatio(NullableString v) { setField(65, v); }
  @$pb.TagNumber(65)
  $core.bool hasExecRatio() => $_has(64);
  @$pb.TagNumber(65)
  void clearExecRatio() => clearField(65);
  @$pb.TagNumber(65)
  NullableString ensureExecRatio() => $_ensure(64);

  @$pb.TagNumber(66)
  $core.double get roe => $_getN(65);
  @$pb.TagNumber(66)
  set roe($core.double v) { $_setDouble(65, v); }
  @$pb.TagNumber(66)
  $core.bool hasRoe() => $_has(65);
  @$pb.TagNumber(66)
  void clearRoe() => clearField(66);

  @$pb.TagNumber(67)
  $core.double get roa => $_getN(66);
  @$pb.TagNumber(67)
  set roa($core.double v) { $_setDouble(66, v); }
  @$pb.TagNumber(67)
  $core.bool hasRoa() => $_has(66);
  @$pb.TagNumber(67)
  void clearRoa() => clearField(67);
}

class SymbolTotalInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SymbolTotalInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOM<SymbolTotalInfo_SecDetailInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secDetailInfo', protoName: 'secDetailInfo', subBuilder: SymbolTotalInfo_SecDetailInfo.create)
    ..e<STOCK_COLOR_CODE>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'colorCode', $pb.PbFieldType.OE, protoName: 'colorCode', defaultOrMaker: STOCK_COLOR_CODE.BASIC_PRICE, valueOf: STOCK_COLOR_CODE.valueOf, enumValues: STOCK_COLOR_CODE.values)
    ..pc<PriceInfo>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'priceInfoList', $pb.PbFieldType.PM, protoName: 'priceInfoList', subBuilder: PriceInfo.create)
    ..hasRequiredFields = false
  ;

  SymbolTotalInfo._() : super();
  factory SymbolTotalInfo({
    SymbolTotalInfo_SecDetailInfo? secDetailInfo,
    STOCK_COLOR_CODE? colorCode,
    $core.Iterable<PriceInfo>? priceInfoList,
  }) {
    final _result = create();
    if (secDetailInfo != null) {
      _result.secDetailInfo = secDetailInfo;
    }
    if (colorCode != null) {
      _result.colorCode = colorCode;
    }
    if (priceInfoList != null) {
      _result.priceInfoList.addAll(priceInfoList);
    }
    return _result;
  }
  factory SymbolTotalInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SymbolTotalInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SymbolTotalInfo clone() => SymbolTotalInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SymbolTotalInfo copyWith(void Function(SymbolTotalInfo) updates) => super.copyWith((message) => updates(message as SymbolTotalInfo)) as SymbolTotalInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SymbolTotalInfo create() => SymbolTotalInfo._();
  SymbolTotalInfo createEmptyInstance() => create();
  static $pb.PbList<SymbolTotalInfo> createRepeated() => $pb.PbList<SymbolTotalInfo>();
  @$core.pragma('dart2js:noInline')
  static SymbolTotalInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SymbolTotalInfo>(create);
  static SymbolTotalInfo? _defaultInstance;

  @$pb.TagNumber(1)
  SymbolTotalInfo_SecDetailInfo get secDetailInfo => $_getN(0);
  @$pb.TagNumber(1)
  set secDetailInfo(SymbolTotalInfo_SecDetailInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSecDetailInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecDetailInfo() => clearField(1);
  @$pb.TagNumber(1)
  SymbolTotalInfo_SecDetailInfo ensureSecDetailInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  STOCK_COLOR_CODE get colorCode => $_getN(1);
  @$pb.TagNumber(2)
  set colorCode(STOCK_COLOR_CODE v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasColorCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearColorCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<PriceInfo> get priceInfoList => $_getList(2);
}

class PriceInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PriceInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price', $pb.PbFieldType.OD)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'qty', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  PriceInfo._() : super();
  factory PriceInfo({
    $fixnum.Int64? time,
    $core.double? price,
    $core.double? qty,
  }) {
    final _result = create();
    if (time != null) {
      _result.time = time;
    }
    if (price != null) {
      _result.price = price;
    }
    if (qty != null) {
      _result.qty = qty;
    }
    return _result;
  }
  factory PriceInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PriceInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PriceInfo clone() => PriceInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PriceInfo copyWith(void Function(PriceInfo) updates) => super.copyWith((message) => updates(message as PriceInfo)) as PriceInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PriceInfo create() => PriceInfo._();
  PriceInfo createEmptyInstance() => create();
  static $pb.PbList<PriceInfo> createRepeated() => $pb.PbList<PriceInfo>();
  @$core.pragma('dart2js:noInline')
  static PriceInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PriceInfo>(create);
  static PriceInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get time => $_getI64(0);
  @$pb.TagNumber(1)
  set time($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get price => $_getN(1);
  @$pb.TagNumber(2)
  set price($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get qty => $_getN(2);
  @$pb.TagNumber(3)
  set qty($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasQty() => $_has(2);
  @$pb.TagNumber(3)
  void clearQty() => clearField(3);
}

class MarketDepthInput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketDepthInput', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userID', protoName: 'userID')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexCd', $pb.PbFieldType.O3, protoName: 'indexCd')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..hasRequiredFields = false
  ;

  MarketDepthInput._() : super();
  factory MarketDepthInput({
    $core.String? userID,
    $core.int? indexCd,
    $core.String? authenCode,
  }) {
    final _result = create();
    if (userID != null) {
      _result.userID = userID;
    }
    if (indexCd != null) {
      _result.indexCd = indexCd;
    }
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    return _result;
  }
  factory MarketDepthInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketDepthInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketDepthInput clone() => MarketDepthInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketDepthInput copyWith(void Function(MarketDepthInput) updates) => super.copyWith((message) => updates(message as MarketDepthInput)) as MarketDepthInput; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketDepthInput create() => MarketDepthInput._();
  MarketDepthInput createEmptyInstance() => create();
  static $pb.PbList<MarketDepthInput> createRepeated() => $pb.PbList<MarketDepthInput>();
  @$core.pragma('dart2js:noInline')
  static MarketDepthInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketDepthInput>(create);
  static MarketDepthInput? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userID => $_getSZ(0);
  @$pb.TagNumber(1)
  set userID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get indexCd => $_getIZ(1);
  @$pb.TagNumber(2)
  set indexCd($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndexCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndexCd() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get authenCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set authenCode($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAuthenCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthenCode() => clearField(3);
}

class MarketMatchingInput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketMatchingInput', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userID', protoName: 'userID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tn', $pb.PbFieldType.O3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..hasRequiredFields = false
  ;

  MarketMatchingInput._() : super();
  factory MarketMatchingInput({
    $core.String? userID,
    $core.String? secCd,
    $core.int? tn,
    $core.String? authenCode,
  }) {
    final _result = create();
    if (userID != null) {
      _result.userID = userID;
    }
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (tn != null) {
      _result.tn = tn;
    }
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    return _result;
  }
  factory MarketMatchingInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketMatchingInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketMatchingInput clone() => MarketMatchingInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketMatchingInput copyWith(void Function(MarketMatchingInput) updates) => super.copyWith((message) => updates(message as MarketMatchingInput)) as MarketMatchingInput; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketMatchingInput create() => MarketMatchingInput._();
  MarketMatchingInput createEmptyInstance() => create();
  static $pb.PbList<MarketMatchingInput> createRepeated() => $pb.PbList<MarketMatchingInput>();
  @$core.pragma('dart2js:noInline')
  static MarketMatchingInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketMatchingInput>(create);
  static MarketMatchingInput? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userID => $_getSZ(0);
  @$pb.TagNumber(1)
  set userID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get secCd => $_getSZ(1);
  @$pb.TagNumber(2)
  set secCd($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecCd() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get tn => $_getIZ(2);
  @$pb.TagNumber(3)
  set tn($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTn() => $_has(2);
  @$pb.TagNumber(3)
  void clearTn() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get authenCode => $_getSZ(3);
  @$pb.TagNumber(4)
  set authenCode($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAuthenCode() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuthenCode() => clearField(4);
}

class TopSecUpDownInput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopSecUpDownInput', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userID', protoName: 'userID')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topType', $pb.PbFieldType.O3, protoName: 'topType')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', protoName: 'marketCd')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'industries')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'periodType', $pb.PbFieldType.O3, protoName: 'periodType')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderFieldType', $pb.PbFieldType.O3, protoName: 'orderFieldType')
    ..e<ORDER_TYPE>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderType', $pb.PbFieldType.OE, protoName: 'orderType', defaultOrMaker: ORDER_TYPE.ORDER_DEFAULT, valueOf: ORDER_TYPE.valueOf, enumValues: ORDER_TYPE.values)
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset', $pb.PbFieldType.O3)
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit', $pb.PbFieldType.O3)
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..hasRequiredFields = false
  ;

  TopSecUpDownInput._() : super();
  factory TopSecUpDownInput({
    $core.String? userID,
    $core.int? topType,
    $core.String? marketCd,
    $core.String? industries,
    $core.int? periodType,
    $core.int? orderFieldType,
    ORDER_TYPE? orderType,
    $core.int? offset,
    $core.int? limit,
    $core.String? authenCode,
  }) {
    final _result = create();
    if (userID != null) {
      _result.userID = userID;
    }
    if (topType != null) {
      _result.topType = topType;
    }
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    if (industries != null) {
      _result.industries = industries;
    }
    if (periodType != null) {
      _result.periodType = periodType;
    }
    if (orderFieldType != null) {
      _result.orderFieldType = orderFieldType;
    }
    if (orderType != null) {
      _result.orderType = orderType;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    return _result;
  }
  factory TopSecUpDownInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopSecUpDownInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopSecUpDownInput clone() => TopSecUpDownInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopSecUpDownInput copyWith(void Function(TopSecUpDownInput) updates) => super.copyWith((message) => updates(message as TopSecUpDownInput)) as TopSecUpDownInput; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopSecUpDownInput create() => TopSecUpDownInput._();
  TopSecUpDownInput createEmptyInstance() => create();
  static $pb.PbList<TopSecUpDownInput> createRepeated() => $pb.PbList<TopSecUpDownInput>();
  @$core.pragma('dart2js:noInline')
  static TopSecUpDownInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopSecUpDownInput>(create);
  static TopSecUpDownInput? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userID => $_getSZ(0);
  @$pb.TagNumber(1)
  set userID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get topType => $_getIZ(1);
  @$pb.TagNumber(2)
  set topType($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTopType() => $_has(1);
  @$pb.TagNumber(2)
  void clearTopType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get marketCd => $_getSZ(2);
  @$pb.TagNumber(3)
  set marketCd($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMarketCd() => $_has(2);
  @$pb.TagNumber(3)
  void clearMarketCd() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get industries => $_getSZ(3);
  @$pb.TagNumber(4)
  set industries($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIndustries() => $_has(3);
  @$pb.TagNumber(4)
  void clearIndustries() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get periodType => $_getIZ(4);
  @$pb.TagNumber(5)
  set periodType($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPeriodType() => $_has(4);
  @$pb.TagNumber(5)
  void clearPeriodType() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get orderFieldType => $_getIZ(5);
  @$pb.TagNumber(6)
  set orderFieldType($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOrderFieldType() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrderFieldType() => clearField(6);

  @$pb.TagNumber(7)
  ORDER_TYPE get orderType => $_getN(6);
  @$pb.TagNumber(7)
  set orderType(ORDER_TYPE v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasOrderType() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrderType() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get offset => $_getIZ(7);
  @$pb.TagNumber(8)
  set offset($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasOffset() => $_has(7);
  @$pb.TagNumber(8)
  void clearOffset() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get limit => $_getIZ(8);
  @$pb.TagNumber(9)
  set limit($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLimit() => $_has(8);
  @$pb.TagNumber(9)
  void clearLimit() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get authenCode => $_getSZ(9);
  @$pb.TagNumber(10)
  set authenCode($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAuthenCode() => $_has(9);
  @$pb.TagNumber(10)
  void clearAuthenCode() => clearField(10);
}

class TopSecUpDownResponse_TopSecUpDownInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopSecUpDownResponse.TopSecUpDownInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalAmt', $pb.PbFieldType.OD, protoName: 'totalAmt')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalQty', $pb.PbFieldType.OD, protoName: 'totalQty')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'closePrice', $pb.PbFieldType.OD, protoName: 'closePrice')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePoint', $pb.PbFieldType.OD, protoName: 'changePoint')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePercent', $pb.PbFieldType.OD, protoName: 'changePercent')
    ..e<STOCK_COLOR_CODE>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'colorCode', $pb.PbFieldType.OE, protoName: 'colorCode', defaultOrMaker: STOCK_COLOR_CODE.BASIC_PRICE, valueOf: STOCK_COLOR_CODE.valueOf, enumValues: STOCK_COLOR_CODE.values)
    ..hasRequiredFields = false
  ;

  TopSecUpDownResponse_TopSecUpDownInfo._() : super();
  factory TopSecUpDownResponse_TopSecUpDownInfo({
    $core.String? secCd,
    $core.double? totalAmt,
    $core.double? totalQty,
    $core.double? closePrice,
    $core.double? changePoint,
    $core.double? changePercent,
    STOCK_COLOR_CODE? colorCode,
  }) {
    final _result = create();
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (totalAmt != null) {
      _result.totalAmt = totalAmt;
    }
    if (totalQty != null) {
      _result.totalQty = totalQty;
    }
    if (closePrice != null) {
      _result.closePrice = closePrice;
    }
    if (changePoint != null) {
      _result.changePoint = changePoint;
    }
    if (changePercent != null) {
      _result.changePercent = changePercent;
    }
    if (colorCode != null) {
      _result.colorCode = colorCode;
    }
    return _result;
  }
  factory TopSecUpDownResponse_TopSecUpDownInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopSecUpDownResponse_TopSecUpDownInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopSecUpDownResponse_TopSecUpDownInfo clone() => TopSecUpDownResponse_TopSecUpDownInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopSecUpDownResponse_TopSecUpDownInfo copyWith(void Function(TopSecUpDownResponse_TopSecUpDownInfo) updates) => super.copyWith((message) => updates(message as TopSecUpDownResponse_TopSecUpDownInfo)) as TopSecUpDownResponse_TopSecUpDownInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopSecUpDownResponse_TopSecUpDownInfo create() => TopSecUpDownResponse_TopSecUpDownInfo._();
  TopSecUpDownResponse_TopSecUpDownInfo createEmptyInstance() => create();
  static $pb.PbList<TopSecUpDownResponse_TopSecUpDownInfo> createRepeated() => $pb.PbList<TopSecUpDownResponse_TopSecUpDownInfo>();
  @$core.pragma('dart2js:noInline')
  static TopSecUpDownResponse_TopSecUpDownInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopSecUpDownResponse_TopSecUpDownInfo>(create);
  static TopSecUpDownResponse_TopSecUpDownInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get secCd => $_getSZ(0);
  @$pb.TagNumber(1)
  set secCd($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSecCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get totalAmt => $_getN(1);
  @$pb.TagNumber(2)
  set totalAmt($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalAmt() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalAmt() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get totalQty => $_getN(2);
  @$pb.TagNumber(3)
  set totalQty($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTotalQty() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalQty() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get closePrice => $_getN(3);
  @$pb.TagNumber(4)
  set closePrice($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasClosePrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearClosePrice() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get changePoint => $_getN(4);
  @$pb.TagNumber(5)
  set changePoint($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChangePoint() => $_has(4);
  @$pb.TagNumber(5)
  void clearChangePoint() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get changePercent => $_getN(5);
  @$pb.TagNumber(6)
  set changePercent($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasChangePercent() => $_has(5);
  @$pb.TagNumber(6)
  void clearChangePercent() => clearField(6);

  @$pb.TagNumber(7)
  STOCK_COLOR_CODE get colorCode => $_getN(6);
  @$pb.TagNumber(7)
  set colorCode(STOCK_COLOR_CODE v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasColorCode() => $_has(6);
  @$pb.TagNumber(7)
  void clearColorCode() => clearField(7);
}

class TopSecUpDownResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopSecUpDownResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..pc<TopSecUpDownResponse_TopSecUpDownInfo>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topSecUpDown', $pb.PbFieldType.PM, protoName: 'topSecUpDown', subBuilder: TopSecUpDownResponse_TopSecUpDownInfo.create)
    ..hasRequiredFields = false
  ;

  TopSecUpDownResponse._() : super();
  factory TopSecUpDownResponse({
    $core.int? status,
    $core.String? error,
    $core.String? message,
    $core.Iterable<TopSecUpDownResponse_TopSecUpDownInfo>? topSecUpDown,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (topSecUpDown != null) {
      _result.topSecUpDown.addAll(topSecUpDown);
    }
    return _result;
  }
  factory TopSecUpDownResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopSecUpDownResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopSecUpDownResponse clone() => TopSecUpDownResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopSecUpDownResponse copyWith(void Function(TopSecUpDownResponse) updates) => super.copyWith((message) => updates(message as TopSecUpDownResponse)) as TopSecUpDownResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopSecUpDownResponse create() => TopSecUpDownResponse._();
  TopSecUpDownResponse createEmptyInstance() => create();
  static $pb.PbList<TopSecUpDownResponse> createRepeated() => $pb.PbList<TopSecUpDownResponse>();
  @$core.pragma('dart2js:noInline')
  static TopSecUpDownResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopSecUpDownResponse>(create);
  static TopSecUpDownResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<TopSecUpDownResponse_TopSecUpDownInfo> get topSecUpDown => $_getList(3);
}

class TradingSession extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TradingSession', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', protoName: 'marketCd')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tradingDate', $pb.PbFieldType.O3, protoName: 'tradingDate')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..hasRequiredFields = false
  ;

  TradingSession._() : super();
  factory TradingSession({
    $core.String? marketCd,
    $core.int? tradingDate,
    $core.String? status,
  }) {
    final _result = create();
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    if (tradingDate != null) {
      _result.tradingDate = tradingDate;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory TradingSession.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TradingSession.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TradingSession clone() => TradingSession()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TradingSession copyWith(void Function(TradingSession) updates) => super.copyWith((message) => updates(message as TradingSession)) as TradingSession; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TradingSession create() => TradingSession._();
  TradingSession createEmptyInstance() => create();
  static $pb.PbList<TradingSession> createRepeated() => $pb.PbList<TradingSession>();
  @$core.pragma('dart2js:noInline')
  static TradingSession getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TradingSession>(create);
  static TradingSession? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get marketCd => $_getSZ(0);
  @$pb.TagNumber(1)
  set marketCd($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMarketCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearMarketCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get tradingDate => $_getIZ(1);
  @$pb.TagNumber(2)
  set tradingDate($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTradingDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearTradingDate() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get status => $_getSZ(2);
  @$pb.TagNumber(3)
  set status($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);
}

class BasketInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BasketInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexCd', $pb.PbFieldType.O3, protoName: 'indexCd')
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secList', protoName: 'secList')
    ..hasRequiredFields = false
  ;

  BasketInfo._() : super();
  factory BasketInfo({
    $core.int? indexCd,
    $core.Iterable<$core.String>? secList,
  }) {
    final _result = create();
    if (indexCd != null) {
      _result.indexCd = indexCd;
    }
    if (secList != null) {
      _result.secList.addAll(secList);
    }
    return _result;
  }
  factory BasketInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BasketInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BasketInfo clone() => BasketInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BasketInfo copyWith(void Function(BasketInfo) updates) => super.copyWith((message) => updates(message as BasketInfo)) as BasketInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BasketInfo create() => BasketInfo._();
  BasketInfo createEmptyInstance() => create();
  static $pb.PbList<BasketInfo> createRepeated() => $pb.PbList<BasketInfo>();
  @$core.pragma('dart2js:noInline')
  static BasketInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BasketInfo>(create);
  static BasketInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get indexCd => $_getIZ(0);
  @$pb.TagNumber(1)
  set indexCd($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIndexCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndexCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get secList => $_getList(1);
}

class IndustryInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IndustryInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secList', protoName: 'secList')
    ..hasRequiredFields = false
  ;

  IndustryInfo._() : super();
  factory IndustryInfo({
    $core.int? id,
    $core.Iterable<$core.String>? secList,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (secList != null) {
      _result.secList.addAll(secList);
    }
    return _result;
  }
  factory IndustryInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IndustryInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IndustryInfo clone() => IndustryInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IndustryInfo copyWith(void Function(IndustryInfo) updates) => super.copyWith((message) => updates(message as IndustryInfo)) as IndustryInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IndustryInfo create() => IndustryInfo._();
  IndustryInfo createEmptyInstance() => create();
  static $pb.PbList<IndustryInfo> createRepeated() => $pb.PbList<IndustryInfo>();
  @$core.pragma('dart2js:noInline')
  static IndustryInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IndustryInfo>(create);
  static IndustryInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get secList => $_getList(1);
}

class MarketMatching extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketMatching', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tradeDate', $pb.PbFieldType.O3, protoName: 'tradeDate')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyRange1', $pb.PbFieldType.O3, protoName: 'buyRange1')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyPercent1', $pb.PbFieldType.OD, protoName: 'buyPercent1')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyRange2', $pb.PbFieldType.O3, protoName: 'buyRange2')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyPercent2', $pb.PbFieldType.OD, protoName: 'buyPercent2')
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyRange3', $pb.PbFieldType.O3, protoName: 'buyRange3')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyPercent3', $pb.PbFieldType.OD, protoName: 'buyPercent3')
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellRange1', $pb.PbFieldType.O3, protoName: 'sellRange1')
    ..a<$core.double>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellPercent1', $pb.PbFieldType.OD, protoName: 'sellPercent1')
    ..a<$core.int>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellRange2', $pb.PbFieldType.O3, protoName: 'sellRange2')
    ..a<$core.double>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellPercent2', $pb.PbFieldType.OD, protoName: 'sellPercent2')
    ..a<$core.int>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellRange3', $pb.PbFieldType.O3, protoName: 'sellRange3')
    ..a<$core.double>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellPercent3', $pb.PbFieldType.OD, protoName: 'sellPercent3')
    ..a<$core.double>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyAmt', $pb.PbFieldType.OD, protoName: 'buyAmt')
    ..a<$core.double>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellAmt', $pb.PbFieldType.OD, protoName: 'sellAmt')
    ..hasRequiredFields = false
  ;

  MarketMatching._() : super();
  factory MarketMatching({
    $core.int? tradeDate,
    $core.int? time,
    $core.String? secCd,
    $core.int? buyRange1,
    $core.double? buyPercent1,
    $core.int? buyRange2,
    $core.double? buyPercent2,
    $core.int? buyRange3,
    $core.double? buyPercent3,
    $core.int? sellRange1,
    $core.double? sellPercent1,
    $core.int? sellRange2,
    $core.double? sellPercent2,
    $core.int? sellRange3,
    $core.double? sellPercent3,
    $core.double? buyAmt,
    $core.double? sellAmt,
  }) {
    final _result = create();
    if (tradeDate != null) {
      _result.tradeDate = tradeDate;
    }
    if (time != null) {
      _result.time = time;
    }
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (buyRange1 != null) {
      _result.buyRange1 = buyRange1;
    }
    if (buyPercent1 != null) {
      _result.buyPercent1 = buyPercent1;
    }
    if (buyRange2 != null) {
      _result.buyRange2 = buyRange2;
    }
    if (buyPercent2 != null) {
      _result.buyPercent2 = buyPercent2;
    }
    if (buyRange3 != null) {
      _result.buyRange3 = buyRange3;
    }
    if (buyPercent3 != null) {
      _result.buyPercent3 = buyPercent3;
    }
    if (sellRange1 != null) {
      _result.sellRange1 = sellRange1;
    }
    if (sellPercent1 != null) {
      _result.sellPercent1 = sellPercent1;
    }
    if (sellRange2 != null) {
      _result.sellRange2 = sellRange2;
    }
    if (sellPercent2 != null) {
      _result.sellPercent2 = sellPercent2;
    }
    if (sellRange3 != null) {
      _result.sellRange3 = sellRange3;
    }
    if (sellPercent3 != null) {
      _result.sellPercent3 = sellPercent3;
    }
    if (buyAmt != null) {
      _result.buyAmt = buyAmt;
    }
    if (sellAmt != null) {
      _result.sellAmt = sellAmt;
    }
    return _result;
  }
  factory MarketMatching.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketMatching.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketMatching clone() => MarketMatching()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketMatching copyWith(void Function(MarketMatching) updates) => super.copyWith((message) => updates(message as MarketMatching)) as MarketMatching; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketMatching create() => MarketMatching._();
  MarketMatching createEmptyInstance() => create();
  static $pb.PbList<MarketMatching> createRepeated() => $pb.PbList<MarketMatching>();
  @$core.pragma('dart2js:noInline')
  static MarketMatching getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketMatching>(create);
  static MarketMatching? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tradeDate => $_getIZ(0);
  @$pb.TagNumber(1)
  set tradeDate($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTradeDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearTradeDate() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get time => $_getIZ(1);
  @$pb.TagNumber(2)
  set time($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get secCd => $_getSZ(2);
  @$pb.TagNumber(3)
  set secCd($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSecCd() => $_has(2);
  @$pb.TagNumber(3)
  void clearSecCd() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get buyRange1 => $_getIZ(3);
  @$pb.TagNumber(4)
  set buyRange1($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBuyRange1() => $_has(3);
  @$pb.TagNumber(4)
  void clearBuyRange1() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get buyPercent1 => $_getN(4);
  @$pb.TagNumber(5)
  set buyPercent1($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBuyPercent1() => $_has(4);
  @$pb.TagNumber(5)
  void clearBuyPercent1() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get buyRange2 => $_getIZ(5);
  @$pb.TagNumber(6)
  set buyRange2($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBuyRange2() => $_has(5);
  @$pb.TagNumber(6)
  void clearBuyRange2() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get buyPercent2 => $_getN(6);
  @$pb.TagNumber(7)
  set buyPercent2($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBuyPercent2() => $_has(6);
  @$pb.TagNumber(7)
  void clearBuyPercent2() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get buyRange3 => $_getIZ(7);
  @$pb.TagNumber(8)
  set buyRange3($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasBuyRange3() => $_has(7);
  @$pb.TagNumber(8)
  void clearBuyRange3() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get buyPercent3 => $_getN(8);
  @$pb.TagNumber(9)
  set buyPercent3($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasBuyPercent3() => $_has(8);
  @$pb.TagNumber(9)
  void clearBuyPercent3() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get sellRange1 => $_getIZ(9);
  @$pb.TagNumber(10)
  set sellRange1($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSellRange1() => $_has(9);
  @$pb.TagNumber(10)
  void clearSellRange1() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get sellPercent1 => $_getN(10);
  @$pb.TagNumber(11)
  set sellPercent1($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSellPercent1() => $_has(10);
  @$pb.TagNumber(11)
  void clearSellPercent1() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get sellRange2 => $_getIZ(11);
  @$pb.TagNumber(12)
  set sellRange2($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasSellRange2() => $_has(11);
  @$pb.TagNumber(12)
  void clearSellRange2() => clearField(12);

  @$pb.TagNumber(13)
  $core.double get sellPercent2 => $_getN(12);
  @$pb.TagNumber(13)
  set sellPercent2($core.double v) { $_setDouble(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasSellPercent2() => $_has(12);
  @$pb.TagNumber(13)
  void clearSellPercent2() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get sellRange3 => $_getIZ(13);
  @$pb.TagNumber(14)
  set sellRange3($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasSellRange3() => $_has(13);
  @$pb.TagNumber(14)
  void clearSellRange3() => clearField(14);

  @$pb.TagNumber(15)
  $core.double get sellPercent3 => $_getN(14);
  @$pb.TagNumber(15)
  set sellPercent3($core.double v) { $_setDouble(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasSellPercent3() => $_has(14);
  @$pb.TagNumber(15)
  void clearSellPercent3() => clearField(15);

  @$pb.TagNumber(16)
  $core.double get buyAmt => $_getN(15);
  @$pb.TagNumber(16)
  set buyAmt($core.double v) { $_setDouble(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasBuyAmt() => $_has(15);
  @$pb.TagNumber(16)
  void clearBuyAmt() => clearField(16);

  @$pb.TagNumber(17)
  $core.double get sellAmt => $_getN(16);
  @$pb.TagNumber(17)
  set sellAmt($core.double v) { $_setDouble(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasSellAmt() => $_has(16);
  @$pb.TagNumber(17)
  void clearSellAmt() => clearField(17);
}

class SecInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', protoName: 'marketCd')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ceilingPrice', $pb.PbFieldType.OD, protoName: 'ceilingPrice')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'basicPrice', $pb.PbFieldType.OD, protoName: 'basicPrice')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'floorPrice', $pb.PbFieldType.OD, protoName: 'floorPrice')
    ..hasRequiredFields = false
  ;

  SecInfo._() : super();
  factory SecInfo({
    $core.String? marketCd,
    $core.String? secCd,
    $core.double? ceilingPrice,
    $core.double? basicPrice,
    $core.double? floorPrice,
  }) {
    final _result = create();
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (ceilingPrice != null) {
      _result.ceilingPrice = ceilingPrice;
    }
    if (basicPrice != null) {
      _result.basicPrice = basicPrice;
    }
    if (floorPrice != null) {
      _result.floorPrice = floorPrice;
    }
    return _result;
  }
  factory SecInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SecInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SecInfo clone() => SecInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SecInfo copyWith(void Function(SecInfo) updates) => super.copyWith((message) => updates(message as SecInfo)) as SecInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SecInfo create() => SecInfo._();
  SecInfo createEmptyInstance() => create();
  static $pb.PbList<SecInfo> createRepeated() => $pb.PbList<SecInfo>();
  @$core.pragma('dart2js:noInline')
  static SecInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SecInfo>(create);
  static SecInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get marketCd => $_getSZ(0);
  @$pb.TagNumber(1)
  set marketCd($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMarketCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearMarketCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get secCd => $_getSZ(1);
  @$pb.TagNumber(2)
  set secCd($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecCd() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get ceilingPrice => $_getN(2);
  @$pb.TagNumber(3)
  set ceilingPrice($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCeilingPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearCeilingPrice() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get basicPrice => $_getN(3);
  @$pb.TagNumber(4)
  set basicPrice($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBasicPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearBasicPrice() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get floorPrice => $_getN(4);
  @$pb.TagNumber(5)
  set floorPrice($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFloorPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearFloorPrice() => clearField(5);
}

class MarketDepth extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketDepth', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tradeDate', $pb.PbFieldType.O3, protoName: 'tradeDate')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexCd', $pb.PbFieldType.O3, protoName: 'indexCd')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'down7', $pb.PbFieldType.O3)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'down57', $pb.PbFieldType.O3)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'down35', $pb.PbFieldType.O3)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'down13', $pb.PbFieldType.O3)
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'down01', $pb.PbFieldType.O3)
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'noChange', $pb.PbFieldType.O3, protoName: 'noChange')
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'up01', $pb.PbFieldType.O3)
    ..a<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'up13', $pb.PbFieldType.O3)
    ..a<$core.int>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'up35', $pb.PbFieldType.O3)
    ..a<$core.int>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'up57', $pb.PbFieldType.O3)
    ..a<$core.int>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'up7', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  MarketDepth._() : super();
  factory MarketDepth({
    $core.int? tradeDate,
    $fixnum.Int64? time,
    $core.int? indexCd,
    $core.int? down7,
    $core.int? down57,
    $core.int? down35,
    $core.int? down13,
    $core.int? down01,
    $core.int? noChange,
    $core.int? up01,
    $core.int? up13,
    $core.int? up35,
    $core.int? up57,
    $core.int? up7,
  }) {
    final _result = create();
    if (tradeDate != null) {
      _result.tradeDate = tradeDate;
    }
    if (time != null) {
      _result.time = time;
    }
    if (indexCd != null) {
      _result.indexCd = indexCd;
    }
    if (down7 != null) {
      _result.down7 = down7;
    }
    if (down57 != null) {
      _result.down57 = down57;
    }
    if (down35 != null) {
      _result.down35 = down35;
    }
    if (down13 != null) {
      _result.down13 = down13;
    }
    if (down01 != null) {
      _result.down01 = down01;
    }
    if (noChange != null) {
      _result.noChange = noChange;
    }
    if (up01 != null) {
      _result.up01 = up01;
    }
    if (up13 != null) {
      _result.up13 = up13;
    }
    if (up35 != null) {
      _result.up35 = up35;
    }
    if (up57 != null) {
      _result.up57 = up57;
    }
    if (up7 != null) {
      _result.up7 = up7;
    }
    return _result;
  }
  factory MarketDepth.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketDepth.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketDepth clone() => MarketDepth()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketDepth copyWith(void Function(MarketDepth) updates) => super.copyWith((message) => updates(message as MarketDepth)) as MarketDepth; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketDepth create() => MarketDepth._();
  MarketDepth createEmptyInstance() => create();
  static $pb.PbList<MarketDepth> createRepeated() => $pb.PbList<MarketDepth>();
  @$core.pragma('dart2js:noInline')
  static MarketDepth getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketDepth>(create);
  static MarketDepth? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tradeDate => $_getIZ(0);
  @$pb.TagNumber(1)
  set tradeDate($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTradeDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearTradeDate() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get time => $_getI64(1);
  @$pb.TagNumber(2)
  set time($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get indexCd => $_getIZ(2);
  @$pb.TagNumber(3)
  set indexCd($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIndexCd() => $_has(2);
  @$pb.TagNumber(3)
  void clearIndexCd() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get down7 => $_getIZ(3);
  @$pb.TagNumber(4)
  set down7($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDown7() => $_has(3);
  @$pb.TagNumber(4)
  void clearDown7() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get down57 => $_getIZ(4);
  @$pb.TagNumber(5)
  set down57($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDown57() => $_has(4);
  @$pb.TagNumber(5)
  void clearDown57() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get down35 => $_getIZ(5);
  @$pb.TagNumber(6)
  set down35($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDown35() => $_has(5);
  @$pb.TagNumber(6)
  void clearDown35() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get down13 => $_getIZ(6);
  @$pb.TagNumber(7)
  set down13($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDown13() => $_has(6);
  @$pb.TagNumber(7)
  void clearDown13() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get down01 => $_getIZ(7);
  @$pb.TagNumber(8)
  set down01($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDown01() => $_has(7);
  @$pb.TagNumber(8)
  void clearDown01() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get noChange => $_getIZ(8);
  @$pb.TagNumber(9)
  set noChange($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasNoChange() => $_has(8);
  @$pb.TagNumber(9)
  void clearNoChange() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get up01 => $_getIZ(9);
  @$pb.TagNumber(10)
  set up01($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasUp01() => $_has(9);
  @$pb.TagNumber(10)
  void clearUp01() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get up13 => $_getIZ(10);
  @$pb.TagNumber(11)
  set up13($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasUp13() => $_has(10);
  @$pb.TagNumber(11)
  void clearUp13() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get up35 => $_getIZ(11);
  @$pb.TagNumber(12)
  set up35($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasUp35() => $_has(11);
  @$pb.TagNumber(12)
  void clearUp35() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get up57 => $_getIZ(12);
  @$pb.TagNumber(13)
  set up57($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasUp57() => $_has(12);
  @$pb.TagNumber(13)
  void clearUp57() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get up7 => $_getIZ(13);
  @$pb.TagNumber(14)
  set up7($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasUp7() => $_has(13);
  @$pb.TagNumber(14)
  void clearUp7() => clearField(14);
}

class MarketDepthResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketDepthResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOM<MarketDepth>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketDepthInfo', protoName: 'marketDepthInfo', subBuilder: MarketDepth.create)
    ..hasRequiredFields = false
  ;

  MarketDepthResponse._() : super();
  factory MarketDepthResponse({
    $core.int? status,
    $core.String? error,
    $core.String? message,
    MarketDepth? marketDepthInfo,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (marketDepthInfo != null) {
      _result.marketDepthInfo = marketDepthInfo;
    }
    return _result;
  }
  factory MarketDepthResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketDepthResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketDepthResponse clone() => MarketDepthResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketDepthResponse copyWith(void Function(MarketDepthResponse) updates) => super.copyWith((message) => updates(message as MarketDepthResponse)) as MarketDepthResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketDepthResponse create() => MarketDepthResponse._();
  MarketDepthResponse createEmptyInstance() => create();
  static $pb.PbList<MarketDepthResponse> createRepeated() => $pb.PbList<MarketDepthResponse>();
  @$core.pragma('dart2js:noInline')
  static MarketDepthResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketDepthResponse>(create);
  static MarketDepthResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  MarketDepth get marketDepthInfo => $_getN(3);
  @$pb.TagNumber(4)
  set marketDepthInfo(MarketDepth v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMarketDepthInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearMarketDepthInfo() => clearField(4);
  @$pb.TagNumber(4)
  MarketDepth ensureMarketDepthInfo() => $_ensure(3);
}

class MarketMatchingResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketMatchingResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOM<MarketMatchingInfo>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketMatchingInfo', protoName: 'marketMatchingInfo', subBuilder: MarketMatchingInfo.create)
    ..hasRequiredFields = false
  ;

  MarketMatchingResponse._() : super();
  factory MarketMatchingResponse({
    $core.int? status,
    $core.String? error,
    $core.String? message,
    MarketMatchingInfo? marketMatchingInfo,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (marketMatchingInfo != null) {
      _result.marketMatchingInfo = marketMatchingInfo;
    }
    return _result;
  }
  factory MarketMatchingResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketMatchingResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketMatchingResponse clone() => MarketMatchingResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketMatchingResponse copyWith(void Function(MarketMatchingResponse) updates) => super.copyWith((message) => updates(message as MarketMatchingResponse)) as MarketMatchingResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketMatchingResponse create() => MarketMatchingResponse._();
  MarketMatchingResponse createEmptyInstance() => create();
  static $pb.PbList<MarketMatchingResponse> createRepeated() => $pb.PbList<MarketMatchingResponse>();
  @$core.pragma('dart2js:noInline')
  static MarketMatchingResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketMatchingResponse>(create);
  static MarketMatchingResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  MarketMatchingInfo get marketMatchingInfo => $_getN(3);
  @$pb.TagNumber(4)
  set marketMatchingInfo(MarketMatchingInfo v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMarketMatchingInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearMarketMatchingInfo() => clearField(4);
  @$pb.TagNumber(4)
  MarketMatchingInfo ensureMarketMatchingInfo() => $_ensure(3);
}

class MarketMatchingInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketMatchingInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tradeDate', $pb.PbFieldType.O3, protoName: 'tradeDate')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyQty', $pb.PbFieldType.OD, protoName: 'buyQty')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyAmt', $pb.PbFieldType.OD, protoName: 'buyAmt')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellQty', $pb.PbFieldType.OD, protoName: 'sellQty')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellAmt', $pb.PbFieldType.OD, protoName: 'sellAmt')
    ..hasRequiredFields = false
  ;

  MarketMatchingInfo._() : super();
  factory MarketMatchingInfo({
    $core.int? tradeDate,
    $core.int? time,
    $core.String? secCd,
    $core.double? buyQty,
    $core.double? buyAmt,
    $core.double? sellQty,
    $core.double? sellAmt,
  }) {
    final _result = create();
    if (tradeDate != null) {
      _result.tradeDate = tradeDate;
    }
    if (time != null) {
      _result.time = time;
    }
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (buyQty != null) {
      _result.buyQty = buyQty;
    }
    if (buyAmt != null) {
      _result.buyAmt = buyAmt;
    }
    if (sellQty != null) {
      _result.sellQty = sellQty;
    }
    if (sellAmt != null) {
      _result.sellAmt = sellAmt;
    }
    return _result;
  }
  factory MarketMatchingInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketMatchingInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketMatchingInfo clone() => MarketMatchingInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketMatchingInfo copyWith(void Function(MarketMatchingInfo) updates) => super.copyWith((message) => updates(message as MarketMatchingInfo)) as MarketMatchingInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketMatchingInfo create() => MarketMatchingInfo._();
  MarketMatchingInfo createEmptyInstance() => create();
  static $pb.PbList<MarketMatchingInfo> createRepeated() => $pb.PbList<MarketMatchingInfo>();
  @$core.pragma('dart2js:noInline')
  static MarketMatchingInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketMatchingInfo>(create);
  static MarketMatchingInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tradeDate => $_getIZ(0);
  @$pb.TagNumber(1)
  set tradeDate($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTradeDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearTradeDate() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get time => $_getIZ(1);
  @$pb.TagNumber(2)
  set time($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get secCd => $_getSZ(2);
  @$pb.TagNumber(3)
  set secCd($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSecCd() => $_has(2);
  @$pb.TagNumber(3)
  void clearSecCd() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get buyQty => $_getN(3);
  @$pb.TagNumber(4)
  set buyQty($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBuyQty() => $_has(3);
  @$pb.TagNumber(4)
  void clearBuyQty() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get buyAmt => $_getN(4);
  @$pb.TagNumber(5)
  set buyAmt($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBuyAmt() => $_has(4);
  @$pb.TagNumber(5)
  void clearBuyAmt() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get sellQty => $_getN(5);
  @$pb.TagNumber(6)
  set sellQty($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSellQty() => $_has(5);
  @$pb.TagNumber(6)
  void clearSellQty() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get sellAmt => $_getN(6);
  @$pb.TagNumber(7)
  set sellAmt($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSellAmt() => $_has(6);
  @$pb.TagNumber(7)
  void clearSellAmt() => clearField(7);
}

class NetFlowInput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NetFlowInput', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOM<NullableString>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId', protoName: 'userId', subBuilder: NullableString.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexCd', $pb.PbFieldType.O3, protoName: 'indexCd')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tn', $pb.PbFieldType.O3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..hasRequiredFields = false
  ;

  NetFlowInput._() : super();
  factory NetFlowInput({
    NullableString? userId,
    $core.int? indexCd,
    $core.int? tn,
    $core.String? authenCode,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (indexCd != null) {
      _result.indexCd = indexCd;
    }
    if (tn != null) {
      _result.tn = tn;
    }
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    return _result;
  }
  factory NetFlowInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NetFlowInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NetFlowInput clone() => NetFlowInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NetFlowInput copyWith(void Function(NetFlowInput) updates) => super.copyWith((message) => updates(message as NetFlowInput)) as NetFlowInput; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NetFlowInput create() => NetFlowInput._();
  NetFlowInput createEmptyInstance() => create();
  static $pb.PbList<NetFlowInput> createRepeated() => $pb.PbList<NetFlowInput>();
  @$core.pragma('dart2js:noInline')
  static NetFlowInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NetFlowInput>(create);
  static NetFlowInput? _defaultInstance;

  @$pb.TagNumber(1)
  NullableString get userId => $_getN(0);
  @$pb.TagNumber(1)
  set userId(NullableString v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
  @$pb.TagNumber(1)
  NullableString ensureUserId() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get indexCd => $_getIZ(1);
  @$pb.TagNumber(2)
  set indexCd($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndexCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndexCd() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get tn => $_getIZ(2);
  @$pb.TagNumber(3)
  set tn($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTn() => $_has(2);
  @$pb.TagNumber(3)
  void clearTn() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get authenCode => $_getSZ(3);
  @$pb.TagNumber(4)
  set authenCode($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAuthenCode() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuthenCode() => clearField(4);
}

class MarketNetFlowResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketNetFlowResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..pc<MarketNetFlow>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketNetFlowList', $pb.PbFieldType.PM, protoName: 'marketNetFlowList', subBuilder: MarketNetFlow.create)
    ..hasRequiredFields = false
  ;

  MarketNetFlowResponse._() : super();
  factory MarketNetFlowResponse({
    $core.int? status,
    $core.String? error,
    $core.String? message,
    $core.Iterable<MarketNetFlow>? marketNetFlowList,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (marketNetFlowList != null) {
      _result.marketNetFlowList.addAll(marketNetFlowList);
    }
    return _result;
  }
  factory MarketNetFlowResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketNetFlowResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketNetFlowResponse clone() => MarketNetFlowResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketNetFlowResponse copyWith(void Function(MarketNetFlowResponse) updates) => super.copyWith((message) => updates(message as MarketNetFlowResponse)) as MarketNetFlowResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketNetFlowResponse create() => MarketNetFlowResponse._();
  MarketNetFlowResponse createEmptyInstance() => create();
  static $pb.PbList<MarketNetFlowResponse> createRepeated() => $pb.PbList<MarketNetFlowResponse>();
  @$core.pragma('dart2js:noInline')
  static MarketNetFlowResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketNetFlowResponse>(create);
  static MarketNetFlowResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<MarketNetFlow> get marketNetFlowList => $_getList(3);
}

class MarketNetFlow extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketNetFlow', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tradingDate', $pb.PbFieldType.O3, protoName: 'tradingDate')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexCd', $pb.PbFieldType.O3, protoName: 'indexCd')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyQty', $pb.PbFieldType.OD, protoName: 'buyQty')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyAmt', $pb.PbFieldType.OD, protoName: 'buyAmt')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellQty', $pb.PbFieldType.OD, protoName: 'sellQty')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellAmt', $pb.PbFieldType.OD, protoName: 'sellAmt')
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'netAmt', $pb.PbFieldType.OD, protoName: 'netAmt')
    ..hasRequiredFields = false
  ;

  MarketNetFlow._() : super();
  factory MarketNetFlow({
    $core.int? tradingDate,
    $core.int? indexCd,
    $fixnum.Int64? time,
    $core.double? buyQty,
    $core.double? buyAmt,
    $core.double? sellQty,
    $core.double? sellAmt,
    $core.double? netAmt,
  }) {
    final _result = create();
    if (tradingDate != null) {
      _result.tradingDate = tradingDate;
    }
    if (indexCd != null) {
      _result.indexCd = indexCd;
    }
    if (time != null) {
      _result.time = time;
    }
    if (buyQty != null) {
      _result.buyQty = buyQty;
    }
    if (buyAmt != null) {
      _result.buyAmt = buyAmt;
    }
    if (sellQty != null) {
      _result.sellQty = sellQty;
    }
    if (sellAmt != null) {
      _result.sellAmt = sellAmt;
    }
    if (netAmt != null) {
      _result.netAmt = netAmt;
    }
    return _result;
  }
  factory MarketNetFlow.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketNetFlow.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketNetFlow clone() => MarketNetFlow()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketNetFlow copyWith(void Function(MarketNetFlow) updates) => super.copyWith((message) => updates(message as MarketNetFlow)) as MarketNetFlow; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketNetFlow create() => MarketNetFlow._();
  MarketNetFlow createEmptyInstance() => create();
  static $pb.PbList<MarketNetFlow> createRepeated() => $pb.PbList<MarketNetFlow>();
  @$core.pragma('dart2js:noInline')
  static MarketNetFlow getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketNetFlow>(create);
  static MarketNetFlow? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tradingDate => $_getIZ(0);
  @$pb.TagNumber(1)
  set tradingDate($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTradingDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearTradingDate() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get indexCd => $_getIZ(1);
  @$pb.TagNumber(2)
  set indexCd($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndexCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndexCd() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get time => $_getI64(2);
  @$pb.TagNumber(3)
  set time($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get buyQty => $_getN(3);
  @$pb.TagNumber(4)
  set buyQty($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBuyQty() => $_has(3);
  @$pb.TagNumber(4)
  void clearBuyQty() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get buyAmt => $_getN(4);
  @$pb.TagNumber(5)
  set buyAmt($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBuyAmt() => $_has(4);
  @$pb.TagNumber(5)
  void clearBuyAmt() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get sellQty => $_getN(5);
  @$pb.TagNumber(6)
  set sellQty($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSellQty() => $_has(5);
  @$pb.TagNumber(6)
  void clearSellQty() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get sellAmt => $_getN(6);
  @$pb.TagNumber(7)
  set sellAmt($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSellAmt() => $_has(6);
  @$pb.TagNumber(7)
  void clearSellAmt() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get netAmt => $_getN(7);
  @$pb.TagNumber(8)
  set netAmt($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasNetAmt() => $_has(7);
  @$pb.TagNumber(8)
  void clearNetAmt() => clearField(8);
}

class SecQuotesCapPro extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecQuotesCapPro', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', protoName: 'marketCd')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tradeDate', $pb.PbFieldType.O3, protoName: 'tradeDate')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'capTime', protoName: 'capTime')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'openPrice', $pb.PbFieldType.OD, protoName: 'openPrice')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'openQty', $pb.PbFieldType.OD, protoName: 'openQty')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'highestPrice', $pb.PbFieldType.OD, protoName: 'highestPrice')
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lowestPrice', $pb.PbFieldType.OD, protoName: 'lowestPrice')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'closePrice', $pb.PbFieldType.OD, protoName: 'closePrice')
    ..a<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'closeQty', $pb.PbFieldType.OD, protoName: 'closeQty')
    ..hasRequiredFields = false
  ;

  SecQuotesCapPro._() : super();
  factory SecQuotesCapPro({
    $core.String? marketCd,
    $core.int? tradeDate,
    $core.String? secCd,
    $fixnum.Int64? capTime,
    $core.double? openPrice,
    $core.double? openQty,
    $core.double? highestPrice,
    $core.double? lowestPrice,
    $core.double? closePrice,
    $core.double? closeQty,
  }) {
    final _result = create();
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    if (tradeDate != null) {
      _result.tradeDate = tradeDate;
    }
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (capTime != null) {
      _result.capTime = capTime;
    }
    if (openPrice != null) {
      _result.openPrice = openPrice;
    }
    if (openQty != null) {
      _result.openQty = openQty;
    }
    if (highestPrice != null) {
      _result.highestPrice = highestPrice;
    }
    if (lowestPrice != null) {
      _result.lowestPrice = lowestPrice;
    }
    if (closePrice != null) {
      _result.closePrice = closePrice;
    }
    if (closeQty != null) {
      _result.closeQty = closeQty;
    }
    return _result;
  }
  factory SecQuotesCapPro.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SecQuotesCapPro.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SecQuotesCapPro clone() => SecQuotesCapPro()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SecQuotesCapPro copyWith(void Function(SecQuotesCapPro) updates) => super.copyWith((message) => updates(message as SecQuotesCapPro)) as SecQuotesCapPro; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SecQuotesCapPro create() => SecQuotesCapPro._();
  SecQuotesCapPro createEmptyInstance() => create();
  static $pb.PbList<SecQuotesCapPro> createRepeated() => $pb.PbList<SecQuotesCapPro>();
  @$core.pragma('dart2js:noInline')
  static SecQuotesCapPro getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SecQuotesCapPro>(create);
  static SecQuotesCapPro? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get marketCd => $_getSZ(0);
  @$pb.TagNumber(1)
  set marketCd($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMarketCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearMarketCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get tradeDate => $_getIZ(1);
  @$pb.TagNumber(2)
  set tradeDate($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTradeDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearTradeDate() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get secCd => $_getSZ(2);
  @$pb.TagNumber(3)
  set secCd($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSecCd() => $_has(2);
  @$pb.TagNumber(3)
  void clearSecCd() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get capTime => $_getI64(3);
  @$pb.TagNumber(4)
  set capTime($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCapTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearCapTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get openPrice => $_getN(4);
  @$pb.TagNumber(5)
  set openPrice($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOpenPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearOpenPrice() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get openQty => $_getN(5);
  @$pb.TagNumber(6)
  set openQty($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOpenQty() => $_has(5);
  @$pb.TagNumber(6)
  void clearOpenQty() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get highestPrice => $_getN(6);
  @$pb.TagNumber(7)
  set highestPrice($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasHighestPrice() => $_has(6);
  @$pb.TagNumber(7)
  void clearHighestPrice() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get lowestPrice => $_getN(7);
  @$pb.TagNumber(8)
  set lowestPrice($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLowestPrice() => $_has(7);
  @$pb.TagNumber(8)
  void clearLowestPrice() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get closePrice => $_getN(8);
  @$pb.TagNumber(9)
  set closePrice($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasClosePrice() => $_has(8);
  @$pb.TagNumber(9)
  void clearClosePrice() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get closeQty => $_getN(9);
  @$pb.TagNumber(10)
  set closeQty($core.double v) { $_setDouble(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasCloseQty() => $_has(9);
  @$pb.TagNumber(10)
  void clearCloseQty() => clearField(10);
}

class IndexCapPro extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IndexCapPro', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexCd', protoName: 'indexCd')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'capTime', protoName: 'capTime')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'openIndex', $pb.PbFieldType.OD, protoName: 'openIndex')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'openQty', $pb.PbFieldType.OD, protoName: 'openQty')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'highestIndex', $pb.PbFieldType.OD, protoName: 'highestIndex')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lowestIndex', $pb.PbFieldType.OD, protoName: 'lowestIndex')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'closeIndex', $pb.PbFieldType.OD, protoName: 'closeIndex')
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'closeQty', $pb.PbFieldType.OD, protoName: 'closeQty')
    ..hasRequiredFields = false
  ;

  IndexCapPro._() : super();
  factory IndexCapPro({
    $core.String? indexCd,
    $fixnum.Int64? capTime,
    $core.double? openIndex,
    $core.double? openQty,
    $core.double? highestIndex,
    $core.double? lowestIndex,
    $core.double? closeIndex,
    $core.double? closeQty,
  }) {
    final _result = create();
    if (indexCd != null) {
      _result.indexCd = indexCd;
    }
    if (capTime != null) {
      _result.capTime = capTime;
    }
    if (openIndex != null) {
      _result.openIndex = openIndex;
    }
    if (openQty != null) {
      _result.openQty = openQty;
    }
    if (highestIndex != null) {
      _result.highestIndex = highestIndex;
    }
    if (lowestIndex != null) {
      _result.lowestIndex = lowestIndex;
    }
    if (closeIndex != null) {
      _result.closeIndex = closeIndex;
    }
    if (closeQty != null) {
      _result.closeQty = closeQty;
    }
    return _result;
  }
  factory IndexCapPro.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IndexCapPro.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IndexCapPro clone() => IndexCapPro()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IndexCapPro copyWith(void Function(IndexCapPro) updates) => super.copyWith((message) => updates(message as IndexCapPro)) as IndexCapPro; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IndexCapPro create() => IndexCapPro._();
  IndexCapPro createEmptyInstance() => create();
  static $pb.PbList<IndexCapPro> createRepeated() => $pb.PbList<IndexCapPro>();
  @$core.pragma('dart2js:noInline')
  static IndexCapPro getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IndexCapPro>(create);
  static IndexCapPro? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get indexCd => $_getSZ(0);
  @$pb.TagNumber(1)
  set indexCd($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIndexCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndexCd() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get capTime => $_getI64(1);
  @$pb.TagNumber(2)
  set capTime($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCapTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearCapTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get openIndex => $_getN(2);
  @$pb.TagNumber(3)
  set openIndex($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOpenIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearOpenIndex() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get openQty => $_getN(3);
  @$pb.TagNumber(4)
  set openQty($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOpenQty() => $_has(3);
  @$pb.TagNumber(4)
  void clearOpenQty() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get highestIndex => $_getN(4);
  @$pb.TagNumber(5)
  set highestIndex($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHighestIndex() => $_has(4);
  @$pb.TagNumber(5)
  void clearHighestIndex() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get lowestIndex => $_getN(5);
  @$pb.TagNumber(6)
  set lowestIndex($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLowestIndex() => $_has(5);
  @$pb.TagNumber(6)
  void clearLowestIndex() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get closeIndex => $_getN(6);
  @$pb.TagNumber(7)
  set closeIndex($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCloseIndex() => $_has(6);
  @$pb.TagNumber(7)
  void clearCloseIndex() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get closeQty => $_getN(7);
  @$pb.TagNumber(8)
  set closeQty($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCloseQty() => $_has(7);
  @$pb.TagNumber(8)
  void clearCloseQty() => clearField(8);
}

class SecTimeSaleCap extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecTimeSaleCap', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..pc<SecTimeSalePro>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secTimeSaleList', $pb.PbFieldType.PM, protoName: 'secTimeSaleList', subBuilder: SecTimeSalePro.create)
    ..hasRequiredFields = false
  ;

  SecTimeSaleCap._() : super();
  factory SecTimeSaleCap({
    $core.String? secCd,
    $core.Iterable<SecTimeSalePro>? secTimeSaleList,
  }) {
    final _result = create();
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (secTimeSaleList != null) {
      _result.secTimeSaleList.addAll(secTimeSaleList);
    }
    return _result;
  }
  factory SecTimeSaleCap.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SecTimeSaleCap.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SecTimeSaleCap clone() => SecTimeSaleCap()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SecTimeSaleCap copyWith(void Function(SecTimeSaleCap) updates) => super.copyWith((message) => updates(message as SecTimeSaleCap)) as SecTimeSaleCap; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SecTimeSaleCap create() => SecTimeSaleCap._();
  SecTimeSaleCap createEmptyInstance() => create();
  static $pb.PbList<SecTimeSaleCap> createRepeated() => $pb.PbList<SecTimeSaleCap>();
  @$core.pragma('dart2js:noInline')
  static SecTimeSaleCap getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SecTimeSaleCap>(create);
  static SecTimeSaleCap? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get secCd => $_getSZ(0);
  @$pb.TagNumber(1)
  set secCd($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSecCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<SecTimeSalePro> get secTimeSaleList => $_getList(1);
}

class SecTimeSalePro extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecTimeSalePro', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tradeDate', $pb.PbFieldType.O3, protoName: 'tradeDate')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'matPrice', $pb.PbFieldType.OD, protoName: 'matPrice')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyQty', $pb.PbFieldType.OD, protoName: 'buyQty')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyAmt', $pb.PbFieldType.OD, protoName: 'buyAmt')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyPercent', $pb.PbFieldType.OD, protoName: 'buyPercent')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellQty', $pb.PbFieldType.OD, protoName: 'sellQty')
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellAmt', $pb.PbFieldType.OD, protoName: 'sellAmt')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellPercent', $pb.PbFieldType.OD, protoName: 'sellPercent')
    ..a<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalQty', $pb.PbFieldType.OD, protoName: 'totalQty')
    ..a<$core.double>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalAmt', $pb.PbFieldType.OD, protoName: 'totalAmt')
    ..a<$core.double>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'percentByTotal', $pb.PbFieldType.OD, protoName: 'percentByTotal')
    ..e<STOCK_COLOR_CODE>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'colorCode', $pb.PbFieldType.OE, protoName: 'colorCode', defaultOrMaker: STOCK_COLOR_CODE.BASIC_PRICE, valueOf: STOCK_COLOR_CODE.valueOf, enumValues: STOCK_COLOR_CODE.values)
    ..hasRequiredFields = false
  ;

  SecTimeSalePro._() : super();
  factory SecTimeSalePro({
    $core.int? tradeDate,
    $core.String? secCd,
    $core.double? matPrice,
    $core.double? buyQty,
    $core.double? buyAmt,
    $core.double? buyPercent,
    $core.double? sellQty,
    $core.double? sellAmt,
    $core.double? sellPercent,
    $core.double? totalQty,
    $core.double? totalAmt,
    $core.double? percentByTotal,
    STOCK_COLOR_CODE? colorCode,
  }) {
    final _result = create();
    if (tradeDate != null) {
      _result.tradeDate = tradeDate;
    }
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (matPrice != null) {
      _result.matPrice = matPrice;
    }
    if (buyQty != null) {
      _result.buyQty = buyQty;
    }
    if (buyAmt != null) {
      _result.buyAmt = buyAmt;
    }
    if (buyPercent != null) {
      _result.buyPercent = buyPercent;
    }
    if (sellQty != null) {
      _result.sellQty = sellQty;
    }
    if (sellAmt != null) {
      _result.sellAmt = sellAmt;
    }
    if (sellPercent != null) {
      _result.sellPercent = sellPercent;
    }
    if (totalQty != null) {
      _result.totalQty = totalQty;
    }
    if (totalAmt != null) {
      _result.totalAmt = totalAmt;
    }
    if (percentByTotal != null) {
      _result.percentByTotal = percentByTotal;
    }
    if (colorCode != null) {
      _result.colorCode = colorCode;
    }
    return _result;
  }
  factory SecTimeSalePro.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SecTimeSalePro.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SecTimeSalePro clone() => SecTimeSalePro()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SecTimeSalePro copyWith(void Function(SecTimeSalePro) updates) => super.copyWith((message) => updates(message as SecTimeSalePro)) as SecTimeSalePro; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SecTimeSalePro create() => SecTimeSalePro._();
  SecTimeSalePro createEmptyInstance() => create();
  static $pb.PbList<SecTimeSalePro> createRepeated() => $pb.PbList<SecTimeSalePro>();
  @$core.pragma('dart2js:noInline')
  static SecTimeSalePro getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SecTimeSalePro>(create);
  static SecTimeSalePro? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tradeDate => $_getIZ(0);
  @$pb.TagNumber(1)
  set tradeDate($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTradeDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearTradeDate() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get secCd => $_getSZ(1);
  @$pb.TagNumber(2)
  set secCd($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecCd() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get matPrice => $_getN(2);
  @$pb.TagNumber(3)
  set matPrice($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMatPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearMatPrice() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get buyQty => $_getN(3);
  @$pb.TagNumber(4)
  set buyQty($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBuyQty() => $_has(3);
  @$pb.TagNumber(4)
  void clearBuyQty() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get buyAmt => $_getN(4);
  @$pb.TagNumber(5)
  set buyAmt($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBuyAmt() => $_has(4);
  @$pb.TagNumber(5)
  void clearBuyAmt() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get buyPercent => $_getN(5);
  @$pb.TagNumber(6)
  set buyPercent($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBuyPercent() => $_has(5);
  @$pb.TagNumber(6)
  void clearBuyPercent() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get sellQty => $_getN(6);
  @$pb.TagNumber(7)
  set sellQty($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSellQty() => $_has(6);
  @$pb.TagNumber(7)
  void clearSellQty() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get sellAmt => $_getN(7);
  @$pb.TagNumber(8)
  set sellAmt($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSellAmt() => $_has(7);
  @$pb.TagNumber(8)
  void clearSellAmt() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get sellPercent => $_getN(8);
  @$pb.TagNumber(9)
  set sellPercent($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSellPercent() => $_has(8);
  @$pb.TagNumber(9)
  void clearSellPercent() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get totalQty => $_getN(9);
  @$pb.TagNumber(10)
  set totalQty($core.double v) { $_setDouble(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasTotalQty() => $_has(9);
  @$pb.TagNumber(10)
  void clearTotalQty() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get totalAmt => $_getN(10);
  @$pb.TagNumber(11)
  set totalAmt($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasTotalAmt() => $_has(10);
  @$pb.TagNumber(11)
  void clearTotalAmt() => clearField(11);

  @$pb.TagNumber(12)
  $core.double get percentByTotal => $_getN(11);
  @$pb.TagNumber(12)
  set percentByTotal($core.double v) { $_setDouble(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasPercentByTotal() => $_has(11);
  @$pb.TagNumber(12)
  void clearPercentByTotal() => clearField(12);

  @$pb.TagNumber(13)
  STOCK_COLOR_CODE get colorCode => $_getN(12);
  @$pb.TagNumber(13)
  set colorCode(STOCK_COLOR_CODE v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasColorCode() => $_has(12);
  @$pb.TagNumber(13)
  void clearColorCode() => clearField(13);
}

class MarketShareInput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketShareInput', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOM<NullableString>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userID', protoName: 'userID', subBuilder: NullableString.create)
    ..aOM<NullableInt32>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', subBuilder: NullableInt32.create)
    ..aOM<NullableString>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'industryIdStr', protoName: 'industryIdStr', subBuilder: NullableString.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..hasRequiredFields = false
  ;

  MarketShareInput._() : super();
  factory MarketShareInput({
    NullableString? userID,
    NullableInt32? type,
    NullableString? industryIdStr,
    $core.String? authenCode,
  }) {
    final _result = create();
    if (userID != null) {
      _result.userID = userID;
    }
    if (type != null) {
      _result.type = type;
    }
    if (industryIdStr != null) {
      _result.industryIdStr = industryIdStr;
    }
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    return _result;
  }
  factory MarketShareInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketShareInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketShareInput clone() => MarketShareInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketShareInput copyWith(void Function(MarketShareInput) updates) => super.copyWith((message) => updates(message as MarketShareInput)) as MarketShareInput; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketShareInput create() => MarketShareInput._();
  MarketShareInput createEmptyInstance() => create();
  static $pb.PbList<MarketShareInput> createRepeated() => $pb.PbList<MarketShareInput>();
  @$core.pragma('dart2js:noInline')
  static MarketShareInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketShareInput>(create);
  static MarketShareInput? _defaultInstance;

  @$pb.TagNumber(1)
  NullableString get userID => $_getN(0);
  @$pb.TagNumber(1)
  set userID(NullableString v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);
  @$pb.TagNumber(1)
  NullableString ensureUserID() => $_ensure(0);

  @$pb.TagNumber(2)
  NullableInt32 get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(NullableInt32 v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);
  @$pb.TagNumber(2)
  NullableInt32 ensureType() => $_ensure(1);

  @$pb.TagNumber(3)
  NullableString get industryIdStr => $_getN(2);
  @$pb.TagNumber(3)
  set industryIdStr(NullableString v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasIndustryIdStr() => $_has(2);
  @$pb.TagNumber(3)
  void clearIndustryIdStr() => clearField(3);
  @$pb.TagNumber(3)
  NullableString ensureIndustryIdStr() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get authenCode => $_getSZ(3);
  @$pb.TagNumber(4)
  set authenCode($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAuthenCode() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuthenCode() => clearField(4);
}

class MarketShareResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketShareResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..pc<MarketSharePro>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketShareList', $pb.PbFieldType.PM, protoName: 'marketShareList', subBuilder: MarketSharePro.create)
    ..hasRequiredFields = false
  ;

  MarketShareResponse._() : super();
  factory MarketShareResponse({
    $core.Iterable<MarketSharePro>? marketShareList,
  }) {
    final _result = create();
    if (marketShareList != null) {
      _result.marketShareList.addAll(marketShareList);
    }
    return _result;
  }
  factory MarketShareResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketShareResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketShareResponse clone() => MarketShareResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketShareResponse copyWith(void Function(MarketShareResponse) updates) => super.copyWith((message) => updates(message as MarketShareResponse)) as MarketShareResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketShareResponse create() => MarketShareResponse._();
  MarketShareResponse createEmptyInstance() => create();
  static $pb.PbList<MarketShareResponse> createRepeated() => $pb.PbList<MarketShareResponse>();
  @$core.pragma('dart2js:noInline')
  static MarketShareResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketShareResponse>(create);
  static MarketShareResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MarketSharePro> get marketShareList => $_getList(0);
}

class MarketSharePro extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketSharePro', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secType', $pb.PbFieldType.O3, protoName: 'secType')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.O3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'period', $pb.PbFieldType.O3)
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyQty', $pb.PbFieldType.OD, protoName: 'buyQty')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyAmt', $pb.PbFieldType.OD, protoName: 'buyAmt')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellQty', $pb.PbFieldType.OD, protoName: 'sellQty')
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellAmt', $pb.PbFieldType.OD, protoName: 'sellAmt')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'netAmt', $pb.PbFieldType.OD, protoName: 'netAmt')
    ..a<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'openPrice', $pb.PbFieldType.OD, protoName: 'openPrice')
    ..a<$core.double>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'closePrice', $pb.PbFieldType.OD, protoName: 'closePrice')
    ..a<$core.double>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'highPrice', $pb.PbFieldType.OD, protoName: 'highPrice')
    ..a<$core.double>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lowPrice', $pb.PbFieldType.OD, protoName: 'lowPrice')
    ..a<$core.double>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePercent', $pb.PbFieldType.OD, protoName: 'changePercent')
    ..a<$core.double>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePoint', $pb.PbFieldType.OD, protoName: 'changePoint')
    ..a<$core.double>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyForeignQty', $pb.PbFieldType.OD, protoName: 'buyForeignQty')
    ..a<$core.double>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyForeignAmt', $pb.PbFieldType.OD, protoName: 'buyForeignAmt')
    ..a<$core.double>(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellForeignQty', $pb.PbFieldType.OD, protoName: 'sellForeignQty')
    ..a<$core.double>(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellForeignAmt', $pb.PbFieldType.OD, protoName: 'sellForeignAmt')
    ..a<$core.double>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalQty', $pb.PbFieldType.OD, protoName: 'totalQty')
    ..a<$core.double>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalAmt', $pb.PbFieldType.OD, protoName: 'totalAmt')
    ..hasRequiredFields = false
  ;

  MarketSharePro._() : super();
  factory MarketSharePro({
    $core.String? secCd,
    $core.int? secType,
    $core.int? type,
    $core.int? period,
    $core.double? buyQty,
    $core.double? buyAmt,
    $core.double? sellQty,
    $core.double? sellAmt,
    $core.double? netAmt,
    $core.double? openPrice,
    $core.double? closePrice,
    $core.double? highPrice,
    $core.double? lowPrice,
    $core.double? changePercent,
    $core.double? changePoint,
    $core.double? buyForeignQty,
    $core.double? buyForeignAmt,
    $core.double? sellForeignQty,
    $core.double? sellForeignAmt,
    $core.double? totalQty,
    $core.double? totalAmt,
  }) {
    final _result = create();
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (secType != null) {
      _result.secType = secType;
    }
    if (type != null) {
      _result.type = type;
    }
    if (period != null) {
      _result.period = period;
    }
    if (buyQty != null) {
      _result.buyQty = buyQty;
    }
    if (buyAmt != null) {
      _result.buyAmt = buyAmt;
    }
    if (sellQty != null) {
      _result.sellQty = sellQty;
    }
    if (sellAmt != null) {
      _result.sellAmt = sellAmt;
    }
    if (netAmt != null) {
      _result.netAmt = netAmt;
    }
    if (openPrice != null) {
      _result.openPrice = openPrice;
    }
    if (closePrice != null) {
      _result.closePrice = closePrice;
    }
    if (highPrice != null) {
      _result.highPrice = highPrice;
    }
    if (lowPrice != null) {
      _result.lowPrice = lowPrice;
    }
    if (changePercent != null) {
      _result.changePercent = changePercent;
    }
    if (changePoint != null) {
      _result.changePoint = changePoint;
    }
    if (buyForeignQty != null) {
      _result.buyForeignQty = buyForeignQty;
    }
    if (buyForeignAmt != null) {
      _result.buyForeignAmt = buyForeignAmt;
    }
    if (sellForeignQty != null) {
      _result.sellForeignQty = sellForeignQty;
    }
    if (sellForeignAmt != null) {
      _result.sellForeignAmt = sellForeignAmt;
    }
    if (totalQty != null) {
      _result.totalQty = totalQty;
    }
    if (totalAmt != null) {
      _result.totalAmt = totalAmt;
    }
    return _result;
  }
  factory MarketSharePro.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketSharePro.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketSharePro clone() => MarketSharePro()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketSharePro copyWith(void Function(MarketSharePro) updates) => super.copyWith((message) => updates(message as MarketSharePro)) as MarketSharePro; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketSharePro create() => MarketSharePro._();
  MarketSharePro createEmptyInstance() => create();
  static $pb.PbList<MarketSharePro> createRepeated() => $pb.PbList<MarketSharePro>();
  @$core.pragma('dart2js:noInline')
  static MarketSharePro getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketSharePro>(create);
  static MarketSharePro? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get secCd => $_getSZ(0);
  @$pb.TagNumber(1)
  set secCd($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSecCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get secType => $_getIZ(1);
  @$pb.TagNumber(2)
  set secType($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecType() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecType() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get type => $_getIZ(2);
  @$pb.TagNumber(3)
  set type($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get period => $_getIZ(3);
  @$pb.TagNumber(4)
  set period($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPeriod() => $_has(3);
  @$pb.TagNumber(4)
  void clearPeriod() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get buyQty => $_getN(4);
  @$pb.TagNumber(5)
  set buyQty($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBuyQty() => $_has(4);
  @$pb.TagNumber(5)
  void clearBuyQty() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get buyAmt => $_getN(5);
  @$pb.TagNumber(6)
  set buyAmt($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBuyAmt() => $_has(5);
  @$pb.TagNumber(6)
  void clearBuyAmt() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get sellQty => $_getN(6);
  @$pb.TagNumber(7)
  set sellQty($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSellQty() => $_has(6);
  @$pb.TagNumber(7)
  void clearSellQty() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get sellAmt => $_getN(7);
  @$pb.TagNumber(8)
  set sellAmt($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSellAmt() => $_has(7);
  @$pb.TagNumber(8)
  void clearSellAmt() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get netAmt => $_getN(8);
  @$pb.TagNumber(9)
  set netAmt($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasNetAmt() => $_has(8);
  @$pb.TagNumber(9)
  void clearNetAmt() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get openPrice => $_getN(9);
  @$pb.TagNumber(10)
  set openPrice($core.double v) { $_setDouble(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasOpenPrice() => $_has(9);
  @$pb.TagNumber(10)
  void clearOpenPrice() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get closePrice => $_getN(10);
  @$pb.TagNumber(11)
  set closePrice($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasClosePrice() => $_has(10);
  @$pb.TagNumber(11)
  void clearClosePrice() => clearField(11);

  @$pb.TagNumber(12)
  $core.double get highPrice => $_getN(11);
  @$pb.TagNumber(12)
  set highPrice($core.double v) { $_setDouble(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasHighPrice() => $_has(11);
  @$pb.TagNumber(12)
  void clearHighPrice() => clearField(12);

  @$pb.TagNumber(13)
  $core.double get lowPrice => $_getN(12);
  @$pb.TagNumber(13)
  set lowPrice($core.double v) { $_setDouble(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasLowPrice() => $_has(12);
  @$pb.TagNumber(13)
  void clearLowPrice() => clearField(13);

  @$pb.TagNumber(14)
  $core.double get changePercent => $_getN(13);
  @$pb.TagNumber(14)
  set changePercent($core.double v) { $_setDouble(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasChangePercent() => $_has(13);
  @$pb.TagNumber(14)
  void clearChangePercent() => clearField(14);

  @$pb.TagNumber(15)
  $core.double get changePoint => $_getN(14);
  @$pb.TagNumber(15)
  set changePoint($core.double v) { $_setDouble(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasChangePoint() => $_has(14);
  @$pb.TagNumber(15)
  void clearChangePoint() => clearField(15);

  @$pb.TagNumber(16)
  $core.double get buyForeignQty => $_getN(15);
  @$pb.TagNumber(16)
  set buyForeignQty($core.double v) { $_setDouble(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasBuyForeignQty() => $_has(15);
  @$pb.TagNumber(16)
  void clearBuyForeignQty() => clearField(16);

  @$pb.TagNumber(17)
  $core.double get buyForeignAmt => $_getN(16);
  @$pb.TagNumber(17)
  set buyForeignAmt($core.double v) { $_setDouble(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasBuyForeignAmt() => $_has(16);
  @$pb.TagNumber(17)
  void clearBuyForeignAmt() => clearField(17);

  @$pb.TagNumber(18)
  $core.double get sellForeignQty => $_getN(17);
  @$pb.TagNumber(18)
  set sellForeignQty($core.double v) { $_setDouble(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasSellForeignQty() => $_has(17);
  @$pb.TagNumber(18)
  void clearSellForeignQty() => clearField(18);

  @$pb.TagNumber(19)
  $core.double get sellForeignAmt => $_getN(18);
  @$pb.TagNumber(19)
  set sellForeignAmt($core.double v) { $_setDouble(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasSellForeignAmt() => $_has(18);
  @$pb.TagNumber(19)
  void clearSellForeignAmt() => clearField(19);

  @$pb.TagNumber(20)
  $core.double get totalQty => $_getN(19);
  @$pb.TagNumber(20)
  set totalQty($core.double v) { $_setDouble(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasTotalQty() => $_has(19);
  @$pb.TagNumber(20)
  void clearTotalQty() => clearField(20);

  @$pb.TagNumber(21)
  $core.double get totalAmt => $_getN(20);
  @$pb.TagNumber(21)
  set totalAmt($core.double v) { $_setDouble(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasTotalAmt() => $_has(20);
  @$pb.TagNumber(21)
  void clearTotalAmt() => clearField(21);
}

class MarketShareProCapture extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketShareProCapture', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tradeDate', $pb.PbFieldType.O3, protoName: 'tradeDate')
    ..pc<MarketSharePro>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketShareProList', $pb.PbFieldType.PM, protoName: 'marketShareProList', subBuilder: MarketSharePro.create)
    ..hasRequiredFields = false
  ;

  MarketShareProCapture._() : super();
  factory MarketShareProCapture({
    $core.int? tradeDate,
    $core.Iterable<MarketSharePro>? marketShareProList,
  }) {
    final _result = create();
    if (tradeDate != null) {
      _result.tradeDate = tradeDate;
    }
    if (marketShareProList != null) {
      _result.marketShareProList.addAll(marketShareProList);
    }
    return _result;
  }
  factory MarketShareProCapture.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketShareProCapture.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketShareProCapture clone() => MarketShareProCapture()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketShareProCapture copyWith(void Function(MarketShareProCapture) updates) => super.copyWith((message) => updates(message as MarketShareProCapture)) as MarketShareProCapture; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketShareProCapture create() => MarketShareProCapture._();
  MarketShareProCapture createEmptyInstance() => create();
  static $pb.PbList<MarketShareProCapture> createRepeated() => $pb.PbList<MarketShareProCapture>();
  @$core.pragma('dart2js:noInline')
  static MarketShareProCapture getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketShareProCapture>(create);
  static MarketShareProCapture? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tradeDate => $_getIZ(0);
  @$pb.TagNumber(1)
  set tradeDate($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTradeDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearTradeDate() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<MarketSharePro> get marketShareProList => $_getList(1);
}

class TimeSaleInput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TimeSaleInput', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOM<NullableString>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userID', protoName: 'userID', subBuilder: NullableString.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tn', $pb.PbFieldType.O3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..hasRequiredFields = false
  ;

  TimeSaleInput._() : super();
  factory TimeSaleInput({
    NullableString? userID,
    $core.String? secCd,
    $core.int? tn,
    $core.String? authenCode,
  }) {
    final _result = create();
    if (userID != null) {
      _result.userID = userID;
    }
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (tn != null) {
      _result.tn = tn;
    }
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    return _result;
  }
  factory TimeSaleInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TimeSaleInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TimeSaleInput clone() => TimeSaleInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TimeSaleInput copyWith(void Function(TimeSaleInput) updates) => super.copyWith((message) => updates(message as TimeSaleInput)) as TimeSaleInput; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TimeSaleInput create() => TimeSaleInput._();
  TimeSaleInput createEmptyInstance() => create();
  static $pb.PbList<TimeSaleInput> createRepeated() => $pb.PbList<TimeSaleInput>();
  @$core.pragma('dart2js:noInline')
  static TimeSaleInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimeSaleInput>(create);
  static TimeSaleInput? _defaultInstance;

  @$pb.TagNumber(1)
  NullableString get userID => $_getN(0);
  @$pb.TagNumber(1)
  set userID(NullableString v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);
  @$pb.TagNumber(1)
  NullableString ensureUserID() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get secCd => $_getSZ(1);
  @$pb.TagNumber(2)
  set secCd($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecCd() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get tn => $_getIZ(2);
  @$pb.TagNumber(3)
  set tn($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTn() => $_has(2);
  @$pb.TagNumber(3)
  void clearTn() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get authenCode => $_getSZ(3);
  @$pb.TagNumber(4)
  set authenCode($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAuthenCode() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuthenCode() => clearField(4);
}

class TimeSaleResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TimeSaleResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..pc<SecTimeSalePro>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secTimeSaleList', $pb.PbFieldType.PM, protoName: 'secTimeSaleList', subBuilder: SecTimeSalePro.create)
    ..hasRequiredFields = false
  ;

  TimeSaleResponse._() : super();
  factory TimeSaleResponse({
    $core.Iterable<SecTimeSalePro>? secTimeSaleList,
  }) {
    final _result = create();
    if (secTimeSaleList != null) {
      _result.secTimeSaleList.addAll(secTimeSaleList);
    }
    return _result;
  }
  factory TimeSaleResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TimeSaleResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TimeSaleResponse clone() => TimeSaleResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TimeSaleResponse copyWith(void Function(TimeSaleResponse) updates) => super.copyWith((message) => updates(message as TimeSaleResponse)) as TimeSaleResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TimeSaleResponse create() => TimeSaleResponse._();
  TimeSaleResponse createEmptyInstance() => create();
  static $pb.PbList<TimeSaleResponse> createRepeated() => $pb.PbList<TimeSaleResponse>();
  @$core.pragma('dart2js:noInline')
  static TimeSaleResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimeSaleResponse>(create);
  static TimeSaleResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SecTimeSalePro> get secTimeSaleList => $_getList(0);
}

class InternalMSInput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'InternalMSInput', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOM<NullableString>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userID', protoName: 'userID', subBuilder: NullableString.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'side', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexCdStr', protoName: 'indexCdStr')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'industryIDStr', protoName: 'industryIDStr')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.O3)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderFieldType', $pb.PbFieldType.O3, protoName: 'orderFieldType')
    ..e<ORDER_TYPE>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderType', $pb.PbFieldType.OE, protoName: 'orderType', defaultOrMaker: ORDER_TYPE.ORDER_DEFAULT, valueOf: ORDER_TYPE.valueOf, enumValues: ORDER_TYPE.values)
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset', $pb.PbFieldType.O3)
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit', $pb.PbFieldType.O3)
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..hasRequiredFields = false
  ;

  InternalMSInput._() : super();
  factory InternalMSInput({
    NullableString? userID,
    $core.int? side,
    $core.String? indexCdStr,
    $core.String? industryIDStr,
    $core.int? type,
    $core.int? orderFieldType,
    ORDER_TYPE? orderType,
    $core.int? offset,
    $core.int? limit,
    $core.String? authenCode,
  }) {
    final _result = create();
    if (userID != null) {
      _result.userID = userID;
    }
    if (side != null) {
      _result.side = side;
    }
    if (indexCdStr != null) {
      _result.indexCdStr = indexCdStr;
    }
    if (industryIDStr != null) {
      _result.industryIDStr = industryIDStr;
    }
    if (type != null) {
      _result.type = type;
    }
    if (orderFieldType != null) {
      _result.orderFieldType = orderFieldType;
    }
    if (orderType != null) {
      _result.orderType = orderType;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    return _result;
  }
  factory InternalMSInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InternalMSInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InternalMSInput clone() => InternalMSInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InternalMSInput copyWith(void Function(InternalMSInput) updates) => super.copyWith((message) => updates(message as InternalMSInput)) as InternalMSInput; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InternalMSInput create() => InternalMSInput._();
  InternalMSInput createEmptyInstance() => create();
  static $pb.PbList<InternalMSInput> createRepeated() => $pb.PbList<InternalMSInput>();
  @$core.pragma('dart2js:noInline')
  static InternalMSInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InternalMSInput>(create);
  static InternalMSInput? _defaultInstance;

  @$pb.TagNumber(1)
  NullableString get userID => $_getN(0);
  @$pb.TagNumber(1)
  set userID(NullableString v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);
  @$pb.TagNumber(1)
  NullableString ensureUserID() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get side => $_getIZ(1);
  @$pb.TagNumber(2)
  set side($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSide() => $_has(1);
  @$pb.TagNumber(2)
  void clearSide() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get indexCdStr => $_getSZ(2);
  @$pb.TagNumber(3)
  set indexCdStr($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIndexCdStr() => $_has(2);
  @$pb.TagNumber(3)
  void clearIndexCdStr() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get industryIDStr => $_getSZ(3);
  @$pb.TagNumber(4)
  set industryIDStr($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIndustryIDStr() => $_has(3);
  @$pb.TagNumber(4)
  void clearIndustryIDStr() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get type => $_getIZ(4);
  @$pb.TagNumber(5)
  set type($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get orderFieldType => $_getIZ(5);
  @$pb.TagNumber(6)
  set orderFieldType($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOrderFieldType() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrderFieldType() => clearField(6);

  @$pb.TagNumber(7)
  ORDER_TYPE get orderType => $_getN(6);
  @$pb.TagNumber(7)
  set orderType(ORDER_TYPE v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasOrderType() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrderType() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get offset => $_getIZ(7);
  @$pb.TagNumber(8)
  set offset($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasOffset() => $_has(7);
  @$pb.TagNumber(8)
  void clearOffset() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get limit => $_getIZ(8);
  @$pb.TagNumber(9)
  set limit($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLimit() => $_has(8);
  @$pb.TagNumber(9)
  void clearLimit() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get authenCode => $_getSZ(9);
  @$pb.TagNumber(10)
  set authenCode($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAuthenCode() => $_has(9);
  @$pb.TagNumber(10)
  void clearAuthenCode() => clearField(10);
}

class InternalMS extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'InternalMS', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePercent', $pb.PbFieldType.OD, protoName: 'changePercent')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePoint', $pb.PbFieldType.OD, protoName: 'changePoint')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'closePrice', $pb.PbFieldType.OD, protoName: 'closePrice')
    ..e<STOCK_COLOR_CODE>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'colorCode', $pb.PbFieldType.OE, protoName: 'colorCode', defaultOrMaker: STOCK_COLOR_CODE.BASIC_PRICE, valueOf: STOCK_COLOR_CODE.valueOf, enumValues: STOCK_COLOR_CODE.values)
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyForeignQty', $pb.PbFieldType.OD, protoName: 'buyForeignQty')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellForeignQty', $pb.PbFieldType.OD, protoName: 'sellForeignQty')
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'netForeignQty', $pb.PbFieldType.OD, protoName: 'netForeignQty')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyForeignAmt', $pb.PbFieldType.OD, protoName: 'buyForeignAmt')
    ..a<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellForeignAmt', $pb.PbFieldType.OD, protoName: 'sellForeignAmt')
    ..a<$core.double>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'netForeignAmt', $pb.PbFieldType.OD, protoName: 'netForeignAmt')
    ..hasRequiredFields = false
  ;

  InternalMS._() : super();
  factory InternalMS({
    $core.String? secCd,
    $core.double? changePercent,
    $core.double? changePoint,
    $core.double? closePrice,
    STOCK_COLOR_CODE? colorCode,
    $core.double? buyForeignQty,
    $core.double? sellForeignQty,
    $core.double? netForeignQty,
    $core.double? buyForeignAmt,
    $core.double? sellForeignAmt,
    $core.double? netForeignAmt,
  }) {
    final _result = create();
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (changePercent != null) {
      _result.changePercent = changePercent;
    }
    if (changePoint != null) {
      _result.changePoint = changePoint;
    }
    if (closePrice != null) {
      _result.closePrice = closePrice;
    }
    if (colorCode != null) {
      _result.colorCode = colorCode;
    }
    if (buyForeignQty != null) {
      _result.buyForeignQty = buyForeignQty;
    }
    if (sellForeignQty != null) {
      _result.sellForeignQty = sellForeignQty;
    }
    if (netForeignQty != null) {
      _result.netForeignQty = netForeignQty;
    }
    if (buyForeignAmt != null) {
      _result.buyForeignAmt = buyForeignAmt;
    }
    if (sellForeignAmt != null) {
      _result.sellForeignAmt = sellForeignAmt;
    }
    if (netForeignAmt != null) {
      _result.netForeignAmt = netForeignAmt;
    }
    return _result;
  }
  factory InternalMS.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InternalMS.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InternalMS clone() => InternalMS()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InternalMS copyWith(void Function(InternalMS) updates) => super.copyWith((message) => updates(message as InternalMS)) as InternalMS; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InternalMS create() => InternalMS._();
  InternalMS createEmptyInstance() => create();
  static $pb.PbList<InternalMS> createRepeated() => $pb.PbList<InternalMS>();
  @$core.pragma('dart2js:noInline')
  static InternalMS getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InternalMS>(create);
  static InternalMS? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get secCd => $_getSZ(0);
  @$pb.TagNumber(1)
  set secCd($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSecCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get changePercent => $_getN(1);
  @$pb.TagNumber(2)
  set changePercent($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChangePercent() => $_has(1);
  @$pb.TagNumber(2)
  void clearChangePercent() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get changePoint => $_getN(2);
  @$pb.TagNumber(3)
  set changePoint($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChangePoint() => $_has(2);
  @$pb.TagNumber(3)
  void clearChangePoint() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get closePrice => $_getN(3);
  @$pb.TagNumber(4)
  set closePrice($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasClosePrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearClosePrice() => clearField(4);

  @$pb.TagNumber(5)
  STOCK_COLOR_CODE get colorCode => $_getN(4);
  @$pb.TagNumber(5)
  set colorCode(STOCK_COLOR_CODE v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasColorCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearColorCode() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get buyForeignQty => $_getN(5);
  @$pb.TagNumber(6)
  set buyForeignQty($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBuyForeignQty() => $_has(5);
  @$pb.TagNumber(6)
  void clearBuyForeignQty() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get sellForeignQty => $_getN(6);
  @$pb.TagNumber(7)
  set sellForeignQty($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSellForeignQty() => $_has(6);
  @$pb.TagNumber(7)
  void clearSellForeignQty() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get netForeignQty => $_getN(7);
  @$pb.TagNumber(8)
  set netForeignQty($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasNetForeignQty() => $_has(7);
  @$pb.TagNumber(8)
  void clearNetForeignQty() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get buyForeignAmt => $_getN(8);
  @$pb.TagNumber(9)
  set buyForeignAmt($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasBuyForeignAmt() => $_has(8);
  @$pb.TagNumber(9)
  void clearBuyForeignAmt() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get sellForeignAmt => $_getN(9);
  @$pb.TagNumber(10)
  set sellForeignAmt($core.double v) { $_setDouble(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSellForeignAmt() => $_has(9);
  @$pb.TagNumber(10)
  void clearSellForeignAmt() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get netForeignAmt => $_getN(10);
  @$pb.TagNumber(11)
  set netForeignAmt($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasNetForeignAmt() => $_has(10);
  @$pb.TagNumber(11)
  void clearNetForeignAmt() => clearField(11);
}

class InternalMSResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'InternalMSResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..pc<InternalMS>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'internalMSList', $pb.PbFieldType.PM, protoName: 'internalMSList', subBuilder: InternalMS.create)
    ..hasRequiredFields = false
  ;

  InternalMSResponse._() : super();
  factory InternalMSResponse({
    $core.int? status,
    $core.String? error,
    $core.String? message,
    $core.Iterable<InternalMS>? internalMSList,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (internalMSList != null) {
      _result.internalMSList.addAll(internalMSList);
    }
    return _result;
  }
  factory InternalMSResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InternalMSResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InternalMSResponse clone() => InternalMSResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InternalMSResponse copyWith(void Function(InternalMSResponse) updates) => super.copyWith((message) => updates(message as InternalMSResponse)) as InternalMSResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InternalMSResponse create() => InternalMSResponse._();
  InternalMSResponse createEmptyInstance() => create();
  static $pb.PbList<InternalMSResponse> createRepeated() => $pb.PbList<InternalMSResponse>();
  @$core.pragma('dart2js:noInline')
  static InternalMSResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InternalMSResponse>(create);
  static InternalMSResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<InternalMS> get internalMSList => $_getList(3);
}

class TopSecChangedInput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopSecChangedInput', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userID', protoName: 'userID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', protoName: 'marketCd')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changedType', $pb.PbFieldType.O3, protoName: 'changedType')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'periodType', $pb.PbFieldType.O3, protoName: 'periodType')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderFieldType', $pb.PbFieldType.O3, protoName: 'orderFieldType')
    ..e<ORDER_TYPE>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderType', $pb.PbFieldType.OE, protoName: 'orderType', defaultOrMaker: ORDER_TYPE.ORDER_DEFAULT, valueOf: ORDER_TYPE.valueOf, enumValues: ORDER_TYPE.values)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset', $pb.PbFieldType.O3)
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit', $pb.PbFieldType.O3)
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..hasRequiredFields = false
  ;

  TopSecChangedInput._() : super();
  factory TopSecChangedInput({
    $core.String? userID,
    $core.String? marketCd,
    $core.int? changedType,
    $core.int? periodType,
    $core.int? orderFieldType,
    ORDER_TYPE? orderType,
    $core.int? offset,
    $core.int? limit,
    $core.String? authenCode,
  }) {
    final _result = create();
    if (userID != null) {
      _result.userID = userID;
    }
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    if (changedType != null) {
      _result.changedType = changedType;
    }
    if (periodType != null) {
      _result.periodType = periodType;
    }
    if (orderFieldType != null) {
      _result.orderFieldType = orderFieldType;
    }
    if (orderType != null) {
      _result.orderType = orderType;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    return _result;
  }
  factory TopSecChangedInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopSecChangedInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopSecChangedInput clone() => TopSecChangedInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopSecChangedInput copyWith(void Function(TopSecChangedInput) updates) => super.copyWith((message) => updates(message as TopSecChangedInput)) as TopSecChangedInput; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopSecChangedInput create() => TopSecChangedInput._();
  TopSecChangedInput createEmptyInstance() => create();
  static $pb.PbList<TopSecChangedInput> createRepeated() => $pb.PbList<TopSecChangedInput>();
  @$core.pragma('dart2js:noInline')
  static TopSecChangedInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopSecChangedInput>(create);
  static TopSecChangedInput? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userID => $_getSZ(0);
  @$pb.TagNumber(1)
  set userID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get marketCd => $_getSZ(1);
  @$pb.TagNumber(2)
  set marketCd($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMarketCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearMarketCd() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get changedType => $_getIZ(2);
  @$pb.TagNumber(3)
  set changedType($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChangedType() => $_has(2);
  @$pb.TagNumber(3)
  void clearChangedType() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get periodType => $_getIZ(3);
  @$pb.TagNumber(4)
  set periodType($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPeriodType() => $_has(3);
  @$pb.TagNumber(4)
  void clearPeriodType() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get orderFieldType => $_getIZ(4);
  @$pb.TagNumber(5)
  set orderFieldType($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOrderFieldType() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrderFieldType() => clearField(5);

  @$pb.TagNumber(6)
  ORDER_TYPE get orderType => $_getN(5);
  @$pb.TagNumber(6)
  set orderType(ORDER_TYPE v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasOrderType() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrderType() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get offset => $_getIZ(6);
  @$pb.TagNumber(7)
  set offset($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOffset() => $_has(6);
  @$pb.TagNumber(7)
  void clearOffset() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get limit => $_getIZ(7);
  @$pb.TagNumber(8)
  set limit($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLimit() => $_has(7);
  @$pb.TagNumber(8)
  void clearLimit() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get authenCode => $_getSZ(8);
  @$pb.TagNumber(9)
  set authenCode($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasAuthenCode() => $_has(8);
  @$pb.TagNumber(9)
  void clearAuthenCode() => clearField(9);
}

class TopSecChangedResponse_TopSecChangedInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopSecChangedResponse.TopSecChangedInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalAmt', $pb.PbFieldType.OD, protoName: 'totalAmt')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalQty', $pb.PbFieldType.OD, protoName: 'totalQty')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'closePrice', $pb.PbFieldType.OD, protoName: 'closePrice')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePoint', $pb.PbFieldType.OD, protoName: 'changePoint')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePercent', $pb.PbFieldType.OD, protoName: 'changePercent')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changeHighLow', $pb.PbFieldType.OD, protoName: 'changeHighLow')
    ..e<STOCK_COLOR_CODE>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'colorCode', $pb.PbFieldType.OE, protoName: 'colorCode', defaultOrMaker: STOCK_COLOR_CODE.BASIC_PRICE, valueOf: STOCK_COLOR_CODE.valueOf, enumValues: STOCK_COLOR_CODE.values)
    ..hasRequiredFields = false
  ;

  TopSecChangedResponse_TopSecChangedInfo._() : super();
  factory TopSecChangedResponse_TopSecChangedInfo({
    $core.String? secCd,
    $core.double? totalAmt,
    $core.double? totalQty,
    $core.double? closePrice,
    $core.double? changePoint,
    $core.double? changePercent,
    $core.double? changeHighLow,
    STOCK_COLOR_CODE? colorCode,
  }) {
    final _result = create();
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (totalAmt != null) {
      _result.totalAmt = totalAmt;
    }
    if (totalQty != null) {
      _result.totalQty = totalQty;
    }
    if (closePrice != null) {
      _result.closePrice = closePrice;
    }
    if (changePoint != null) {
      _result.changePoint = changePoint;
    }
    if (changePercent != null) {
      _result.changePercent = changePercent;
    }
    if (changeHighLow != null) {
      _result.changeHighLow = changeHighLow;
    }
    if (colorCode != null) {
      _result.colorCode = colorCode;
    }
    return _result;
  }
  factory TopSecChangedResponse_TopSecChangedInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopSecChangedResponse_TopSecChangedInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopSecChangedResponse_TopSecChangedInfo clone() => TopSecChangedResponse_TopSecChangedInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopSecChangedResponse_TopSecChangedInfo copyWith(void Function(TopSecChangedResponse_TopSecChangedInfo) updates) => super.copyWith((message) => updates(message as TopSecChangedResponse_TopSecChangedInfo)) as TopSecChangedResponse_TopSecChangedInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopSecChangedResponse_TopSecChangedInfo create() => TopSecChangedResponse_TopSecChangedInfo._();
  TopSecChangedResponse_TopSecChangedInfo createEmptyInstance() => create();
  static $pb.PbList<TopSecChangedResponse_TopSecChangedInfo> createRepeated() => $pb.PbList<TopSecChangedResponse_TopSecChangedInfo>();
  @$core.pragma('dart2js:noInline')
  static TopSecChangedResponse_TopSecChangedInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopSecChangedResponse_TopSecChangedInfo>(create);
  static TopSecChangedResponse_TopSecChangedInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get secCd => $_getSZ(0);
  @$pb.TagNumber(1)
  set secCd($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSecCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get totalAmt => $_getN(1);
  @$pb.TagNumber(2)
  set totalAmt($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalAmt() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalAmt() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get totalQty => $_getN(2);
  @$pb.TagNumber(3)
  set totalQty($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTotalQty() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalQty() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get closePrice => $_getN(3);
  @$pb.TagNumber(4)
  set closePrice($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasClosePrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearClosePrice() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get changePoint => $_getN(4);
  @$pb.TagNumber(5)
  set changePoint($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChangePoint() => $_has(4);
  @$pb.TagNumber(5)
  void clearChangePoint() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get changePercent => $_getN(5);
  @$pb.TagNumber(6)
  set changePercent($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasChangePercent() => $_has(5);
  @$pb.TagNumber(6)
  void clearChangePercent() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get changeHighLow => $_getN(6);
  @$pb.TagNumber(7)
  set changeHighLow($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasChangeHighLow() => $_has(6);
  @$pb.TagNumber(7)
  void clearChangeHighLow() => clearField(7);

  @$pb.TagNumber(8)
  STOCK_COLOR_CODE get colorCode => $_getN(7);
  @$pb.TagNumber(8)
  set colorCode(STOCK_COLOR_CODE v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasColorCode() => $_has(7);
  @$pb.TagNumber(8)
  void clearColorCode() => clearField(8);
}

class TopSecChangedResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopSecChangedResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..pc<TopSecChangedResponse_TopSecChangedInfo>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topSecChanged', $pb.PbFieldType.PM, protoName: 'topSecChanged', subBuilder: TopSecChangedResponse_TopSecChangedInfo.create)
    ..hasRequiredFields = false
  ;

  TopSecChangedResponse._() : super();
  factory TopSecChangedResponse({
    $core.int? status,
    $core.String? error,
    $core.String? message,
    $core.Iterable<TopSecChangedResponse_TopSecChangedInfo>? topSecChanged,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (topSecChanged != null) {
      _result.topSecChanged.addAll(topSecChanged);
    }
    return _result;
  }
  factory TopSecChangedResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopSecChangedResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopSecChangedResponse clone() => TopSecChangedResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopSecChangedResponse copyWith(void Function(TopSecChangedResponse) updates) => super.copyWith((message) => updates(message as TopSecChangedResponse)) as TopSecChangedResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopSecChangedResponse create() => TopSecChangedResponse._();
  TopSecChangedResponse createEmptyInstance() => create();
  static $pb.PbList<TopSecChangedResponse> createRepeated() => $pb.PbList<TopSecChangedResponse>();
  @$core.pragma('dart2js:noInline')
  static TopSecChangedResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopSecChangedResponse>(create);
  static TopSecChangedResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<TopSecChangedResponse_TopSecChangedInfo> get topSecChanged => $_getList(3);
}

class SecDividendInput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecDividendInput', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userID', protoName: 'userID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..hasRequiredFields = false
  ;

  SecDividendInput._() : super();
  factory SecDividendInput({
    $core.String? userID,
    $core.String? secCd,
    $core.String? authenCode,
  }) {
    final _result = create();
    if (userID != null) {
      _result.userID = userID;
    }
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    return _result;
  }
  factory SecDividendInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SecDividendInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SecDividendInput clone() => SecDividendInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SecDividendInput copyWith(void Function(SecDividendInput) updates) => super.copyWith((message) => updates(message as SecDividendInput)) as SecDividendInput; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SecDividendInput create() => SecDividendInput._();
  SecDividendInput createEmptyInstance() => create();
  static $pb.PbList<SecDividendInput> createRepeated() => $pb.PbList<SecDividendInput>();
  @$core.pragma('dart2js:noInline')
  static SecDividendInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SecDividendInput>(create);
  static SecDividendInput? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userID => $_getSZ(0);
  @$pb.TagNumber(1)
  set userID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get secCd => $_getSZ(1);
  @$pb.TagNumber(2)
  set secCd($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecCd() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get authenCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set authenCode($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAuthenCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthenCode() => clearField(3);
}

class SecDividendResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecDividendResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOM<SecDividendInfo>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secDividendInfo', protoName: 'secDividendInfo', subBuilder: SecDividendInfo.create)
    ..hasRequiredFields = false
  ;

  SecDividendResponse._() : super();
  factory SecDividendResponse({
    $core.int? status,
    $core.String? error,
    $core.String? message,
    SecDividendInfo? secDividendInfo,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (secDividendInfo != null) {
      _result.secDividendInfo = secDividendInfo;
    }
    return _result;
  }
  factory SecDividendResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SecDividendResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SecDividendResponse clone() => SecDividendResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SecDividendResponse copyWith(void Function(SecDividendResponse) updates) => super.copyWith((message) => updates(message as SecDividendResponse)) as SecDividendResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SecDividendResponse create() => SecDividendResponse._();
  SecDividendResponse createEmptyInstance() => create();
  static $pb.PbList<SecDividendResponse> createRepeated() => $pb.PbList<SecDividendResponse>();
  @$core.pragma('dart2js:noInline')
  static SecDividendResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SecDividendResponse>(create);
  static SecDividendResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  SecDividendInfo get secDividendInfo => $_getN(3);
  @$pb.TagNumber(4)
  set secDividendInfo(SecDividendInfo v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSecDividendInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearSecDividendInfo() => clearField(4);
  @$pb.TagNumber(4)
  SecDividendInfo ensureSecDividendInfo() => $_ensure(3);
}

class MarketIndexInput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketIndexInput', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userID', protoName: 'userID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexCdList', protoName: 'indexCdList')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..hasRequiredFields = false
  ;

  MarketIndexInput._() : super();
  factory MarketIndexInput({
    $core.String? userID,
    $core.String? indexCdList,
    $core.String? authenCode,
  }) {
    final _result = create();
    if (userID != null) {
      _result.userID = userID;
    }
    if (indexCdList != null) {
      _result.indexCdList = indexCdList;
    }
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    return _result;
  }
  factory MarketIndexInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketIndexInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketIndexInput clone() => MarketIndexInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketIndexInput copyWith(void Function(MarketIndexInput) updates) => super.copyWith((message) => updates(message as MarketIndexInput)) as MarketIndexInput; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketIndexInput create() => MarketIndexInput._();
  MarketIndexInput createEmptyInstance() => create();
  static $pb.PbList<MarketIndexInput> createRepeated() => $pb.PbList<MarketIndexInput>();
  @$core.pragma('dart2js:noInline')
  static MarketIndexInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketIndexInput>(create);
  static MarketIndexInput? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userID => $_getSZ(0);
  @$pb.TagNumber(1)
  set userID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get indexCdList => $_getSZ(1);
  @$pb.TagNumber(2)
  set indexCdList($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndexCdList() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndexCdList() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get authenCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set authenCode($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAuthenCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthenCode() => clearField(3);
}

class MarketIndexInfo_IndexTime extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketIndexInfo.IndexTime', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'val', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  MarketIndexInfo_IndexTime._() : super();
  factory MarketIndexInfo_IndexTime({
    $fixnum.Int64? time,
    $core.double? val,
  }) {
    final _result = create();
    if (time != null) {
      _result.time = time;
    }
    if (val != null) {
      _result.val = val;
    }
    return _result;
  }
  factory MarketIndexInfo_IndexTime.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketIndexInfo_IndexTime.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketIndexInfo_IndexTime clone() => MarketIndexInfo_IndexTime()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketIndexInfo_IndexTime copyWith(void Function(MarketIndexInfo_IndexTime) updates) => super.copyWith((message) => updates(message as MarketIndexInfo_IndexTime)) as MarketIndexInfo_IndexTime; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketIndexInfo_IndexTime create() => MarketIndexInfo_IndexTime._();
  MarketIndexInfo_IndexTime createEmptyInstance() => create();
  static $pb.PbList<MarketIndexInfo_IndexTime> createRepeated() => $pb.PbList<MarketIndexInfo_IndexTime>();
  @$core.pragma('dart2js:noInline')
  static MarketIndexInfo_IndexTime getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketIndexInfo_IndexTime>(create);
  static MarketIndexInfo_IndexTime? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get time => $_getI64(0);
  @$pb.TagNumber(1)
  set time($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get val => $_getN(1);
  @$pb.TagNumber(2)
  set val($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVal() => $_has(1);
  @$pb.TagNumber(2)
  void clearVal() => clearField(2);
}

class MarketIndexInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketIndexInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexCd', $pb.PbFieldType.O3, protoName: 'indexCd')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'openIndex', $pb.PbFieldType.OD, protoName: 'openIndex')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketIndex', $pb.PbFieldType.OD, protoName: 'marketIndex')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changeIndex', $pb.PbFieldType.OD, protoName: 'changeIndex')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePercent', $pb.PbFieldType.OD, protoName: 'changePercent')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalQty', $pb.PbFieldType.OD, protoName: 'totalQty')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalAmt', $pb.PbFieldType.OD, protoName: 'totalAmt')
    ..e<INDEX_COLOR_CODE>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'colorCode', $pb.PbFieldType.OE, protoName: 'colorCode', defaultOrMaker: INDEX_COLOR_CODE.NONE, valueOf: INDEX_COLOR_CODE.valueOf, enumValues: INDEX_COLOR_CODE.values)
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'highestIndex', $pb.PbFieldType.OD, protoName: 'highestIndex')
    ..a<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lowestIndex', $pb.PbFieldType.OD, protoName: 'lowestIndex')
    ..a<$core.double>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalBuyForeignAmt', $pb.PbFieldType.OD, protoName: 'totalBuyForeignAmt')
    ..a<$core.double>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalSellForeignAmt', $pb.PbFieldType.OD, protoName: 'totalSellForeignAmt')
    ..a<$core.double>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'advances', $pb.PbFieldType.OD)
    ..a<$core.double>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'declenes', $pb.PbFieldType.OD)
    ..a<$core.double>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'noChange', $pb.PbFieldType.OD, protoName: 'noChange')
    ..pc<MarketIndexInfo_IndexTime>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexTime', $pb.PbFieldType.PM, protoName: 'indexTime', subBuilder: MarketIndexInfo_IndexTime.create)
    ..e<INDEX_STATE>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: INDEX_STATE.S, valueOf: INDEX_STATE.valueOf, enumValues: INDEX_STATE.values)
    ..hasRequiredFields = false
  ;

  MarketIndexInfo._() : super();
  factory MarketIndexInfo({
    $core.int? indexCd,
    $core.double? openIndex,
    $core.double? marketIndex,
    $core.double? changeIndex,
    $core.double? changePercent,
    $core.double? totalQty,
    $core.double? totalAmt,
    INDEX_COLOR_CODE? colorCode,
    $core.double? highestIndex,
    $core.double? lowestIndex,
    $core.double? totalBuyForeignAmt,
    $core.double? totalSellForeignAmt,
    $core.double? advances,
    $core.double? declenes,
    $core.double? noChange,
    $core.Iterable<MarketIndexInfo_IndexTime>? indexTime,
    INDEX_STATE? state,
  }) {
    final _result = create();
    if (indexCd != null) {
      _result.indexCd = indexCd;
    }
    if (openIndex != null) {
      _result.openIndex = openIndex;
    }
    if (marketIndex != null) {
      _result.marketIndex = marketIndex;
    }
    if (changeIndex != null) {
      _result.changeIndex = changeIndex;
    }
    if (changePercent != null) {
      _result.changePercent = changePercent;
    }
    if (totalQty != null) {
      _result.totalQty = totalQty;
    }
    if (totalAmt != null) {
      _result.totalAmt = totalAmt;
    }
    if (colorCode != null) {
      _result.colorCode = colorCode;
    }
    if (highestIndex != null) {
      _result.highestIndex = highestIndex;
    }
    if (lowestIndex != null) {
      _result.lowestIndex = lowestIndex;
    }
    if (totalBuyForeignAmt != null) {
      _result.totalBuyForeignAmt = totalBuyForeignAmt;
    }
    if (totalSellForeignAmt != null) {
      _result.totalSellForeignAmt = totalSellForeignAmt;
    }
    if (advances != null) {
      _result.advances = advances;
    }
    if (declenes != null) {
      _result.declenes = declenes;
    }
    if (noChange != null) {
      _result.noChange = noChange;
    }
    if (indexTime != null) {
      _result.indexTime.addAll(indexTime);
    }
    if (state != null) {
      _result.state = state;
    }
    return _result;
  }
  factory MarketIndexInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketIndexInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketIndexInfo clone() => MarketIndexInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketIndexInfo copyWith(void Function(MarketIndexInfo) updates) => super.copyWith((message) => updates(message as MarketIndexInfo)) as MarketIndexInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketIndexInfo create() => MarketIndexInfo._();
  MarketIndexInfo createEmptyInstance() => create();
  static $pb.PbList<MarketIndexInfo> createRepeated() => $pb.PbList<MarketIndexInfo>();
  @$core.pragma('dart2js:noInline')
  static MarketIndexInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketIndexInfo>(create);
  static MarketIndexInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get indexCd => $_getIZ(0);
  @$pb.TagNumber(1)
  set indexCd($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIndexCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndexCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get openIndex => $_getN(1);
  @$pb.TagNumber(2)
  set openIndex($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOpenIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearOpenIndex() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get marketIndex => $_getN(2);
  @$pb.TagNumber(3)
  set marketIndex($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMarketIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearMarketIndex() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get changeIndex => $_getN(3);
  @$pb.TagNumber(4)
  set changeIndex($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasChangeIndex() => $_has(3);
  @$pb.TagNumber(4)
  void clearChangeIndex() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get changePercent => $_getN(4);
  @$pb.TagNumber(5)
  set changePercent($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChangePercent() => $_has(4);
  @$pb.TagNumber(5)
  void clearChangePercent() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get totalQty => $_getN(5);
  @$pb.TagNumber(6)
  set totalQty($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTotalQty() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalQty() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get totalAmt => $_getN(6);
  @$pb.TagNumber(7)
  set totalAmt($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTotalAmt() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalAmt() => clearField(7);

  @$pb.TagNumber(8)
  INDEX_COLOR_CODE get colorCode => $_getN(7);
  @$pb.TagNumber(8)
  set colorCode(INDEX_COLOR_CODE v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasColorCode() => $_has(7);
  @$pb.TagNumber(8)
  void clearColorCode() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get highestIndex => $_getN(8);
  @$pb.TagNumber(9)
  set highestIndex($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasHighestIndex() => $_has(8);
  @$pb.TagNumber(9)
  void clearHighestIndex() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get lowestIndex => $_getN(9);
  @$pb.TagNumber(10)
  set lowestIndex($core.double v) { $_setDouble(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasLowestIndex() => $_has(9);
  @$pb.TagNumber(10)
  void clearLowestIndex() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get totalBuyForeignAmt => $_getN(10);
  @$pb.TagNumber(11)
  set totalBuyForeignAmt($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasTotalBuyForeignAmt() => $_has(10);
  @$pb.TagNumber(11)
  void clearTotalBuyForeignAmt() => clearField(11);

  @$pb.TagNumber(12)
  $core.double get totalSellForeignAmt => $_getN(11);
  @$pb.TagNumber(12)
  set totalSellForeignAmt($core.double v) { $_setDouble(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasTotalSellForeignAmt() => $_has(11);
  @$pb.TagNumber(12)
  void clearTotalSellForeignAmt() => clearField(12);

  @$pb.TagNumber(13)
  $core.double get advances => $_getN(12);
  @$pb.TagNumber(13)
  set advances($core.double v) { $_setDouble(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasAdvances() => $_has(12);
  @$pb.TagNumber(13)
  void clearAdvances() => clearField(13);

  @$pb.TagNumber(14)
  $core.double get declenes => $_getN(13);
  @$pb.TagNumber(14)
  set declenes($core.double v) { $_setDouble(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasDeclenes() => $_has(13);
  @$pb.TagNumber(14)
  void clearDeclenes() => clearField(14);

  @$pb.TagNumber(15)
  $core.double get noChange => $_getN(14);
  @$pb.TagNumber(15)
  set noChange($core.double v) { $_setDouble(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasNoChange() => $_has(14);
  @$pb.TagNumber(15)
  void clearNoChange() => clearField(15);

  @$pb.TagNumber(16)
  $core.List<MarketIndexInfo_IndexTime> get indexTime => $_getList(15);

  @$pb.TagNumber(17)
  INDEX_STATE get state => $_getN(16);
  @$pb.TagNumber(17)
  set state(INDEX_STATE v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasState() => $_has(16);
  @$pb.TagNumber(17)
  void clearState() => clearField(17);
}

class MarketWorldIndexInput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketWorldIndexInput', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userID', protoName: 'userID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..hasRequiredFields = false
  ;

  MarketWorldIndexInput._() : super();
  factory MarketWorldIndexInput({
    $core.String? userID,
    $core.String? authenCode,
  }) {
    final _result = create();
    if (userID != null) {
      _result.userID = userID;
    }
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    return _result;
  }
  factory MarketWorldIndexInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketWorldIndexInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketWorldIndexInput clone() => MarketWorldIndexInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketWorldIndexInput copyWith(void Function(MarketWorldIndexInput) updates) => super.copyWith((message) => updates(message as MarketWorldIndexInput)) as MarketWorldIndexInput; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketWorldIndexInput create() => MarketWorldIndexInput._();
  MarketWorldIndexInput createEmptyInstance() => create();
  static $pb.PbList<MarketWorldIndexInput> createRepeated() => $pb.PbList<MarketWorldIndexInput>();
  @$core.pragma('dart2js:noInline')
  static MarketWorldIndexInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketWorldIndexInput>(create);
  static MarketWorldIndexInput? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userID => $_getSZ(0);
  @$pb.TagNumber(1)
  set userID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get authenCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set authenCode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAuthenCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthenCode() => clearField(2);
}

class MarketWorldIndexInfo_IndexTime extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketWorldIndexInfo.IndexTime', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'val', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  MarketWorldIndexInfo_IndexTime._() : super();
  factory MarketWorldIndexInfo_IndexTime({
    $fixnum.Int64? time,
    $core.double? val,
  }) {
    final _result = create();
    if (time != null) {
      _result.time = time;
    }
    if (val != null) {
      _result.val = val;
    }
    return _result;
  }
  factory MarketWorldIndexInfo_IndexTime.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketWorldIndexInfo_IndexTime.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketWorldIndexInfo_IndexTime clone() => MarketWorldIndexInfo_IndexTime()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketWorldIndexInfo_IndexTime copyWith(void Function(MarketWorldIndexInfo_IndexTime) updates) => super.copyWith((message) => updates(message as MarketWorldIndexInfo_IndexTime)) as MarketWorldIndexInfo_IndexTime; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketWorldIndexInfo_IndexTime create() => MarketWorldIndexInfo_IndexTime._();
  MarketWorldIndexInfo_IndexTime createEmptyInstance() => create();
  static $pb.PbList<MarketWorldIndexInfo_IndexTime> createRepeated() => $pb.PbList<MarketWorldIndexInfo_IndexTime>();
  @$core.pragma('dart2js:noInline')
  static MarketWorldIndexInfo_IndexTime getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketWorldIndexInfo_IndexTime>(create);
  static MarketWorldIndexInfo_IndexTime? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get time => $_getI64(0);
  @$pb.TagNumber(1)
  set time($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get val => $_getN(1);
  @$pb.TagNumber(2)
  set val($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVal() => $_has(1);
  @$pb.TagNumber(2)
  void clearVal() => clearField(2);
}

class MarketWorldIndexInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketWorldIndexInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexCd', $pb.PbFieldType.O3, protoName: 'indexCd')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'symbol')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time', $pb.PbFieldType.OD)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'flag')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'open', $pb.PbFieldType.OD)
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'last', $pb.PbFieldType.OD)
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chgPct', $pb.PbFieldType.OD, protoName: 'chgPct')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chg', $pb.PbFieldType.OD)
    ..a<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'volume', $pb.PbFieldType.OD)
    ..e<INDEX_COLOR_CODE>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'colorCode', $pb.PbFieldType.OE, protoName: 'colorCode', defaultOrMaker: INDEX_COLOR_CODE.NONE, valueOf: INDEX_COLOR_CODE.valueOf, enumValues: INDEX_COLOR_CODE.values)
    ..pc<MarketWorldIndexInfo_IndexTime>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexTime', $pb.PbFieldType.PM, protoName: 'indexTime', subBuilder: MarketWorldIndexInfo_IndexTime.create)
    ..hasRequiredFields = false
  ;

  MarketWorldIndexInfo._() : super();
  factory MarketWorldIndexInfo({
    $core.int? indexCd,
    $core.String? symbol,
    $core.double? time,
    $core.String? flag,
    $core.double? open,
    $core.double? last,
    $core.double? chgPct,
    $core.double? chg,
    $core.double? volume,
    INDEX_COLOR_CODE? colorCode,
    $core.Iterable<MarketWorldIndexInfo_IndexTime>? indexTime,
  }) {
    final _result = create();
    if (indexCd != null) {
      _result.indexCd = indexCd;
    }
    if (symbol != null) {
      _result.symbol = symbol;
    }
    if (time != null) {
      _result.time = time;
    }
    if (flag != null) {
      _result.flag = flag;
    }
    if (open != null) {
      _result.open = open;
    }
    if (last != null) {
      _result.last = last;
    }
    if (chgPct != null) {
      _result.chgPct = chgPct;
    }
    if (chg != null) {
      _result.chg = chg;
    }
    if (volume != null) {
      _result.volume = volume;
    }
    if (colorCode != null) {
      _result.colorCode = colorCode;
    }
    if (indexTime != null) {
      _result.indexTime.addAll(indexTime);
    }
    return _result;
  }
  factory MarketWorldIndexInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketWorldIndexInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketWorldIndexInfo clone() => MarketWorldIndexInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketWorldIndexInfo copyWith(void Function(MarketWorldIndexInfo) updates) => super.copyWith((message) => updates(message as MarketWorldIndexInfo)) as MarketWorldIndexInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketWorldIndexInfo create() => MarketWorldIndexInfo._();
  MarketWorldIndexInfo createEmptyInstance() => create();
  static $pb.PbList<MarketWorldIndexInfo> createRepeated() => $pb.PbList<MarketWorldIndexInfo>();
  @$core.pragma('dart2js:noInline')
  static MarketWorldIndexInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketWorldIndexInfo>(create);
  static MarketWorldIndexInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get indexCd => $_getIZ(0);
  @$pb.TagNumber(1)
  set indexCd($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIndexCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndexCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get symbol => $_getSZ(1);
  @$pb.TagNumber(2)
  set symbol($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSymbol() => $_has(1);
  @$pb.TagNumber(2)
  void clearSymbol() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get time => $_getN(2);
  @$pb.TagNumber(3)
  set time($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get flag => $_getSZ(3);
  @$pb.TagNumber(4)
  set flag($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFlag() => $_has(3);
  @$pb.TagNumber(4)
  void clearFlag() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get open => $_getN(4);
  @$pb.TagNumber(5)
  set open($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOpen() => $_has(4);
  @$pb.TagNumber(5)
  void clearOpen() => clearField(5);

  @$pb.TagNumber(7)
  $core.double get last => $_getN(5);
  @$pb.TagNumber(7)
  set last($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasLast() => $_has(5);
  @$pb.TagNumber(7)
  void clearLast() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get chgPct => $_getN(6);
  @$pb.TagNumber(8)
  set chgPct($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasChgPct() => $_has(6);
  @$pb.TagNumber(8)
  void clearChgPct() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get chg => $_getN(7);
  @$pb.TagNumber(9)
  set chg($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasChg() => $_has(7);
  @$pb.TagNumber(9)
  void clearChg() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get volume => $_getN(8);
  @$pb.TagNumber(10)
  set volume($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasVolume() => $_has(8);
  @$pb.TagNumber(10)
  void clearVolume() => clearField(10);

  @$pb.TagNumber(11)
  INDEX_COLOR_CODE get colorCode => $_getN(9);
  @$pb.TagNumber(11)
  set colorCode(INDEX_COLOR_CODE v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasColorCode() => $_has(9);
  @$pb.TagNumber(11)
  void clearColorCode() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<MarketWorldIndexInfo_IndexTime> get indexTime => $_getList(10);
}

class SecQuotesDetailInput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecQuotesDetailInput', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userID', protoName: 'userID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..hasRequiredFields = false
  ;

  SecQuotesDetailInput._() : super();
  factory SecQuotesDetailInput({
    $core.String? userID,
    $core.String? secCd,
    $core.String? authenCode,
  }) {
    final _result = create();
    if (userID != null) {
      _result.userID = userID;
    }
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    return _result;
  }
  factory SecQuotesDetailInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SecQuotesDetailInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SecQuotesDetailInput clone() => SecQuotesDetailInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SecQuotesDetailInput copyWith(void Function(SecQuotesDetailInput) updates) => super.copyWith((message) => updates(message as SecQuotesDetailInput)) as SecQuotesDetailInput; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SecQuotesDetailInput create() => SecQuotesDetailInput._();
  SecQuotesDetailInput createEmptyInstance() => create();
  static $pb.PbList<SecQuotesDetailInput> createRepeated() => $pb.PbList<SecQuotesDetailInput>();
  @$core.pragma('dart2js:noInline')
  static SecQuotesDetailInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SecQuotesDetailInput>(create);
  static SecQuotesDetailInput? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userID => $_getSZ(0);
  @$pb.TagNumber(1)
  set userID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get secCd => $_getSZ(1);
  @$pb.TagNumber(2)
  set secCd($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecCd() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get authenCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set authenCode($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAuthenCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthenCode() => clearField(3);
}

class SecQuotesDetailResponse_SecDetailInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecQuotesDetailResponse.SecDetailInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', protoName: 'marketCd')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secName', protoName: 'secName')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secType', $pb.PbFieldType.O3, protoName: 'secType')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'basicPrice', $pb.PbFieldType.OD, protoName: 'basicPrice')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ceilingPrice', $pb.PbFieldType.OD, protoName: 'ceilingPrice')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'floorPrice', $pb.PbFieldType.OD, protoName: 'floorPrice')
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'highestPrice', $pb.PbFieldType.OD, protoName: 'highestPrice')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lowestPrice', $pb.PbFieldType.OD, protoName: 'lowestPrice')
    ..a<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avgPrice', $pb.PbFieldType.OD, protoName: 'avgPrice')
    ..a<$core.double>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastPrice', $pb.PbFieldType.OD, protoName: 'lastPrice')
    ..a<$core.double>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastQty', $pb.PbFieldType.OD, protoName: 'lastQty')
    ..a<$core.double>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalQty', $pb.PbFieldType.OD, protoName: 'totalQty')
    ..a<$core.double>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalAmt', $pb.PbFieldType.OD, protoName: 'totalAmt')
    ..a<$core.double>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalPtQty', $pb.PbFieldType.OD, protoName: 'totalPtQty')
    ..a<$core.double>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalPtAmt', $pb.PbFieldType.OD, protoName: 'totalPtAmt')
    ..a<$core.double>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellForeignQty', $pb.PbFieldType.OD, protoName: 'sellForeignQty')
    ..a<$core.double>(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyForeignQty', $pb.PbFieldType.OD, protoName: 'buyForeignQty')
    ..a<$core.double>(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePoint', $pb.PbFieldType.OD, protoName: 'changePoint')
    ..a<$core.double>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePercent', $pb.PbFieldType.OD, protoName: 'changePercent')
    ..a<$core.double>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalRoom', $pb.PbFieldType.OD, protoName: 'totalRoom')
    ..a<$core.double>(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currentRoom', $pb.PbFieldType.OD, protoName: 'currentRoom')
    ..a<$core.double>(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'w52High', $pb.PbFieldType.OD, protoName: 'w52High')
    ..a<$core.double>(24, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'w52Low', $pb.PbFieldType.OD, protoName: 'w52Low')
    ..aOS(25, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best1BidPriceStr', protoName: 'best1BidPriceStr')
    ..a<$core.double>(26, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best1BidPrice', $pb.PbFieldType.OD, protoName: 'best1BidPrice')
    ..a<$core.double>(27, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best1BidQty', $pb.PbFieldType.OD, protoName: 'best1BidQty')
    ..a<$core.double>(28, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best2BidPrice', $pb.PbFieldType.OD, protoName: 'best2BidPrice')
    ..a<$core.double>(29, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best2BidQty', $pb.PbFieldType.OD, protoName: 'best2BidQty')
    ..a<$core.double>(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best3BidPrice', $pb.PbFieldType.OD, protoName: 'best3BidPrice')
    ..a<$core.double>(31, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best3BidQty', $pb.PbFieldType.OD, protoName: 'best3BidQty')
    ..a<$core.double>(32, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best4BidQty', $pb.PbFieldType.OD, protoName: 'best4BidQty')
    ..aOS(33, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best1OfferPriceStr', protoName: 'best1OfferPriceStr')
    ..a<$core.double>(34, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best1OfferPrice', $pb.PbFieldType.OD, protoName: 'best1OfferPrice')
    ..a<$core.double>(35, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best1OfferQty', $pb.PbFieldType.OD, protoName: 'best1OfferQty')
    ..a<$core.double>(36, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best2OfferPrice', $pb.PbFieldType.OD, protoName: 'best2OfferPrice')
    ..a<$core.double>(37, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best2OfferQty', $pb.PbFieldType.OD, protoName: 'best2OfferQty')
    ..a<$core.double>(38, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best3OfferPrice', $pb.PbFieldType.OD, protoName: 'best3OfferPrice')
    ..a<$core.double>(39, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best3OfferQty', $pb.PbFieldType.OD, protoName: 'best3OfferQty')
    ..a<$core.double>(40, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best4OfferQty', $pb.PbFieldType.OD, protoName: 'best4OfferQty')
    ..a<$core.double>(41, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'listedQty', $pb.PbFieldType.OD, protoName: 'listedQty')
    ..a<$core.double>(42, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tradeQty', $pb.PbFieldType.OD, protoName: 'tradeQty')
    ..a<$core.double>(43, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tradePercent', $pb.PbFieldType.OD, protoName: 'tradePercent')
    ..a<$core.double>(44, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'esp', $pb.PbFieldType.OD)
    ..a<$core.double>(45, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pe', $pb.PbFieldType.OD)
    ..a<$core.double>(46, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pb', $pb.PbFieldType.OD)
    ..a<$core.double>(47, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ps', $pb.PbFieldType.OD)
    ..a<$core.double>(48, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bookValue', $pb.PbFieldType.OD, protoName: 'bookValue')
    ..a<$core.double>(49, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dividendAmt', $pb.PbFieldType.OD, protoName: 'dividendAmt')
    ..a<$core.double>(50, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dividendRate', $pb.PbFieldType.OD, protoName: 'dividendRate')
    ..a<$core.double>(51, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'openPrice', $pb.PbFieldType.OD, protoName: 'openPrice')
    ..a<$core.double>(52, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'closePrice', $pb.PbFieldType.OD, protoName: 'closePrice')
    ..a<$core.double>(53, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roe', $pb.PbFieldType.OD)
    ..a<$core.double>(54, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roa', $pb.PbFieldType.OD)
    ..a<$core.double>(55, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'turnoverRate', $pb.PbFieldType.OD, protoName: 'turnoverRate')
    ..a<$core.double>(56, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'range', $pb.PbFieldType.OD)
    ..aOS(57, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secNameEn', protoName: 'secNameEn')
    ..aOM<NullableString>(58, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'baseSecCd', protoName: 'baseSecCd', subBuilder: NullableString.create)
    ..aOM<NullableString>(59, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'issuer', subBuilder: NullableString.create)
    ..a<$core.double>(60, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'basePrice', $pb.PbFieldType.OD, protoName: 'basePrice')
    ..a<$core.double>(61, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'execPrice', $pb.PbFieldType.OD, protoName: 'execPrice')
    ..a<$core.double>(62, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'basePriceCp', $pb.PbFieldType.OD, protoName: 'basePriceCp')
    ..a<$core.double>(63, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bfPrice', $pb.PbFieldType.OD, protoName: 'bfPrice')
    ..a<$core.double>(64, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bbPrice', $pb.PbFieldType.OD, protoName: 'bbPrice')
    ..a<$core.double>(65, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bcPrice', $pb.PbFieldType.OD, protoName: 'bcPrice')
    ..a<$core.int>(66, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastTradeDate', $pb.PbFieldType.O3, protoName: 'lastTradeDate')
    ..e<STOCK_COLOR_CODE>(67, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'baseSecPriceColor', $pb.PbFieldType.OE, protoName: 'baseSecPriceColor', defaultOrMaker: STOCK_COLOR_CODE.BASIC_PRICE, valueOf: STOCK_COLOR_CODE.valueOf, enumValues: STOCK_COLOR_CODE.values)
    ..a<$core.int>(68, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasRightExec', $pb.PbFieldType.O3, protoName: 'hasRightExec')
    ..aOM<NullableString>(69, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'execRatio', protoName: 'execRatio', subBuilder: NullableString.create)
    ..a<$core.double>(70, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCap', $pb.PbFieldType.OD, protoName: 'marketCap')
    ..hasRequiredFields = false
  ;

  SecQuotesDetailResponse_SecDetailInfo._() : super();
  factory SecQuotesDetailResponse_SecDetailInfo({
    $core.String? marketCd,
    $core.String? secCd,
    $core.String? secName,
    $core.int? secType,
    $core.double? basicPrice,
    $core.double? ceilingPrice,
    $core.double? floorPrice,
    $core.double? highestPrice,
    $core.double? lowestPrice,
    $core.double? avgPrice,
    $core.double? lastPrice,
    $core.double? lastQty,
    $core.double? totalQty,
    $core.double? totalAmt,
    $core.double? totalPtQty,
    $core.double? totalPtAmt,
    $core.double? sellForeignQty,
    $core.double? buyForeignQty,
    $core.double? changePoint,
    $core.double? changePercent,
    $core.double? totalRoom,
    $core.double? currentRoom,
    $core.double? w52High,
    $core.double? w52Low,
    $core.String? best1BidPriceStr,
    $core.double? best1BidPrice,
    $core.double? best1BidQty,
    $core.double? best2BidPrice,
    $core.double? best2BidQty,
    $core.double? best3BidPrice,
    $core.double? best3BidQty,
    $core.double? best4BidQty,
    $core.String? best1OfferPriceStr,
    $core.double? best1OfferPrice,
    $core.double? best1OfferQty,
    $core.double? best2OfferPrice,
    $core.double? best2OfferQty,
    $core.double? best3OfferPrice,
    $core.double? best3OfferQty,
    $core.double? best4OfferQty,
    $core.double? listedQty,
    $core.double? tradeQty,
    $core.double? tradePercent,
    $core.double? esp,
    $core.double? pe,
    $core.double? pb,
    $core.double? ps,
    $core.double? bookValue,
    $core.double? dividendAmt,
    $core.double? dividendRate,
    $core.double? openPrice,
    $core.double? closePrice,
    $core.double? roe,
    $core.double? roa,
    $core.double? turnoverRate,
    $core.double? range,
    $core.String? secNameEn,
    NullableString? baseSecCd,
    NullableString? issuer,
    $core.double? basePrice,
    $core.double? execPrice,
    $core.double? basePriceCp,
    $core.double? bfPrice,
    $core.double? bbPrice,
    $core.double? bcPrice,
    $core.int? lastTradeDate,
    STOCK_COLOR_CODE? baseSecPriceColor,
    $core.int? hasRightExec,
    NullableString? execRatio,
    $core.double? marketCap,
  }) {
    final _result = create();
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (secName != null) {
      _result.secName = secName;
    }
    if (secType != null) {
      _result.secType = secType;
    }
    if (basicPrice != null) {
      _result.basicPrice = basicPrice;
    }
    if (ceilingPrice != null) {
      _result.ceilingPrice = ceilingPrice;
    }
    if (floorPrice != null) {
      _result.floorPrice = floorPrice;
    }
    if (highestPrice != null) {
      _result.highestPrice = highestPrice;
    }
    if (lowestPrice != null) {
      _result.lowestPrice = lowestPrice;
    }
    if (avgPrice != null) {
      _result.avgPrice = avgPrice;
    }
    if (lastPrice != null) {
      _result.lastPrice = lastPrice;
    }
    if (lastQty != null) {
      _result.lastQty = lastQty;
    }
    if (totalQty != null) {
      _result.totalQty = totalQty;
    }
    if (totalAmt != null) {
      _result.totalAmt = totalAmt;
    }
    if (totalPtQty != null) {
      _result.totalPtQty = totalPtQty;
    }
    if (totalPtAmt != null) {
      _result.totalPtAmt = totalPtAmt;
    }
    if (sellForeignQty != null) {
      _result.sellForeignQty = sellForeignQty;
    }
    if (buyForeignQty != null) {
      _result.buyForeignQty = buyForeignQty;
    }
    if (changePoint != null) {
      _result.changePoint = changePoint;
    }
    if (changePercent != null) {
      _result.changePercent = changePercent;
    }
    if (totalRoom != null) {
      _result.totalRoom = totalRoom;
    }
    if (currentRoom != null) {
      _result.currentRoom = currentRoom;
    }
    if (w52High != null) {
      _result.w52High = w52High;
    }
    if (w52Low != null) {
      _result.w52Low = w52Low;
    }
    if (best1BidPriceStr != null) {
      _result.best1BidPriceStr = best1BidPriceStr;
    }
    if (best1BidPrice != null) {
      _result.best1BidPrice = best1BidPrice;
    }
    if (best1BidQty != null) {
      _result.best1BidQty = best1BidQty;
    }
    if (best2BidPrice != null) {
      _result.best2BidPrice = best2BidPrice;
    }
    if (best2BidQty != null) {
      _result.best2BidQty = best2BidQty;
    }
    if (best3BidPrice != null) {
      _result.best3BidPrice = best3BidPrice;
    }
    if (best3BidQty != null) {
      _result.best3BidQty = best3BidQty;
    }
    if (best4BidQty != null) {
      _result.best4BidQty = best4BidQty;
    }
    if (best1OfferPriceStr != null) {
      _result.best1OfferPriceStr = best1OfferPriceStr;
    }
    if (best1OfferPrice != null) {
      _result.best1OfferPrice = best1OfferPrice;
    }
    if (best1OfferQty != null) {
      _result.best1OfferQty = best1OfferQty;
    }
    if (best2OfferPrice != null) {
      _result.best2OfferPrice = best2OfferPrice;
    }
    if (best2OfferQty != null) {
      _result.best2OfferQty = best2OfferQty;
    }
    if (best3OfferPrice != null) {
      _result.best3OfferPrice = best3OfferPrice;
    }
    if (best3OfferQty != null) {
      _result.best3OfferQty = best3OfferQty;
    }
    if (best4OfferQty != null) {
      _result.best4OfferQty = best4OfferQty;
    }
    if (listedQty != null) {
      _result.listedQty = listedQty;
    }
    if (tradeQty != null) {
      _result.tradeQty = tradeQty;
    }
    if (tradePercent != null) {
      _result.tradePercent = tradePercent;
    }
    if (esp != null) {
      _result.esp = esp;
    }
    if (pe != null) {
      _result.pe = pe;
    }
    if (pb != null) {
      _result.pb = pb;
    }
    if (ps != null) {
      _result.ps = ps;
    }
    if (bookValue != null) {
      _result.bookValue = bookValue;
    }
    if (dividendAmt != null) {
      _result.dividendAmt = dividendAmt;
    }
    if (dividendRate != null) {
      _result.dividendRate = dividendRate;
    }
    if (openPrice != null) {
      _result.openPrice = openPrice;
    }
    if (closePrice != null) {
      _result.closePrice = closePrice;
    }
    if (roe != null) {
      _result.roe = roe;
    }
    if (roa != null) {
      _result.roa = roa;
    }
    if (turnoverRate != null) {
      _result.turnoverRate = turnoverRate;
    }
    if (range != null) {
      _result.range = range;
    }
    if (secNameEn != null) {
      _result.secNameEn = secNameEn;
    }
    if (baseSecCd != null) {
      _result.baseSecCd = baseSecCd;
    }
    if (issuer != null) {
      _result.issuer = issuer;
    }
    if (basePrice != null) {
      _result.basePrice = basePrice;
    }
    if (execPrice != null) {
      _result.execPrice = execPrice;
    }
    if (basePriceCp != null) {
      _result.basePriceCp = basePriceCp;
    }
    if (bfPrice != null) {
      _result.bfPrice = bfPrice;
    }
    if (bbPrice != null) {
      _result.bbPrice = bbPrice;
    }
    if (bcPrice != null) {
      _result.bcPrice = bcPrice;
    }
    if (lastTradeDate != null) {
      _result.lastTradeDate = lastTradeDate;
    }
    if (baseSecPriceColor != null) {
      _result.baseSecPriceColor = baseSecPriceColor;
    }
    if (hasRightExec != null) {
      _result.hasRightExec = hasRightExec;
    }
    if (execRatio != null) {
      _result.execRatio = execRatio;
    }
    if (marketCap != null) {
      _result.marketCap = marketCap;
    }
    return _result;
  }
  factory SecQuotesDetailResponse_SecDetailInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SecQuotesDetailResponse_SecDetailInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SecQuotesDetailResponse_SecDetailInfo clone() => SecQuotesDetailResponse_SecDetailInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SecQuotesDetailResponse_SecDetailInfo copyWith(void Function(SecQuotesDetailResponse_SecDetailInfo) updates) => super.copyWith((message) => updates(message as SecQuotesDetailResponse_SecDetailInfo)) as SecQuotesDetailResponse_SecDetailInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SecQuotesDetailResponse_SecDetailInfo create() => SecQuotesDetailResponse_SecDetailInfo._();
  SecQuotesDetailResponse_SecDetailInfo createEmptyInstance() => create();
  static $pb.PbList<SecQuotesDetailResponse_SecDetailInfo> createRepeated() => $pb.PbList<SecQuotesDetailResponse_SecDetailInfo>();
  @$core.pragma('dart2js:noInline')
  static SecQuotesDetailResponse_SecDetailInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SecQuotesDetailResponse_SecDetailInfo>(create);
  static SecQuotesDetailResponse_SecDetailInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get marketCd => $_getSZ(0);
  @$pb.TagNumber(1)
  set marketCd($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMarketCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearMarketCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get secCd => $_getSZ(1);
  @$pb.TagNumber(2)
  set secCd($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecCd() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get secName => $_getSZ(2);
  @$pb.TagNumber(3)
  set secName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSecName() => $_has(2);
  @$pb.TagNumber(3)
  void clearSecName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get secType => $_getIZ(3);
  @$pb.TagNumber(4)
  set secType($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSecType() => $_has(3);
  @$pb.TagNumber(4)
  void clearSecType() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get basicPrice => $_getN(4);
  @$pb.TagNumber(5)
  set basicPrice($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBasicPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearBasicPrice() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get ceilingPrice => $_getN(5);
  @$pb.TagNumber(6)
  set ceilingPrice($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCeilingPrice() => $_has(5);
  @$pb.TagNumber(6)
  void clearCeilingPrice() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get floorPrice => $_getN(6);
  @$pb.TagNumber(7)
  set floorPrice($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasFloorPrice() => $_has(6);
  @$pb.TagNumber(7)
  void clearFloorPrice() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get highestPrice => $_getN(7);
  @$pb.TagNumber(8)
  set highestPrice($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasHighestPrice() => $_has(7);
  @$pb.TagNumber(8)
  void clearHighestPrice() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get lowestPrice => $_getN(8);
  @$pb.TagNumber(9)
  set lowestPrice($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLowestPrice() => $_has(8);
  @$pb.TagNumber(9)
  void clearLowestPrice() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get avgPrice => $_getN(9);
  @$pb.TagNumber(10)
  set avgPrice($core.double v) { $_setDouble(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAvgPrice() => $_has(9);
  @$pb.TagNumber(10)
  void clearAvgPrice() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get lastPrice => $_getN(10);
  @$pb.TagNumber(11)
  set lastPrice($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasLastPrice() => $_has(10);
  @$pb.TagNumber(11)
  void clearLastPrice() => clearField(11);

  @$pb.TagNumber(12)
  $core.double get lastQty => $_getN(11);
  @$pb.TagNumber(12)
  set lastQty($core.double v) { $_setDouble(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasLastQty() => $_has(11);
  @$pb.TagNumber(12)
  void clearLastQty() => clearField(12);

  @$pb.TagNumber(13)
  $core.double get totalQty => $_getN(12);
  @$pb.TagNumber(13)
  set totalQty($core.double v) { $_setDouble(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasTotalQty() => $_has(12);
  @$pb.TagNumber(13)
  void clearTotalQty() => clearField(13);

  @$pb.TagNumber(14)
  $core.double get totalAmt => $_getN(13);
  @$pb.TagNumber(14)
  set totalAmt($core.double v) { $_setDouble(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasTotalAmt() => $_has(13);
  @$pb.TagNumber(14)
  void clearTotalAmt() => clearField(14);

  @$pb.TagNumber(15)
  $core.double get totalPtQty => $_getN(14);
  @$pb.TagNumber(15)
  set totalPtQty($core.double v) { $_setDouble(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasTotalPtQty() => $_has(14);
  @$pb.TagNumber(15)
  void clearTotalPtQty() => clearField(15);

  @$pb.TagNumber(16)
  $core.double get totalPtAmt => $_getN(15);
  @$pb.TagNumber(16)
  set totalPtAmt($core.double v) { $_setDouble(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasTotalPtAmt() => $_has(15);
  @$pb.TagNumber(16)
  void clearTotalPtAmt() => clearField(16);

  @$pb.TagNumber(17)
  $core.double get sellForeignQty => $_getN(16);
  @$pb.TagNumber(17)
  set sellForeignQty($core.double v) { $_setDouble(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasSellForeignQty() => $_has(16);
  @$pb.TagNumber(17)
  void clearSellForeignQty() => clearField(17);

  @$pb.TagNumber(18)
  $core.double get buyForeignQty => $_getN(17);
  @$pb.TagNumber(18)
  set buyForeignQty($core.double v) { $_setDouble(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasBuyForeignQty() => $_has(17);
  @$pb.TagNumber(18)
  void clearBuyForeignQty() => clearField(18);

  @$pb.TagNumber(19)
  $core.double get changePoint => $_getN(18);
  @$pb.TagNumber(19)
  set changePoint($core.double v) { $_setDouble(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasChangePoint() => $_has(18);
  @$pb.TagNumber(19)
  void clearChangePoint() => clearField(19);

  @$pb.TagNumber(20)
  $core.double get changePercent => $_getN(19);
  @$pb.TagNumber(20)
  set changePercent($core.double v) { $_setDouble(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasChangePercent() => $_has(19);
  @$pb.TagNumber(20)
  void clearChangePercent() => clearField(20);

  @$pb.TagNumber(21)
  $core.double get totalRoom => $_getN(20);
  @$pb.TagNumber(21)
  set totalRoom($core.double v) { $_setDouble(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasTotalRoom() => $_has(20);
  @$pb.TagNumber(21)
  void clearTotalRoom() => clearField(21);

  @$pb.TagNumber(22)
  $core.double get currentRoom => $_getN(21);
  @$pb.TagNumber(22)
  set currentRoom($core.double v) { $_setDouble(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasCurrentRoom() => $_has(21);
  @$pb.TagNumber(22)
  void clearCurrentRoom() => clearField(22);

  @$pb.TagNumber(23)
  $core.double get w52High => $_getN(22);
  @$pb.TagNumber(23)
  set w52High($core.double v) { $_setDouble(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasW52High() => $_has(22);
  @$pb.TagNumber(23)
  void clearW52High() => clearField(23);

  @$pb.TagNumber(24)
  $core.double get w52Low => $_getN(23);
  @$pb.TagNumber(24)
  set w52Low($core.double v) { $_setDouble(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasW52Low() => $_has(23);
  @$pb.TagNumber(24)
  void clearW52Low() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get best1BidPriceStr => $_getSZ(24);
  @$pb.TagNumber(25)
  set best1BidPriceStr($core.String v) { $_setString(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasBest1BidPriceStr() => $_has(24);
  @$pb.TagNumber(25)
  void clearBest1BidPriceStr() => clearField(25);

  @$pb.TagNumber(26)
  $core.double get best1BidPrice => $_getN(25);
  @$pb.TagNumber(26)
  set best1BidPrice($core.double v) { $_setDouble(25, v); }
  @$pb.TagNumber(26)
  $core.bool hasBest1BidPrice() => $_has(25);
  @$pb.TagNumber(26)
  void clearBest1BidPrice() => clearField(26);

  @$pb.TagNumber(27)
  $core.double get best1BidQty => $_getN(26);
  @$pb.TagNumber(27)
  set best1BidQty($core.double v) { $_setDouble(26, v); }
  @$pb.TagNumber(27)
  $core.bool hasBest1BidQty() => $_has(26);
  @$pb.TagNumber(27)
  void clearBest1BidQty() => clearField(27);

  @$pb.TagNumber(28)
  $core.double get best2BidPrice => $_getN(27);
  @$pb.TagNumber(28)
  set best2BidPrice($core.double v) { $_setDouble(27, v); }
  @$pb.TagNumber(28)
  $core.bool hasBest2BidPrice() => $_has(27);
  @$pb.TagNumber(28)
  void clearBest2BidPrice() => clearField(28);

  @$pb.TagNumber(29)
  $core.double get best2BidQty => $_getN(28);
  @$pb.TagNumber(29)
  set best2BidQty($core.double v) { $_setDouble(28, v); }
  @$pb.TagNumber(29)
  $core.bool hasBest2BidQty() => $_has(28);
  @$pb.TagNumber(29)
  void clearBest2BidQty() => clearField(29);

  @$pb.TagNumber(30)
  $core.double get best3BidPrice => $_getN(29);
  @$pb.TagNumber(30)
  set best3BidPrice($core.double v) { $_setDouble(29, v); }
  @$pb.TagNumber(30)
  $core.bool hasBest3BidPrice() => $_has(29);
  @$pb.TagNumber(30)
  void clearBest3BidPrice() => clearField(30);

  @$pb.TagNumber(31)
  $core.double get best3BidQty => $_getN(30);
  @$pb.TagNumber(31)
  set best3BidQty($core.double v) { $_setDouble(30, v); }
  @$pb.TagNumber(31)
  $core.bool hasBest3BidQty() => $_has(30);
  @$pb.TagNumber(31)
  void clearBest3BidQty() => clearField(31);

  @$pb.TagNumber(32)
  $core.double get best4BidQty => $_getN(31);
  @$pb.TagNumber(32)
  set best4BidQty($core.double v) { $_setDouble(31, v); }
  @$pb.TagNumber(32)
  $core.bool hasBest4BidQty() => $_has(31);
  @$pb.TagNumber(32)
  void clearBest4BidQty() => clearField(32);

  @$pb.TagNumber(33)
  $core.String get best1OfferPriceStr => $_getSZ(32);
  @$pb.TagNumber(33)
  set best1OfferPriceStr($core.String v) { $_setString(32, v); }
  @$pb.TagNumber(33)
  $core.bool hasBest1OfferPriceStr() => $_has(32);
  @$pb.TagNumber(33)
  void clearBest1OfferPriceStr() => clearField(33);

  @$pb.TagNumber(34)
  $core.double get best1OfferPrice => $_getN(33);
  @$pb.TagNumber(34)
  set best1OfferPrice($core.double v) { $_setDouble(33, v); }
  @$pb.TagNumber(34)
  $core.bool hasBest1OfferPrice() => $_has(33);
  @$pb.TagNumber(34)
  void clearBest1OfferPrice() => clearField(34);

  @$pb.TagNumber(35)
  $core.double get best1OfferQty => $_getN(34);
  @$pb.TagNumber(35)
  set best1OfferQty($core.double v) { $_setDouble(34, v); }
  @$pb.TagNumber(35)
  $core.bool hasBest1OfferQty() => $_has(34);
  @$pb.TagNumber(35)
  void clearBest1OfferQty() => clearField(35);

  @$pb.TagNumber(36)
  $core.double get best2OfferPrice => $_getN(35);
  @$pb.TagNumber(36)
  set best2OfferPrice($core.double v) { $_setDouble(35, v); }
  @$pb.TagNumber(36)
  $core.bool hasBest2OfferPrice() => $_has(35);
  @$pb.TagNumber(36)
  void clearBest2OfferPrice() => clearField(36);

  @$pb.TagNumber(37)
  $core.double get best2OfferQty => $_getN(36);
  @$pb.TagNumber(37)
  set best2OfferQty($core.double v) { $_setDouble(36, v); }
  @$pb.TagNumber(37)
  $core.bool hasBest2OfferQty() => $_has(36);
  @$pb.TagNumber(37)
  void clearBest2OfferQty() => clearField(37);

  @$pb.TagNumber(38)
  $core.double get best3OfferPrice => $_getN(37);
  @$pb.TagNumber(38)
  set best3OfferPrice($core.double v) { $_setDouble(37, v); }
  @$pb.TagNumber(38)
  $core.bool hasBest3OfferPrice() => $_has(37);
  @$pb.TagNumber(38)
  void clearBest3OfferPrice() => clearField(38);

  @$pb.TagNumber(39)
  $core.double get best3OfferQty => $_getN(38);
  @$pb.TagNumber(39)
  set best3OfferQty($core.double v) { $_setDouble(38, v); }
  @$pb.TagNumber(39)
  $core.bool hasBest3OfferQty() => $_has(38);
  @$pb.TagNumber(39)
  void clearBest3OfferQty() => clearField(39);

  @$pb.TagNumber(40)
  $core.double get best4OfferQty => $_getN(39);
  @$pb.TagNumber(40)
  set best4OfferQty($core.double v) { $_setDouble(39, v); }
  @$pb.TagNumber(40)
  $core.bool hasBest4OfferQty() => $_has(39);
  @$pb.TagNumber(40)
  void clearBest4OfferQty() => clearField(40);

  @$pb.TagNumber(41)
  $core.double get listedQty => $_getN(40);
  @$pb.TagNumber(41)
  set listedQty($core.double v) { $_setDouble(40, v); }
  @$pb.TagNumber(41)
  $core.bool hasListedQty() => $_has(40);
  @$pb.TagNumber(41)
  void clearListedQty() => clearField(41);

  @$pb.TagNumber(42)
  $core.double get tradeQty => $_getN(41);
  @$pb.TagNumber(42)
  set tradeQty($core.double v) { $_setDouble(41, v); }
  @$pb.TagNumber(42)
  $core.bool hasTradeQty() => $_has(41);
  @$pb.TagNumber(42)
  void clearTradeQty() => clearField(42);

  @$pb.TagNumber(43)
  $core.double get tradePercent => $_getN(42);
  @$pb.TagNumber(43)
  set tradePercent($core.double v) { $_setDouble(42, v); }
  @$pb.TagNumber(43)
  $core.bool hasTradePercent() => $_has(42);
  @$pb.TagNumber(43)
  void clearTradePercent() => clearField(43);

  @$pb.TagNumber(44)
  $core.double get esp => $_getN(43);
  @$pb.TagNumber(44)
  set esp($core.double v) { $_setDouble(43, v); }
  @$pb.TagNumber(44)
  $core.bool hasEsp() => $_has(43);
  @$pb.TagNumber(44)
  void clearEsp() => clearField(44);

  @$pb.TagNumber(45)
  $core.double get pe => $_getN(44);
  @$pb.TagNumber(45)
  set pe($core.double v) { $_setDouble(44, v); }
  @$pb.TagNumber(45)
  $core.bool hasPe() => $_has(44);
  @$pb.TagNumber(45)
  void clearPe() => clearField(45);

  @$pb.TagNumber(46)
  $core.double get pb => $_getN(45);
  @$pb.TagNumber(46)
  set pb($core.double v) { $_setDouble(45, v); }
  @$pb.TagNumber(46)
  $core.bool hasPb() => $_has(45);
  @$pb.TagNumber(46)
  void clearPb() => clearField(46);

  @$pb.TagNumber(47)
  $core.double get ps => $_getN(46);
  @$pb.TagNumber(47)
  set ps($core.double v) { $_setDouble(46, v); }
  @$pb.TagNumber(47)
  $core.bool hasPs() => $_has(46);
  @$pb.TagNumber(47)
  void clearPs() => clearField(47);

  @$pb.TagNumber(48)
  $core.double get bookValue => $_getN(47);
  @$pb.TagNumber(48)
  set bookValue($core.double v) { $_setDouble(47, v); }
  @$pb.TagNumber(48)
  $core.bool hasBookValue() => $_has(47);
  @$pb.TagNumber(48)
  void clearBookValue() => clearField(48);

  @$pb.TagNumber(49)
  $core.double get dividendAmt => $_getN(48);
  @$pb.TagNumber(49)
  set dividendAmt($core.double v) { $_setDouble(48, v); }
  @$pb.TagNumber(49)
  $core.bool hasDividendAmt() => $_has(48);
  @$pb.TagNumber(49)
  void clearDividendAmt() => clearField(49);

  @$pb.TagNumber(50)
  $core.double get dividendRate => $_getN(49);
  @$pb.TagNumber(50)
  set dividendRate($core.double v) { $_setDouble(49, v); }
  @$pb.TagNumber(50)
  $core.bool hasDividendRate() => $_has(49);
  @$pb.TagNumber(50)
  void clearDividendRate() => clearField(50);

  @$pb.TagNumber(51)
  $core.double get openPrice => $_getN(50);
  @$pb.TagNumber(51)
  set openPrice($core.double v) { $_setDouble(50, v); }
  @$pb.TagNumber(51)
  $core.bool hasOpenPrice() => $_has(50);
  @$pb.TagNumber(51)
  void clearOpenPrice() => clearField(51);

  @$pb.TagNumber(52)
  $core.double get closePrice => $_getN(51);
  @$pb.TagNumber(52)
  set closePrice($core.double v) { $_setDouble(51, v); }
  @$pb.TagNumber(52)
  $core.bool hasClosePrice() => $_has(51);
  @$pb.TagNumber(52)
  void clearClosePrice() => clearField(52);

  @$pb.TagNumber(53)
  $core.double get roe => $_getN(52);
  @$pb.TagNumber(53)
  set roe($core.double v) { $_setDouble(52, v); }
  @$pb.TagNumber(53)
  $core.bool hasRoe() => $_has(52);
  @$pb.TagNumber(53)
  void clearRoe() => clearField(53);

  @$pb.TagNumber(54)
  $core.double get roa => $_getN(53);
  @$pb.TagNumber(54)
  set roa($core.double v) { $_setDouble(53, v); }
  @$pb.TagNumber(54)
  $core.bool hasRoa() => $_has(53);
  @$pb.TagNumber(54)
  void clearRoa() => clearField(54);

  @$pb.TagNumber(55)
  $core.double get turnoverRate => $_getN(54);
  @$pb.TagNumber(55)
  set turnoverRate($core.double v) { $_setDouble(54, v); }
  @$pb.TagNumber(55)
  $core.bool hasTurnoverRate() => $_has(54);
  @$pb.TagNumber(55)
  void clearTurnoverRate() => clearField(55);

  @$pb.TagNumber(56)
  $core.double get range => $_getN(55);
  @$pb.TagNumber(56)
  set range($core.double v) { $_setDouble(55, v); }
  @$pb.TagNumber(56)
  $core.bool hasRange() => $_has(55);
  @$pb.TagNumber(56)
  void clearRange() => clearField(56);

  @$pb.TagNumber(57)
  $core.String get secNameEn => $_getSZ(56);
  @$pb.TagNumber(57)
  set secNameEn($core.String v) { $_setString(56, v); }
  @$pb.TagNumber(57)
  $core.bool hasSecNameEn() => $_has(56);
  @$pb.TagNumber(57)
  void clearSecNameEn() => clearField(57);

  @$pb.TagNumber(58)
  NullableString get baseSecCd => $_getN(57);
  @$pb.TagNumber(58)
  set baseSecCd(NullableString v) { setField(58, v); }
  @$pb.TagNumber(58)
  $core.bool hasBaseSecCd() => $_has(57);
  @$pb.TagNumber(58)
  void clearBaseSecCd() => clearField(58);
  @$pb.TagNumber(58)
  NullableString ensureBaseSecCd() => $_ensure(57);

  @$pb.TagNumber(59)
  NullableString get issuer => $_getN(58);
  @$pb.TagNumber(59)
  set issuer(NullableString v) { setField(59, v); }
  @$pb.TagNumber(59)
  $core.bool hasIssuer() => $_has(58);
  @$pb.TagNumber(59)
  void clearIssuer() => clearField(59);
  @$pb.TagNumber(59)
  NullableString ensureIssuer() => $_ensure(58);

  @$pb.TagNumber(60)
  $core.double get basePrice => $_getN(59);
  @$pb.TagNumber(60)
  set basePrice($core.double v) { $_setDouble(59, v); }
  @$pb.TagNumber(60)
  $core.bool hasBasePrice() => $_has(59);
  @$pb.TagNumber(60)
  void clearBasePrice() => clearField(60);

  @$pb.TagNumber(61)
  $core.double get execPrice => $_getN(60);
  @$pb.TagNumber(61)
  set execPrice($core.double v) { $_setDouble(60, v); }
  @$pb.TagNumber(61)
  $core.bool hasExecPrice() => $_has(60);
  @$pb.TagNumber(61)
  void clearExecPrice() => clearField(61);

  @$pb.TagNumber(62)
  $core.double get basePriceCp => $_getN(61);
  @$pb.TagNumber(62)
  set basePriceCp($core.double v) { $_setDouble(61, v); }
  @$pb.TagNumber(62)
  $core.bool hasBasePriceCp() => $_has(61);
  @$pb.TagNumber(62)
  void clearBasePriceCp() => clearField(62);

  @$pb.TagNumber(63)
  $core.double get bfPrice => $_getN(62);
  @$pb.TagNumber(63)
  set bfPrice($core.double v) { $_setDouble(62, v); }
  @$pb.TagNumber(63)
  $core.bool hasBfPrice() => $_has(62);
  @$pb.TagNumber(63)
  void clearBfPrice() => clearField(63);

  @$pb.TagNumber(64)
  $core.double get bbPrice => $_getN(63);
  @$pb.TagNumber(64)
  set bbPrice($core.double v) { $_setDouble(63, v); }
  @$pb.TagNumber(64)
  $core.bool hasBbPrice() => $_has(63);
  @$pb.TagNumber(64)
  void clearBbPrice() => clearField(64);

  @$pb.TagNumber(65)
  $core.double get bcPrice => $_getN(64);
  @$pb.TagNumber(65)
  set bcPrice($core.double v) { $_setDouble(64, v); }
  @$pb.TagNumber(65)
  $core.bool hasBcPrice() => $_has(64);
  @$pb.TagNumber(65)
  void clearBcPrice() => clearField(65);

  @$pb.TagNumber(66)
  $core.int get lastTradeDate => $_getIZ(65);
  @$pb.TagNumber(66)
  set lastTradeDate($core.int v) { $_setSignedInt32(65, v); }
  @$pb.TagNumber(66)
  $core.bool hasLastTradeDate() => $_has(65);
  @$pb.TagNumber(66)
  void clearLastTradeDate() => clearField(66);

  @$pb.TagNumber(67)
  STOCK_COLOR_CODE get baseSecPriceColor => $_getN(66);
  @$pb.TagNumber(67)
  set baseSecPriceColor(STOCK_COLOR_CODE v) { setField(67, v); }
  @$pb.TagNumber(67)
  $core.bool hasBaseSecPriceColor() => $_has(66);
  @$pb.TagNumber(67)
  void clearBaseSecPriceColor() => clearField(67);

  @$pb.TagNumber(68)
  $core.int get hasRightExec => $_getIZ(67);
  @$pb.TagNumber(68)
  set hasRightExec($core.int v) { $_setSignedInt32(67, v); }
  @$pb.TagNumber(68)
  $core.bool hasHasRightExec() => $_has(67);
  @$pb.TagNumber(68)
  void clearHasRightExec() => clearField(68);

  @$pb.TagNumber(69)
  NullableString get execRatio => $_getN(68);
  @$pb.TagNumber(69)
  set execRatio(NullableString v) { setField(69, v); }
  @$pb.TagNumber(69)
  $core.bool hasExecRatio() => $_has(68);
  @$pb.TagNumber(69)
  void clearExecRatio() => clearField(69);
  @$pb.TagNumber(69)
  NullableString ensureExecRatio() => $_ensure(68);

  @$pb.TagNumber(70)
  $core.double get marketCap => $_getN(69);
  @$pb.TagNumber(70)
  set marketCap($core.double v) { $_setDouble(69, v); }
  @$pb.TagNumber(70)
  $core.bool hasMarketCap() => $_has(69);
  @$pb.TagNumber(70)
  void clearMarketCap() => clearField(70);
}

class SecQuotesDetailResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecQuotesDetailResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOM<SecQuotesDetailResponse_SecDetailInfo>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secDetailInfo', protoName: 'secDetailInfo', subBuilder: SecQuotesDetailResponse_SecDetailInfo.create)
    ..hasRequiredFields = false
  ;

  SecQuotesDetailResponse._() : super();
  factory SecQuotesDetailResponse({
    $core.int? status,
    $core.String? error,
    $core.String? message,
    SecQuotesDetailResponse_SecDetailInfo? secDetailInfo,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (secDetailInfo != null) {
      _result.secDetailInfo = secDetailInfo;
    }
    return _result;
  }
  factory SecQuotesDetailResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SecQuotesDetailResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SecQuotesDetailResponse clone() => SecQuotesDetailResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SecQuotesDetailResponse copyWith(void Function(SecQuotesDetailResponse) updates) => super.copyWith((message) => updates(message as SecQuotesDetailResponse)) as SecQuotesDetailResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SecQuotesDetailResponse create() => SecQuotesDetailResponse._();
  SecQuotesDetailResponse createEmptyInstance() => create();
  static $pb.PbList<SecQuotesDetailResponse> createRepeated() => $pb.PbList<SecQuotesDetailResponse>();
  @$core.pragma('dart2js:noInline')
  static SecQuotesDetailResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SecQuotesDetailResponse>(create);
  static SecQuotesDetailResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  SecQuotesDetailResponse_SecDetailInfo get secDetailInfo => $_getN(3);
  @$pb.TagNumber(4)
  set secDetailInfo(SecQuotesDetailResponse_SecDetailInfo v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSecDetailInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearSecDetailInfo() => clearField(4);
  @$pb.TagNumber(4)
  SecQuotesDetailResponse_SecDetailInfo ensureSecDetailInfo() => $_ensure(3);
}

class MarketQuotesInput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketQuotesInput', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userID', protoName: 'userID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexCd', protoName: 'indexCd')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..hasRequiredFields = false
  ;

  MarketQuotesInput._() : super();
  factory MarketQuotesInput({
    $core.String? userID,
    $core.String? indexCd,
    $core.String? authenCode,
  }) {
    final _result = create();
    if (userID != null) {
      _result.userID = userID;
    }
    if (indexCd != null) {
      _result.indexCd = indexCd;
    }
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    return _result;
  }
  factory MarketQuotesInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketQuotesInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketQuotesInput clone() => MarketQuotesInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketQuotesInput copyWith(void Function(MarketQuotesInput) updates) => super.copyWith((message) => updates(message as MarketQuotesInput)) as MarketQuotesInput; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketQuotesInput create() => MarketQuotesInput._();
  MarketQuotesInput createEmptyInstance() => create();
  static $pb.PbList<MarketQuotesInput> createRepeated() => $pb.PbList<MarketQuotesInput>();
  @$core.pragma('dart2js:noInline')
  static MarketQuotesInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketQuotesInput>(create);
  static MarketQuotesInput? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userID => $_getSZ(0);
  @$pb.TagNumber(1)
  set userID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get indexCd => $_getSZ(1);
  @$pb.TagNumber(2)
  set indexCd($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndexCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndexCd() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get authenCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set authenCode($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAuthenCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthenCode() => clearField(3);
}

class MarketQuotesResponse_MarketQuotesInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketQuotesResponse.MarketQuotesInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexCd', $pb.PbFieldType.O3, protoName: 'indexCd')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalTrade', $pb.PbFieldType.OD, protoName: 'totalTrade')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalAmt', $pb.PbFieldType.OD, protoName: 'totalAmt')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalQty', $pb.PbFieldType.OD, protoName: 'totalQty')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalTradePt', $pb.PbFieldType.OD, protoName: 'totalTradePt')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalAmtPt', $pb.PbFieldType.OD, protoName: 'totalAmtPt')
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalQtyPt', $pb.PbFieldType.OD, protoName: 'totalQtyPt')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketIndex', $pb.PbFieldType.OD, protoName: 'marketIndex')
    ..a<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changeIndex', $pb.PbFieldType.OD, protoName: 'changeIndex')
    ..a<$core.double>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changeIndexPercent', $pb.PbFieldType.OD, protoName: 'changeIndexPercent')
    ..a<$core.double>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'openIndex', $pb.PbFieldType.OD, protoName: 'openIndex')
    ..a<$core.double>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'highestIndex', $pb.PbFieldType.OD, protoName: 'highestIndex')
    ..a<$core.double>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lowestIndex', $pb.PbFieldType.OD, protoName: 'lowestIndex')
    ..a<$core.double>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'advances', $pb.PbFieldType.OD)
    ..a<$core.double>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'noChange', $pb.PbFieldType.OD, protoName: 'noChange')
    ..a<$core.double>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'declenes', $pb.PbFieldType.OD)
    ..a<$core.double>(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'floor', $pb.PbFieldType.OD)
    ..a<$core.double>(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ceiling', $pb.PbFieldType.OD)
    ..a<$core.double>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalBuy', $pb.PbFieldType.OD, protoName: 'totalBuy')
    ..a<$core.double>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalSell', $pb.PbFieldType.OD, protoName: 'totalSell')
    ..a<$core.double>(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalBuyForeignQty', $pb.PbFieldType.OD, protoName: 'totalBuyForeignQty')
    ..a<$core.double>(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalSellForeignQty', $pb.PbFieldType.OD, protoName: 'totalSellForeignQty')
    ..a<$core.double>(24, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalBuyForeignAmt', $pb.PbFieldType.OD, protoName: 'totalBuyForeignAmt')
    ..a<$core.double>(25, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalSellForeignAmt', $pb.PbFieldType.OD, protoName: 'totalSellForeignAmt')
    ..hasRequiredFields = false
  ;

  MarketQuotesResponse_MarketQuotesInfo._() : super();
  factory MarketQuotesResponse_MarketQuotesInfo({
    $core.int? indexCd,
    $core.String? state,
    $core.double? totalTrade,
    $core.double? totalAmt,
    $core.double? totalQty,
    $core.double? totalTradePt,
    $core.double? totalAmtPt,
    $core.double? totalQtyPt,
    $core.double? marketIndex,
    $core.double? changeIndex,
    $core.double? changeIndexPercent,
    $core.double? openIndex,
    $core.double? highestIndex,
    $core.double? lowestIndex,
    $core.double? advances,
    $core.double? noChange,
    $core.double? declenes,
    $core.double? floor,
    $core.double? ceiling,
    $core.double? totalBuy,
    $core.double? totalSell,
    $core.double? totalBuyForeignQty,
    $core.double? totalSellForeignQty,
    $core.double? totalBuyForeignAmt,
    $core.double? totalSellForeignAmt,
  }) {
    final _result = create();
    if (indexCd != null) {
      _result.indexCd = indexCd;
    }
    if (state != null) {
      _result.state = state;
    }
    if (totalTrade != null) {
      _result.totalTrade = totalTrade;
    }
    if (totalAmt != null) {
      _result.totalAmt = totalAmt;
    }
    if (totalQty != null) {
      _result.totalQty = totalQty;
    }
    if (totalTradePt != null) {
      _result.totalTradePt = totalTradePt;
    }
    if (totalAmtPt != null) {
      _result.totalAmtPt = totalAmtPt;
    }
    if (totalQtyPt != null) {
      _result.totalQtyPt = totalQtyPt;
    }
    if (marketIndex != null) {
      _result.marketIndex = marketIndex;
    }
    if (changeIndex != null) {
      _result.changeIndex = changeIndex;
    }
    if (changeIndexPercent != null) {
      _result.changeIndexPercent = changeIndexPercent;
    }
    if (openIndex != null) {
      _result.openIndex = openIndex;
    }
    if (highestIndex != null) {
      _result.highestIndex = highestIndex;
    }
    if (lowestIndex != null) {
      _result.lowestIndex = lowestIndex;
    }
    if (advances != null) {
      _result.advances = advances;
    }
    if (noChange != null) {
      _result.noChange = noChange;
    }
    if (declenes != null) {
      _result.declenes = declenes;
    }
    if (floor != null) {
      _result.floor = floor;
    }
    if (ceiling != null) {
      _result.ceiling = ceiling;
    }
    if (totalBuy != null) {
      _result.totalBuy = totalBuy;
    }
    if (totalSell != null) {
      _result.totalSell = totalSell;
    }
    if (totalBuyForeignQty != null) {
      _result.totalBuyForeignQty = totalBuyForeignQty;
    }
    if (totalSellForeignQty != null) {
      _result.totalSellForeignQty = totalSellForeignQty;
    }
    if (totalBuyForeignAmt != null) {
      _result.totalBuyForeignAmt = totalBuyForeignAmt;
    }
    if (totalSellForeignAmt != null) {
      _result.totalSellForeignAmt = totalSellForeignAmt;
    }
    return _result;
  }
  factory MarketQuotesResponse_MarketQuotesInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketQuotesResponse_MarketQuotesInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketQuotesResponse_MarketQuotesInfo clone() => MarketQuotesResponse_MarketQuotesInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketQuotesResponse_MarketQuotesInfo copyWith(void Function(MarketQuotesResponse_MarketQuotesInfo) updates) => super.copyWith((message) => updates(message as MarketQuotesResponse_MarketQuotesInfo)) as MarketQuotesResponse_MarketQuotesInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketQuotesResponse_MarketQuotesInfo create() => MarketQuotesResponse_MarketQuotesInfo._();
  MarketQuotesResponse_MarketQuotesInfo createEmptyInstance() => create();
  static $pb.PbList<MarketQuotesResponse_MarketQuotesInfo> createRepeated() => $pb.PbList<MarketQuotesResponse_MarketQuotesInfo>();
  @$core.pragma('dart2js:noInline')
  static MarketQuotesResponse_MarketQuotesInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketQuotesResponse_MarketQuotesInfo>(create);
  static MarketQuotesResponse_MarketQuotesInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get indexCd => $_getIZ(0);
  @$pb.TagNumber(1)
  set indexCd($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIndexCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndexCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get state => $_getSZ(1);
  @$pb.TagNumber(2)
  set state($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get totalTrade => $_getN(2);
  @$pb.TagNumber(3)
  set totalTrade($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTotalTrade() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalTrade() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get totalAmt => $_getN(3);
  @$pb.TagNumber(4)
  set totalAmt($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTotalAmt() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalAmt() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get totalQty => $_getN(4);
  @$pb.TagNumber(5)
  set totalQty($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTotalQty() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalQty() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get totalTradePt => $_getN(5);
  @$pb.TagNumber(6)
  set totalTradePt($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTotalTradePt() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalTradePt() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get totalAmtPt => $_getN(6);
  @$pb.TagNumber(7)
  set totalAmtPt($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTotalAmtPt() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalAmtPt() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get totalQtyPt => $_getN(7);
  @$pb.TagNumber(8)
  set totalQtyPt($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTotalQtyPt() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalQtyPt() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get marketIndex => $_getN(8);
  @$pb.TagNumber(9)
  set marketIndex($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasMarketIndex() => $_has(8);
  @$pb.TagNumber(9)
  void clearMarketIndex() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get changeIndex => $_getN(9);
  @$pb.TagNumber(10)
  set changeIndex($core.double v) { $_setDouble(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasChangeIndex() => $_has(9);
  @$pb.TagNumber(10)
  void clearChangeIndex() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get changeIndexPercent => $_getN(10);
  @$pb.TagNumber(11)
  set changeIndexPercent($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasChangeIndexPercent() => $_has(10);
  @$pb.TagNumber(11)
  void clearChangeIndexPercent() => clearField(11);

  @$pb.TagNumber(12)
  $core.double get openIndex => $_getN(11);
  @$pb.TagNumber(12)
  set openIndex($core.double v) { $_setDouble(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasOpenIndex() => $_has(11);
  @$pb.TagNumber(12)
  void clearOpenIndex() => clearField(12);

  @$pb.TagNumber(13)
  $core.double get highestIndex => $_getN(12);
  @$pb.TagNumber(13)
  set highestIndex($core.double v) { $_setDouble(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasHighestIndex() => $_has(12);
  @$pb.TagNumber(13)
  void clearHighestIndex() => clearField(13);

  @$pb.TagNumber(14)
  $core.double get lowestIndex => $_getN(13);
  @$pb.TagNumber(14)
  set lowestIndex($core.double v) { $_setDouble(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasLowestIndex() => $_has(13);
  @$pb.TagNumber(14)
  void clearLowestIndex() => clearField(14);

  @$pb.TagNumber(15)
  $core.double get advances => $_getN(14);
  @$pb.TagNumber(15)
  set advances($core.double v) { $_setDouble(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasAdvances() => $_has(14);
  @$pb.TagNumber(15)
  void clearAdvances() => clearField(15);

  @$pb.TagNumber(16)
  $core.double get noChange => $_getN(15);
  @$pb.TagNumber(16)
  set noChange($core.double v) { $_setDouble(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasNoChange() => $_has(15);
  @$pb.TagNumber(16)
  void clearNoChange() => clearField(16);

  @$pb.TagNumber(17)
  $core.double get declenes => $_getN(16);
  @$pb.TagNumber(17)
  set declenes($core.double v) { $_setDouble(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasDeclenes() => $_has(16);
  @$pb.TagNumber(17)
  void clearDeclenes() => clearField(17);

  @$pb.TagNumber(18)
  $core.double get floor => $_getN(17);
  @$pb.TagNumber(18)
  set floor($core.double v) { $_setDouble(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasFloor() => $_has(17);
  @$pb.TagNumber(18)
  void clearFloor() => clearField(18);

  @$pb.TagNumber(19)
  $core.double get ceiling => $_getN(18);
  @$pb.TagNumber(19)
  set ceiling($core.double v) { $_setDouble(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasCeiling() => $_has(18);
  @$pb.TagNumber(19)
  void clearCeiling() => clearField(19);

  @$pb.TagNumber(20)
  $core.double get totalBuy => $_getN(19);
  @$pb.TagNumber(20)
  set totalBuy($core.double v) { $_setDouble(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasTotalBuy() => $_has(19);
  @$pb.TagNumber(20)
  void clearTotalBuy() => clearField(20);

  @$pb.TagNumber(21)
  $core.double get totalSell => $_getN(20);
  @$pb.TagNumber(21)
  set totalSell($core.double v) { $_setDouble(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasTotalSell() => $_has(20);
  @$pb.TagNumber(21)
  void clearTotalSell() => clearField(21);

  @$pb.TagNumber(22)
  $core.double get totalBuyForeignQty => $_getN(21);
  @$pb.TagNumber(22)
  set totalBuyForeignQty($core.double v) { $_setDouble(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasTotalBuyForeignQty() => $_has(21);
  @$pb.TagNumber(22)
  void clearTotalBuyForeignQty() => clearField(22);

  @$pb.TagNumber(23)
  $core.double get totalSellForeignQty => $_getN(22);
  @$pb.TagNumber(23)
  set totalSellForeignQty($core.double v) { $_setDouble(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasTotalSellForeignQty() => $_has(22);
  @$pb.TagNumber(23)
  void clearTotalSellForeignQty() => clearField(23);

  @$pb.TagNumber(24)
  $core.double get totalBuyForeignAmt => $_getN(23);
  @$pb.TagNumber(24)
  set totalBuyForeignAmt($core.double v) { $_setDouble(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasTotalBuyForeignAmt() => $_has(23);
  @$pb.TagNumber(24)
  void clearTotalBuyForeignAmt() => clearField(24);

  @$pb.TagNumber(25)
  $core.double get totalSellForeignAmt => $_getN(24);
  @$pb.TagNumber(25)
  set totalSellForeignAmt($core.double v) { $_setDouble(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasTotalSellForeignAmt() => $_has(24);
  @$pb.TagNumber(25)
  void clearTotalSellForeignAmt() => clearField(25);
}

class MarketQuotesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketQuotesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOM<MarketQuotesResponse_MarketQuotesInfo>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketQuotesInfo', protoName: 'marketQuotesInfo', subBuilder: MarketQuotesResponse_MarketQuotesInfo.create)
    ..hasRequiredFields = false
  ;

  MarketQuotesResponse._() : super();
  factory MarketQuotesResponse({
    $core.int? status,
    $core.String? error,
    $core.String? message,
    MarketQuotesResponse_MarketQuotesInfo? marketQuotesInfo,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (marketQuotesInfo != null) {
      _result.marketQuotesInfo = marketQuotesInfo;
    }
    return _result;
  }
  factory MarketQuotesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketQuotesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketQuotesResponse clone() => MarketQuotesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketQuotesResponse copyWith(void Function(MarketQuotesResponse) updates) => super.copyWith((message) => updates(message as MarketQuotesResponse)) as MarketQuotesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketQuotesResponse create() => MarketQuotesResponse._();
  MarketQuotesResponse createEmptyInstance() => create();
  static $pb.PbList<MarketQuotesResponse> createRepeated() => $pb.PbList<MarketQuotesResponse>();
  @$core.pragma('dart2js:noInline')
  static MarketQuotesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketQuotesResponse>(create);
  static MarketQuotesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  MarketQuotesResponse_MarketQuotesInfo get marketQuotesInfo => $_getN(3);
  @$pb.TagNumber(4)
  set marketQuotesInfo(MarketQuotesResponse_MarketQuotesInfo v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMarketQuotesInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearMarketQuotesInfo() => clearField(4);
  @$pb.TagNumber(4)
  MarketQuotesResponse_MarketQuotesInfo ensureMarketQuotesInfo() => $_ensure(3);
}

class SecDividendInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecDividendInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tradeDate', $pb.PbFieldType.O3, protoName: 'tradeDate')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyCount1', $pb.PbFieldType.O3, protoName: 'buyCount1')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyAmt1', $pb.PbFieldType.OD, protoName: 'buyAmt1')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyCount2', $pb.PbFieldType.O3, protoName: 'buyCount2')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyAmt2', $pb.PbFieldType.OD, protoName: 'buyAmt2')
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyCount3', $pb.PbFieldType.O3, protoName: 'buyCount3')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyAmt3', $pb.PbFieldType.OD, protoName: 'buyAmt3')
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellCount1', $pb.PbFieldType.O3, protoName: 'sellCount1')
    ..a<$core.double>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellAmt1', $pb.PbFieldType.OD, protoName: 'sellAmt1')
    ..a<$core.int>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellCount2', $pb.PbFieldType.O3, protoName: 'sellCount2')
    ..a<$core.double>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellAmt2', $pb.PbFieldType.OD, protoName: 'sellAmt2')
    ..a<$core.int>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellCount3', $pb.PbFieldType.O3, protoName: 'sellCount3')
    ..a<$core.double>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellAmt3', $pb.PbFieldType.OD, protoName: 'sellAmt3')
    ..hasRequiredFields = false
  ;

  SecDividendInfo._() : super();
  factory SecDividendInfo({
    $core.int? tradeDate,
    $core.String? secCd,
    $fixnum.Int64? time,
    $core.int? buyCount1,
    $core.double? buyAmt1,
    $core.int? buyCount2,
    $core.double? buyAmt2,
    $core.int? buyCount3,
    $core.double? buyAmt3,
    $core.int? sellCount1,
    $core.double? sellAmt1,
    $core.int? sellCount2,
    $core.double? sellAmt2,
    $core.int? sellCount3,
    $core.double? sellAmt3,
  }) {
    final _result = create();
    if (tradeDate != null) {
      _result.tradeDate = tradeDate;
    }
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (time != null) {
      _result.time = time;
    }
    if (buyCount1 != null) {
      _result.buyCount1 = buyCount1;
    }
    if (buyAmt1 != null) {
      _result.buyAmt1 = buyAmt1;
    }
    if (buyCount2 != null) {
      _result.buyCount2 = buyCount2;
    }
    if (buyAmt2 != null) {
      _result.buyAmt2 = buyAmt2;
    }
    if (buyCount3 != null) {
      _result.buyCount3 = buyCount3;
    }
    if (buyAmt3 != null) {
      _result.buyAmt3 = buyAmt3;
    }
    if (sellCount1 != null) {
      _result.sellCount1 = sellCount1;
    }
    if (sellAmt1 != null) {
      _result.sellAmt1 = sellAmt1;
    }
    if (sellCount2 != null) {
      _result.sellCount2 = sellCount2;
    }
    if (sellAmt2 != null) {
      _result.sellAmt2 = sellAmt2;
    }
    if (sellCount3 != null) {
      _result.sellCount3 = sellCount3;
    }
    if (sellAmt3 != null) {
      _result.sellAmt3 = sellAmt3;
    }
    return _result;
  }
  factory SecDividendInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SecDividendInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SecDividendInfo clone() => SecDividendInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SecDividendInfo copyWith(void Function(SecDividendInfo) updates) => super.copyWith((message) => updates(message as SecDividendInfo)) as SecDividendInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SecDividendInfo create() => SecDividendInfo._();
  SecDividendInfo createEmptyInstance() => create();
  static $pb.PbList<SecDividendInfo> createRepeated() => $pb.PbList<SecDividendInfo>();
  @$core.pragma('dart2js:noInline')
  static SecDividendInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SecDividendInfo>(create);
  static SecDividendInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tradeDate => $_getIZ(0);
  @$pb.TagNumber(1)
  set tradeDate($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTradeDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearTradeDate() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get secCd => $_getSZ(1);
  @$pb.TagNumber(2)
  set secCd($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecCd() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get time => $_getI64(2);
  @$pb.TagNumber(3)
  set time($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get buyCount1 => $_getIZ(3);
  @$pb.TagNumber(4)
  set buyCount1($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBuyCount1() => $_has(3);
  @$pb.TagNumber(4)
  void clearBuyCount1() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get buyAmt1 => $_getN(4);
  @$pb.TagNumber(5)
  set buyAmt1($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBuyAmt1() => $_has(4);
  @$pb.TagNumber(5)
  void clearBuyAmt1() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get buyCount2 => $_getIZ(5);
  @$pb.TagNumber(6)
  set buyCount2($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBuyCount2() => $_has(5);
  @$pb.TagNumber(6)
  void clearBuyCount2() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get buyAmt2 => $_getN(6);
  @$pb.TagNumber(7)
  set buyAmt2($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBuyAmt2() => $_has(6);
  @$pb.TagNumber(7)
  void clearBuyAmt2() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get buyCount3 => $_getIZ(7);
  @$pb.TagNumber(8)
  set buyCount3($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasBuyCount3() => $_has(7);
  @$pb.TagNumber(8)
  void clearBuyCount3() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get buyAmt3 => $_getN(8);
  @$pb.TagNumber(9)
  set buyAmt3($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasBuyAmt3() => $_has(8);
  @$pb.TagNumber(9)
  void clearBuyAmt3() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get sellCount1 => $_getIZ(9);
  @$pb.TagNumber(10)
  set sellCount1($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSellCount1() => $_has(9);
  @$pb.TagNumber(10)
  void clearSellCount1() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get sellAmt1 => $_getN(10);
  @$pb.TagNumber(11)
  set sellAmt1($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSellAmt1() => $_has(10);
  @$pb.TagNumber(11)
  void clearSellAmt1() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get sellCount2 => $_getIZ(11);
  @$pb.TagNumber(12)
  set sellCount2($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasSellCount2() => $_has(11);
  @$pb.TagNumber(12)
  void clearSellCount2() => clearField(12);

  @$pb.TagNumber(13)
  $core.double get sellAmt2 => $_getN(12);
  @$pb.TagNumber(13)
  set sellAmt2($core.double v) { $_setDouble(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasSellAmt2() => $_has(12);
  @$pb.TagNumber(13)
  void clearSellAmt2() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get sellCount3 => $_getIZ(13);
  @$pb.TagNumber(14)
  set sellCount3($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasSellCount3() => $_has(13);
  @$pb.TagNumber(14)
  void clearSellCount3() => clearField(14);

  @$pb.TagNumber(15)
  $core.double get sellAmt3 => $_getN(14);
  @$pb.TagNumber(15)
  set sellAmt3($core.double v) { $_setDouble(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasSellAmt3() => $_has(14);
  @$pb.TagNumber(15)
  void clearSellAmt3() => clearField(15);
}

class SecIntradayInput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecIntradayInput', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userID', protoName: 'userID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset', $pb.PbFieldType.O3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit', $pb.PbFieldType.O3)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..hasRequiredFields = false
  ;

  SecIntradayInput._() : super();
  factory SecIntradayInput({
    $core.String? userID,
    $core.String? secCd,
    $core.int? offset,
    $core.int? limit,
    $core.String? authenCode,
  }) {
    final _result = create();
    if (userID != null) {
      _result.userID = userID;
    }
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    return _result;
  }
  factory SecIntradayInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SecIntradayInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SecIntradayInput clone() => SecIntradayInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SecIntradayInput copyWith(void Function(SecIntradayInput) updates) => super.copyWith((message) => updates(message as SecIntradayInput)) as SecIntradayInput; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SecIntradayInput create() => SecIntradayInput._();
  SecIntradayInput createEmptyInstance() => create();
  static $pb.PbList<SecIntradayInput> createRepeated() => $pb.PbList<SecIntradayInput>();
  @$core.pragma('dart2js:noInline')
  static SecIntradayInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SecIntradayInput>(create);
  static SecIntradayInput? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userID => $_getSZ(0);
  @$pb.TagNumber(1)
  set userID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get secCd => $_getSZ(1);
  @$pb.TagNumber(2)
  set secCd($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecCd() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get limit => $_getIZ(3);
  @$pb.TagNumber(4)
  set limit($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearLimit() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get authenCode => $_getSZ(4);
  @$pb.TagNumber(5)
  set authenCode($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAuthenCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearAuthenCode() => clearField(5);
}

class SecIntradayResponse_SecIntradayInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecIntradayResponse.SecIntradayInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price', $pb.PbFieldType.OD)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'qty', $pb.PbFieldType.OD)
    ..e<STOCK_COLOR_CODE>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'colorCode', $pb.PbFieldType.OE, protoName: 'colorCode', defaultOrMaker: STOCK_COLOR_CODE.BASIC_PRICE, valueOf: STOCK_COLOR_CODE.valueOf, enumValues: STOCK_COLOR_CODE.values)
    ..aOM<NullableString>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'side', subBuilder: NullableString.create)
    ..hasRequiredFields = false
  ;

  SecIntradayResponse_SecIntradayInfo._() : super();
  factory SecIntradayResponse_SecIntradayInfo({
    $core.String? time,
    $core.double? price,
    $core.double? qty,
    STOCK_COLOR_CODE? colorCode,
    NullableString? side,
  }) {
    final _result = create();
    if (time != null) {
      _result.time = time;
    }
    if (price != null) {
      _result.price = price;
    }
    if (qty != null) {
      _result.qty = qty;
    }
    if (colorCode != null) {
      _result.colorCode = colorCode;
    }
    if (side != null) {
      _result.side = side;
    }
    return _result;
  }
  factory SecIntradayResponse_SecIntradayInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SecIntradayResponse_SecIntradayInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SecIntradayResponse_SecIntradayInfo clone() => SecIntradayResponse_SecIntradayInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SecIntradayResponse_SecIntradayInfo copyWith(void Function(SecIntradayResponse_SecIntradayInfo) updates) => super.copyWith((message) => updates(message as SecIntradayResponse_SecIntradayInfo)) as SecIntradayResponse_SecIntradayInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SecIntradayResponse_SecIntradayInfo create() => SecIntradayResponse_SecIntradayInfo._();
  SecIntradayResponse_SecIntradayInfo createEmptyInstance() => create();
  static $pb.PbList<SecIntradayResponse_SecIntradayInfo> createRepeated() => $pb.PbList<SecIntradayResponse_SecIntradayInfo>();
  @$core.pragma('dart2js:noInline')
  static SecIntradayResponse_SecIntradayInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SecIntradayResponse_SecIntradayInfo>(create);
  static SecIntradayResponse_SecIntradayInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get time => $_getSZ(0);
  @$pb.TagNumber(1)
  set time($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get price => $_getN(1);
  @$pb.TagNumber(2)
  set price($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get qty => $_getN(2);
  @$pb.TagNumber(3)
  set qty($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasQty() => $_has(2);
  @$pb.TagNumber(3)
  void clearQty() => clearField(3);

  @$pb.TagNumber(4)
  STOCK_COLOR_CODE get colorCode => $_getN(3);
  @$pb.TagNumber(4)
  set colorCode(STOCK_COLOR_CODE v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasColorCode() => $_has(3);
  @$pb.TagNumber(4)
  void clearColorCode() => clearField(4);

  @$pb.TagNumber(5)
  NullableString get side => $_getN(4);
  @$pb.TagNumber(5)
  set side(NullableString v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasSide() => $_has(4);
  @$pb.TagNumber(5)
  void clearSide() => clearField(5);
  @$pb.TagNumber(5)
  NullableString ensureSide() => $_ensure(4);
}

class SecIntradayResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SecIntradayResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..pc<SecIntradayResponse_SecIntradayInfo>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secIntradayInfo', $pb.PbFieldType.PM, protoName: 'secIntradayInfo', subBuilder: SecIntradayResponse_SecIntradayInfo.create)
    ..hasRequiredFields = false
  ;

  SecIntradayResponse._() : super();
  factory SecIntradayResponse({
    $core.int? status,
    $core.String? error,
    $core.String? message,
    $core.Iterable<SecIntradayResponse_SecIntradayInfo>? secIntradayInfo,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (secIntradayInfo != null) {
      _result.secIntradayInfo.addAll(secIntradayInfo);
    }
    return _result;
  }
  factory SecIntradayResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SecIntradayResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SecIntradayResponse clone() => SecIntradayResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SecIntradayResponse copyWith(void Function(SecIntradayResponse) updates) => super.copyWith((message) => updates(message as SecIntradayResponse)) as SecIntradayResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SecIntradayResponse create() => SecIntradayResponse._();
  SecIntradayResponse createEmptyInstance() => create();
  static $pb.PbList<SecIntradayResponse> createRepeated() => $pb.PbList<SecIntradayResponse>();
  @$core.pragma('dart2js:noInline')
  static SecIntradayResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SecIntradayResponse>(create);
  static SecIntradayResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<SecIntradayResponse_SecIntradayInfo> get secIntradayInfo => $_getList(3);
}

class ScreenerInput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ScreenerInput', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOM<NullableString>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', protoName: 'marketCd', subBuilder: NullableString.create)
    ..aOM<NullableString>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'industries', subBuilder: NullableString.create)
    ..aOM<NullableString>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'quotesIndicators', protoName: 'quotesIndicators', subBuilder: NullableString.create)
    ..aOM<NullableString>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'financialIndicators', protoName: 'financialIndicators', subBuilder: NullableString.create)
    ..aOM<NullableString>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'technicalIndicators', protoName: 'technicalIndicators', subBuilder: NullableString.create)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderFieldType', $pb.PbFieldType.O3, protoName: 'orderFieldType')
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderType', $pb.PbFieldType.O3, protoName: 'orderType')
    ..a<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset', $pb.PbFieldType.O3)
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit', $pb.PbFieldType.O3)
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..hasRequiredFields = false
  ;

  ScreenerInput._() : super();
  factory ScreenerInput({
    NullableString? marketCd,
    NullableString? industries,
    NullableString? quotesIndicators,
    NullableString? financialIndicators,
    NullableString? technicalIndicators,
    $core.int? orderFieldType,
    $core.int? orderType,
    $core.int? offset,
    $core.int? limit,
    $core.String? authenCode,
  }) {
    final _result = create();
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    if (industries != null) {
      _result.industries = industries;
    }
    if (quotesIndicators != null) {
      _result.quotesIndicators = quotesIndicators;
    }
    if (financialIndicators != null) {
      _result.financialIndicators = financialIndicators;
    }
    if (technicalIndicators != null) {
      _result.technicalIndicators = technicalIndicators;
    }
    if (orderFieldType != null) {
      _result.orderFieldType = orderFieldType;
    }
    if (orderType != null) {
      _result.orderType = orderType;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    return _result;
  }
  factory ScreenerInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScreenerInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScreenerInput clone() => ScreenerInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScreenerInput copyWith(void Function(ScreenerInput) updates) => super.copyWith((message) => updates(message as ScreenerInput)) as ScreenerInput; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenerInput create() => ScreenerInput._();
  ScreenerInput createEmptyInstance() => create();
  static $pb.PbList<ScreenerInput> createRepeated() => $pb.PbList<ScreenerInput>();
  @$core.pragma('dart2js:noInline')
  static ScreenerInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScreenerInput>(create);
  static ScreenerInput? _defaultInstance;

  @$pb.TagNumber(1)
  NullableString get marketCd => $_getN(0);
  @$pb.TagNumber(1)
  set marketCd(NullableString v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMarketCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearMarketCd() => clearField(1);
  @$pb.TagNumber(1)
  NullableString ensureMarketCd() => $_ensure(0);

  @$pb.TagNumber(2)
  NullableString get industries => $_getN(1);
  @$pb.TagNumber(2)
  set industries(NullableString v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndustries() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndustries() => clearField(2);
  @$pb.TagNumber(2)
  NullableString ensureIndustries() => $_ensure(1);

  @$pb.TagNumber(3)
  NullableString get quotesIndicators => $_getN(2);
  @$pb.TagNumber(3)
  set quotesIndicators(NullableString v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasQuotesIndicators() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuotesIndicators() => clearField(3);
  @$pb.TagNumber(3)
  NullableString ensureQuotesIndicators() => $_ensure(2);

  @$pb.TagNumber(4)
  NullableString get financialIndicators => $_getN(3);
  @$pb.TagNumber(4)
  set financialIndicators(NullableString v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFinancialIndicators() => $_has(3);
  @$pb.TagNumber(4)
  void clearFinancialIndicators() => clearField(4);
  @$pb.TagNumber(4)
  NullableString ensureFinancialIndicators() => $_ensure(3);

  @$pb.TagNumber(5)
  NullableString get technicalIndicators => $_getN(4);
  @$pb.TagNumber(5)
  set technicalIndicators(NullableString v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTechnicalIndicators() => $_has(4);
  @$pb.TagNumber(5)
  void clearTechnicalIndicators() => clearField(5);
  @$pb.TagNumber(5)
  NullableString ensureTechnicalIndicators() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.int get orderFieldType => $_getIZ(5);
  @$pb.TagNumber(6)
  set orderFieldType($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOrderFieldType() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrderFieldType() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get orderType => $_getIZ(6);
  @$pb.TagNumber(7)
  set orderType($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOrderType() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrderType() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get offset => $_getIZ(7);
  @$pb.TagNumber(8)
  set offset($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasOffset() => $_has(7);
  @$pb.TagNumber(8)
  void clearOffset() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get limit => $_getIZ(8);
  @$pb.TagNumber(9)
  set limit($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLimit() => $_has(8);
  @$pb.TagNumber(9)
  void clearLimit() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get authenCode => $_getSZ(9);
  @$pb.TagNumber(10)
  set authenCode($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAuthenCode() => $_has(9);
  @$pb.TagNumber(10)
  void clearAuthenCode() => clearField(10);
}

class ScreenerResponse_SecDetailInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ScreenerResponse.SecDetailInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secName', protoName: 'secName')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secType', $pb.PbFieldType.O3, protoName: 'secType')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', protoName: 'marketCd')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'basicPrice', $pb.PbFieldType.OD, protoName: 'basicPrice')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ceilingPrice', $pb.PbFieldType.OD, protoName: 'ceilingPrice')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'floorPrice', $pb.PbFieldType.OD, protoName: 'floorPrice')
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'highestPrice', $pb.PbFieldType.OD, protoName: 'highestPrice')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lowestPrice', $pb.PbFieldType.OD, protoName: 'lowestPrice')
    ..a<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avgPrice', $pb.PbFieldType.OD, protoName: 'avgPrice')
    ..a<$core.double>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastPrice', $pb.PbFieldType.OD, protoName: 'lastPrice')
    ..a<$core.double>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastQty', $pb.PbFieldType.OD, protoName: 'lastQty')
    ..a<$core.double>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalQty', $pb.PbFieldType.OD, protoName: 'totalQty')
    ..a<$core.double>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalAmt', $pb.PbFieldType.OD, protoName: 'totalAmt')
    ..a<$core.double>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalPtQty', $pb.PbFieldType.OD, protoName: 'totalPtQty')
    ..a<$core.double>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalPtAmt', $pb.PbFieldType.OD, protoName: 'totalPtAmt')
    ..a<$core.double>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellForeignQty', $pb.PbFieldType.OD, protoName: 'sellForeignQty')
    ..a<$core.double>(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyForeignQty', $pb.PbFieldType.OD, protoName: 'buyForeignQty')
    ..a<$core.double>(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePoint', $pb.PbFieldType.OD, protoName: 'changePoint')
    ..a<$core.double>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePercent', $pb.PbFieldType.OD, protoName: 'changePercent')
    ..a<$core.double>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalRoom', $pb.PbFieldType.OD, protoName: 'totalRoom')
    ..a<$core.double>(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currentRoom', $pb.PbFieldType.OD, protoName: 'currentRoom')
    ..a<$core.double>(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'w52High', $pb.PbFieldType.OD, protoName: 'w52High')
    ..a<$core.double>(24, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'w52Low', $pb.PbFieldType.OD, protoName: 'w52Low')
    ..aOS(25, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best1BidPriceStr', protoName: 'best1BidPriceStr')
    ..a<$core.double>(26, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best1BidPrice', $pb.PbFieldType.OD, protoName: 'best1BidPrice')
    ..a<$core.double>(27, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best1BidQty', $pb.PbFieldType.OD, protoName: 'best1BidQty')
    ..a<$core.double>(28, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best2BidPrice', $pb.PbFieldType.OD, protoName: 'best2BidPrice')
    ..a<$core.double>(29, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best2BidQty', $pb.PbFieldType.OD, protoName: 'best2BidQty')
    ..a<$core.double>(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best3BidPrice', $pb.PbFieldType.OD, protoName: 'best3BidPrice')
    ..a<$core.double>(31, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best3BidQty', $pb.PbFieldType.OD, protoName: 'best3BidQty')
    ..a<$core.double>(32, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best4BidQty', $pb.PbFieldType.OD, protoName: 'best4BidQty')
    ..aOS(33, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best1OfferPriceStr', protoName: 'best1OfferPriceStr')
    ..a<$core.double>(34, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best1OfferPrice', $pb.PbFieldType.OD, protoName: 'best1OfferPrice')
    ..a<$core.double>(35, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best1OfferQty', $pb.PbFieldType.OD, protoName: 'best1OfferQty')
    ..a<$core.double>(36, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best2OfferPrice', $pb.PbFieldType.OD, protoName: 'best2OfferPrice')
    ..a<$core.double>(37, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best2OfferQty', $pb.PbFieldType.OD, protoName: 'best2OfferQty')
    ..a<$core.double>(38, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best3OfferPrice', $pb.PbFieldType.OD, protoName: 'best3OfferPrice')
    ..a<$core.double>(39, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best3OfferQty', $pb.PbFieldType.OD, protoName: 'best3OfferQty')
    ..a<$core.double>(40, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'best4OfferQty', $pb.PbFieldType.OD, protoName: 'best4OfferQty')
    ..a<$core.double>(41, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'listedQty', $pb.PbFieldType.OD, protoName: 'listedQty')
    ..a<$core.double>(42, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tradeQty', $pb.PbFieldType.OD, protoName: 'tradeQty')
    ..a<$core.double>(43, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tradePercent', $pb.PbFieldType.OD, protoName: 'tradePercent')
    ..a<$core.double>(44, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'esp', $pb.PbFieldType.OD)
    ..a<$core.double>(45, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pe', $pb.PbFieldType.OD)
    ..a<$core.double>(46, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pb', $pb.PbFieldType.OD)
    ..a<$core.double>(47, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ps', $pb.PbFieldType.OD)
    ..a<$core.double>(48, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bookValue', $pb.PbFieldType.OD, protoName: 'bookValue')
    ..a<$core.double>(49, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dividendAmt', $pb.PbFieldType.OD, protoName: 'dividendAmt')
    ..a<$core.double>(50, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dividendRate', $pb.PbFieldType.OD, protoName: 'dividendRate')
    ..aOS(51, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secNameEn', protoName: 'secNameEn')
    ..a<$core.double>(52, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCap', $pb.PbFieldType.OD, protoName: 'marketCap')
    ..a<$core.double>(53, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roa', $pb.PbFieldType.OD)
    ..a<$core.double>(54, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roe', $pb.PbFieldType.OD)
    ..a<$core.double>(55, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'netSale', $pb.PbFieldType.OD, protoName: 'netSale')
    ..e<STOCK_COLOR_CODE>(56, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'colorCode', $pb.PbFieldType.OE, protoName: 'colorCode', defaultOrMaker: STOCK_COLOR_CODE.BASIC_PRICE, valueOf: STOCK_COLOR_CODE.valueOf, enumValues: STOCK_COLOR_CODE.values)
    ..hasRequiredFields = false
  ;

  ScreenerResponse_SecDetailInfo._() : super();
  factory ScreenerResponse_SecDetailInfo({
    $core.String? secCd,
    $core.String? secName,
    $core.int? secType,
    $core.String? marketCd,
    $core.double? basicPrice,
    $core.double? ceilingPrice,
    $core.double? floorPrice,
    $core.double? highestPrice,
    $core.double? lowestPrice,
    $core.double? avgPrice,
    $core.double? lastPrice,
    $core.double? lastQty,
    $core.double? totalQty,
    $core.double? totalAmt,
    $core.double? totalPtQty,
    $core.double? totalPtAmt,
    $core.double? sellForeignQty,
    $core.double? buyForeignQty,
    $core.double? changePoint,
    $core.double? changePercent,
    $core.double? totalRoom,
    $core.double? currentRoom,
    $core.double? w52High,
    $core.double? w52Low,
    $core.String? best1BidPriceStr,
    $core.double? best1BidPrice,
    $core.double? best1BidQty,
    $core.double? best2BidPrice,
    $core.double? best2BidQty,
    $core.double? best3BidPrice,
    $core.double? best3BidQty,
    $core.double? best4BidQty,
    $core.String? best1OfferPriceStr,
    $core.double? best1OfferPrice,
    $core.double? best1OfferQty,
    $core.double? best2OfferPrice,
    $core.double? best2OfferQty,
    $core.double? best3OfferPrice,
    $core.double? best3OfferQty,
    $core.double? best4OfferQty,
    $core.double? listedQty,
    $core.double? tradeQty,
    $core.double? tradePercent,
    $core.double? esp,
    $core.double? pe,
    $core.double? pb,
    $core.double? ps,
    $core.double? bookValue,
    $core.double? dividendAmt,
    $core.double? dividendRate,
    $core.String? secNameEn,
    $core.double? marketCap,
    $core.double? roa,
    $core.double? roe,
    $core.double? netSale,
    STOCK_COLOR_CODE? colorCode,
  }) {
    final _result = create();
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (secName != null) {
      _result.secName = secName;
    }
    if (secType != null) {
      _result.secType = secType;
    }
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    if (basicPrice != null) {
      _result.basicPrice = basicPrice;
    }
    if (ceilingPrice != null) {
      _result.ceilingPrice = ceilingPrice;
    }
    if (floorPrice != null) {
      _result.floorPrice = floorPrice;
    }
    if (highestPrice != null) {
      _result.highestPrice = highestPrice;
    }
    if (lowestPrice != null) {
      _result.lowestPrice = lowestPrice;
    }
    if (avgPrice != null) {
      _result.avgPrice = avgPrice;
    }
    if (lastPrice != null) {
      _result.lastPrice = lastPrice;
    }
    if (lastQty != null) {
      _result.lastQty = lastQty;
    }
    if (totalQty != null) {
      _result.totalQty = totalQty;
    }
    if (totalAmt != null) {
      _result.totalAmt = totalAmt;
    }
    if (totalPtQty != null) {
      _result.totalPtQty = totalPtQty;
    }
    if (totalPtAmt != null) {
      _result.totalPtAmt = totalPtAmt;
    }
    if (sellForeignQty != null) {
      _result.sellForeignQty = sellForeignQty;
    }
    if (buyForeignQty != null) {
      _result.buyForeignQty = buyForeignQty;
    }
    if (changePoint != null) {
      _result.changePoint = changePoint;
    }
    if (changePercent != null) {
      _result.changePercent = changePercent;
    }
    if (totalRoom != null) {
      _result.totalRoom = totalRoom;
    }
    if (currentRoom != null) {
      _result.currentRoom = currentRoom;
    }
    if (w52High != null) {
      _result.w52High = w52High;
    }
    if (w52Low != null) {
      _result.w52Low = w52Low;
    }
    if (best1BidPriceStr != null) {
      _result.best1BidPriceStr = best1BidPriceStr;
    }
    if (best1BidPrice != null) {
      _result.best1BidPrice = best1BidPrice;
    }
    if (best1BidQty != null) {
      _result.best1BidQty = best1BidQty;
    }
    if (best2BidPrice != null) {
      _result.best2BidPrice = best2BidPrice;
    }
    if (best2BidQty != null) {
      _result.best2BidQty = best2BidQty;
    }
    if (best3BidPrice != null) {
      _result.best3BidPrice = best3BidPrice;
    }
    if (best3BidQty != null) {
      _result.best3BidQty = best3BidQty;
    }
    if (best4BidQty != null) {
      _result.best4BidQty = best4BidQty;
    }
    if (best1OfferPriceStr != null) {
      _result.best1OfferPriceStr = best1OfferPriceStr;
    }
    if (best1OfferPrice != null) {
      _result.best1OfferPrice = best1OfferPrice;
    }
    if (best1OfferQty != null) {
      _result.best1OfferQty = best1OfferQty;
    }
    if (best2OfferPrice != null) {
      _result.best2OfferPrice = best2OfferPrice;
    }
    if (best2OfferQty != null) {
      _result.best2OfferQty = best2OfferQty;
    }
    if (best3OfferPrice != null) {
      _result.best3OfferPrice = best3OfferPrice;
    }
    if (best3OfferQty != null) {
      _result.best3OfferQty = best3OfferQty;
    }
    if (best4OfferQty != null) {
      _result.best4OfferQty = best4OfferQty;
    }
    if (listedQty != null) {
      _result.listedQty = listedQty;
    }
    if (tradeQty != null) {
      _result.tradeQty = tradeQty;
    }
    if (tradePercent != null) {
      _result.tradePercent = tradePercent;
    }
    if (esp != null) {
      _result.esp = esp;
    }
    if (pe != null) {
      _result.pe = pe;
    }
    if (pb != null) {
      _result.pb = pb;
    }
    if (ps != null) {
      _result.ps = ps;
    }
    if (bookValue != null) {
      _result.bookValue = bookValue;
    }
    if (dividendAmt != null) {
      _result.dividendAmt = dividendAmt;
    }
    if (dividendRate != null) {
      _result.dividendRate = dividendRate;
    }
    if (secNameEn != null) {
      _result.secNameEn = secNameEn;
    }
    if (marketCap != null) {
      _result.marketCap = marketCap;
    }
    if (roa != null) {
      _result.roa = roa;
    }
    if (roe != null) {
      _result.roe = roe;
    }
    if (netSale != null) {
      _result.netSale = netSale;
    }
    if (colorCode != null) {
      _result.colorCode = colorCode;
    }
    return _result;
  }
  factory ScreenerResponse_SecDetailInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScreenerResponse_SecDetailInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScreenerResponse_SecDetailInfo clone() => ScreenerResponse_SecDetailInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScreenerResponse_SecDetailInfo copyWith(void Function(ScreenerResponse_SecDetailInfo) updates) => super.copyWith((message) => updates(message as ScreenerResponse_SecDetailInfo)) as ScreenerResponse_SecDetailInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenerResponse_SecDetailInfo create() => ScreenerResponse_SecDetailInfo._();
  ScreenerResponse_SecDetailInfo createEmptyInstance() => create();
  static $pb.PbList<ScreenerResponse_SecDetailInfo> createRepeated() => $pb.PbList<ScreenerResponse_SecDetailInfo>();
  @$core.pragma('dart2js:noInline')
  static ScreenerResponse_SecDetailInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScreenerResponse_SecDetailInfo>(create);
  static ScreenerResponse_SecDetailInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get secCd => $_getSZ(0);
  @$pb.TagNumber(1)
  set secCd($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSecCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get secName => $_getSZ(1);
  @$pb.TagNumber(2)
  set secName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get secType => $_getIZ(2);
  @$pb.TagNumber(3)
  set secType($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSecType() => $_has(2);
  @$pb.TagNumber(3)
  void clearSecType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get marketCd => $_getSZ(3);
  @$pb.TagNumber(4)
  set marketCd($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMarketCd() => $_has(3);
  @$pb.TagNumber(4)
  void clearMarketCd() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get basicPrice => $_getN(4);
  @$pb.TagNumber(5)
  set basicPrice($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBasicPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearBasicPrice() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get ceilingPrice => $_getN(5);
  @$pb.TagNumber(6)
  set ceilingPrice($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCeilingPrice() => $_has(5);
  @$pb.TagNumber(6)
  void clearCeilingPrice() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get floorPrice => $_getN(6);
  @$pb.TagNumber(7)
  set floorPrice($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasFloorPrice() => $_has(6);
  @$pb.TagNumber(7)
  void clearFloorPrice() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get highestPrice => $_getN(7);
  @$pb.TagNumber(8)
  set highestPrice($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasHighestPrice() => $_has(7);
  @$pb.TagNumber(8)
  void clearHighestPrice() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get lowestPrice => $_getN(8);
  @$pb.TagNumber(9)
  set lowestPrice($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLowestPrice() => $_has(8);
  @$pb.TagNumber(9)
  void clearLowestPrice() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get avgPrice => $_getN(9);
  @$pb.TagNumber(10)
  set avgPrice($core.double v) { $_setDouble(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAvgPrice() => $_has(9);
  @$pb.TagNumber(10)
  void clearAvgPrice() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get lastPrice => $_getN(10);
  @$pb.TagNumber(11)
  set lastPrice($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasLastPrice() => $_has(10);
  @$pb.TagNumber(11)
  void clearLastPrice() => clearField(11);

  @$pb.TagNumber(12)
  $core.double get lastQty => $_getN(11);
  @$pb.TagNumber(12)
  set lastQty($core.double v) { $_setDouble(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasLastQty() => $_has(11);
  @$pb.TagNumber(12)
  void clearLastQty() => clearField(12);

  @$pb.TagNumber(13)
  $core.double get totalQty => $_getN(12);
  @$pb.TagNumber(13)
  set totalQty($core.double v) { $_setDouble(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasTotalQty() => $_has(12);
  @$pb.TagNumber(13)
  void clearTotalQty() => clearField(13);

  @$pb.TagNumber(14)
  $core.double get totalAmt => $_getN(13);
  @$pb.TagNumber(14)
  set totalAmt($core.double v) { $_setDouble(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasTotalAmt() => $_has(13);
  @$pb.TagNumber(14)
  void clearTotalAmt() => clearField(14);

  @$pb.TagNumber(15)
  $core.double get totalPtQty => $_getN(14);
  @$pb.TagNumber(15)
  set totalPtQty($core.double v) { $_setDouble(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasTotalPtQty() => $_has(14);
  @$pb.TagNumber(15)
  void clearTotalPtQty() => clearField(15);

  @$pb.TagNumber(16)
  $core.double get totalPtAmt => $_getN(15);
  @$pb.TagNumber(16)
  set totalPtAmt($core.double v) { $_setDouble(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasTotalPtAmt() => $_has(15);
  @$pb.TagNumber(16)
  void clearTotalPtAmt() => clearField(16);

  @$pb.TagNumber(17)
  $core.double get sellForeignQty => $_getN(16);
  @$pb.TagNumber(17)
  set sellForeignQty($core.double v) { $_setDouble(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasSellForeignQty() => $_has(16);
  @$pb.TagNumber(17)
  void clearSellForeignQty() => clearField(17);

  @$pb.TagNumber(18)
  $core.double get buyForeignQty => $_getN(17);
  @$pb.TagNumber(18)
  set buyForeignQty($core.double v) { $_setDouble(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasBuyForeignQty() => $_has(17);
  @$pb.TagNumber(18)
  void clearBuyForeignQty() => clearField(18);

  @$pb.TagNumber(19)
  $core.double get changePoint => $_getN(18);
  @$pb.TagNumber(19)
  set changePoint($core.double v) { $_setDouble(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasChangePoint() => $_has(18);
  @$pb.TagNumber(19)
  void clearChangePoint() => clearField(19);

  @$pb.TagNumber(20)
  $core.double get changePercent => $_getN(19);
  @$pb.TagNumber(20)
  set changePercent($core.double v) { $_setDouble(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasChangePercent() => $_has(19);
  @$pb.TagNumber(20)
  void clearChangePercent() => clearField(20);

  @$pb.TagNumber(21)
  $core.double get totalRoom => $_getN(20);
  @$pb.TagNumber(21)
  set totalRoom($core.double v) { $_setDouble(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasTotalRoom() => $_has(20);
  @$pb.TagNumber(21)
  void clearTotalRoom() => clearField(21);

  @$pb.TagNumber(22)
  $core.double get currentRoom => $_getN(21);
  @$pb.TagNumber(22)
  set currentRoom($core.double v) { $_setDouble(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasCurrentRoom() => $_has(21);
  @$pb.TagNumber(22)
  void clearCurrentRoom() => clearField(22);

  @$pb.TagNumber(23)
  $core.double get w52High => $_getN(22);
  @$pb.TagNumber(23)
  set w52High($core.double v) { $_setDouble(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasW52High() => $_has(22);
  @$pb.TagNumber(23)
  void clearW52High() => clearField(23);

  @$pb.TagNumber(24)
  $core.double get w52Low => $_getN(23);
  @$pb.TagNumber(24)
  set w52Low($core.double v) { $_setDouble(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasW52Low() => $_has(23);
  @$pb.TagNumber(24)
  void clearW52Low() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get best1BidPriceStr => $_getSZ(24);
  @$pb.TagNumber(25)
  set best1BidPriceStr($core.String v) { $_setString(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasBest1BidPriceStr() => $_has(24);
  @$pb.TagNumber(25)
  void clearBest1BidPriceStr() => clearField(25);

  @$pb.TagNumber(26)
  $core.double get best1BidPrice => $_getN(25);
  @$pb.TagNumber(26)
  set best1BidPrice($core.double v) { $_setDouble(25, v); }
  @$pb.TagNumber(26)
  $core.bool hasBest1BidPrice() => $_has(25);
  @$pb.TagNumber(26)
  void clearBest1BidPrice() => clearField(26);

  @$pb.TagNumber(27)
  $core.double get best1BidQty => $_getN(26);
  @$pb.TagNumber(27)
  set best1BidQty($core.double v) { $_setDouble(26, v); }
  @$pb.TagNumber(27)
  $core.bool hasBest1BidQty() => $_has(26);
  @$pb.TagNumber(27)
  void clearBest1BidQty() => clearField(27);

  @$pb.TagNumber(28)
  $core.double get best2BidPrice => $_getN(27);
  @$pb.TagNumber(28)
  set best2BidPrice($core.double v) { $_setDouble(27, v); }
  @$pb.TagNumber(28)
  $core.bool hasBest2BidPrice() => $_has(27);
  @$pb.TagNumber(28)
  void clearBest2BidPrice() => clearField(28);

  @$pb.TagNumber(29)
  $core.double get best2BidQty => $_getN(28);
  @$pb.TagNumber(29)
  set best2BidQty($core.double v) { $_setDouble(28, v); }
  @$pb.TagNumber(29)
  $core.bool hasBest2BidQty() => $_has(28);
  @$pb.TagNumber(29)
  void clearBest2BidQty() => clearField(29);

  @$pb.TagNumber(30)
  $core.double get best3BidPrice => $_getN(29);
  @$pb.TagNumber(30)
  set best3BidPrice($core.double v) { $_setDouble(29, v); }
  @$pb.TagNumber(30)
  $core.bool hasBest3BidPrice() => $_has(29);
  @$pb.TagNumber(30)
  void clearBest3BidPrice() => clearField(30);

  @$pb.TagNumber(31)
  $core.double get best3BidQty => $_getN(30);
  @$pb.TagNumber(31)
  set best3BidQty($core.double v) { $_setDouble(30, v); }
  @$pb.TagNumber(31)
  $core.bool hasBest3BidQty() => $_has(30);
  @$pb.TagNumber(31)
  void clearBest3BidQty() => clearField(31);

  @$pb.TagNumber(32)
  $core.double get best4BidQty => $_getN(31);
  @$pb.TagNumber(32)
  set best4BidQty($core.double v) { $_setDouble(31, v); }
  @$pb.TagNumber(32)
  $core.bool hasBest4BidQty() => $_has(31);
  @$pb.TagNumber(32)
  void clearBest4BidQty() => clearField(32);

  @$pb.TagNumber(33)
  $core.String get best1OfferPriceStr => $_getSZ(32);
  @$pb.TagNumber(33)
  set best1OfferPriceStr($core.String v) { $_setString(32, v); }
  @$pb.TagNumber(33)
  $core.bool hasBest1OfferPriceStr() => $_has(32);
  @$pb.TagNumber(33)
  void clearBest1OfferPriceStr() => clearField(33);

  @$pb.TagNumber(34)
  $core.double get best1OfferPrice => $_getN(33);
  @$pb.TagNumber(34)
  set best1OfferPrice($core.double v) { $_setDouble(33, v); }
  @$pb.TagNumber(34)
  $core.bool hasBest1OfferPrice() => $_has(33);
  @$pb.TagNumber(34)
  void clearBest1OfferPrice() => clearField(34);

  @$pb.TagNumber(35)
  $core.double get best1OfferQty => $_getN(34);
  @$pb.TagNumber(35)
  set best1OfferQty($core.double v) { $_setDouble(34, v); }
  @$pb.TagNumber(35)
  $core.bool hasBest1OfferQty() => $_has(34);
  @$pb.TagNumber(35)
  void clearBest1OfferQty() => clearField(35);

  @$pb.TagNumber(36)
  $core.double get best2OfferPrice => $_getN(35);
  @$pb.TagNumber(36)
  set best2OfferPrice($core.double v) { $_setDouble(35, v); }
  @$pb.TagNumber(36)
  $core.bool hasBest2OfferPrice() => $_has(35);
  @$pb.TagNumber(36)
  void clearBest2OfferPrice() => clearField(36);

  @$pb.TagNumber(37)
  $core.double get best2OfferQty => $_getN(36);
  @$pb.TagNumber(37)
  set best2OfferQty($core.double v) { $_setDouble(36, v); }
  @$pb.TagNumber(37)
  $core.bool hasBest2OfferQty() => $_has(36);
  @$pb.TagNumber(37)
  void clearBest2OfferQty() => clearField(37);

  @$pb.TagNumber(38)
  $core.double get best3OfferPrice => $_getN(37);
  @$pb.TagNumber(38)
  set best3OfferPrice($core.double v) { $_setDouble(37, v); }
  @$pb.TagNumber(38)
  $core.bool hasBest3OfferPrice() => $_has(37);
  @$pb.TagNumber(38)
  void clearBest3OfferPrice() => clearField(38);

  @$pb.TagNumber(39)
  $core.double get best3OfferQty => $_getN(38);
  @$pb.TagNumber(39)
  set best3OfferQty($core.double v) { $_setDouble(38, v); }
  @$pb.TagNumber(39)
  $core.bool hasBest3OfferQty() => $_has(38);
  @$pb.TagNumber(39)
  void clearBest3OfferQty() => clearField(39);

  @$pb.TagNumber(40)
  $core.double get best4OfferQty => $_getN(39);
  @$pb.TagNumber(40)
  set best4OfferQty($core.double v) { $_setDouble(39, v); }
  @$pb.TagNumber(40)
  $core.bool hasBest4OfferQty() => $_has(39);
  @$pb.TagNumber(40)
  void clearBest4OfferQty() => clearField(40);

  @$pb.TagNumber(41)
  $core.double get listedQty => $_getN(40);
  @$pb.TagNumber(41)
  set listedQty($core.double v) { $_setDouble(40, v); }
  @$pb.TagNumber(41)
  $core.bool hasListedQty() => $_has(40);
  @$pb.TagNumber(41)
  void clearListedQty() => clearField(41);

  @$pb.TagNumber(42)
  $core.double get tradeQty => $_getN(41);
  @$pb.TagNumber(42)
  set tradeQty($core.double v) { $_setDouble(41, v); }
  @$pb.TagNumber(42)
  $core.bool hasTradeQty() => $_has(41);
  @$pb.TagNumber(42)
  void clearTradeQty() => clearField(42);

  @$pb.TagNumber(43)
  $core.double get tradePercent => $_getN(42);
  @$pb.TagNumber(43)
  set tradePercent($core.double v) { $_setDouble(42, v); }
  @$pb.TagNumber(43)
  $core.bool hasTradePercent() => $_has(42);
  @$pb.TagNumber(43)
  void clearTradePercent() => clearField(43);

  @$pb.TagNumber(44)
  $core.double get esp => $_getN(43);
  @$pb.TagNumber(44)
  set esp($core.double v) { $_setDouble(43, v); }
  @$pb.TagNumber(44)
  $core.bool hasEsp() => $_has(43);
  @$pb.TagNumber(44)
  void clearEsp() => clearField(44);

  @$pb.TagNumber(45)
  $core.double get pe => $_getN(44);
  @$pb.TagNumber(45)
  set pe($core.double v) { $_setDouble(44, v); }
  @$pb.TagNumber(45)
  $core.bool hasPe() => $_has(44);
  @$pb.TagNumber(45)
  void clearPe() => clearField(45);

  @$pb.TagNumber(46)
  $core.double get pb => $_getN(45);
  @$pb.TagNumber(46)
  set pb($core.double v) { $_setDouble(45, v); }
  @$pb.TagNumber(46)
  $core.bool hasPb() => $_has(45);
  @$pb.TagNumber(46)
  void clearPb() => clearField(46);

  @$pb.TagNumber(47)
  $core.double get ps => $_getN(46);
  @$pb.TagNumber(47)
  set ps($core.double v) { $_setDouble(46, v); }
  @$pb.TagNumber(47)
  $core.bool hasPs() => $_has(46);
  @$pb.TagNumber(47)
  void clearPs() => clearField(47);

  @$pb.TagNumber(48)
  $core.double get bookValue => $_getN(47);
  @$pb.TagNumber(48)
  set bookValue($core.double v) { $_setDouble(47, v); }
  @$pb.TagNumber(48)
  $core.bool hasBookValue() => $_has(47);
  @$pb.TagNumber(48)
  void clearBookValue() => clearField(48);

  @$pb.TagNumber(49)
  $core.double get dividendAmt => $_getN(48);
  @$pb.TagNumber(49)
  set dividendAmt($core.double v) { $_setDouble(48, v); }
  @$pb.TagNumber(49)
  $core.bool hasDividendAmt() => $_has(48);
  @$pb.TagNumber(49)
  void clearDividendAmt() => clearField(49);

  @$pb.TagNumber(50)
  $core.double get dividendRate => $_getN(49);
  @$pb.TagNumber(50)
  set dividendRate($core.double v) { $_setDouble(49, v); }
  @$pb.TagNumber(50)
  $core.bool hasDividendRate() => $_has(49);
  @$pb.TagNumber(50)
  void clearDividendRate() => clearField(50);

  @$pb.TagNumber(51)
  $core.String get secNameEn => $_getSZ(50);
  @$pb.TagNumber(51)
  set secNameEn($core.String v) { $_setString(50, v); }
  @$pb.TagNumber(51)
  $core.bool hasSecNameEn() => $_has(50);
  @$pb.TagNumber(51)
  void clearSecNameEn() => clearField(51);

  @$pb.TagNumber(52)
  $core.double get marketCap => $_getN(51);
  @$pb.TagNumber(52)
  set marketCap($core.double v) { $_setDouble(51, v); }
  @$pb.TagNumber(52)
  $core.bool hasMarketCap() => $_has(51);
  @$pb.TagNumber(52)
  void clearMarketCap() => clearField(52);

  @$pb.TagNumber(53)
  $core.double get roa => $_getN(52);
  @$pb.TagNumber(53)
  set roa($core.double v) { $_setDouble(52, v); }
  @$pb.TagNumber(53)
  $core.bool hasRoa() => $_has(52);
  @$pb.TagNumber(53)
  void clearRoa() => clearField(53);

  @$pb.TagNumber(54)
  $core.double get roe => $_getN(53);
  @$pb.TagNumber(54)
  set roe($core.double v) { $_setDouble(53, v); }
  @$pb.TagNumber(54)
  $core.bool hasRoe() => $_has(53);
  @$pb.TagNumber(54)
  void clearRoe() => clearField(54);

  @$pb.TagNumber(55)
  $core.double get netSale => $_getN(54);
  @$pb.TagNumber(55)
  set netSale($core.double v) { $_setDouble(54, v); }
  @$pb.TagNumber(55)
  $core.bool hasNetSale() => $_has(54);
  @$pb.TagNumber(55)
  void clearNetSale() => clearField(55);

  @$pb.TagNumber(56)
  STOCK_COLOR_CODE get colorCode => $_getN(55);
  @$pb.TagNumber(56)
  set colorCode(STOCK_COLOR_CODE v) { setField(56, v); }
  @$pb.TagNumber(56)
  $core.bool hasColorCode() => $_has(55);
  @$pb.TagNumber(56)
  void clearColorCode() => clearField(56);
}

class ScreenerResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ScreenerResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalRecords', $pb.PbFieldType.O3, protoName: 'totalRecords')
    ..pc<ScreenerResponse_SecDetailInfo>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secDetailInfo', $pb.PbFieldType.PM, protoName: 'secDetailInfo', subBuilder: ScreenerResponse_SecDetailInfo.create)
    ..hasRequiredFields = false
  ;

  ScreenerResponse._() : super();
  factory ScreenerResponse({
    $core.int? status,
    $core.String? error,
    $core.String? message,
    $core.int? totalRecords,
    $core.Iterable<ScreenerResponse_SecDetailInfo>? secDetailInfo,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (totalRecords != null) {
      _result.totalRecords = totalRecords;
    }
    if (secDetailInfo != null) {
      _result.secDetailInfo.addAll(secDetailInfo);
    }
    return _result;
  }
  factory ScreenerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScreenerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScreenerResponse clone() => ScreenerResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScreenerResponse copyWith(void Function(ScreenerResponse) updates) => super.copyWith((message) => updates(message as ScreenerResponse)) as ScreenerResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScreenerResponse create() => ScreenerResponse._();
  ScreenerResponse createEmptyInstance() => create();
  static $pb.PbList<ScreenerResponse> createRepeated() => $pb.PbList<ScreenerResponse>();
  @$core.pragma('dart2js:noInline')
  static ScreenerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScreenerResponse>(create);
  static ScreenerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get totalRecords => $_getIZ(3);
  @$pb.TagNumber(4)
  set totalRecords($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTotalRecords() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalRecords() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<ScreenerResponse_SecDetailInfo> get secDetailInfo => $_getList(4);
}

class TopMarketCapInput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopMarketCapInput', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userID', protoName: 'userID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', protoName: 'marketCd')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'offset', $pb.PbFieldType.O3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'limit', $pb.PbFieldType.O3)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..hasRequiredFields = false
  ;

  TopMarketCapInput._() : super();
  factory TopMarketCapInput({
    $core.String? userID,
    $core.String? marketCd,
    $core.int? offset,
    $core.int? limit,
    $core.String? authenCode,
  }) {
    final _result = create();
    if (userID != null) {
      _result.userID = userID;
    }
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    if (offset != null) {
      _result.offset = offset;
    }
    if (limit != null) {
      _result.limit = limit;
    }
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    return _result;
  }
  factory TopMarketCapInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopMarketCapInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopMarketCapInput clone() => TopMarketCapInput()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopMarketCapInput copyWith(void Function(TopMarketCapInput) updates) => super.copyWith((message) => updates(message as TopMarketCapInput)) as TopMarketCapInput; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopMarketCapInput create() => TopMarketCapInput._();
  TopMarketCapInput createEmptyInstance() => create();
  static $pb.PbList<TopMarketCapInput> createRepeated() => $pb.PbList<TopMarketCapInput>();
  @$core.pragma('dart2js:noInline')
  static TopMarketCapInput getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopMarketCapInput>(create);
  static TopMarketCapInput? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userID => $_getSZ(0);
  @$pb.TagNumber(1)
  set userID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get marketCd => $_getSZ(1);
  @$pb.TagNumber(2)
  set marketCd($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMarketCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearMarketCd() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get limit => $_getIZ(3);
  @$pb.TagNumber(4)
  set limit($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearLimit() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get authenCode => $_getSZ(4);
  @$pb.TagNumber(5)
  set authenCode($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAuthenCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearAuthenCode() => clearField(5);
}

class TopMarketCapResponse_TopMarketCapInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopMarketCapResponse.TopMarketCapInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePoint', $pb.PbFieldType.OD, protoName: 'changePoint')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePercent', $pb.PbFieldType.OD, protoName: 'changePercent')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCap', $pb.PbFieldType.OD, protoName: 'marketCap')
    ..e<STOCK_COLOR_CODE>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'colorCode', $pb.PbFieldType.OE, protoName: 'colorCode', defaultOrMaker: STOCK_COLOR_CODE.BASIC_PRICE, valueOf: STOCK_COLOR_CODE.valueOf, enumValues: STOCK_COLOR_CODE.values)
    ..hasRequiredFields = false
  ;

  TopMarketCapResponse_TopMarketCapInfo._() : super();
  factory TopMarketCapResponse_TopMarketCapInfo({
    $core.String? secCd,
    $core.double? changePoint,
    $core.double? changePercent,
    $core.double? marketCap,
    STOCK_COLOR_CODE? colorCode,
  }) {
    final _result = create();
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (changePoint != null) {
      _result.changePoint = changePoint;
    }
    if (changePercent != null) {
      _result.changePercent = changePercent;
    }
    if (marketCap != null) {
      _result.marketCap = marketCap;
    }
    if (colorCode != null) {
      _result.colorCode = colorCode;
    }
    return _result;
  }
  factory TopMarketCapResponse_TopMarketCapInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopMarketCapResponse_TopMarketCapInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopMarketCapResponse_TopMarketCapInfo clone() => TopMarketCapResponse_TopMarketCapInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopMarketCapResponse_TopMarketCapInfo copyWith(void Function(TopMarketCapResponse_TopMarketCapInfo) updates) => super.copyWith((message) => updates(message as TopMarketCapResponse_TopMarketCapInfo)) as TopMarketCapResponse_TopMarketCapInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopMarketCapResponse_TopMarketCapInfo create() => TopMarketCapResponse_TopMarketCapInfo._();
  TopMarketCapResponse_TopMarketCapInfo createEmptyInstance() => create();
  static $pb.PbList<TopMarketCapResponse_TopMarketCapInfo> createRepeated() => $pb.PbList<TopMarketCapResponse_TopMarketCapInfo>();
  @$core.pragma('dart2js:noInline')
  static TopMarketCapResponse_TopMarketCapInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopMarketCapResponse_TopMarketCapInfo>(create);
  static TopMarketCapResponse_TopMarketCapInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get secCd => $_getSZ(0);
  @$pb.TagNumber(1)
  set secCd($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSecCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get changePoint => $_getN(1);
  @$pb.TagNumber(2)
  set changePoint($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChangePoint() => $_has(1);
  @$pb.TagNumber(2)
  void clearChangePoint() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get changePercent => $_getN(2);
  @$pb.TagNumber(3)
  set changePercent($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChangePercent() => $_has(2);
  @$pb.TagNumber(3)
  void clearChangePercent() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get marketCap => $_getN(3);
  @$pb.TagNumber(4)
  set marketCap($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMarketCap() => $_has(3);
  @$pb.TagNumber(4)
  void clearMarketCap() => clearField(4);

  @$pb.TagNumber(5)
  STOCK_COLOR_CODE get colorCode => $_getN(4);
  @$pb.TagNumber(5)
  set colorCode(STOCK_COLOR_CODE v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasColorCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearColorCode() => clearField(5);
}

class TopMarketCapResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopMarketCapResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..pc<TopMarketCapResponse_TopMarketCapInfo>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topMarketCapInfo', $pb.PbFieldType.PM, protoName: 'topMarketCapInfo', subBuilder: TopMarketCapResponse_TopMarketCapInfo.create)
    ..hasRequiredFields = false
  ;

  TopMarketCapResponse._() : super();
  factory TopMarketCapResponse({
    $core.int? status,
    $core.String? error,
    $core.String? message,
    $core.Iterable<TopMarketCapResponse_TopMarketCapInfo>? topMarketCapInfo,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (topMarketCapInfo != null) {
      _result.topMarketCapInfo.addAll(topMarketCapInfo);
    }
    return _result;
  }
  factory TopMarketCapResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopMarketCapResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopMarketCapResponse clone() => TopMarketCapResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopMarketCapResponse copyWith(void Function(TopMarketCapResponse) updates) => super.copyWith((message) => updates(message as TopMarketCapResponse)) as TopMarketCapResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopMarketCapResponse create() => TopMarketCapResponse._();
  TopMarketCapResponse createEmptyInstance() => create();
  static $pb.PbList<TopMarketCapResponse> createRepeated() => $pb.PbList<TopMarketCapResponse>();
  @$core.pragma('dart2js:noInline')
  static TopMarketCapResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopMarketCapResponse>(create);
  static TopMarketCapResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get status => $_getIZ(0);
  @$pb.TagNumber(1)
  set status($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<TopMarketCapResponse_TopMarketCapInfo> get topMarketCapInfo => $_getList(3);
}

class SystemState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SystemState', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tradeDate', $pb.PbFieldType.O3, protoName: 'tradeDate')
    ..e<SystemState_StatusCode>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: SystemState_StatusCode.NONE, valueOf: SystemState_StatusCode.valueOf, enumValues: SystemState_StatusCode.values)
    ..hasRequiredFields = false
  ;

  SystemState._() : super();
  factory SystemState({
    $core.int? tradeDate,
    SystemState_StatusCode? status,
  }) {
    final _result = create();
    if (tradeDate != null) {
      _result.tradeDate = tradeDate;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory SystemState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SystemState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SystemState clone() => SystemState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SystemState copyWith(void Function(SystemState) updates) => super.copyWith((message) => updates(message as SystemState)) as SystemState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SystemState create() => SystemState._();
  SystemState createEmptyInstance() => create();
  static $pb.PbList<SystemState> createRepeated() => $pb.PbList<SystemState>();
  @$core.pragma('dart2js:noInline')
  static SystemState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SystemState>(create);
  static SystemState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tradeDate => $_getIZ(0);
  @$pb.TagNumber(1)
  set tradeDate($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTradeDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearTradeDate() => clearField(1);

  @$pb.TagNumber(2)
  SystemState_StatusCode get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(SystemState_StatusCode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
}

class IndexUpdate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IndexUpdate', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexCd', $pb.PbFieldType.O3, protoName: 'indexCd')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'index', $pb.PbFieldType.OD)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changeIndex', $pb.PbFieldType.OD, protoName: 'changeIndex')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalTrade', $pb.PbFieldType.O3, protoName: 'totalTrade')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalQty', $pb.PbFieldType.OD, protoName: 'totalQty')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalAmt', $pb.PbFieldType.OD, protoName: 'totalAmt')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'openIndex', $pb.PbFieldType.OD, protoName: 'openIndex')
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'highIndex', $pb.PbFieldType.OD, protoName: 'highIndex')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lowIndex', $pb.PbFieldType.OD, protoName: 'lowIndex')
    ..a<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'advances', $pb.PbFieldType.O3)
    ..a<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'noChange', $pb.PbFieldType.O3, protoName: 'noChange')
    ..a<$core.int>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'declenes', $pb.PbFieldType.O3)
    ..a<$core.int>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ceiling', $pb.PbFieldType.O3)
    ..a<$core.int>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'floor', $pb.PbFieldType.O3)
    ..e<INDEX_STATE>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: INDEX_STATE.S, valueOf: INDEX_STATE.valueOf, enumValues: INDEX_STATE.values)
    ..e<INDEX_COLOR_CODE>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'colorCode', $pb.PbFieldType.OE, protoName: 'colorCode', defaultOrMaker: INDEX_COLOR_CODE.NONE, valueOf: INDEX_COLOR_CODE.valueOf, enumValues: INDEX_COLOR_CODE.values)
    ..a<$core.double>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePercent', $pb.PbFieldType.OD, protoName: 'changePercent')
    ..aInt64(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updTime', protoName: 'updTime')
    ..hasRequiredFields = false
  ;

  IndexUpdate._() : super();
  factory IndexUpdate({
    $core.int? indexCd,
    $core.double? index,
    $core.double? changeIndex,
    $core.int? totalTrade,
    $core.double? totalQty,
    $core.double? totalAmt,
    $core.double? openIndex,
    $core.double? highIndex,
    $core.double? lowIndex,
    $core.int? advances,
    $core.int? noChange,
    $core.int? declenes,
    $core.int? ceiling,
    $core.int? floor,
    INDEX_STATE? state,
    INDEX_COLOR_CODE? colorCode,
    $core.double? changePercent,
    $fixnum.Int64? updTime,
  }) {
    final _result = create();
    if (indexCd != null) {
      _result.indexCd = indexCd;
    }
    if (index != null) {
      _result.index = index;
    }
    if (changeIndex != null) {
      _result.changeIndex = changeIndex;
    }
    if (totalTrade != null) {
      _result.totalTrade = totalTrade;
    }
    if (totalQty != null) {
      _result.totalQty = totalQty;
    }
    if (totalAmt != null) {
      _result.totalAmt = totalAmt;
    }
    if (openIndex != null) {
      _result.openIndex = openIndex;
    }
    if (highIndex != null) {
      _result.highIndex = highIndex;
    }
    if (lowIndex != null) {
      _result.lowIndex = lowIndex;
    }
    if (advances != null) {
      _result.advances = advances;
    }
    if (noChange != null) {
      _result.noChange = noChange;
    }
    if (declenes != null) {
      _result.declenes = declenes;
    }
    if (ceiling != null) {
      _result.ceiling = ceiling;
    }
    if (floor != null) {
      _result.floor = floor;
    }
    if (state != null) {
      _result.state = state;
    }
    if (colorCode != null) {
      _result.colorCode = colorCode;
    }
    if (changePercent != null) {
      _result.changePercent = changePercent;
    }
    if (updTime != null) {
      _result.updTime = updTime;
    }
    return _result;
  }
  factory IndexUpdate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IndexUpdate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IndexUpdate clone() => IndexUpdate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IndexUpdate copyWith(void Function(IndexUpdate) updates) => super.copyWith((message) => updates(message as IndexUpdate)) as IndexUpdate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IndexUpdate create() => IndexUpdate._();
  IndexUpdate createEmptyInstance() => create();
  static $pb.PbList<IndexUpdate> createRepeated() => $pb.PbList<IndexUpdate>();
  @$core.pragma('dart2js:noInline')
  static IndexUpdate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IndexUpdate>(create);
  static IndexUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get indexCd => $_getIZ(0);
  @$pb.TagNumber(1)
  set indexCd($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIndexCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndexCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get index => $_getN(1);
  @$pb.TagNumber(2)
  set index($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndex() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get changeIndex => $_getN(2);
  @$pb.TagNumber(3)
  set changeIndex($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChangeIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearChangeIndex() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get totalTrade => $_getIZ(3);
  @$pb.TagNumber(4)
  set totalTrade($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTotalTrade() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalTrade() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get totalQty => $_getN(4);
  @$pb.TagNumber(5)
  set totalQty($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTotalQty() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalQty() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get totalAmt => $_getN(5);
  @$pb.TagNumber(6)
  set totalAmt($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTotalAmt() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalAmt() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get openIndex => $_getN(6);
  @$pb.TagNumber(7)
  set openIndex($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOpenIndex() => $_has(6);
  @$pb.TagNumber(7)
  void clearOpenIndex() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get highIndex => $_getN(7);
  @$pb.TagNumber(8)
  set highIndex($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasHighIndex() => $_has(7);
  @$pb.TagNumber(8)
  void clearHighIndex() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get lowIndex => $_getN(8);
  @$pb.TagNumber(9)
  set lowIndex($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLowIndex() => $_has(8);
  @$pb.TagNumber(9)
  void clearLowIndex() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get advances => $_getIZ(9);
  @$pb.TagNumber(10)
  set advances($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAdvances() => $_has(9);
  @$pb.TagNumber(10)
  void clearAdvances() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get noChange => $_getIZ(10);
  @$pb.TagNumber(11)
  set noChange($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasNoChange() => $_has(10);
  @$pb.TagNumber(11)
  void clearNoChange() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get declenes => $_getIZ(11);
  @$pb.TagNumber(12)
  set declenes($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasDeclenes() => $_has(11);
  @$pb.TagNumber(12)
  void clearDeclenes() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get ceiling => $_getIZ(12);
  @$pb.TagNumber(13)
  set ceiling($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasCeiling() => $_has(12);
  @$pb.TagNumber(13)
  void clearCeiling() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get floor => $_getIZ(13);
  @$pb.TagNumber(14)
  set floor($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasFloor() => $_has(13);
  @$pb.TagNumber(14)
  void clearFloor() => clearField(14);

  @$pb.TagNumber(15)
  INDEX_STATE get state => $_getN(14);
  @$pb.TagNumber(15)
  set state(INDEX_STATE v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasState() => $_has(14);
  @$pb.TagNumber(15)
  void clearState() => clearField(15);

  @$pb.TagNumber(16)
  INDEX_COLOR_CODE get colorCode => $_getN(15);
  @$pb.TagNumber(16)
  set colorCode(INDEX_COLOR_CODE v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasColorCode() => $_has(15);
  @$pb.TagNumber(16)
  void clearColorCode() => clearField(16);

  @$pb.TagNumber(17)
  $core.double get changePercent => $_getN(16);
  @$pb.TagNumber(17)
  set changePercent($core.double v) { $_setDouble(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasChangePercent() => $_has(16);
  @$pb.TagNumber(17)
  void clearChangePercent() => clearField(17);

  @$pb.TagNumber(18)
  $fixnum.Int64 get updTime => $_getI64(17);
  @$pb.TagNumber(18)
  set updTime($fixnum.Int64 v) { $_setInt64(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasUpdTime() => $_has(17);
  @$pb.TagNumber(18)
  void clearUpdTime() => clearField(18);
}

class TopPrice_TopPriceDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopPrice.TopPriceDetail', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'top', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'qty', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  TopPrice_TopPriceDetail._() : super();
  factory TopPrice_TopPriceDetail({
    $core.int? top,
    $core.String? price,
    $core.double? qty,
  }) {
    final _result = create();
    if (top != null) {
      _result.top = top;
    }
    if (price != null) {
      _result.price = price;
    }
    if (qty != null) {
      _result.qty = qty;
    }
    return _result;
  }
  factory TopPrice_TopPriceDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopPrice_TopPriceDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopPrice_TopPriceDetail clone() => TopPrice_TopPriceDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopPrice_TopPriceDetail copyWith(void Function(TopPrice_TopPriceDetail) updates) => super.copyWith((message) => updates(message as TopPrice_TopPriceDetail)) as TopPrice_TopPriceDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopPrice_TopPriceDetail create() => TopPrice_TopPriceDetail._();
  TopPrice_TopPriceDetail createEmptyInstance() => create();
  static $pb.PbList<TopPrice_TopPriceDetail> createRepeated() => $pb.PbList<TopPrice_TopPriceDetail>();
  @$core.pragma('dart2js:noInline')
  static TopPrice_TopPriceDetail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopPrice_TopPriceDetail>(create);
  static TopPrice_TopPriceDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get top => $_getIZ(0);
  @$pb.TagNumber(1)
  set top($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTop() => $_has(0);
  @$pb.TagNumber(1)
  void clearTop() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get price => $_getSZ(1);
  @$pb.TagNumber(2)
  set price($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get qty => $_getN(2);
  @$pb.TagNumber(3)
  set qty($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasQty() => $_has(2);
  @$pb.TagNumber(3)
  void clearQty() => clearField(3);
}

class TopPrice extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopPrice', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalBidQty', $pb.PbFieldType.OD, protoName: 'totalBidQty')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalOfferQty', $pb.PbFieldType.OD, protoName: 'totalOfferQty')
    ..pc<TopPrice_TopPriceDetail>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topPriceBid', $pb.PbFieldType.PM, protoName: 'topPriceBid', subBuilder: TopPrice_TopPriceDetail.create)
    ..pc<TopPrice_TopPriceDetail>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topPriceOffer', $pb.PbFieldType.PM, protoName: 'topPriceOffer', subBuilder: TopPrice_TopPriceDetail.create)
    ..hasRequiredFields = false
  ;

  TopPrice._() : super();
  factory TopPrice({
    $core.String? secCd,
    $core.double? totalBidQty,
    $core.double? totalOfferQty,
    $core.Iterable<TopPrice_TopPriceDetail>? topPriceBid,
    $core.Iterable<TopPrice_TopPriceDetail>? topPriceOffer,
  }) {
    final _result = create();
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (totalBidQty != null) {
      _result.totalBidQty = totalBidQty;
    }
    if (totalOfferQty != null) {
      _result.totalOfferQty = totalOfferQty;
    }
    if (topPriceBid != null) {
      _result.topPriceBid.addAll(topPriceBid);
    }
    if (topPriceOffer != null) {
      _result.topPriceOffer.addAll(topPriceOffer);
    }
    return _result;
  }
  factory TopPrice.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopPrice.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopPrice clone() => TopPrice()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopPrice copyWith(void Function(TopPrice) updates) => super.copyWith((message) => updates(message as TopPrice)) as TopPrice; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopPrice create() => TopPrice._();
  TopPrice createEmptyInstance() => create();
  static $pb.PbList<TopPrice> createRepeated() => $pb.PbList<TopPrice>();
  @$core.pragma('dart2js:noInline')
  static TopPrice getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopPrice>(create);
  static TopPrice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get secCd => $_getSZ(0);
  @$pb.TagNumber(1)
  set secCd($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSecCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get totalBidQty => $_getN(1);
  @$pb.TagNumber(2)
  set totalBidQty($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalBidQty() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalBidQty() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get totalOfferQty => $_getN(2);
  @$pb.TagNumber(3)
  set totalOfferQty($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTotalOfferQty() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalOfferQty() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<TopPrice_TopPriceDetail> get topPriceBid => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<TopPrice_TopPriceDetail> get topPriceOffer => $_getList(4);
}

class LastSale extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LastSale', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', protoName: 'marketCd')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePoint', $pb.PbFieldType.OD, protoName: 'changePoint')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePercent', $pb.PbFieldType.OD, protoName: 'changePercent')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastPrice', $pb.PbFieldType.OD, protoName: 'lastPrice')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastQty', $pb.PbFieldType.OD, protoName: 'lastQty')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastAmt', $pb.PbFieldType.OD, protoName: 'lastAmt')
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalQty', $pb.PbFieldType.OD, protoName: 'totalQty')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalAmt', $pb.PbFieldType.OD, protoName: 'totalAmt')
    ..a<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hightPrice', $pb.PbFieldType.OD, protoName: 'hightPrice')
    ..a<$core.double>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lowPrice', $pb.PbFieldType.OD, protoName: 'lowPrice')
    ..a<$core.double>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avgPrice', $pb.PbFieldType.OD, protoName: 'avgPrice')
    ..aOM<NullableString>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'side', subBuilder: NullableString.create)
    ..e<STOCK_COLOR_CODE>(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'colorCode', $pb.PbFieldType.OE, protoName: 'colorCode', defaultOrMaker: STOCK_COLOR_CODE.BASIC_PRICE, valueOf: STOCK_COLOR_CODE.valueOf, enumValues: STOCK_COLOR_CODE.values)
    ..a<$core.int>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'matTime', $pb.PbFieldType.O3, protoName: 'matTime')
    ..hasRequiredFields = false
  ;

  LastSale._() : super();
  factory LastSale({
    $core.String? marketCd,
    $core.String? secCd,
    $core.double? changePoint,
    $core.double? changePercent,
    $core.double? lastPrice,
    $core.double? lastQty,
    $core.double? lastAmt,
    $core.double? totalQty,
    $core.double? totalAmt,
    $core.double? hightPrice,
    $core.double? lowPrice,
    $core.double? avgPrice,
    NullableString? side,
    STOCK_COLOR_CODE? colorCode,
    $core.int? matTime,
  }) {
    final _result = create();
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (changePoint != null) {
      _result.changePoint = changePoint;
    }
    if (changePercent != null) {
      _result.changePercent = changePercent;
    }
    if (lastPrice != null) {
      _result.lastPrice = lastPrice;
    }
    if (lastQty != null) {
      _result.lastQty = lastQty;
    }
    if (lastAmt != null) {
      _result.lastAmt = lastAmt;
    }
    if (totalQty != null) {
      _result.totalQty = totalQty;
    }
    if (totalAmt != null) {
      _result.totalAmt = totalAmt;
    }
    if (hightPrice != null) {
      _result.hightPrice = hightPrice;
    }
    if (lowPrice != null) {
      _result.lowPrice = lowPrice;
    }
    if (avgPrice != null) {
      _result.avgPrice = avgPrice;
    }
    if (side != null) {
      _result.side = side;
    }
    if (colorCode != null) {
      _result.colorCode = colorCode;
    }
    if (matTime != null) {
      _result.matTime = matTime;
    }
    return _result;
  }
  factory LastSale.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LastSale.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LastSale clone() => LastSale()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LastSale copyWith(void Function(LastSale) updates) => super.copyWith((message) => updates(message as LastSale)) as LastSale; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LastSale create() => LastSale._();
  LastSale createEmptyInstance() => create();
  static $pb.PbList<LastSale> createRepeated() => $pb.PbList<LastSale>();
  @$core.pragma('dart2js:noInline')
  static LastSale getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LastSale>(create);
  static LastSale? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get marketCd => $_getSZ(0);
  @$pb.TagNumber(1)
  set marketCd($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMarketCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearMarketCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get secCd => $_getSZ(1);
  @$pb.TagNumber(2)
  set secCd($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecCd() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get changePoint => $_getN(2);
  @$pb.TagNumber(3)
  set changePoint($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChangePoint() => $_has(2);
  @$pb.TagNumber(3)
  void clearChangePoint() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get changePercent => $_getN(3);
  @$pb.TagNumber(4)
  set changePercent($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasChangePercent() => $_has(3);
  @$pb.TagNumber(4)
  void clearChangePercent() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get lastPrice => $_getN(4);
  @$pb.TagNumber(5)
  set lastPrice($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastPrice() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get lastQty => $_getN(5);
  @$pb.TagNumber(6)
  set lastQty($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastQty() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastQty() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get lastAmt => $_getN(6);
  @$pb.TagNumber(7)
  set lastAmt($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLastAmt() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastAmt() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get totalQty => $_getN(7);
  @$pb.TagNumber(8)
  set totalQty($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTotalQty() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalQty() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get totalAmt => $_getN(8);
  @$pb.TagNumber(9)
  set totalAmt($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasTotalAmt() => $_has(8);
  @$pb.TagNumber(9)
  void clearTotalAmt() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get hightPrice => $_getN(9);
  @$pb.TagNumber(10)
  set hightPrice($core.double v) { $_setDouble(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasHightPrice() => $_has(9);
  @$pb.TagNumber(10)
  void clearHightPrice() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get lowPrice => $_getN(10);
  @$pb.TagNumber(11)
  set lowPrice($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasLowPrice() => $_has(10);
  @$pb.TagNumber(11)
  void clearLowPrice() => clearField(11);

  @$pb.TagNumber(12)
  $core.double get avgPrice => $_getN(11);
  @$pb.TagNumber(12)
  set avgPrice($core.double v) { $_setDouble(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasAvgPrice() => $_has(11);
  @$pb.TagNumber(12)
  void clearAvgPrice() => clearField(12);

  @$pb.TagNumber(13)
  NullableString get side => $_getN(12);
  @$pb.TagNumber(13)
  set side(NullableString v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasSide() => $_has(12);
  @$pb.TagNumber(13)
  void clearSide() => clearField(13);
  @$pb.TagNumber(13)
  NullableString ensureSide() => $_ensure(12);

  @$pb.TagNumber(14)
  STOCK_COLOR_CODE get colorCode => $_getN(13);
  @$pb.TagNumber(14)
  set colorCode(STOCK_COLOR_CODE v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasColorCode() => $_has(13);
  @$pb.TagNumber(14)
  void clearColorCode() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get matTime => $_getIZ(14);
  @$pb.TagNumber(15)
  set matTime($core.int v) { $_setSignedInt32(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasMatTime() => $_has(14);
  @$pb.TagNumber(15)
  void clearMatTime() => clearField(15);
}

class ForeignRoom extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ForeignRoom', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalRoom', $pb.PbFieldType.OD, protoName: 'totalRoom')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currentRoom', $pb.PbFieldType.OD, protoName: 'currentRoom')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyForeignQty', $pb.PbFieldType.OD, protoName: 'buyForeignQty')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyForeignAmt', $pb.PbFieldType.OD, protoName: 'buyForeignAmt')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellForeignQty', $pb.PbFieldType.OD, protoName: 'sellForeignQty')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellForeignAmt', $pb.PbFieldType.OD, protoName: 'sellForeignAmt')
    ..hasRequiredFields = false
  ;

  ForeignRoom._() : super();
  factory ForeignRoom({
    $core.String? secCd,
    $core.double? totalRoom,
    $core.double? currentRoom,
    $core.double? buyForeignQty,
    $core.double? buyForeignAmt,
    $core.double? sellForeignQty,
    $core.double? sellForeignAmt,
  }) {
    final _result = create();
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (totalRoom != null) {
      _result.totalRoom = totalRoom;
    }
    if (currentRoom != null) {
      _result.currentRoom = currentRoom;
    }
    if (buyForeignQty != null) {
      _result.buyForeignQty = buyForeignQty;
    }
    if (buyForeignAmt != null) {
      _result.buyForeignAmt = buyForeignAmt;
    }
    if (sellForeignQty != null) {
      _result.sellForeignQty = sellForeignQty;
    }
    if (sellForeignAmt != null) {
      _result.sellForeignAmt = sellForeignAmt;
    }
    return _result;
  }
  factory ForeignRoom.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ForeignRoom.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ForeignRoom clone() => ForeignRoom()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ForeignRoom copyWith(void Function(ForeignRoom) updates) => super.copyWith((message) => updates(message as ForeignRoom)) as ForeignRoom; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ForeignRoom create() => ForeignRoom._();
  ForeignRoom createEmptyInstance() => create();
  static $pb.PbList<ForeignRoom> createRepeated() => $pb.PbList<ForeignRoom>();
  @$core.pragma('dart2js:noInline')
  static ForeignRoom getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ForeignRoom>(create);
  static ForeignRoom? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get secCd => $_getSZ(0);
  @$pb.TagNumber(1)
  set secCd($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSecCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get totalRoom => $_getN(1);
  @$pb.TagNumber(2)
  set totalRoom($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalRoom() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalRoom() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get currentRoom => $_getN(2);
  @$pb.TagNumber(3)
  set currentRoom($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCurrentRoom() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentRoom() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get buyForeignQty => $_getN(3);
  @$pb.TagNumber(4)
  set buyForeignQty($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBuyForeignQty() => $_has(3);
  @$pb.TagNumber(4)
  void clearBuyForeignQty() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get buyForeignAmt => $_getN(4);
  @$pb.TagNumber(5)
  set buyForeignAmt($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBuyForeignAmt() => $_has(4);
  @$pb.TagNumber(5)
  void clearBuyForeignAmt() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get sellForeignQty => $_getN(5);
  @$pb.TagNumber(6)
  set sellForeignQty($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSellForeignQty() => $_has(5);
  @$pb.TagNumber(6)
  void clearSellForeignQty() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get sellForeignAmt => $_getN(6);
  @$pb.TagNumber(7)
  set sellForeignAmt($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSellForeignAmt() => $_has(6);
  @$pb.TagNumber(7)
  void clearSellForeignAmt() => clearField(7);
}

enum NullableString_Kind {
  null_1, 
  data, 
  notSet
}

class NullableString extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, NullableString_Kind> _NullableString_KindByTag = {
    1 : NullableString_Kind.null_1,
    2 : NullableString_Kind.data,
    0 : NullableString_Kind.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NullableString', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..e<$1.NullValue>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'null', $pb.PbFieldType.OE, defaultOrMaker: $1.NullValue.NULL_VALUE, valueOf: $1.NullValue.valueOf, enumValues: $1.NullValue.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data')
    ..hasRequiredFields = false
  ;

  NullableString._() : super();
  factory NullableString({
    $1.NullValue? null_1,
    $core.String? data,
  }) {
    final _result = create();
    if (null_1 != null) {
      _result.null_1 = null_1;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory NullableString.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NullableString.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NullableString clone() => NullableString()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NullableString copyWith(void Function(NullableString) updates) => super.copyWith((message) => updates(message as NullableString)) as NullableString; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NullableString create() => NullableString._();
  NullableString createEmptyInstance() => create();
  static $pb.PbList<NullableString> createRepeated() => $pb.PbList<NullableString>();
  @$core.pragma('dart2js:noInline')
  static NullableString getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NullableString>(create);
  static NullableString? _defaultInstance;

  NullableString_Kind whichKind() => _NullableString_KindByTag[$_whichOneof(0)]!;
  void clearKind() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.NullValue get null_1 => $_getN(0);
  @$pb.TagNumber(1)
  set null_1($1.NullValue v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNull_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearNull_1() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get data => $_getSZ(1);
  @$pb.TagNumber(2)
  set data($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
}

enum NullableInt32_Kind {
  null_1, 
  data, 
  notSet
}

class NullableInt32 extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, NullableInt32_Kind> _NullableInt32_KindByTag = {
    1 : NullableInt32_Kind.null_1,
    2 : NullableInt32_Kind.data,
    0 : NullableInt32_Kind.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NullableInt32', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..e<$1.NullValue>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'null', $pb.PbFieldType.OE, defaultOrMaker: $1.NullValue.NULL_VALUE, valueOf: $1.NullValue.valueOf, enumValues: $1.NullValue.values)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  NullableInt32._() : super();
  factory NullableInt32({
    $1.NullValue? null_1,
    $core.int? data,
  }) {
    final _result = create();
    if (null_1 != null) {
      _result.null_1 = null_1;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory NullableInt32.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NullableInt32.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NullableInt32 clone() => NullableInt32()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NullableInt32 copyWith(void Function(NullableInt32) updates) => super.copyWith((message) => updates(message as NullableInt32)) as NullableInt32; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NullableInt32 create() => NullableInt32._();
  NullableInt32 createEmptyInstance() => create();
  static $pb.PbList<NullableInt32> createRepeated() => $pb.PbList<NullableInt32>();
  @$core.pragma('dart2js:noInline')
  static NullableInt32 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NullableInt32>(create);
  static NullableInt32? _defaultInstance;

  NullableInt32_Kind whichKind() => _NullableInt32_KindByTag[$_whichOneof(0)]!;
  void clearKind() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.NullValue get null_1 => $_getN(0);
  @$pb.TagNumber(1)
  set null_1($1.NullValue v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNull_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearNull_1() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get data => $_getIZ(1);
  @$pb.TagNumber(2)
  set data($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
}

enum NullableInt64_Kind {
  null_1, 
  data, 
  notSet
}

class NullableInt64 extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, NullableInt64_Kind> _NullableInt64_KindByTag = {
    1 : NullableInt64_Kind.null_1,
    2 : NullableInt64_Kind.data,
    0 : NullableInt64_Kind.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NullableInt64', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..e<$1.NullValue>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'null', $pb.PbFieldType.OE, defaultOrMaker: $1.NullValue.NULL_VALUE, valueOf: $1.NullValue.valueOf, enumValues: $1.NullValue.values)
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data')
    ..hasRequiredFields = false
  ;

  NullableInt64._() : super();
  factory NullableInt64({
    $1.NullValue? null_1,
    $fixnum.Int64? data,
  }) {
    final _result = create();
    if (null_1 != null) {
      _result.null_1 = null_1;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory NullableInt64.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NullableInt64.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NullableInt64 clone() => NullableInt64()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NullableInt64 copyWith(void Function(NullableInt64) updates) => super.copyWith((message) => updates(message as NullableInt64)) as NullableInt64; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NullableInt64 create() => NullableInt64._();
  NullableInt64 createEmptyInstance() => create();
  static $pb.PbList<NullableInt64> createRepeated() => $pb.PbList<NullableInt64>();
  @$core.pragma('dart2js:noInline')
  static NullableInt64 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NullableInt64>(create);
  static NullableInt64? _defaultInstance;

  NullableInt64_Kind whichKind() => _NullableInt64_KindByTag[$_whichOneof(0)]!;
  void clearKind() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.NullValue get null_1 => $_getN(0);
  @$pb.TagNumber(1)
  set null_1($1.NullValue v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNull_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearNull_1() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get data => $_getI64(1);
  @$pb.TagNumber(2)
  set data($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
}

enum NullableDouble_Kind {
  null_1, 
  data, 
  notSet
}

class NullableDouble extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, NullableDouble_Kind> _NullableDouble_KindByTag = {
    1 : NullableDouble_Kind.null_1,
    2 : NullableDouble_Kind.data,
    0 : NullableDouble_Kind.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NullableDouble', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..e<$1.NullValue>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'null', $pb.PbFieldType.OE, defaultOrMaker: $1.NullValue.NULL_VALUE, valueOf: $1.NullValue.valueOf, enumValues: $1.NullValue.values)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  NullableDouble._() : super();
  factory NullableDouble({
    $1.NullValue? null_1,
    $core.double? data,
  }) {
    final _result = create();
    if (null_1 != null) {
      _result.null_1 = null_1;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory NullableDouble.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NullableDouble.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NullableDouble clone() => NullableDouble()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NullableDouble copyWith(void Function(NullableDouble) updates) => super.copyWith((message) => updates(message as NullableDouble)) as NullableDouble; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NullableDouble create() => NullableDouble._();
  NullableDouble createEmptyInstance() => create();
  static $pb.PbList<NullableDouble> createRepeated() => $pb.PbList<NullableDouble>();
  @$core.pragma('dart2js:noInline')
  static NullableDouble getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NullableDouble>(create);
  static NullableDouble? _defaultInstance;

  NullableDouble_Kind whichKind() => _NullableDouble_KindByTag[$_whichOneof(0)]!;
  void clearKind() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.NullValue get null_1 => $_getN(0);
  @$pb.TagNumber(1)
  set null_1($1.NullValue v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNull_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearNull_1() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get data => $_getN(1);
  @$pb.TagNumber(2)
  set data($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
}

class MarketInitDataParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketInitDataParam', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'channel', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..hasRequiredFields = false
  ;

  MarketInitDataParam._() : super();
  factory MarketInitDataParam({
    $core.int? channel,
    $core.String? authenCode,
  }) {
    final _result = create();
    if (channel != null) {
      _result.channel = channel;
    }
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    return _result;
  }
  factory MarketInitDataParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketInitDataParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketInitDataParam clone() => MarketInitDataParam()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketInitDataParam copyWith(void Function(MarketInitDataParam) updates) => super.copyWith((message) => updates(message as MarketInitDataParam)) as MarketInitDataParam; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketInitDataParam create() => MarketInitDataParam._();
  MarketInitDataParam createEmptyInstance() => create();
  static $pb.PbList<MarketInitDataParam> createRepeated() => $pb.PbList<MarketInitDataParam>();
  @$core.pragma('dart2js:noInline')
  static MarketInitDataParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketInitDataParam>(create);
  static MarketInitDataParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get channel => $_getIZ(0);
  @$pb.TagNumber(1)
  set channel($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChannel() => $_has(0);
  @$pb.TagNumber(1)
  void clearChannel() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get authenCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set authenCode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAuthenCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthenCode() => clearField(2);
}

class MarketInitDataResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketInitDataResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOM<MarketInitDataItem>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'items', subBuilder: MarketInitDataItem.create)
    ..hasRequiredFields = false
  ;

  MarketInitDataResponse._() : super();
  factory MarketInitDataResponse({
    $core.int? result,
    $core.String? error,
    $core.String? message,
    MarketInitDataItem? items,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (items != null) {
      _result.items = items;
    }
    return _result;
  }
  factory MarketInitDataResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketInitDataResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketInitDataResponse clone() => MarketInitDataResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketInitDataResponse copyWith(void Function(MarketInitDataResponse) updates) => super.copyWith((message) => updates(message as MarketInitDataResponse)) as MarketInitDataResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketInitDataResponse create() => MarketInitDataResponse._();
  MarketInitDataResponse createEmptyInstance() => create();
  static $pb.PbList<MarketInitDataResponse> createRepeated() => $pb.PbList<MarketInitDataResponse>();
  @$core.pragma('dart2js:noInline')
  static MarketInitDataResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketInitDataResponse>(create);
  static MarketInitDataResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get result => $_getIZ(0);
  @$pb.TagNumber(1)
  set result($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  MarketInitDataItem get items => $_getN(3);
  @$pb.TagNumber(4)
  set items(MarketInitDataItem v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasItems() => $_has(3);
  @$pb.TagNumber(4)
  void clearItems() => clearField(4);
  @$pb.TagNumber(4)
  MarketInitDataItem ensureItems() => $_ensure(3);
}

class MarketInitDataItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketInitDataItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOM<MrktBasketInfoList>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'basketInfoList', protoName: 'basketInfoList', subBuilder: MrktBasketInfoList.create)
    ..aOM<MrktindustriesList>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mrktindustriesList', protoName: 'mrktindustriesList', subBuilder: MrktindustriesList.create)
    ..hasRequiredFields = false
  ;

  MarketInitDataItem._() : super();
  factory MarketInitDataItem({
    MrktBasketInfoList? basketInfoList,
    MrktindustriesList? mrktindustriesList,
  }) {
    final _result = create();
    if (basketInfoList != null) {
      _result.basketInfoList = basketInfoList;
    }
    if (mrktindustriesList != null) {
      _result.mrktindustriesList = mrktindustriesList;
    }
    return _result;
  }
  factory MarketInitDataItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketInitDataItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketInitDataItem clone() => MarketInitDataItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketInitDataItem copyWith(void Function(MarketInitDataItem) updates) => super.copyWith((message) => updates(message as MarketInitDataItem)) as MarketInitDataItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketInitDataItem create() => MarketInitDataItem._();
  MarketInitDataItem createEmptyInstance() => create();
  static $pb.PbList<MarketInitDataItem> createRepeated() => $pb.PbList<MarketInitDataItem>();
  @$core.pragma('dart2js:noInline')
  static MarketInitDataItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketInitDataItem>(create);
  static MarketInitDataItem? _defaultInstance;

  @$pb.TagNumber(1)
  MrktBasketInfoList get basketInfoList => $_getN(0);
  @$pb.TagNumber(1)
  set basketInfoList(MrktBasketInfoList v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBasketInfoList() => $_has(0);
  @$pb.TagNumber(1)
  void clearBasketInfoList() => clearField(1);
  @$pb.TagNumber(1)
  MrktBasketInfoList ensureBasketInfoList() => $_ensure(0);

  @$pb.TagNumber(2)
  MrktindustriesList get mrktindustriesList => $_getN(1);
  @$pb.TagNumber(2)
  set mrktindustriesList(MrktindustriesList v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMrktindustriesList() => $_has(1);
  @$pb.TagNumber(2)
  void clearMrktindustriesList() => clearField(2);
  @$pb.TagNumber(2)
  MrktindustriesList ensureMrktindustriesList() => $_ensure(1);
}

class MrktBasketInfoList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MrktBasketInfoList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..pc<MrktBasketInfoItem>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'itemBasketInfo', $pb.PbFieldType.PM, protoName: 'itemBasketInfo', subBuilder: MrktBasketInfoItem.create)
    ..hasRequiredFields = false
  ;

  MrktBasketInfoList._() : super();
  factory MrktBasketInfoList({
    $core.Iterable<MrktBasketInfoItem>? itemBasketInfo,
  }) {
    final _result = create();
    if (itemBasketInfo != null) {
      _result.itemBasketInfo.addAll(itemBasketInfo);
    }
    return _result;
  }
  factory MrktBasketInfoList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MrktBasketInfoList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MrktBasketInfoList clone() => MrktBasketInfoList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MrktBasketInfoList copyWith(void Function(MrktBasketInfoList) updates) => super.copyWith((message) => updates(message as MrktBasketInfoList)) as MrktBasketInfoList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MrktBasketInfoList create() => MrktBasketInfoList._();
  MrktBasketInfoList createEmptyInstance() => create();
  static $pb.PbList<MrktBasketInfoList> createRepeated() => $pb.PbList<MrktBasketInfoList>();
  @$core.pragma('dart2js:noInline')
  static MrktBasketInfoList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MrktBasketInfoList>(create);
  static MrktBasketInfoList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MrktBasketInfoItem> get itemBasketInfo => $_getList(0);
}

class MrktindustriesList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MrktindustriesList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..pc<MrktindustriesItem>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'itemMrktindustries', $pb.PbFieldType.PM, protoName: 'itemMrktindustries', subBuilder: MrktindustriesItem.create)
    ..hasRequiredFields = false
  ;

  MrktindustriesList._() : super();
  factory MrktindustriesList({
    $core.Iterable<MrktindustriesItem>? itemMrktindustries,
  }) {
    final _result = create();
    if (itemMrktindustries != null) {
      _result.itemMrktindustries.addAll(itemMrktindustries);
    }
    return _result;
  }
  factory MrktindustriesList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MrktindustriesList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MrktindustriesList clone() => MrktindustriesList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MrktindustriesList copyWith(void Function(MrktindustriesList) updates) => super.copyWith((message) => updates(message as MrktindustriesList)) as MrktindustriesList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MrktindustriesList create() => MrktindustriesList._();
  MrktindustriesList createEmptyInstance() => create();
  static $pb.PbList<MrktindustriesList> createRepeated() => $pb.PbList<MrktindustriesList>();
  @$core.pragma('dart2js:noInline')
  static MrktindustriesList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MrktindustriesList>(create);
  static MrktindustriesList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MrktindustriesItem> get itemMrktindustries => $_getList(0);
}

class MrktBasketInfoItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MrktBasketInfoItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexCd', $pb.PbFieldType.O3, protoName: 'indexCd')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexName', protoName: 'indexName')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCdList', protoName: 'secCdList')
    ..hasRequiredFields = false
  ;

  MrktBasketInfoItem._() : super();
  factory MrktBasketInfoItem({
    $core.int? indexCd,
    $core.String? indexName,
    $core.String? secCdList,
  }) {
    final _result = create();
    if (indexCd != null) {
      _result.indexCd = indexCd;
    }
    if (indexName != null) {
      _result.indexName = indexName;
    }
    if (secCdList != null) {
      _result.secCdList = secCdList;
    }
    return _result;
  }
  factory MrktBasketInfoItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MrktBasketInfoItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MrktBasketInfoItem clone() => MrktBasketInfoItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MrktBasketInfoItem copyWith(void Function(MrktBasketInfoItem) updates) => super.copyWith((message) => updates(message as MrktBasketInfoItem)) as MrktBasketInfoItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MrktBasketInfoItem create() => MrktBasketInfoItem._();
  MrktBasketInfoItem createEmptyInstance() => create();
  static $pb.PbList<MrktBasketInfoItem> createRepeated() => $pb.PbList<MrktBasketInfoItem>();
  @$core.pragma('dart2js:noInline')
  static MrktBasketInfoItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MrktBasketInfoItem>(create);
  static MrktBasketInfoItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get indexCd => $_getIZ(0);
  @$pb.TagNumber(1)
  set indexCd($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIndexCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndexCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get indexName => $_getSZ(1);
  @$pb.TagNumber(2)
  set indexName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndexName() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndexName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get secCdList => $_getSZ(2);
  @$pb.TagNumber(3)
  set secCdList($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSecCdList() => $_has(2);
  @$pb.TagNumber(3)
  void clearSecCdList() => clearField(3);
}

class MrktindustriesItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MrktindustriesItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nameVn', protoName: 'nameVn')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nameEn', protoName: 'nameEn')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCdList', protoName: 'secCdList')
    ..hasRequiredFields = false
  ;

  MrktindustriesItem._() : super();
  factory MrktindustriesItem({
    $core.int? id,
    $core.String? code,
    $core.String? nameVn,
    $core.String? nameEn,
    $core.String? secCdList,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (code != null) {
      _result.code = code;
    }
    if (nameVn != null) {
      _result.nameVn = nameVn;
    }
    if (nameEn != null) {
      _result.nameEn = nameEn;
    }
    if (secCdList != null) {
      _result.secCdList = secCdList;
    }
    return _result;
  }
  factory MrktindustriesItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MrktindustriesItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MrktindustriesItem clone() => MrktindustriesItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MrktindustriesItem copyWith(void Function(MrktindustriesItem) updates) => super.copyWith((message) => updates(message as MrktindustriesItem)) as MrktindustriesItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MrktindustriesItem create() => MrktindustriesItem._();
  MrktindustriesItem createEmptyInstance() => create();
  static $pb.PbList<MrktindustriesItem> createRepeated() => $pb.PbList<MrktindustriesItem>();
  @$core.pragma('dart2js:noInline')
  static MrktindustriesItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MrktindustriesItem>(create);
  static MrktindustriesItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get nameVn => $_getSZ(2);
  @$pb.TagNumber(3)
  set nameVn($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNameVn() => $_has(2);
  @$pb.TagNumber(3)
  void clearNameVn() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get nameEn => $_getSZ(3);
  @$pb.TagNumber(4)
  set nameEn($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNameEn() => $_has(3);
  @$pb.TagNumber(4)
  void clearNameEn() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get secCdList => $_getSZ(4);
  @$pb.TagNumber(5)
  set secCdList($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSecCdList() => $_has(4);
  @$pb.TagNumber(5)
  void clearSecCdList() => clearField(5);
}

class MrktSecInfoItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MrktSecInfoItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secType', $pb.PbFieldType.O3, protoName: 'secType')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secName', protoName: 'secName')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secNameEn', protoName: 'secNameEn')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', $pb.PbFieldType.O3, protoName: 'marketCd')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxRate', $pb.PbFieldType.OF, protoName: 'maxRate')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'listedQty', $pb.PbFieldType.OF, protoName: 'listedQty')
    ..hasRequiredFields = false
  ;

  MrktSecInfoItem._() : super();
  factory MrktSecInfoItem({
    $core.String? secCd,
    $core.int? secType,
    $core.String? secName,
    $core.String? secNameEn,
    $core.int? marketCd,
    $core.double? maxRate,
    $core.double? listedQty,
  }) {
    final _result = create();
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (secType != null) {
      _result.secType = secType;
    }
    if (secName != null) {
      _result.secName = secName;
    }
    if (secNameEn != null) {
      _result.secNameEn = secNameEn;
    }
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    if (maxRate != null) {
      _result.maxRate = maxRate;
    }
    if (listedQty != null) {
      _result.listedQty = listedQty;
    }
    return _result;
  }
  factory MrktSecInfoItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MrktSecInfoItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MrktSecInfoItem clone() => MrktSecInfoItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MrktSecInfoItem copyWith(void Function(MrktSecInfoItem) updates) => super.copyWith((message) => updates(message as MrktSecInfoItem)) as MrktSecInfoItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MrktSecInfoItem create() => MrktSecInfoItem._();
  MrktSecInfoItem createEmptyInstance() => create();
  static $pb.PbList<MrktSecInfoItem> createRepeated() => $pb.PbList<MrktSecInfoItem>();
  @$core.pragma('dart2js:noInline')
  static MrktSecInfoItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MrktSecInfoItem>(create);
  static MrktSecInfoItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get secCd => $_getSZ(0);
  @$pb.TagNumber(1)
  set secCd($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSecCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get secType => $_getIZ(1);
  @$pb.TagNumber(2)
  set secType($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecType() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get secName => $_getSZ(2);
  @$pb.TagNumber(3)
  set secName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSecName() => $_has(2);
  @$pb.TagNumber(3)
  void clearSecName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get secNameEn => $_getSZ(3);
  @$pb.TagNumber(4)
  set secNameEn($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSecNameEn() => $_has(3);
  @$pb.TagNumber(4)
  void clearSecNameEn() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get marketCd => $_getIZ(4);
  @$pb.TagNumber(5)
  set marketCd($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMarketCd() => $_has(4);
  @$pb.TagNumber(5)
  void clearMarketCd() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get maxRate => $_getN(5);
  @$pb.TagNumber(6)
  set maxRate($core.double v) { $_setFloat(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMaxRate() => $_has(5);
  @$pb.TagNumber(6)
  void clearMaxRate() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get listedQty => $_getN(6);
  @$pb.TagNumber(7)
  set listedQty($core.double v) { $_setFloat(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasListedQty() => $_has(6);
  @$pb.TagNumber(7)
  void clearListedQty() => clearField(7);
}

class MrktSecInfoResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MrktSecInfoResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..pc<MrktSecInfoItem>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.PM, subBuilder: MrktSecInfoItem.create)
    ..hasRequiredFields = false
  ;

  MrktSecInfoResponse._() : super();
  factory MrktSecInfoResponse({
    $core.int? result,
    $core.String? error,
    $core.String? message,
    $core.Iterable<MrktSecInfoItem>? data,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory MrktSecInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MrktSecInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MrktSecInfoResponse clone() => MrktSecInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MrktSecInfoResponse copyWith(void Function(MrktSecInfoResponse) updates) => super.copyWith((message) => updates(message as MrktSecInfoResponse)) as MrktSecInfoResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MrktSecInfoResponse create() => MrktSecInfoResponse._();
  MrktSecInfoResponse createEmptyInstance() => create();
  static $pb.PbList<MrktSecInfoResponse> createRepeated() => $pb.PbList<MrktSecInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static MrktSecInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MrktSecInfoResponse>(create);
  static MrktSecInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get result => $_getIZ(0);
  @$pb.TagNumber(1)
  set result($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<MrktSecInfoItem> get data => $_getList(3);
}

class MrktSecInfoParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MrktSecInfoParam', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..hasRequiredFields = false
  ;

  MrktSecInfoParam._() : super();
  factory MrktSecInfoParam({
    $core.String? authenCode,
  }) {
    final _result = create();
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    return _result;
  }
  factory MrktSecInfoParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MrktSecInfoParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MrktSecInfoParam clone() => MrktSecInfoParam()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MrktSecInfoParam copyWith(void Function(MrktSecInfoParam) updates) => super.copyWith((message) => updates(message as MrktSecInfoParam)) as MrktSecInfoParam; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MrktSecInfoParam create() => MrktSecInfoParam._();
  MrktSecInfoParam createEmptyInstance() => create();
  static $pb.PbList<MrktSecInfoParam> createRepeated() => $pb.PbList<MrktSecInfoParam>();
  @$core.pragma('dart2js:noInline')
  static MrktSecInfoParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MrktSecInfoParam>(create);
  static MrktSecInfoParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get authenCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set authenCode($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuthenCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthenCode() => clearField(1);
}

class MrktAdvItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MrktAdvItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tradeDate', $pb.PbFieldType.O3, protoName: 'tradeDate')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'advTime', $pb.PbFieldType.O3, protoName: 'advTime')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'qty')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price', $pb.PbFieldType.OF)
    ..e<STOCK_COLOR_CODE>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'colorCode', $pb.PbFieldType.OE, protoName: 'colorCode', defaultOrMaker: STOCK_COLOR_CODE.BASIC_PRICE, valueOf: STOCK_COLOR_CODE.valueOf, enumValues: STOCK_COLOR_CODE.values)
    ..hasRequiredFields = false
  ;

  MrktAdvItem._() : super();
  factory MrktAdvItem({
    $core.int? tradeDate,
    $core.int? advTime,
    $core.String? secCd,
    $fixnum.Int64? qty,
    $core.double? price,
    STOCK_COLOR_CODE? colorCode,
  }) {
    final _result = create();
    if (tradeDate != null) {
      _result.tradeDate = tradeDate;
    }
    if (advTime != null) {
      _result.advTime = advTime;
    }
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (qty != null) {
      _result.qty = qty;
    }
    if (price != null) {
      _result.price = price;
    }
    if (colorCode != null) {
      _result.colorCode = colorCode;
    }
    return _result;
  }
  factory MrktAdvItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MrktAdvItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MrktAdvItem clone() => MrktAdvItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MrktAdvItem copyWith(void Function(MrktAdvItem) updates) => super.copyWith((message) => updates(message as MrktAdvItem)) as MrktAdvItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MrktAdvItem create() => MrktAdvItem._();
  MrktAdvItem createEmptyInstance() => create();
  static $pb.PbList<MrktAdvItem> createRepeated() => $pb.PbList<MrktAdvItem>();
  @$core.pragma('dart2js:noInline')
  static MrktAdvItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MrktAdvItem>(create);
  static MrktAdvItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tradeDate => $_getIZ(0);
  @$pb.TagNumber(1)
  set tradeDate($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTradeDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearTradeDate() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get advTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set advTime($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAdvTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearAdvTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get secCd => $_getSZ(2);
  @$pb.TagNumber(3)
  set secCd($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSecCd() => $_has(2);
  @$pb.TagNumber(3)
  void clearSecCd() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get qty => $_getI64(3);
  @$pb.TagNumber(4)
  set qty($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasQty() => $_has(3);
  @$pb.TagNumber(4)
  void clearQty() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get price => $_getN(4);
  @$pb.TagNumber(5)
  set price($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrice() => clearField(5);

  @$pb.TagNumber(6)
  STOCK_COLOR_CODE get colorCode => $_getN(5);
  @$pb.TagNumber(6)
  set colorCode(STOCK_COLOR_CODE v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasColorCode() => $_has(5);
  @$pb.TagNumber(6)
  void clearColorCode() => clearField(6);
}

class MrktMatchPtItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MrktMatchPtItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tradeDate', $pb.PbFieldType.O3, protoName: 'tradeDate')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'matTime', $pb.PbFieldType.O3, protoName: 'matTime')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'confirmNo', protoName: 'confirmNo')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', $pb.PbFieldType.O3, protoName: 'marketCd')
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'matQty', protoName: 'matQty')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'matPrice', $pb.PbFieldType.OF, protoName: 'matPrice')
    ..e<STOCK_COLOR_CODE>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'colorCode', $pb.PbFieldType.OE, protoName: 'colorCode', defaultOrMaker: STOCK_COLOR_CODE.BASIC_PRICE, valueOf: STOCK_COLOR_CODE.valueOf, enumValues: STOCK_COLOR_CODE.values)
    ..hasRequiredFields = false
  ;

  MrktMatchPtItem._() : super();
  factory MrktMatchPtItem({
    $core.int? tradeDate,
    $core.int? matTime,
    $core.String? confirmNo,
    $core.String? secCd,
    $core.int? marketCd,
    $fixnum.Int64? matQty,
    $core.double? matPrice,
    STOCK_COLOR_CODE? colorCode,
  }) {
    final _result = create();
    if (tradeDate != null) {
      _result.tradeDate = tradeDate;
    }
    if (matTime != null) {
      _result.matTime = matTime;
    }
    if (confirmNo != null) {
      _result.confirmNo = confirmNo;
    }
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    if (matQty != null) {
      _result.matQty = matQty;
    }
    if (matPrice != null) {
      _result.matPrice = matPrice;
    }
    if (colorCode != null) {
      _result.colorCode = colorCode;
    }
    return _result;
  }
  factory MrktMatchPtItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MrktMatchPtItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MrktMatchPtItem clone() => MrktMatchPtItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MrktMatchPtItem copyWith(void Function(MrktMatchPtItem) updates) => super.copyWith((message) => updates(message as MrktMatchPtItem)) as MrktMatchPtItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MrktMatchPtItem create() => MrktMatchPtItem._();
  MrktMatchPtItem createEmptyInstance() => create();
  static $pb.PbList<MrktMatchPtItem> createRepeated() => $pb.PbList<MrktMatchPtItem>();
  @$core.pragma('dart2js:noInline')
  static MrktMatchPtItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MrktMatchPtItem>(create);
  static MrktMatchPtItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tradeDate => $_getIZ(0);
  @$pb.TagNumber(1)
  set tradeDate($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTradeDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearTradeDate() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get matTime => $_getIZ(1);
  @$pb.TagNumber(2)
  set matTime($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMatTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearMatTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get confirmNo => $_getSZ(2);
  @$pb.TagNumber(3)
  set confirmNo($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasConfirmNo() => $_has(2);
  @$pb.TagNumber(3)
  void clearConfirmNo() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get secCd => $_getSZ(3);
  @$pb.TagNumber(4)
  set secCd($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSecCd() => $_has(3);
  @$pb.TagNumber(4)
  void clearSecCd() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get marketCd => $_getIZ(4);
  @$pb.TagNumber(5)
  set marketCd($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMarketCd() => $_has(4);
  @$pb.TagNumber(5)
  void clearMarketCd() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get matQty => $_getI64(5);
  @$pb.TagNumber(6)
  set matQty($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMatQty() => $_has(5);
  @$pb.TagNumber(6)
  void clearMatQty() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get matPrice => $_getN(6);
  @$pb.TagNumber(7)
  set matPrice($core.double v) { $_setFloat(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMatPrice() => $_has(6);
  @$pb.TagNumber(7)
  void clearMatPrice() => clearField(7);

  @$pb.TagNumber(8)
  STOCK_COLOR_CODE get colorCode => $_getN(7);
  @$pb.TagNumber(8)
  set colorCode(STOCK_COLOR_CODE v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasColorCode() => $_has(7);
  @$pb.TagNumber(8)
  void clearColorCode() => clearField(8);
}

class PutThroughData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PutThroughData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..pc<MrktAdvItem>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellList', $pb.PbFieldType.PM, protoName: 'sellList', subBuilder: MrktAdvItem.create)
    ..pc<MrktAdvItem>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyList', $pb.PbFieldType.PM, protoName: 'buyList', subBuilder: MrktAdvItem.create)
    ..pc<MrktMatchPtItem>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'matchPtList', $pb.PbFieldType.PM, protoName: 'matchPtList', subBuilder: MrktMatchPtItem.create)
    ..hasRequiredFields = false
  ;

  PutThroughData._() : super();
  factory PutThroughData({
    $core.Iterable<MrktAdvItem>? sellList,
    $core.Iterable<MrktAdvItem>? buyList,
    $core.Iterable<MrktMatchPtItem>? matchPtList,
  }) {
    final _result = create();
    if (sellList != null) {
      _result.sellList.addAll(sellList);
    }
    if (buyList != null) {
      _result.buyList.addAll(buyList);
    }
    if (matchPtList != null) {
      _result.matchPtList.addAll(matchPtList);
    }
    return _result;
  }
  factory PutThroughData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PutThroughData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PutThroughData clone() => PutThroughData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PutThroughData copyWith(void Function(PutThroughData) updates) => super.copyWith((message) => updates(message as PutThroughData)) as PutThroughData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PutThroughData create() => PutThroughData._();
  PutThroughData createEmptyInstance() => create();
  static $pb.PbList<PutThroughData> createRepeated() => $pb.PbList<PutThroughData>();
  @$core.pragma('dart2js:noInline')
  static PutThroughData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PutThroughData>(create);
  static PutThroughData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MrktAdvItem> get sellList => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<MrktAdvItem> get buyList => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<MrktMatchPtItem> get matchPtList => $_getList(2);
}

class PutThroughResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PutThroughResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOM<PutThroughData>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', subBuilder: PutThroughData.create)
    ..hasRequiredFields = false
  ;

  PutThroughResponse._() : super();
  factory PutThroughResponse({
    $core.int? result,
    $core.String? error,
    $core.String? message,
    PutThroughData? data,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory PutThroughResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PutThroughResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PutThroughResponse clone() => PutThroughResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PutThroughResponse copyWith(void Function(PutThroughResponse) updates) => super.copyWith((message) => updates(message as PutThroughResponse)) as PutThroughResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PutThroughResponse create() => PutThroughResponse._();
  PutThroughResponse createEmptyInstance() => create();
  static $pb.PbList<PutThroughResponse> createRepeated() => $pb.PbList<PutThroughResponse>();
  @$core.pragma('dart2js:noInline')
  static PutThroughResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PutThroughResponse>(create);
  static PutThroughResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get result => $_getIZ(0);
  @$pb.TagNumber(1)
  set result($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  PutThroughData get data => $_getN(3);
  @$pb.TagNumber(4)
  set data(PutThroughData v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => clearField(4);
  @$pb.TagNumber(4)
  PutThroughData ensureData() => $_ensure(3);
}

class PutThroughParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PutThroughParam', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', $pb.PbFieldType.O3, protoName: 'marketCd')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tradeDate', $pb.PbFieldType.O3, protoName: 'tradeDate')
    ..hasRequiredFields = false
  ;

  PutThroughParam._() : super();
  factory PutThroughParam({
    $core.String? authenCode,
    $core.int? marketCd,
    $core.int? tradeDate,
  }) {
    final _result = create();
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    if (tradeDate != null) {
      _result.tradeDate = tradeDate;
    }
    return _result;
  }
  factory PutThroughParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PutThroughParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PutThroughParam clone() => PutThroughParam()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PutThroughParam copyWith(void Function(PutThroughParam) updates) => super.copyWith((message) => updates(message as PutThroughParam)) as PutThroughParam; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PutThroughParam create() => PutThroughParam._();
  PutThroughParam createEmptyInstance() => create();
  static $pb.PbList<PutThroughParam> createRepeated() => $pb.PbList<PutThroughParam>();
  @$core.pragma('dart2js:noInline')
  static PutThroughParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PutThroughParam>(create);
  static PutThroughParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get authenCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set authenCode($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuthenCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthenCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get marketCd => $_getIZ(1);
  @$pb.TagNumber(2)
  set marketCd($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMarketCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearMarketCd() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get tradeDate => $_getIZ(2);
  @$pb.TagNumber(3)
  set tradeDate($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTradeDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearTradeDate() => clearField(3);
}

class TopIndexContributionItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopIndexContributionItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contributeVal', $pb.PbFieldType.OD, protoName: 'contributeVal')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contributePercent', $pb.PbFieldType.OD, protoName: 'contributePercent')
    ..hasRequiredFields = false
  ;

  TopIndexContributionItem._() : super();
  factory TopIndexContributionItem({
    $core.String? secCd,
    $core.double? contributeVal,
    $core.double? contributePercent,
  }) {
    final _result = create();
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (contributeVal != null) {
      _result.contributeVal = contributeVal;
    }
    if (contributePercent != null) {
      _result.contributePercent = contributePercent;
    }
    return _result;
  }
  factory TopIndexContributionItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopIndexContributionItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopIndexContributionItem clone() => TopIndexContributionItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopIndexContributionItem copyWith(void Function(TopIndexContributionItem) updates) => super.copyWith((message) => updates(message as TopIndexContributionItem)) as TopIndexContributionItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopIndexContributionItem create() => TopIndexContributionItem._();
  TopIndexContributionItem createEmptyInstance() => create();
  static $pb.PbList<TopIndexContributionItem> createRepeated() => $pb.PbList<TopIndexContributionItem>();
  @$core.pragma('dart2js:noInline')
  static TopIndexContributionItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopIndexContributionItem>(create);
  static TopIndexContributionItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get secCd => $_getSZ(0);
  @$pb.TagNumber(1)
  set secCd($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSecCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get contributeVal => $_getN(1);
  @$pb.TagNumber(2)
  set contributeVal($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContributeVal() => $_has(1);
  @$pb.TagNumber(2)
  void clearContributeVal() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get contributePercent => $_getN(2);
  @$pb.TagNumber(3)
  set contributePercent($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContributePercent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContributePercent() => clearField(3);
}

class TopIndexContributionData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopIndexContributionData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..pc<TopIndexContributionItem>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topIncrease', $pb.PbFieldType.PM, protoName: 'topIncrease', subBuilder: TopIndexContributionItem.create)
    ..pc<TopIndexContributionItem>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'topDecrease', $pb.PbFieldType.PM, protoName: 'topDecrease', subBuilder: TopIndexContributionItem.create)
    ..hasRequiredFields = false
  ;

  TopIndexContributionData._() : super();
  factory TopIndexContributionData({
    $core.Iterable<TopIndexContributionItem>? topIncrease,
    $core.Iterable<TopIndexContributionItem>? topDecrease,
  }) {
    final _result = create();
    if (topIncrease != null) {
      _result.topIncrease.addAll(topIncrease);
    }
    if (topDecrease != null) {
      _result.topDecrease.addAll(topDecrease);
    }
    return _result;
  }
  factory TopIndexContributionData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopIndexContributionData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopIndexContributionData clone() => TopIndexContributionData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopIndexContributionData copyWith(void Function(TopIndexContributionData) updates) => super.copyWith((message) => updates(message as TopIndexContributionData)) as TopIndexContributionData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopIndexContributionData create() => TopIndexContributionData._();
  TopIndexContributionData createEmptyInstance() => create();
  static $pb.PbList<TopIndexContributionData> createRepeated() => $pb.PbList<TopIndexContributionData>();
  @$core.pragma('dart2js:noInline')
  static TopIndexContributionData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopIndexContributionData>(create);
  static TopIndexContributionData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TopIndexContributionItem> get topIncrease => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<TopIndexContributionItem> get topDecrease => $_getList(1);
}

class TopIndexContributionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopIndexContributionResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOM<TopIndexContributionData>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', subBuilder: TopIndexContributionData.create)
    ..hasRequiredFields = false
  ;

  TopIndexContributionResponse._() : super();
  factory TopIndexContributionResponse({
    $core.int? result,
    $core.String? error,
    $core.String? message,
    TopIndexContributionData? data,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data = data;
    }
    return _result;
  }
  factory TopIndexContributionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopIndexContributionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopIndexContributionResponse clone() => TopIndexContributionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopIndexContributionResponse copyWith(void Function(TopIndexContributionResponse) updates) => super.copyWith((message) => updates(message as TopIndexContributionResponse)) as TopIndexContributionResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopIndexContributionResponse create() => TopIndexContributionResponse._();
  TopIndexContributionResponse createEmptyInstance() => create();
  static $pb.PbList<TopIndexContributionResponse> createRepeated() => $pb.PbList<TopIndexContributionResponse>();
  @$core.pragma('dart2js:noInline')
  static TopIndexContributionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopIndexContributionResponse>(create);
  static TopIndexContributionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get result => $_getIZ(0);
  @$pb.TagNumber(1)
  set result($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  TopIndexContributionData get data => $_getN(3);
  @$pb.TagNumber(4)
  set data(TopIndexContributionData v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => clearField(4);
  @$pb.TagNumber(4)
  TopIndexContributionData ensureData() => $_ensure(3);
}

class TopIndexContributionParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopIndexContributionParam', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', $pb.PbFieldType.O3, protoName: 'marketCd')
    ..hasRequiredFields = false
  ;

  TopIndexContributionParam._() : super();
  factory TopIndexContributionParam({
    $core.String? authenCode,
    $core.int? marketCd,
  }) {
    final _result = create();
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    return _result;
  }
  factory TopIndexContributionParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopIndexContributionParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopIndexContributionParam clone() => TopIndexContributionParam()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopIndexContributionParam copyWith(void Function(TopIndexContributionParam) updates) => super.copyWith((message) => updates(message as TopIndexContributionParam)) as TopIndexContributionParam; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopIndexContributionParam create() => TopIndexContributionParam._();
  TopIndexContributionParam createEmptyInstance() => create();
  static $pb.PbList<TopIndexContributionParam> createRepeated() => $pb.PbList<TopIndexContributionParam>();
  @$core.pragma('dart2js:noInline')
  static TopIndexContributionParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopIndexContributionParam>(create);
  static TopIndexContributionParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get authenCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set authenCode($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuthenCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthenCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get marketCd => $_getIZ(1);
  @$pb.TagNumber(2)
  set marketCd($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMarketCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearMarketCd() => clearField(2);
}

class MarketBreadthItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketBreadthItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contributeVal', $pb.PbFieldType.OD, protoName: 'contributeVal')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contributePercent', $pb.PbFieldType.OD, protoName: 'contributePercent')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', $pb.PbFieldType.O3, protoName: 'marketCd')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avgAmt5d', $pb.PbFieldType.OD, protoName: 'avgAmt5d')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCapWeight', $pb.PbFieldType.OD, protoName: 'marketCapWeight')
    ..e<STOCK_COLOR_CODE>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'colorCode', $pb.PbFieldType.OE, protoName: 'colorCode', defaultOrMaker: STOCK_COLOR_CODE.BASIC_PRICE, valueOf: STOCK_COLOR_CODE.valueOf, enumValues: STOCK_COLOR_CODE.values)
    ..hasRequiredFields = false
  ;

  MarketBreadthItem._() : super();
  factory MarketBreadthItem({
    $core.String? secCd,
    $core.double? contributeVal,
    $core.double? contributePercent,
    $core.int? marketCd,
    $core.double? avgAmt5d,
    $core.double? marketCapWeight,
    STOCK_COLOR_CODE? colorCode,
  }) {
    final _result = create();
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (contributeVal != null) {
      _result.contributeVal = contributeVal;
    }
    if (contributePercent != null) {
      _result.contributePercent = contributePercent;
    }
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    if (avgAmt5d != null) {
      _result.avgAmt5d = avgAmt5d;
    }
    if (marketCapWeight != null) {
      _result.marketCapWeight = marketCapWeight;
    }
    if (colorCode != null) {
      _result.colorCode = colorCode;
    }
    return _result;
  }
  factory MarketBreadthItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketBreadthItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketBreadthItem clone() => MarketBreadthItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketBreadthItem copyWith(void Function(MarketBreadthItem) updates) => super.copyWith((message) => updates(message as MarketBreadthItem)) as MarketBreadthItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketBreadthItem create() => MarketBreadthItem._();
  MarketBreadthItem createEmptyInstance() => create();
  static $pb.PbList<MarketBreadthItem> createRepeated() => $pb.PbList<MarketBreadthItem>();
  @$core.pragma('dart2js:noInline')
  static MarketBreadthItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketBreadthItem>(create);
  static MarketBreadthItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get secCd => $_getSZ(0);
  @$pb.TagNumber(1)
  set secCd($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSecCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get contributeVal => $_getN(1);
  @$pb.TagNumber(2)
  set contributeVal($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContributeVal() => $_has(1);
  @$pb.TagNumber(2)
  void clearContributeVal() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get contributePercent => $_getN(2);
  @$pb.TagNumber(3)
  set contributePercent($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContributePercent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContributePercent() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get marketCd => $_getIZ(3);
  @$pb.TagNumber(4)
  set marketCd($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMarketCd() => $_has(3);
  @$pb.TagNumber(4)
  void clearMarketCd() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get avgAmt5d => $_getN(4);
  @$pb.TagNumber(5)
  set avgAmt5d($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAvgAmt5d() => $_has(4);
  @$pb.TagNumber(5)
  void clearAvgAmt5d() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get marketCapWeight => $_getN(5);
  @$pb.TagNumber(6)
  set marketCapWeight($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMarketCapWeight() => $_has(5);
  @$pb.TagNumber(6)
  void clearMarketCapWeight() => clearField(6);

  @$pb.TagNumber(7)
  STOCK_COLOR_CODE get colorCode => $_getN(6);
  @$pb.TagNumber(7)
  set colorCode(STOCK_COLOR_CODE v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasColorCode() => $_has(6);
  @$pb.TagNumber(7)
  void clearColorCode() => clearField(7);
}

class MarketBreadthResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketBreadthResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..pc<MarketBreadthItem>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.PM, subBuilder: MarketBreadthItem.create)
    ..hasRequiredFields = false
  ;

  MarketBreadthResponse._() : super();
  factory MarketBreadthResponse({
    $core.int? result,
    $core.String? error,
    $core.String? message,
    $core.Iterable<MarketBreadthItem>? data,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory MarketBreadthResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketBreadthResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketBreadthResponse clone() => MarketBreadthResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketBreadthResponse copyWith(void Function(MarketBreadthResponse) updates) => super.copyWith((message) => updates(message as MarketBreadthResponse)) as MarketBreadthResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketBreadthResponse create() => MarketBreadthResponse._();
  MarketBreadthResponse createEmptyInstance() => create();
  static $pb.PbList<MarketBreadthResponse> createRepeated() => $pb.PbList<MarketBreadthResponse>();
  @$core.pragma('dart2js:noInline')
  static MarketBreadthResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketBreadthResponse>(create);
  static MarketBreadthResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get result => $_getIZ(0);
  @$pb.TagNumber(1)
  set result($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<MarketBreadthItem> get data => $_getList(3);
}

class MarketLiquidityItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketLiquidityItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tradeDate', $pb.PbFieldType.OD, protoName: 'tradeDate')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'indexCd', $pb.PbFieldType.OD, protoName: 'indexCd')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valueT0', $pb.PbFieldType.OD, protoName: 'valueT0')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valueT1', $pb.PbFieldType.OD, protoName: 'valueT1')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valueT5', $pb.PbFieldType.OD, protoName: 'valueT5')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valueT10', $pb.PbFieldType.OD, protoName: 'valueT10')
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valueT30', $pb.PbFieldType.OD, protoName: 'valueT30')
    ..hasRequiredFields = false
  ;

  MarketLiquidityItem._() : super();
  factory MarketLiquidityItem({
    $core.double? tradeDate,
    $core.double? indexCd,
    $core.String? time,
    $core.double? valueT0,
    $core.double? valueT1,
    $core.double? valueT5,
    $core.double? valueT10,
    $core.double? valueT30,
  }) {
    final _result = create();
    if (tradeDate != null) {
      _result.tradeDate = tradeDate;
    }
    if (indexCd != null) {
      _result.indexCd = indexCd;
    }
    if (time != null) {
      _result.time = time;
    }
    if (valueT0 != null) {
      _result.valueT0 = valueT0;
    }
    if (valueT1 != null) {
      _result.valueT1 = valueT1;
    }
    if (valueT5 != null) {
      _result.valueT5 = valueT5;
    }
    if (valueT10 != null) {
      _result.valueT10 = valueT10;
    }
    if (valueT30 != null) {
      _result.valueT30 = valueT30;
    }
    return _result;
  }
  factory MarketLiquidityItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketLiquidityItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketLiquidityItem clone() => MarketLiquidityItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketLiquidityItem copyWith(void Function(MarketLiquidityItem) updates) => super.copyWith((message) => updates(message as MarketLiquidityItem)) as MarketLiquidityItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketLiquidityItem create() => MarketLiquidityItem._();
  MarketLiquidityItem createEmptyInstance() => create();
  static $pb.PbList<MarketLiquidityItem> createRepeated() => $pb.PbList<MarketLiquidityItem>();
  @$core.pragma('dart2js:noInline')
  static MarketLiquidityItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketLiquidityItem>(create);
  static MarketLiquidityItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get tradeDate => $_getN(0);
  @$pb.TagNumber(1)
  set tradeDate($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTradeDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearTradeDate() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get indexCd => $_getN(1);
  @$pb.TagNumber(2)
  set indexCd($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndexCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndexCd() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get time => $_getSZ(2);
  @$pb.TagNumber(3)
  set time($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get valueT0 => $_getN(3);
  @$pb.TagNumber(4)
  set valueT0($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasValueT0() => $_has(3);
  @$pb.TagNumber(4)
  void clearValueT0() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get valueT1 => $_getN(4);
  @$pb.TagNumber(5)
  set valueT1($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasValueT1() => $_has(4);
  @$pb.TagNumber(5)
  void clearValueT1() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get valueT5 => $_getN(5);
  @$pb.TagNumber(6)
  set valueT5($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasValueT5() => $_has(5);
  @$pb.TagNumber(6)
  void clearValueT5() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get valueT10 => $_getN(6);
  @$pb.TagNumber(7)
  set valueT10($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasValueT10() => $_has(6);
  @$pb.TagNumber(7)
  void clearValueT10() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get valueT30 => $_getN(7);
  @$pb.TagNumber(8)
  set valueT30($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasValueT30() => $_has(7);
  @$pb.TagNumber(8)
  void clearValueT30() => clearField(8);
}

class MarketLiquidityResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketLiquidityResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..pc<MarketLiquidityItem>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.PM, subBuilder: MarketLiquidityItem.create)
    ..hasRequiredFields = false
  ;

  MarketLiquidityResponse._() : super();
  factory MarketLiquidityResponse({
    $core.int? result,
    $core.String? error,
    $core.String? message,
    $core.Iterable<MarketLiquidityItem>? data,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory MarketLiquidityResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketLiquidityResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketLiquidityResponse clone() => MarketLiquidityResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketLiquidityResponse copyWith(void Function(MarketLiquidityResponse) updates) => super.copyWith((message) => updates(message as MarketLiquidityResponse)) as MarketLiquidityResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketLiquidityResponse create() => MarketLiquidityResponse._();
  MarketLiquidityResponse createEmptyInstance() => create();
  static $pb.PbList<MarketLiquidityResponse> createRepeated() => $pb.PbList<MarketLiquidityResponse>();
  @$core.pragma('dart2js:noInline')
  static MarketLiquidityResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketLiquidityResponse>(create);
  static MarketLiquidityResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get result => $_getIZ(0);
  @$pb.TagNumber(1)
  set result($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<MarketLiquidityItem> get data => $_getList(3);
}

class TopIndustriesTradeForeignItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopIndustriesTradeForeignItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', $pb.PbFieldType.O3, protoName: 'marketCd')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'industryNameVi', protoName: 'industryNameVi')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'industryNameEn', protoName: 'industryNameEn')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyForeignQty', $pb.PbFieldType.OD, protoName: 'buyForeignQty')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellForeignQty', $pb.PbFieldType.OD, protoName: 'sellForeignQty')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'netForeignQty', $pb.PbFieldType.OD, protoName: 'netForeignQty')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buyForeignAmt', $pb.PbFieldType.OD, protoName: 'buyForeignAmt')
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sellForeignAmt', $pb.PbFieldType.OD, protoName: 'sellForeignAmt')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'netForeignAmt', $pb.PbFieldType.OD, protoName: 'netForeignAmt')
    ..hasRequiredFields = false
  ;

  TopIndustriesTradeForeignItem._() : super();
  factory TopIndustriesTradeForeignItem({
    $core.int? marketCd,
    $core.String? industryNameVi,
    $core.String? industryNameEn,
    $core.double? buyForeignQty,
    $core.double? sellForeignQty,
    $core.double? netForeignQty,
    $core.double? buyForeignAmt,
    $core.double? sellForeignAmt,
    $core.double? netForeignAmt,
  }) {
    final _result = create();
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    if (industryNameVi != null) {
      _result.industryNameVi = industryNameVi;
    }
    if (industryNameEn != null) {
      _result.industryNameEn = industryNameEn;
    }
    if (buyForeignQty != null) {
      _result.buyForeignQty = buyForeignQty;
    }
    if (sellForeignQty != null) {
      _result.sellForeignQty = sellForeignQty;
    }
    if (netForeignQty != null) {
      _result.netForeignQty = netForeignQty;
    }
    if (buyForeignAmt != null) {
      _result.buyForeignAmt = buyForeignAmt;
    }
    if (sellForeignAmt != null) {
      _result.sellForeignAmt = sellForeignAmt;
    }
    if (netForeignAmt != null) {
      _result.netForeignAmt = netForeignAmt;
    }
    return _result;
  }
  factory TopIndustriesTradeForeignItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopIndustriesTradeForeignItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopIndustriesTradeForeignItem clone() => TopIndustriesTradeForeignItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopIndustriesTradeForeignItem copyWith(void Function(TopIndustriesTradeForeignItem) updates) => super.copyWith((message) => updates(message as TopIndustriesTradeForeignItem)) as TopIndustriesTradeForeignItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopIndustriesTradeForeignItem create() => TopIndustriesTradeForeignItem._();
  TopIndustriesTradeForeignItem createEmptyInstance() => create();
  static $pb.PbList<TopIndustriesTradeForeignItem> createRepeated() => $pb.PbList<TopIndustriesTradeForeignItem>();
  @$core.pragma('dart2js:noInline')
  static TopIndustriesTradeForeignItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopIndustriesTradeForeignItem>(create);
  static TopIndustriesTradeForeignItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get marketCd => $_getIZ(0);
  @$pb.TagNumber(1)
  set marketCd($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMarketCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearMarketCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get industryNameVi => $_getSZ(1);
  @$pb.TagNumber(2)
  set industryNameVi($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndustryNameVi() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndustryNameVi() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get industryNameEn => $_getSZ(2);
  @$pb.TagNumber(3)
  set industryNameEn($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIndustryNameEn() => $_has(2);
  @$pb.TagNumber(3)
  void clearIndustryNameEn() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get buyForeignQty => $_getN(3);
  @$pb.TagNumber(4)
  set buyForeignQty($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBuyForeignQty() => $_has(3);
  @$pb.TagNumber(4)
  void clearBuyForeignQty() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get sellForeignQty => $_getN(4);
  @$pb.TagNumber(5)
  set sellForeignQty($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSellForeignQty() => $_has(4);
  @$pb.TagNumber(5)
  void clearSellForeignQty() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get netForeignQty => $_getN(5);
  @$pb.TagNumber(6)
  set netForeignQty($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNetForeignQty() => $_has(5);
  @$pb.TagNumber(6)
  void clearNetForeignQty() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get buyForeignAmt => $_getN(6);
  @$pb.TagNumber(7)
  set buyForeignAmt($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBuyForeignAmt() => $_has(6);
  @$pb.TagNumber(7)
  void clearBuyForeignAmt() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get sellForeignAmt => $_getN(7);
  @$pb.TagNumber(8)
  set sellForeignAmt($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSellForeignAmt() => $_has(7);
  @$pb.TagNumber(8)
  void clearSellForeignAmt() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get netForeignAmt => $_getN(8);
  @$pb.TagNumber(9)
  set netForeignAmt($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasNetForeignAmt() => $_has(8);
  @$pb.TagNumber(9)
  void clearNetForeignAmt() => clearField(9);
}

class TopIndustriesTradeForeignResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopIndustriesTradeForeignResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..pc<TopIndustriesTradeForeignItem>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.PM, subBuilder: TopIndustriesTradeForeignItem.create)
    ..hasRequiredFields = false
  ;

  TopIndustriesTradeForeignResponse._() : super();
  factory TopIndustriesTradeForeignResponse({
    $core.int? result,
    $core.String? error,
    $core.String? message,
    $core.Iterable<TopIndustriesTradeForeignItem>? data,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory TopIndustriesTradeForeignResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopIndustriesTradeForeignResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopIndustriesTradeForeignResponse clone() => TopIndustriesTradeForeignResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopIndustriesTradeForeignResponse copyWith(void Function(TopIndustriesTradeForeignResponse) updates) => super.copyWith((message) => updates(message as TopIndustriesTradeForeignResponse)) as TopIndustriesTradeForeignResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopIndustriesTradeForeignResponse create() => TopIndustriesTradeForeignResponse._();
  TopIndustriesTradeForeignResponse createEmptyInstance() => create();
  static $pb.PbList<TopIndustriesTradeForeignResponse> createRepeated() => $pb.PbList<TopIndustriesTradeForeignResponse>();
  @$core.pragma('dart2js:noInline')
  static TopIndustriesTradeForeignResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopIndustriesTradeForeignResponse>(create);
  static TopIndustriesTradeForeignResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get result => $_getIZ(0);
  @$pb.TagNumber(1)
  set result($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<TopIndustriesTradeForeignItem> get data => $_getList(3);
}

class TopIndustriesContributionItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopIndustriesContributionItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', $pb.PbFieldType.O3, protoName: 'marketCd')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'industryNameVi', protoName: 'industryNameVi')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'industryNameEn', protoName: 'industryNameEn')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contributeVal', $pb.PbFieldType.OD, protoName: 'contributeVal')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contributePercent', $pb.PbFieldType.OD, protoName: 'contributePercent')
    ..hasRequiredFields = false
  ;

  TopIndustriesContributionItem._() : super();
  factory TopIndustriesContributionItem({
    $core.int? marketCd,
    $core.String? industryNameVi,
    $core.String? industryNameEn,
    $core.double? contributeVal,
    $core.double? contributePercent,
  }) {
    final _result = create();
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    if (industryNameVi != null) {
      _result.industryNameVi = industryNameVi;
    }
    if (industryNameEn != null) {
      _result.industryNameEn = industryNameEn;
    }
    if (contributeVal != null) {
      _result.contributeVal = contributeVal;
    }
    if (contributePercent != null) {
      _result.contributePercent = contributePercent;
    }
    return _result;
  }
  factory TopIndustriesContributionItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopIndustriesContributionItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopIndustriesContributionItem clone() => TopIndustriesContributionItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopIndustriesContributionItem copyWith(void Function(TopIndustriesContributionItem) updates) => super.copyWith((message) => updates(message as TopIndustriesContributionItem)) as TopIndustriesContributionItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopIndustriesContributionItem create() => TopIndustriesContributionItem._();
  TopIndustriesContributionItem createEmptyInstance() => create();
  static $pb.PbList<TopIndustriesContributionItem> createRepeated() => $pb.PbList<TopIndustriesContributionItem>();
  @$core.pragma('dart2js:noInline')
  static TopIndustriesContributionItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopIndustriesContributionItem>(create);
  static TopIndustriesContributionItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get marketCd => $_getIZ(0);
  @$pb.TagNumber(1)
  set marketCd($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMarketCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearMarketCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get industryNameVi => $_getSZ(1);
  @$pb.TagNumber(2)
  set industryNameVi($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndustryNameVi() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndustryNameVi() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get industryNameEn => $_getSZ(2);
  @$pb.TagNumber(3)
  set industryNameEn($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIndustryNameEn() => $_has(2);
  @$pb.TagNumber(3)
  void clearIndustryNameEn() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get contributeVal => $_getN(3);
  @$pb.TagNumber(4)
  set contributeVal($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContributeVal() => $_has(3);
  @$pb.TagNumber(4)
  void clearContributeVal() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get contributePercent => $_getN(4);
  @$pb.TagNumber(5)
  set contributePercent($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasContributePercent() => $_has(4);
  @$pb.TagNumber(5)
  void clearContributePercent() => clearField(5);
}

class TopIndustriesContributionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopIndustriesContributionResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..pc<TopIndustriesContributionItem>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.PM, subBuilder: TopIndustriesContributionItem.create)
    ..hasRequiredFields = false
  ;

  TopIndustriesContributionResponse._() : super();
  factory TopIndustriesContributionResponse({
    $core.int? result,
    $core.String? error,
    $core.String? message,
    $core.Iterable<TopIndustriesContributionItem>? data,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory TopIndustriesContributionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopIndustriesContributionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopIndustriesContributionResponse clone() => TopIndustriesContributionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopIndustriesContributionResponse copyWith(void Function(TopIndustriesContributionResponse) updates) => super.copyWith((message) => updates(message as TopIndustriesContributionResponse)) as TopIndustriesContributionResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopIndustriesContributionResponse create() => TopIndustriesContributionResponse._();
  TopIndustriesContributionResponse createEmptyInstance() => create();
  static $pb.PbList<TopIndustriesContributionResponse> createRepeated() => $pb.PbList<TopIndustriesContributionResponse>();
  @$core.pragma('dart2js:noInline')
  static TopIndustriesContributionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopIndustriesContributionResponse>(create);
  static TopIndustriesContributionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get result => $_getIZ(0);
  @$pb.TagNumber(1)
  set result($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<TopIndustriesContributionItem> get data => $_getList(3);
}

class TopIndustriesTradeItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopIndustriesTradeItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', $pb.PbFieldType.O3, protoName: 'marketCd')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'industryNameVi', protoName: 'industryNameVi')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'industryNameEn', protoName: 'industryNameEn')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'industrySumMarketAmt', $pb.PbFieldType.OD, protoName: 'industrySumMarketAmt')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contributePercent', $pb.PbFieldType.OD, protoName: 'contributePercent')
    ..hasRequiredFields = false
  ;

  TopIndustriesTradeItem._() : super();
  factory TopIndustriesTradeItem({
    $core.int? marketCd,
    $core.String? industryNameVi,
    $core.String? industryNameEn,
    $core.double? industrySumMarketAmt,
    $core.double? contributePercent,
  }) {
    final _result = create();
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    if (industryNameVi != null) {
      _result.industryNameVi = industryNameVi;
    }
    if (industryNameEn != null) {
      _result.industryNameEn = industryNameEn;
    }
    if (industrySumMarketAmt != null) {
      _result.industrySumMarketAmt = industrySumMarketAmt;
    }
    if (contributePercent != null) {
      _result.contributePercent = contributePercent;
    }
    return _result;
  }
  factory TopIndustriesTradeItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopIndustriesTradeItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopIndustriesTradeItem clone() => TopIndustriesTradeItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopIndustriesTradeItem copyWith(void Function(TopIndustriesTradeItem) updates) => super.copyWith((message) => updates(message as TopIndustriesTradeItem)) as TopIndustriesTradeItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopIndustriesTradeItem create() => TopIndustriesTradeItem._();
  TopIndustriesTradeItem createEmptyInstance() => create();
  static $pb.PbList<TopIndustriesTradeItem> createRepeated() => $pb.PbList<TopIndustriesTradeItem>();
  @$core.pragma('dart2js:noInline')
  static TopIndustriesTradeItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopIndustriesTradeItem>(create);
  static TopIndustriesTradeItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get marketCd => $_getIZ(0);
  @$pb.TagNumber(1)
  set marketCd($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMarketCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearMarketCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get industryNameVi => $_getSZ(1);
  @$pb.TagNumber(2)
  set industryNameVi($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndustryNameVi() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndustryNameVi() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get industryNameEn => $_getSZ(2);
  @$pb.TagNumber(3)
  set industryNameEn($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIndustryNameEn() => $_has(2);
  @$pb.TagNumber(3)
  void clearIndustryNameEn() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get industrySumMarketAmt => $_getN(3);
  @$pb.TagNumber(4)
  set industrySumMarketAmt($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIndustrySumMarketAmt() => $_has(3);
  @$pb.TagNumber(4)
  void clearIndustrySumMarketAmt() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get contributePercent => $_getN(4);
  @$pb.TagNumber(5)
  set contributePercent($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasContributePercent() => $_has(4);
  @$pb.TagNumber(5)
  void clearContributePercent() => clearField(5);
}

class TopIndustriesTradeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopIndustriesTradeResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..pc<TopIndustriesTradeItem>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.PM, subBuilder: TopIndustriesTradeItem.create)
    ..hasRequiredFields = false
  ;

  TopIndustriesTradeResponse._() : super();
  factory TopIndustriesTradeResponse({
    $core.int? result,
    $core.String? error,
    $core.String? message,
    $core.Iterable<TopIndustriesTradeItem>? data,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory TopIndustriesTradeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopIndustriesTradeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopIndustriesTradeResponse clone() => TopIndustriesTradeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopIndustriesTradeResponse copyWith(void Function(TopIndustriesTradeResponse) updates) => super.copyWith((message) => updates(message as TopIndustriesTradeResponse)) as TopIndustriesTradeResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopIndustriesTradeResponse create() => TopIndustriesTradeResponse._();
  TopIndustriesTradeResponse createEmptyInstance() => create();
  static $pb.PbList<TopIndustriesTradeResponse> createRepeated() => $pb.PbList<TopIndustriesTradeResponse>();
  @$core.pragma('dart2js:noInline')
  static TopIndustriesTradeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopIndustriesTradeResponse>(create);
  static TopIndustriesTradeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get result => $_getIZ(0);
  @$pb.TagNumber(1)
  set result($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<TopIndustriesTradeItem> get data => $_getList(3);
}

class MarketBreadthParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketBreadthParam', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', $pb.PbFieldType.O3, protoName: 'marketCd')
    ..hasRequiredFields = false
  ;

  MarketBreadthParam._() : super();
  factory MarketBreadthParam({
    $core.String? authenCode,
    $core.int? marketCd,
  }) {
    final _result = create();
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    return _result;
  }
  factory MarketBreadthParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketBreadthParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketBreadthParam clone() => MarketBreadthParam()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketBreadthParam copyWith(void Function(MarketBreadthParam) updates) => super.copyWith((message) => updates(message as MarketBreadthParam)) as MarketBreadthParam; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketBreadthParam create() => MarketBreadthParam._();
  MarketBreadthParam createEmptyInstance() => create();
  static $pb.PbList<MarketBreadthParam> createRepeated() => $pb.PbList<MarketBreadthParam>();
  @$core.pragma('dart2js:noInline')
  static MarketBreadthParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketBreadthParam>(create);
  static MarketBreadthParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get authenCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set authenCode($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuthenCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthenCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get marketCd => $_getIZ(1);
  @$pb.TagNumber(2)
  set marketCd($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMarketCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearMarketCd() => clearField(2);
}

class MarketLiquidityParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketLiquidityParam', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', $pb.PbFieldType.O3, protoName: 'marketCd')
    ..hasRequiredFields = false
  ;

  MarketLiquidityParam._() : super();
  factory MarketLiquidityParam({
    $core.String? authenCode,
    $core.int? marketCd,
  }) {
    final _result = create();
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    return _result;
  }
  factory MarketLiquidityParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketLiquidityParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketLiquidityParam clone() => MarketLiquidityParam()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketLiquidityParam copyWith(void Function(MarketLiquidityParam) updates) => super.copyWith((message) => updates(message as MarketLiquidityParam)) as MarketLiquidityParam; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketLiquidityParam create() => MarketLiquidityParam._();
  MarketLiquidityParam createEmptyInstance() => create();
  static $pb.PbList<MarketLiquidityParam> createRepeated() => $pb.PbList<MarketLiquidityParam>();
  @$core.pragma('dart2js:noInline')
  static MarketLiquidityParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketLiquidityParam>(create);
  static MarketLiquidityParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get authenCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set authenCode($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuthenCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthenCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get marketCd => $_getIZ(1);
  @$pb.TagNumber(2)
  set marketCd($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMarketCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearMarketCd() => clearField(2);
}

class TopIndustriesTradeForeignParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopIndustriesTradeForeignParam', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', $pb.PbFieldType.O3, protoName: 'marketCd')
    ..hasRequiredFields = false
  ;

  TopIndustriesTradeForeignParam._() : super();
  factory TopIndustriesTradeForeignParam({
    $core.String? authenCode,
    $core.int? marketCd,
  }) {
    final _result = create();
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    return _result;
  }
  factory TopIndustriesTradeForeignParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopIndustriesTradeForeignParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopIndustriesTradeForeignParam clone() => TopIndustriesTradeForeignParam()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopIndustriesTradeForeignParam copyWith(void Function(TopIndustriesTradeForeignParam) updates) => super.copyWith((message) => updates(message as TopIndustriesTradeForeignParam)) as TopIndustriesTradeForeignParam; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopIndustriesTradeForeignParam create() => TopIndustriesTradeForeignParam._();
  TopIndustriesTradeForeignParam createEmptyInstance() => create();
  static $pb.PbList<TopIndustriesTradeForeignParam> createRepeated() => $pb.PbList<TopIndustriesTradeForeignParam>();
  @$core.pragma('dart2js:noInline')
  static TopIndustriesTradeForeignParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopIndustriesTradeForeignParam>(create);
  static TopIndustriesTradeForeignParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get authenCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set authenCode($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuthenCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthenCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get marketCd => $_getIZ(1);
  @$pb.TagNumber(2)
  set marketCd($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMarketCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearMarketCd() => clearField(2);
}

class TopIndustriesContributionParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopIndustriesContributionParam', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', $pb.PbFieldType.O3, protoName: 'marketCd')
    ..hasRequiredFields = false
  ;

  TopIndustriesContributionParam._() : super();
  factory TopIndustriesContributionParam({
    $core.String? authenCode,
    $core.int? marketCd,
  }) {
    final _result = create();
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    return _result;
  }
  factory TopIndustriesContributionParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopIndustriesContributionParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopIndustriesContributionParam clone() => TopIndustriesContributionParam()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopIndustriesContributionParam copyWith(void Function(TopIndustriesContributionParam) updates) => super.copyWith((message) => updates(message as TopIndustriesContributionParam)) as TopIndustriesContributionParam; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopIndustriesContributionParam create() => TopIndustriesContributionParam._();
  TopIndustriesContributionParam createEmptyInstance() => create();
  static $pb.PbList<TopIndustriesContributionParam> createRepeated() => $pb.PbList<TopIndustriesContributionParam>();
  @$core.pragma('dart2js:noInline')
  static TopIndustriesContributionParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopIndustriesContributionParam>(create);
  static TopIndustriesContributionParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get authenCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set authenCode($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuthenCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthenCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get marketCd => $_getIZ(1);
  @$pb.TagNumber(2)
  set marketCd($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMarketCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearMarketCd() => clearField(2);
}

class TopIndustriesTradeParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TopIndustriesTradeParam', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCd', $pb.PbFieldType.O3, protoName: 'marketCd')
    ..hasRequiredFields = false
  ;

  TopIndustriesTradeParam._() : super();
  factory TopIndustriesTradeParam({
    $core.String? authenCode,
    $core.int? marketCd,
  }) {
    final _result = create();
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    if (marketCd != null) {
      _result.marketCd = marketCd;
    }
    return _result;
  }
  factory TopIndustriesTradeParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TopIndustriesTradeParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TopIndustriesTradeParam clone() => TopIndustriesTradeParam()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TopIndustriesTradeParam copyWith(void Function(TopIndustriesTradeParam) updates) => super.copyWith((message) => updates(message as TopIndustriesTradeParam)) as TopIndustriesTradeParam; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TopIndustriesTradeParam create() => TopIndustriesTradeParam._();
  TopIndustriesTradeParam createEmptyInstance() => create();
  static $pb.PbList<TopIndustriesTradeParam> createRepeated() => $pb.PbList<TopIndustriesTradeParam>();
  @$core.pragma('dart2js:noInline')
  static TopIndustriesTradeParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TopIndustriesTradeParam>(create);
  static TopIndustriesTradeParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get authenCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set authenCode($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuthenCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthenCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get marketCd => $_getIZ(1);
  @$pb.TagNumber(2)
  set marketCd($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMarketCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearMarketCd() => clearField(2);
}

class IndustriesHeatMapParam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IndustriesHeatMapParam', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authenCode', protoName: 'authenCode')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'industriesId', $pb.PbFieldType.O3, protoName: 'industriesId')
    ..hasRequiredFields = false
  ;

  IndustriesHeatMapParam._() : super();
  factory IndustriesHeatMapParam({
    $core.String? authenCode,
    $core.int? industriesId,
  }) {
    final _result = create();
    if (authenCode != null) {
      _result.authenCode = authenCode;
    }
    if (industriesId != null) {
      _result.industriesId = industriesId;
    }
    return _result;
  }
  factory IndustriesHeatMapParam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IndustriesHeatMapParam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IndustriesHeatMapParam clone() => IndustriesHeatMapParam()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IndustriesHeatMapParam copyWith(void Function(IndustriesHeatMapParam) updates) => super.copyWith((message) => updates(message as IndustriesHeatMapParam)) as IndustriesHeatMapParam; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IndustriesHeatMapParam create() => IndustriesHeatMapParam._();
  IndustriesHeatMapParam createEmptyInstance() => create();
  static $pb.PbList<IndustriesHeatMapParam> createRepeated() => $pb.PbList<IndustriesHeatMapParam>();
  @$core.pragma('dart2js:noInline')
  static IndustriesHeatMapParam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IndustriesHeatMapParam>(create);
  static IndustriesHeatMapParam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get authenCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set authenCode($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuthenCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthenCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get industriesId => $_getIZ(1);
  @$pb.TagNumber(2)
  set industriesId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndustriesId() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndustriesId() => clearField(2);
}

class BasePriceUpdate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BasePriceUpdate', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'baseSecCd', protoName: 'baseSecCd')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'basePrice', $pb.PbFieldType.OD, protoName: 'basePrice')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'basePriceCp', $pb.PbFieldType.OD, protoName: 'basePriceCp')
    ..hasRequiredFields = false
  ;

  BasePriceUpdate._() : super();
  factory BasePriceUpdate({
    $core.String? secCd,
    $core.String? baseSecCd,
    $core.double? basePrice,
    $core.double? basePriceCp,
  }) {
    final _result = create();
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (baseSecCd != null) {
      _result.baseSecCd = baseSecCd;
    }
    if (basePrice != null) {
      _result.basePrice = basePrice;
    }
    if (basePriceCp != null) {
      _result.basePriceCp = basePriceCp;
    }
    return _result;
  }
  factory BasePriceUpdate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BasePriceUpdate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BasePriceUpdate clone() => BasePriceUpdate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BasePriceUpdate copyWith(void Function(BasePriceUpdate) updates) => super.copyWith((message) => updates(message as BasePriceUpdate)) as BasePriceUpdate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BasePriceUpdate create() => BasePriceUpdate._();
  BasePriceUpdate createEmptyInstance() => create();
  static $pb.PbList<BasePriceUpdate> createRepeated() => $pb.PbList<BasePriceUpdate>();
  @$core.pragma('dart2js:noInline')
  static BasePriceUpdate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BasePriceUpdate>(create);
  static BasePriceUpdate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get secCd => $_getSZ(0);
  @$pb.TagNumber(1)
  set secCd($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSecCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get baseSecCd => $_getSZ(1);
  @$pb.TagNumber(2)
  set baseSecCd($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBaseSecCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearBaseSecCd() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get basePrice => $_getN(2);
  @$pb.TagNumber(3)
  set basePrice($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBasePrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearBasePrice() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get basePriceCp => $_getN(3);
  @$pb.TagNumber(4)
  set basePriceCp($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBasePriceCp() => $_has(3);
  @$pb.TagNumber(4)
  void clearBasePriceCp() => clearField(4);
}

class AnyMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AnyMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'typeUrl')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  AnyMessage._() : super();
  factory AnyMessage({
    $core.String? typeUrl,
    $core.List<$core.int>? value,
  }) {
    final _result = create();
    if (typeUrl != null) {
      _result.typeUrl = typeUrl;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory AnyMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnyMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnyMessage clone() => AnyMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnyMessage copyWith(void Function(AnyMessage) updates) => super.copyWith((message) => updates(message as AnyMessage)) as AnyMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AnyMessage create() => AnyMessage._();
  AnyMessage createEmptyInstance() => create();
  static $pb.PbList<AnyMessage> createRepeated() => $pb.PbList<AnyMessage>();
  @$core.pragma('dart2js:noInline')
  static AnyMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnyMessage>(create);
  static AnyMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get typeUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set typeUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTypeUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearTypeUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class ProjectOpen extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProjectOpen', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price', $pb.PbFieldType.OD)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'qty', $pb.PbFieldType.OD)
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePoint', $pb.PbFieldType.OD, protoName: 'changePoint')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePercent', $pb.PbFieldType.OD, protoName: 'changePercent')
    ..e<STOCK_COLOR_CODE>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'colorCode', $pb.PbFieldType.OE, protoName: 'colorCode', defaultOrMaker: STOCK_COLOR_CODE.BASIC_PRICE, valueOf: STOCK_COLOR_CODE.valueOf, enumValues: STOCK_COLOR_CODE.values)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updTime', $pb.PbFieldType.O3, protoName: 'updTime')
    ..hasRequiredFields = false
  ;

  ProjectOpen._() : super();
  factory ProjectOpen({
    $core.String? secCd,
    $core.double? price,
    $core.double? qty,
    $core.double? changePoint,
    $core.double? changePercent,
    STOCK_COLOR_CODE? colorCode,
    $core.int? updTime,
  }) {
    final _result = create();
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (price != null) {
      _result.price = price;
    }
    if (qty != null) {
      _result.qty = qty;
    }
    if (changePoint != null) {
      _result.changePoint = changePoint;
    }
    if (changePercent != null) {
      _result.changePercent = changePercent;
    }
    if (colorCode != null) {
      _result.colorCode = colorCode;
    }
    if (updTime != null) {
      _result.updTime = updTime;
    }
    return _result;
  }
  factory ProjectOpen.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProjectOpen.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProjectOpen clone() => ProjectOpen()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProjectOpen copyWith(void Function(ProjectOpen) updates) => super.copyWith((message) => updates(message as ProjectOpen)) as ProjectOpen; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProjectOpen create() => ProjectOpen._();
  ProjectOpen createEmptyInstance() => create();
  static $pb.PbList<ProjectOpen> createRepeated() => $pb.PbList<ProjectOpen>();
  @$core.pragma('dart2js:noInline')
  static ProjectOpen getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProjectOpen>(create);
  static ProjectOpen? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get secCd => $_getSZ(0);
  @$pb.TagNumber(1)
  set secCd($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSecCd() => $_has(0);
  @$pb.TagNumber(1)
  void clearSecCd() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get price => $_getN(1);
  @$pb.TagNumber(2)
  set price($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get qty => $_getN(2);
  @$pb.TagNumber(3)
  set qty($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasQty() => $_has(2);
  @$pb.TagNumber(3)
  void clearQty() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get changePoint => $_getN(3);
  @$pb.TagNumber(4)
  set changePoint($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasChangePoint() => $_has(3);
  @$pb.TagNumber(4)
  void clearChangePoint() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get changePercent => $_getN(4);
  @$pb.TagNumber(5)
  set changePercent($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChangePercent() => $_has(4);
  @$pb.TagNumber(5)
  void clearChangePercent() => clearField(5);

  @$pb.TagNumber(6)
  STOCK_COLOR_CODE get colorCode => $_getN(5);
  @$pb.TagNumber(6)
  set colorCode(STOCK_COLOR_CODE v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasColorCode() => $_has(5);
  @$pb.TagNumber(6)
  void clearColorCode() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get updTime => $_getIZ(6);
  @$pb.TagNumber(7)
  set updTime($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUpdTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdTime() => clearField(7);
}

class IndustriesHeatMapItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IndustriesHeatMapItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'industryId', $pb.PbFieldType.O3, protoName: 'industryId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secCd', protoName: 'secCd')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastPrice', $pb.PbFieldType.OD, protoName: 'lastPrice')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePoint', $pb.PbFieldType.OD, protoName: 'changePoint')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'changePercent', $pb.PbFieldType.OD, protoName: 'changePercent')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'marketCap', $pb.PbFieldType.OD, protoName: 'marketCap')
    ..hasRequiredFields = false
  ;

  IndustriesHeatMapItem._() : super();
  factory IndustriesHeatMapItem({
    $core.int? industryId,
    $core.String? secCd,
    $core.double? lastPrice,
    $core.double? changePoint,
    $core.double? changePercent,
    $core.double? marketCap,
  }) {
    final _result = create();
    if (industryId != null) {
      _result.industryId = industryId;
    }
    if (secCd != null) {
      _result.secCd = secCd;
    }
    if (lastPrice != null) {
      _result.lastPrice = lastPrice;
    }
    if (changePoint != null) {
      _result.changePoint = changePoint;
    }
    if (changePercent != null) {
      _result.changePercent = changePercent;
    }
    if (marketCap != null) {
      _result.marketCap = marketCap;
    }
    return _result;
  }
  factory IndustriesHeatMapItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IndustriesHeatMapItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IndustriesHeatMapItem clone() => IndustriesHeatMapItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IndustriesHeatMapItem copyWith(void Function(IndustriesHeatMapItem) updates) => super.copyWith((message) => updates(message as IndustriesHeatMapItem)) as IndustriesHeatMapItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IndustriesHeatMapItem create() => IndustriesHeatMapItem._();
  IndustriesHeatMapItem createEmptyInstance() => create();
  static $pb.PbList<IndustriesHeatMapItem> createRepeated() => $pb.PbList<IndustriesHeatMapItem>();
  @$core.pragma('dart2js:noInline')
  static IndustriesHeatMapItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IndustriesHeatMapItem>(create);
  static IndustriesHeatMapItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get industryId => $_getIZ(0);
  @$pb.TagNumber(1)
  set industryId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIndustryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndustryId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get secCd => $_getSZ(1);
  @$pb.TagNumber(2)
  set secCd($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecCd() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecCd() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get lastPrice => $_getN(2);
  @$pb.TagNumber(3)
  set lastPrice($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastPrice() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get changePoint => $_getN(3);
  @$pb.TagNumber(4)
  set changePoint($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasChangePoint() => $_has(3);
  @$pb.TagNumber(4)
  void clearChangePoint() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get changePercent => $_getN(4);
  @$pb.TagNumber(5)
  set changePercent($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChangePercent() => $_has(4);
  @$pb.TagNumber(5)
  void clearChangePercent() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get marketCap => $_getN(5);
  @$pb.TagNumber(6)
  set marketCap($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMarketCap() => $_has(5);
  @$pb.TagNumber(6)
  void clearMarketCap() => clearField(6);
}

class IndustriesHeatMapResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IndustriesHeatMapResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'market_api'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'result', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..pc<IndustriesHeatMapItem>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.PM, subBuilder: IndustriesHeatMapItem.create)
    ..hasRequiredFields = false
  ;

  IndustriesHeatMapResponse._() : super();
  factory IndustriesHeatMapResponse({
    $core.int? result,
    $core.String? error,
    $core.String? message,
    $core.Iterable<IndustriesHeatMapItem>? data,
  }) {
    final _result = create();
    if (result != null) {
      _result.result = result;
    }
    if (error != null) {
      _result.error = error;
    }
    if (message != null) {
      _result.message = message;
    }
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory IndustriesHeatMapResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IndustriesHeatMapResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IndustriesHeatMapResponse clone() => IndustriesHeatMapResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IndustriesHeatMapResponse copyWith(void Function(IndustriesHeatMapResponse) updates) => super.copyWith((message) => updates(message as IndustriesHeatMapResponse)) as IndustriesHeatMapResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IndustriesHeatMapResponse create() => IndustriesHeatMapResponse._();
  IndustriesHeatMapResponse createEmptyInstance() => create();
  static $pb.PbList<IndustriesHeatMapResponse> createRepeated() => $pb.PbList<IndustriesHeatMapResponse>();
  @$core.pragma('dart2js:noInline')
  static IndustriesHeatMapResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IndustriesHeatMapResponse>(create);
  static IndustriesHeatMapResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get result => $_getIZ(0);
  @$pb.TagNumber(1)
  set result($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResult() => $_has(0);
  @$pb.TagNumber(1)
  void clearResult() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<IndustriesHeatMapItem> get data => $_getList(3);
}

