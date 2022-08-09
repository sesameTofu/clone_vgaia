///
//  Generated code. Do not modify.
//  source: auto_trading.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use oRDER_TYPEDescriptor instead')
const ORDER_TYPE$json = const {
  '1': 'ORDER_TYPE',
  '2': const [
    const {'1': 'ORDER_DEFAULT', '2': 0},
    const {'1': 'ORDER_UP', '2': 1},
    const {'1': 'ORDER_DOWN', '2': 2},
  ],
};

/// Descriptor for `ORDER_TYPE`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List oRDER_TYPEDescriptor = $convert.base64Decode('CgpPUkRFUl9UWVBFEhEKDU9SREVSX0RFRkFVTFQQABIMCghPUkRFUl9VUBABEg4KCk9SREVSX0RPV04QAg==');
@$core.Deprecated('Use sTOCK_COLOR_CODEDescriptor instead')
const STOCK_COLOR_CODE$json = const {
  '1': 'STOCK_COLOR_CODE',
  '2': const [
    const {'1': 'BASIC_PRICE', '2': 0},
    const {'1': 'CEILING_PRICE', '2': 1},
    const {'1': 'FLOOR_PRICE', '2': 2},
    const {'1': 'UP_PRICE', '2': 3},
    const {'1': 'DOWN_PRICE', '2': 4},
  ],
};

/// Descriptor for `STOCK_COLOR_CODE`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sTOCK_COLOR_CODEDescriptor = $convert.base64Decode('ChBTVE9DS19DT0xPUl9DT0RFEg8KC0JBU0lDX1BSSUNFEAASEQoNQ0VJTElOR19QUklDRRABEg8KC0ZMT09SX1BSSUNFEAISDAoIVVBfUFJJQ0UQAxIOCgpET1dOX1BSSUNFEAQ=');
@$core.Deprecated('Use iNDEX_COLOR_CODEDescriptor instead')
const INDEX_COLOR_CODE$json = const {
  '1': 'INDEX_COLOR_CODE',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'OPEN_INDEX', '2': 1},
    const {'1': 'UP_INDEX', '2': 2},
    const {'1': 'DOWN_INDEX', '2': 3},
  ],
};

/// Descriptor for `INDEX_COLOR_CODE`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List iNDEX_COLOR_CODEDescriptor = $convert.base64Decode('ChBJTkRFWF9DT0xPUl9DT0RFEggKBE5PTkUQABIOCgpPUEVOX0lOREVYEAESDAoIVVBfSU5ERVgQAhIOCgpET1dOX0lOREVYEAM=');
@$core.Deprecated('Use iNDEX_STATEDescriptor instead')
const INDEX_STATE$json = const {
  '1': 'INDEX_STATE',
  '2': const [
    const {'1': 'S', '2': 0},
    const {'1': 'P', '2': 1},
    const {'1': 'O', '2': 2},
    const {'1': 'A', '2': 3},
    const {'1': 'C', '2': 4},
    const {'1': 'I', '2': 5},
    const {'1': 'K', '2': 6},
    const {'1': 'G', '2': 7},
    const {'1': 'J', '2': 8},
    const {'1': 'Z', '2': 9},
  ],
};

/// Descriptor for `INDEX_STATE`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List iNDEX_STATEDescriptor = $convert.base64Decode('CgtJTkRFWF9TVEFURRIFCgFTEAASBQoBUBABEgUKAU8QAhIFCgFBEAMSBQoBQxAEEgUKAUkQBRIFCgFLEAYSBQoBRxAHEgUKAUoQCBIFCgFaEAk=');
@$core.Deprecated('Use watchListInputDescriptor instead')
const WatchListInput$json = const {
  '1': 'WatchListInput',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 11, '6': '.market_api.NullableString', '10': 'userID'},
    const {'1': 'secList', '3': 2, '4': 1, '5': 9, '10': 'secList'},
    const {'1': 'isIntraday', '3': 3, '4': 1, '5': 11, '6': '.market_api.NullableString', '10': 'isIntraday'},
    const {'1': 'authenCode', '3': 4, '4': 1, '5': 9, '10': 'authenCode'},
  ],
};

/// Descriptor for `WatchListInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List watchListInputDescriptor = $convert.base64Decode('Cg5XYXRjaExpc3RJbnB1dBIyCgZ1c2VySUQYASABKAsyGi5tYXJrZXRfYXBpLk51bGxhYmxlU3RyaW5nUgZ1c2VySUQSGAoHc2VjTGlzdBgCIAEoCVIHc2VjTGlzdBI6Cgppc0ludHJhZGF5GAMgASgLMhoubWFya2V0X2FwaS5OdWxsYWJsZVN0cmluZ1IKaXNJbnRyYWRheRIeCgphdXRoZW5Db2RlGAQgASgJUgphdXRoZW5Db2Rl');
@$core.Deprecated('Use symbolTotalInfoDescriptor instead')
const SymbolTotalInfo$json = const {
  '1': 'SymbolTotalInfo',
  '2': const [
    const {'1': 'secDetailInfo', '3': 1, '4': 1, '5': 11, '6': '.market_api.SymbolTotalInfo.SecDetailInfo', '10': 'secDetailInfo'},
    const {'1': 'colorCode', '3': 2, '4': 1, '5': 14, '6': '.market_api.STOCK_COLOR_CODE', '10': 'colorCode'},
    const {'1': 'priceInfoList', '3': 3, '4': 3, '5': 11, '6': '.market_api.PriceInfo', '10': 'priceInfoList'},
  ],
  '3': const [SymbolTotalInfo_SecDetailInfo$json],
};

@$core.Deprecated('Use symbolTotalInfoDescriptor instead')
const SymbolTotalInfo_SecDetailInfo$json = const {
  '1': 'SecDetailInfo',
  '2': const [
    const {'1': 'marketCd', '3': 1, '4': 1, '5': 9, '10': 'marketCd'},
    const {'1': 'secCd', '3': 2, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'secName', '3': 3, '4': 1, '5': 9, '10': 'secName'},
    const {'1': 'secType', '3': 4, '4': 1, '5': 5, '10': 'secType'},
    const {'1': 'basicPrice', '3': 5, '4': 1, '5': 1, '10': 'basicPrice'},
    const {'1': 'ceilingPrice', '3': 6, '4': 1, '5': 1, '10': 'ceilingPrice'},
    const {'1': 'floorPrice', '3': 7, '4': 1, '5': 1, '10': 'floorPrice'},
    const {'1': 'highestPrice', '3': 8, '4': 1, '5': 1, '10': 'highestPrice'},
    const {'1': 'lowestPrice', '3': 9, '4': 1, '5': 1, '10': 'lowestPrice'},
    const {'1': 'avgPrice', '3': 10, '4': 1, '5': 1, '10': 'avgPrice'},
    const {'1': 'lastPrice', '3': 11, '4': 1, '5': 1, '10': 'lastPrice'},
    const {'1': 'lastQty', '3': 12, '4': 1, '5': 1, '10': 'lastQty'},
    const {'1': 'totalQty', '3': 13, '4': 1, '5': 1, '10': 'totalQty'},
    const {'1': 'totalAmt', '3': 14, '4': 1, '5': 1, '10': 'totalAmt'},
    const {'1': 'totalPtQty', '3': 15, '4': 1, '5': 1, '10': 'totalPtQty'},
    const {'1': 'totalPtAmt', '3': 16, '4': 1, '5': 1, '10': 'totalPtAmt'},
    const {'1': 'sellForeignQty', '3': 17, '4': 1, '5': 1, '10': 'sellForeignQty'},
    const {'1': 'buyForeignQty', '3': 18, '4': 1, '5': 1, '10': 'buyForeignQty'},
    const {'1': 'changePoint', '3': 19, '4': 1, '5': 1, '10': 'changePoint'},
    const {'1': 'changePercent', '3': 20, '4': 1, '5': 1, '10': 'changePercent'},
    const {'1': 'totalRoom', '3': 21, '4': 1, '5': 1, '10': 'totalRoom'},
    const {'1': 'currentRoom', '3': 22, '4': 1, '5': 1, '10': 'currentRoom'},
    const {'1': 'w52High', '3': 23, '4': 1, '5': 1, '10': 'w52High'},
    const {'1': 'w52Low', '3': 24, '4': 1, '5': 1, '10': 'w52Low'},
    const {'1': 'best1BidPriceStr', '3': 25, '4': 1, '5': 9, '10': 'best1BidPriceStr'},
    const {'1': 'best1BidPrice', '3': 26, '4': 1, '5': 1, '10': 'best1BidPrice'},
    const {'1': 'best1BidQty', '3': 27, '4': 1, '5': 1, '10': 'best1BidQty'},
    const {'1': 'best2BidPrice', '3': 28, '4': 1, '5': 1, '10': 'best2BidPrice'},
    const {'1': 'best2BidQty', '3': 29, '4': 1, '5': 1, '10': 'best2BidQty'},
    const {'1': 'best3BidPrice', '3': 30, '4': 1, '5': 1, '10': 'best3BidPrice'},
    const {'1': 'best3BidQty', '3': 31, '4': 1, '5': 1, '10': 'best3BidQty'},
    const {'1': 'best4BidQty', '3': 32, '4': 1, '5': 1, '10': 'best4BidQty'},
    const {'1': 'best1OfferPriceStr', '3': 33, '4': 1, '5': 9, '10': 'best1OfferPriceStr'},
    const {'1': 'best1OfferPrice', '3': 34, '4': 1, '5': 1, '10': 'best1OfferPrice'},
    const {'1': 'best1OfferQty', '3': 35, '4': 1, '5': 1, '10': 'best1OfferQty'},
    const {'1': 'best2OfferPrice', '3': 36, '4': 1, '5': 1, '10': 'best2OfferPrice'},
    const {'1': 'best2OfferQty', '3': 37, '4': 1, '5': 1, '10': 'best2OfferQty'},
    const {'1': 'best3OfferPrice', '3': 38, '4': 1, '5': 1, '10': 'best3OfferPrice'},
    const {'1': 'best3OfferQty', '3': 39, '4': 1, '5': 1, '10': 'best3OfferQty'},
    const {'1': 'best4OfferQty', '3': 40, '4': 1, '5': 1, '10': 'best4OfferQty'},
    const {'1': 'listedQty', '3': 41, '4': 1, '5': 1, '10': 'listedQty'},
    const {'1': 'tradeQty', '3': 42, '4': 1, '5': 1, '10': 'tradeQty'},
    const {'1': 'tradePercent', '3': 43, '4': 1, '5': 1, '10': 'tradePercent'},
    const {'1': 'esp', '3': 44, '4': 1, '5': 1, '10': 'esp'},
    const {'1': 'pe', '3': 45, '4': 1, '5': 1, '10': 'pe'},
    const {'1': 'pb', '3': 46, '4': 1, '5': 1, '10': 'pb'},
    const {'1': 'ps', '3': 47, '4': 1, '5': 1, '10': 'ps'},
    const {'1': 'bookValue', '3': 48, '4': 1, '5': 1, '10': 'bookValue'},
    const {'1': 'dividendAmt', '3': 49, '4': 1, '5': 1, '10': 'dividendAmt'},
    const {'1': 'dividendRate', '3': 50, '4': 1, '5': 1, '10': 'dividendRate'},
    const {'1': 'secNameEn', '3': 51, '4': 1, '5': 9, '10': 'secNameEn'},
    const {'1': 'baseSecCd', '3': 52, '4': 1, '5': 11, '6': '.market_api.NullableString', '10': 'baseSecCd'},
    const {'1': 'issuer', '3': 53, '4': 1, '5': 11, '6': '.market_api.NullableString', '10': 'issuer'},
    const {'1': 'basePrice', '3': 54, '4': 1, '5': 1, '10': 'basePrice'},
    const {'1': 'execPrice', '3': 55, '4': 1, '5': 1, '10': 'execPrice'},
    const {'1': 'basePriceCp', '3': 56, '4': 1, '5': 1, '10': 'basePriceCp'},
    const {'1': 'bfPrice', '3': 57, '4': 1, '5': 1, '10': 'bfPrice'},
    const {'1': 'bbPrice', '3': 58, '4': 1, '5': 1, '10': 'bbPrice'},
    const {'1': 'bcPrice', '3': 59, '4': 1, '5': 1, '10': 'bcPrice'},
    const {'1': 'lastTradeDate', '3': 60, '4': 1, '5': 5, '10': 'lastTradeDate'},
    const {'1': 'turnoverRate', '3': 61, '4': 1, '5': 1, '10': 'turnoverRate'},
    const {'1': 'range', '3': 62, '4': 1, '5': 1, '10': 'range'},
    const {'1': 'baseSecPriceColor', '3': 63, '4': 1, '5': 14, '6': '.market_api.STOCK_COLOR_CODE', '10': 'baseSecPriceColor'},
    const {'1': 'hasRightExec', '3': 64, '4': 1, '5': 5, '10': 'hasRightExec'},
    const {'1': 'execRatio', '3': 65, '4': 1, '5': 11, '6': '.market_api.NullableString', '10': 'execRatio'},
    const {'1': 'roe', '3': 66, '4': 1, '5': 1, '10': 'roe'},
    const {'1': 'roa', '3': 67, '4': 1, '5': 1, '10': 'roa'},
  ],
};

/// Descriptor for `SymbolTotalInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List symbolTotalInfoDescriptor = $convert.base64Decode('Cg9TeW1ib2xUb3RhbEluZm8STwoNc2VjRGV0YWlsSW5mbxgBIAEoCzIpLm1hcmtldF9hcGkuU3ltYm9sVG90YWxJbmZvLlNlY0RldGFpbEluZm9SDXNlY0RldGFpbEluZm8SOgoJY29sb3JDb2RlGAIgASgOMhwubWFya2V0X2FwaS5TVE9DS19DT0xPUl9DT0RFUgljb2xvckNvZGUSOwoNcHJpY2VJbmZvTGlzdBgDIAMoCzIVLm1hcmtldF9hcGkuUHJpY2VJbmZvUg1wcmljZUluZm9MaXN0GskRCg1TZWNEZXRhaWxJbmZvEhoKCG1hcmtldENkGAEgASgJUghtYXJrZXRDZBIUCgVzZWNDZBgCIAEoCVIFc2VjQ2QSGAoHc2VjTmFtZRgDIAEoCVIHc2VjTmFtZRIYCgdzZWNUeXBlGAQgASgFUgdzZWNUeXBlEh4KCmJhc2ljUHJpY2UYBSABKAFSCmJhc2ljUHJpY2USIgoMY2VpbGluZ1ByaWNlGAYgASgBUgxjZWlsaW5nUHJpY2USHgoKZmxvb3JQcmljZRgHIAEoAVIKZmxvb3JQcmljZRIiCgxoaWdoZXN0UHJpY2UYCCABKAFSDGhpZ2hlc3RQcmljZRIgCgtsb3dlc3RQcmljZRgJIAEoAVILbG93ZXN0UHJpY2USGgoIYXZnUHJpY2UYCiABKAFSCGF2Z1ByaWNlEhwKCWxhc3RQcmljZRgLIAEoAVIJbGFzdFByaWNlEhgKB2xhc3RRdHkYDCABKAFSB2xhc3RRdHkSGgoIdG90YWxRdHkYDSABKAFSCHRvdGFsUXR5EhoKCHRvdGFsQW10GA4gASgBUgh0b3RhbEFtdBIeCgp0b3RhbFB0UXR5GA8gASgBUgp0b3RhbFB0UXR5Eh4KCnRvdGFsUHRBbXQYECABKAFSCnRvdGFsUHRBbXQSJgoOc2VsbEZvcmVpZ25RdHkYESABKAFSDnNlbGxGb3JlaWduUXR5EiQKDWJ1eUZvcmVpZ25RdHkYEiABKAFSDWJ1eUZvcmVpZ25RdHkSIAoLY2hhbmdlUG9pbnQYEyABKAFSC2NoYW5nZVBvaW50EiQKDWNoYW5nZVBlcmNlbnQYFCABKAFSDWNoYW5nZVBlcmNlbnQSHAoJdG90YWxSb29tGBUgASgBUgl0b3RhbFJvb20SIAoLY3VycmVudFJvb20YFiABKAFSC2N1cnJlbnRSb29tEhgKB3c1MkhpZ2gYFyABKAFSB3c1MkhpZ2gSFgoGdzUyTG93GBggASgBUgZ3NTJMb3cSKgoQYmVzdDFCaWRQcmljZVN0chgZIAEoCVIQYmVzdDFCaWRQcmljZVN0chIkCg1iZXN0MUJpZFByaWNlGBogASgBUg1iZXN0MUJpZFByaWNlEiAKC2Jlc3QxQmlkUXR5GBsgASgBUgtiZXN0MUJpZFF0eRIkCg1iZXN0MkJpZFByaWNlGBwgASgBUg1iZXN0MkJpZFByaWNlEiAKC2Jlc3QyQmlkUXR5GB0gASgBUgtiZXN0MkJpZFF0eRIkCg1iZXN0M0JpZFByaWNlGB4gASgBUg1iZXN0M0JpZFByaWNlEiAKC2Jlc3QzQmlkUXR5GB8gASgBUgtiZXN0M0JpZFF0eRIgCgtiZXN0NEJpZFF0eRggIAEoAVILYmVzdDRCaWRRdHkSLgoSYmVzdDFPZmZlclByaWNlU3RyGCEgASgJUhJiZXN0MU9mZmVyUHJpY2VTdHISKAoPYmVzdDFPZmZlclByaWNlGCIgASgBUg9iZXN0MU9mZmVyUHJpY2USJAoNYmVzdDFPZmZlclF0eRgjIAEoAVINYmVzdDFPZmZlclF0eRIoCg9iZXN0Mk9mZmVyUHJpY2UYJCABKAFSD2Jlc3QyT2ZmZXJQcmljZRIkCg1iZXN0Mk9mZmVyUXR5GCUgASgBUg1iZXN0Mk9mZmVyUXR5EigKD2Jlc3QzT2ZmZXJQcmljZRgmIAEoAVIPYmVzdDNPZmZlclByaWNlEiQKDWJlc3QzT2ZmZXJRdHkYJyABKAFSDWJlc3QzT2ZmZXJRdHkSJAoNYmVzdDRPZmZlclF0eRgoIAEoAVINYmVzdDRPZmZlclF0eRIcCglsaXN0ZWRRdHkYKSABKAFSCWxpc3RlZFF0eRIaCgh0cmFkZVF0eRgqIAEoAVIIdHJhZGVRdHkSIgoMdHJhZGVQZXJjZW50GCsgASgBUgx0cmFkZVBlcmNlbnQSEAoDZXNwGCwgASgBUgNlc3ASDgoCcGUYLSABKAFSAnBlEg4KAnBiGC4gASgBUgJwYhIOCgJwcxgvIAEoAVICcHMSHAoJYm9va1ZhbHVlGDAgASgBUglib29rVmFsdWUSIAoLZGl2aWRlbmRBbXQYMSABKAFSC2RpdmlkZW5kQW10EiIKDGRpdmlkZW5kUmF0ZRgyIAEoAVIMZGl2aWRlbmRSYXRlEhwKCXNlY05hbWVFbhgzIAEoCVIJc2VjTmFtZUVuEjgKCWJhc2VTZWNDZBg0IAEoCzIaLm1hcmtldF9hcGkuTnVsbGFibGVTdHJpbmdSCWJhc2VTZWNDZBIyCgZpc3N1ZXIYNSABKAsyGi5tYXJrZXRfYXBpLk51bGxhYmxlU3RyaW5nUgZpc3N1ZXISHAoJYmFzZVByaWNlGDYgASgBUgliYXNlUHJpY2USHAoJZXhlY1ByaWNlGDcgASgBUglleGVjUHJpY2USIAoLYmFzZVByaWNlQ3AYOCABKAFSC2Jhc2VQcmljZUNwEhgKB2JmUHJpY2UYOSABKAFSB2JmUHJpY2USGAoHYmJQcmljZRg6IAEoAVIHYmJQcmljZRIYCgdiY1ByaWNlGDsgASgBUgdiY1ByaWNlEiQKDWxhc3RUcmFkZURhdGUYPCABKAVSDWxhc3RUcmFkZURhdGUSIgoMdHVybm92ZXJSYXRlGD0gASgBUgx0dXJub3ZlclJhdGUSFAoFcmFuZ2UYPiABKAFSBXJhbmdlEkoKEWJhc2VTZWNQcmljZUNvbG9yGD8gASgOMhwubWFya2V0X2FwaS5TVE9DS19DT0xPUl9DT0RFUhFiYXNlU2VjUHJpY2VDb2xvchIiCgxoYXNSaWdodEV4ZWMYQCABKAVSDGhhc1JpZ2h0RXhlYxI4CglleGVjUmF0aW8YQSABKAsyGi5tYXJrZXRfYXBpLk51bGxhYmxlU3RyaW5nUglleGVjUmF0aW8SEAoDcm9lGEIgASgBUgNyb2USEAoDcm9hGEMgASgBUgNyb2E=');
@$core.Deprecated('Use priceInfoDescriptor instead')
const PriceInfo$json = const {
  '1': 'PriceInfo',
  '2': const [
    const {'1': 'time', '3': 1, '4': 1, '5': 3, '10': 'time'},
    const {'1': 'price', '3': 2, '4': 1, '5': 1, '10': 'price'},
    const {'1': 'qty', '3': 3, '4': 1, '5': 1, '10': 'qty'},
  ],
};

/// Descriptor for `PriceInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List priceInfoDescriptor = $convert.base64Decode('CglQcmljZUluZm8SEgoEdGltZRgBIAEoA1IEdGltZRIUCgVwcmljZRgCIAEoAVIFcHJpY2USEAoDcXR5GAMgASgBUgNxdHk=');
@$core.Deprecated('Use marketDepthInputDescriptor instead')
const MarketDepthInput$json = const {
  '1': 'MarketDepthInput',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 9, '10': 'userID'},
    const {'1': 'indexCd', '3': 2, '4': 1, '5': 5, '10': 'indexCd'},
    const {'1': 'authenCode', '3': 3, '4': 1, '5': 9, '10': 'authenCode'},
  ],
};

/// Descriptor for `MarketDepthInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketDepthInputDescriptor = $convert.base64Decode('ChBNYXJrZXREZXB0aElucHV0EhYKBnVzZXJJRBgBIAEoCVIGdXNlcklEEhgKB2luZGV4Q2QYAiABKAVSB2luZGV4Q2QSHgoKYXV0aGVuQ29kZRgDIAEoCVIKYXV0aGVuQ29kZQ==');
@$core.Deprecated('Use marketMatchingInputDescriptor instead')
const MarketMatchingInput$json = const {
  '1': 'MarketMatchingInput',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 9, '10': 'userID'},
    const {'1': 'secCd', '3': 2, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'tn', '3': 3, '4': 1, '5': 5, '10': 'tn'},
    const {'1': 'authenCode', '3': 4, '4': 1, '5': 9, '10': 'authenCode'},
  ],
};

/// Descriptor for `MarketMatchingInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketMatchingInputDescriptor = $convert.base64Decode('ChNNYXJrZXRNYXRjaGluZ0lucHV0EhYKBnVzZXJJRBgBIAEoCVIGdXNlcklEEhQKBXNlY0NkGAIgASgJUgVzZWNDZBIOCgJ0bhgDIAEoBVICdG4SHgoKYXV0aGVuQ29kZRgEIAEoCVIKYXV0aGVuQ29kZQ==');
@$core.Deprecated('Use topSecUpDownInputDescriptor instead')
const TopSecUpDownInput$json = const {
  '1': 'TopSecUpDownInput',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 9, '10': 'userID'},
    const {'1': 'topType', '3': 2, '4': 1, '5': 5, '10': 'topType'},
    const {'1': 'marketCd', '3': 3, '4': 1, '5': 9, '10': 'marketCd'},
    const {'1': 'industries', '3': 4, '4': 1, '5': 9, '10': 'industries'},
    const {'1': 'periodType', '3': 5, '4': 1, '5': 5, '10': 'periodType'},
    const {'1': 'orderFieldType', '3': 6, '4': 1, '5': 5, '10': 'orderFieldType'},
    const {'1': 'orderType', '3': 7, '4': 1, '5': 14, '6': '.market_api.ORDER_TYPE', '10': 'orderType'},
    const {'1': 'offset', '3': 8, '4': 1, '5': 5, '10': 'offset'},
    const {'1': 'limit', '3': 9, '4': 1, '5': 5, '10': 'limit'},
    const {'1': 'authenCode', '3': 10, '4': 1, '5': 9, '10': 'authenCode'},
  ],
};

/// Descriptor for `TopSecUpDownInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topSecUpDownInputDescriptor = $convert.base64Decode('ChFUb3BTZWNVcERvd25JbnB1dBIWCgZ1c2VySUQYASABKAlSBnVzZXJJRBIYCgd0b3BUeXBlGAIgASgFUgd0b3BUeXBlEhoKCG1hcmtldENkGAMgASgJUghtYXJrZXRDZBIeCgppbmR1c3RyaWVzGAQgASgJUgppbmR1c3RyaWVzEh4KCnBlcmlvZFR5cGUYBSABKAVSCnBlcmlvZFR5cGUSJgoOb3JkZXJGaWVsZFR5cGUYBiABKAVSDm9yZGVyRmllbGRUeXBlEjQKCW9yZGVyVHlwZRgHIAEoDjIWLm1hcmtldF9hcGkuT1JERVJfVFlQRVIJb3JkZXJUeXBlEhYKBm9mZnNldBgIIAEoBVIGb2Zmc2V0EhQKBWxpbWl0GAkgASgFUgVsaW1pdBIeCgphdXRoZW5Db2RlGAogASgJUgphdXRoZW5Db2Rl');
@$core.Deprecated('Use topSecUpDownResponseDescriptor instead')
const TopSecUpDownResponse$json = const {
  '1': 'TopSecUpDownResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'topSecUpDown', '3': 4, '4': 3, '5': 11, '6': '.market_api.TopSecUpDownResponse.TopSecUpDownInfo', '10': 'topSecUpDown'},
  ],
  '3': const [TopSecUpDownResponse_TopSecUpDownInfo$json],
};

@$core.Deprecated('Use topSecUpDownResponseDescriptor instead')
const TopSecUpDownResponse_TopSecUpDownInfo$json = const {
  '1': 'TopSecUpDownInfo',
  '2': const [
    const {'1': 'secCd', '3': 1, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'totalAmt', '3': 2, '4': 1, '5': 1, '10': 'totalAmt'},
    const {'1': 'totalQty', '3': 3, '4': 1, '5': 1, '10': 'totalQty'},
    const {'1': 'closePrice', '3': 4, '4': 1, '5': 1, '10': 'closePrice'},
    const {'1': 'changePoint', '3': 5, '4': 1, '5': 1, '10': 'changePoint'},
    const {'1': 'changePercent', '3': 6, '4': 1, '5': 1, '10': 'changePercent'},
    const {'1': 'colorCode', '3': 7, '4': 1, '5': 14, '6': '.market_api.STOCK_COLOR_CODE', '10': 'colorCode'},
  ],
};

/// Descriptor for `TopSecUpDownResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topSecUpDownResponseDescriptor = $convert.base64Decode('ChRUb3BTZWNVcERvd25SZXNwb25zZRIWCgZzdGF0dXMYASABKAVSBnN0YXR1cxIUCgVlcnJvchgCIAEoCVIFZXJyb3ISGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZRJVCgx0b3BTZWNVcERvd24YBCADKAsyMS5tYXJrZXRfYXBpLlRvcFNlY1VwRG93blJlc3BvbnNlLlRvcFNlY1VwRG93bkluZm9SDHRvcFNlY1VwRG93bhqEAgoQVG9wU2VjVXBEb3duSW5mbxIUCgVzZWNDZBgBIAEoCVIFc2VjQ2QSGgoIdG90YWxBbXQYAiABKAFSCHRvdGFsQW10EhoKCHRvdGFsUXR5GAMgASgBUgh0b3RhbFF0eRIeCgpjbG9zZVByaWNlGAQgASgBUgpjbG9zZVByaWNlEiAKC2NoYW5nZVBvaW50GAUgASgBUgtjaGFuZ2VQb2ludBIkCg1jaGFuZ2VQZXJjZW50GAYgASgBUg1jaGFuZ2VQZXJjZW50EjoKCWNvbG9yQ29kZRgHIAEoDjIcLm1hcmtldF9hcGkuU1RPQ0tfQ09MT1JfQ09ERVIJY29sb3JDb2Rl');
@$core.Deprecated('Use tradingSessionDescriptor instead')
const TradingSession$json = const {
  '1': 'TradingSession',
  '2': const [
    const {'1': 'tradingDate', '3': 2, '4': 1, '5': 5, '10': 'tradingDate'},
    const {'1': 'marketCd', '3': 1, '4': 1, '5': 9, '10': 'marketCd'},
    const {'1': 'status', '3': 3, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `TradingSession`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tradingSessionDescriptor = $convert.base64Decode('Cg5UcmFkaW5nU2Vzc2lvbhIgCgt0cmFkaW5nRGF0ZRgCIAEoBVILdHJhZGluZ0RhdGUSGgoIbWFya2V0Q2QYASABKAlSCG1hcmtldENkEhYKBnN0YXR1cxgDIAEoCVIGc3RhdHVz');
@$core.Deprecated('Use basketInfoDescriptor instead')
const BasketInfo$json = const {
  '1': 'BasketInfo',
  '2': const [
    const {'1': 'indexCd', '3': 1, '4': 1, '5': 5, '10': 'indexCd'},
    const {'1': 'secList', '3': 2, '4': 3, '5': 9, '10': 'secList'},
  ],
};

/// Descriptor for `BasketInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List basketInfoDescriptor = $convert.base64Decode('CgpCYXNrZXRJbmZvEhgKB2luZGV4Q2QYASABKAVSB2luZGV4Q2QSGAoHc2VjTGlzdBgCIAMoCVIHc2VjTGlzdA==');
@$core.Deprecated('Use industryInfoDescriptor instead')
const IndustryInfo$json = const {
  '1': 'IndustryInfo',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'secList', '3': 2, '4': 3, '5': 9, '10': 'secList'},
  ],
};

/// Descriptor for `IndustryInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List industryInfoDescriptor = $convert.base64Decode('CgxJbmR1c3RyeUluZm8SDgoCaWQYASABKAVSAmlkEhgKB3NlY0xpc3QYAiADKAlSB3NlY0xpc3Q=');
@$core.Deprecated('Use marketMatchingDescriptor instead')
const MarketMatching$json = const {
  '1': 'MarketMatching',
  '2': const [
    const {'1': 'tradeDate', '3': 1, '4': 1, '5': 5, '10': 'tradeDate'},
    const {'1': 'secCd', '3': 3, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'time', '3': 2, '4': 1, '5': 5, '10': 'time'},
    const {'1': 'buyRange1', '3': 4, '4': 1, '5': 5, '10': 'buyRange1'},
    const {'1': 'buyPercent1', '3': 5, '4': 1, '5': 1, '10': 'buyPercent1'},
    const {'1': 'buyRange2', '3': 6, '4': 1, '5': 5, '10': 'buyRange2'},
    const {'1': 'buyPercent2', '3': 7, '4': 1, '5': 1, '10': 'buyPercent2'},
    const {'1': 'buyRange3', '3': 8, '4': 1, '5': 5, '10': 'buyRange3'},
    const {'1': 'buyPercent3', '3': 9, '4': 1, '5': 1, '10': 'buyPercent3'},
    const {'1': 'sellRange1', '3': 10, '4': 1, '5': 5, '10': 'sellRange1'},
    const {'1': 'sellPercent1', '3': 11, '4': 1, '5': 1, '10': 'sellPercent1'},
    const {'1': 'sellRange2', '3': 12, '4': 1, '5': 5, '10': 'sellRange2'},
    const {'1': 'sellPercent2', '3': 13, '4': 1, '5': 1, '10': 'sellPercent2'},
    const {'1': 'sellRange3', '3': 14, '4': 1, '5': 5, '10': 'sellRange3'},
    const {'1': 'sellPercent3', '3': 15, '4': 1, '5': 1, '10': 'sellPercent3'},
    const {'1': 'buyAmt', '3': 16, '4': 1, '5': 1, '10': 'buyAmt'},
    const {'1': 'sellAmt', '3': 17, '4': 1, '5': 1, '10': 'sellAmt'},
  ],
};

/// Descriptor for `MarketMatching`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketMatchingDescriptor = $convert.base64Decode('Cg5NYXJrZXRNYXRjaGluZxIcCgl0cmFkZURhdGUYASABKAVSCXRyYWRlRGF0ZRIUCgVzZWNDZBgDIAEoCVIFc2VjQ2QSEgoEdGltZRgCIAEoBVIEdGltZRIcCglidXlSYW5nZTEYBCABKAVSCWJ1eVJhbmdlMRIgCgtidXlQZXJjZW50MRgFIAEoAVILYnV5UGVyY2VudDESHAoJYnV5UmFuZ2UyGAYgASgFUglidXlSYW5nZTISIAoLYnV5UGVyY2VudDIYByABKAFSC2J1eVBlcmNlbnQyEhwKCWJ1eVJhbmdlMxgIIAEoBVIJYnV5UmFuZ2UzEiAKC2J1eVBlcmNlbnQzGAkgASgBUgtidXlQZXJjZW50MxIeCgpzZWxsUmFuZ2UxGAogASgFUgpzZWxsUmFuZ2UxEiIKDHNlbGxQZXJjZW50MRgLIAEoAVIMc2VsbFBlcmNlbnQxEh4KCnNlbGxSYW5nZTIYDCABKAVSCnNlbGxSYW5nZTISIgoMc2VsbFBlcmNlbnQyGA0gASgBUgxzZWxsUGVyY2VudDISHgoKc2VsbFJhbmdlMxgOIAEoBVIKc2VsbFJhbmdlMxIiCgxzZWxsUGVyY2VudDMYDyABKAFSDHNlbGxQZXJjZW50MxIWCgZidXlBbXQYECABKAFSBmJ1eUFtdBIYCgdzZWxsQW10GBEgASgBUgdzZWxsQW10');
@$core.Deprecated('Use secInfoDescriptor instead')
const SecInfo$json = const {
  '1': 'SecInfo',
  '2': const [
    const {'1': 'marketCd', '3': 1, '4': 1, '5': 9, '10': 'marketCd'},
    const {'1': 'secCd', '3': 2, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'ceilingPrice', '3': 3, '4': 1, '5': 1, '10': 'ceilingPrice'},
    const {'1': 'basicPrice', '3': 4, '4': 1, '5': 1, '10': 'basicPrice'},
    const {'1': 'floorPrice', '3': 5, '4': 1, '5': 1, '10': 'floorPrice'},
  ],
};

/// Descriptor for `SecInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List secInfoDescriptor = $convert.base64Decode('CgdTZWNJbmZvEhoKCG1hcmtldENkGAEgASgJUghtYXJrZXRDZBIUCgVzZWNDZBgCIAEoCVIFc2VjQ2QSIgoMY2VpbGluZ1ByaWNlGAMgASgBUgxjZWlsaW5nUHJpY2USHgoKYmFzaWNQcmljZRgEIAEoAVIKYmFzaWNQcmljZRIeCgpmbG9vclByaWNlGAUgASgBUgpmbG9vclByaWNl');
@$core.Deprecated('Use marketDepthDescriptor instead')
const MarketDepth$json = const {
  '1': 'MarketDepth',
  '2': const [
    const {'1': 'tradeDate', '3': 1, '4': 1, '5': 5, '10': 'tradeDate'},
    const {'1': 'time', '3': 2, '4': 1, '5': 3, '10': 'time'},
    const {'1': 'indexCd', '3': 3, '4': 1, '5': 5, '10': 'indexCd'},
    const {'1': 'down7', '3': 4, '4': 1, '5': 5, '10': 'down7'},
    const {'1': 'down57', '3': 5, '4': 1, '5': 5, '10': 'down57'},
    const {'1': 'down35', '3': 6, '4': 1, '5': 5, '10': 'down35'},
    const {'1': 'down13', '3': 7, '4': 1, '5': 5, '10': 'down13'},
    const {'1': 'down01', '3': 8, '4': 1, '5': 5, '10': 'down01'},
    const {'1': 'noChange', '3': 9, '4': 1, '5': 5, '10': 'noChange'},
    const {'1': 'up01', '3': 10, '4': 1, '5': 5, '10': 'up01'},
    const {'1': 'up13', '3': 11, '4': 1, '5': 5, '10': 'up13'},
    const {'1': 'up35', '3': 12, '4': 1, '5': 5, '10': 'up35'},
    const {'1': 'up57', '3': 13, '4': 1, '5': 5, '10': 'up57'},
    const {'1': 'up7', '3': 14, '4': 1, '5': 5, '10': 'up7'},
  ],
};

/// Descriptor for `MarketDepth`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketDepthDescriptor = $convert.base64Decode('CgtNYXJrZXREZXB0aBIcCgl0cmFkZURhdGUYASABKAVSCXRyYWRlRGF0ZRISCgR0aW1lGAIgASgDUgR0aW1lEhgKB2luZGV4Q2QYAyABKAVSB2luZGV4Q2QSFAoFZG93bjcYBCABKAVSBWRvd243EhYKBmRvd241NxgFIAEoBVIGZG93bjU3EhYKBmRvd24zNRgGIAEoBVIGZG93bjM1EhYKBmRvd24xMxgHIAEoBVIGZG93bjEzEhYKBmRvd24wMRgIIAEoBVIGZG93bjAxEhoKCG5vQ2hhbmdlGAkgASgFUghub0NoYW5nZRISCgR1cDAxGAogASgFUgR1cDAxEhIKBHVwMTMYCyABKAVSBHVwMTMSEgoEdXAzNRgMIAEoBVIEdXAzNRISCgR1cDU3GA0gASgFUgR1cDU3EhAKA3VwNxgOIAEoBVIDdXA3');
@$core.Deprecated('Use marketDepthResponseDescriptor instead')
const MarketDepthResponse$json = const {
  '1': 'MarketDepthResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'marketDepthInfo', '3': 4, '4': 1, '5': 11, '6': '.market_api.MarketDepth', '10': 'marketDepthInfo'},
  ],
};

/// Descriptor for `MarketDepthResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketDepthResponseDescriptor = $convert.base64Decode('ChNNYXJrZXREZXB0aFJlc3BvbnNlEhYKBnN0YXR1cxgBIAEoBVIGc3RhdHVzEhQKBWVycm9yGAIgASgJUgVlcnJvchIYCgdtZXNzYWdlGAMgASgJUgdtZXNzYWdlEkEKD21hcmtldERlcHRoSW5mbxgEIAEoCzIXLm1hcmtldF9hcGkuTWFya2V0RGVwdGhSD21hcmtldERlcHRoSW5mbw==');
@$core.Deprecated('Use marketMatchingResponseDescriptor instead')
const MarketMatchingResponse$json = const {
  '1': 'MarketMatchingResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'marketMatchingInfo', '3': 4, '4': 1, '5': 11, '6': '.market_api.MarketMatchingInfo', '10': 'marketMatchingInfo'},
  ],
};

/// Descriptor for `MarketMatchingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketMatchingResponseDescriptor = $convert.base64Decode('ChZNYXJrZXRNYXRjaGluZ1Jlc3BvbnNlEhYKBnN0YXR1cxgBIAEoBVIGc3RhdHVzEhQKBWVycm9yGAIgASgJUgVlcnJvchIYCgdtZXNzYWdlGAMgASgJUgdtZXNzYWdlEk4KEm1hcmtldE1hdGNoaW5nSW5mbxgEIAEoCzIeLm1hcmtldF9hcGkuTWFya2V0TWF0Y2hpbmdJbmZvUhJtYXJrZXRNYXRjaGluZ0luZm8=');
@$core.Deprecated('Use marketMatchingInfoDescriptor instead')
const MarketMatchingInfo$json = const {
  '1': 'MarketMatchingInfo',
  '2': const [
    const {'1': 'tradeDate', '3': 1, '4': 1, '5': 5, '10': 'tradeDate'},
    const {'1': 'time', '3': 2, '4': 1, '5': 5, '10': 'time'},
    const {'1': 'secCd', '3': 3, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'buyQty', '3': 4, '4': 1, '5': 1, '10': 'buyQty'},
    const {'1': 'buyAmt', '3': 5, '4': 1, '5': 1, '10': 'buyAmt'},
    const {'1': 'sellQty', '3': 6, '4': 1, '5': 1, '10': 'sellQty'},
    const {'1': 'sellAmt', '3': 7, '4': 1, '5': 1, '10': 'sellAmt'},
  ],
};

/// Descriptor for `MarketMatchingInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketMatchingInfoDescriptor = $convert.base64Decode('ChJNYXJrZXRNYXRjaGluZ0luZm8SHAoJdHJhZGVEYXRlGAEgASgFUgl0cmFkZURhdGUSEgoEdGltZRgCIAEoBVIEdGltZRIUCgVzZWNDZBgDIAEoCVIFc2VjQ2QSFgoGYnV5UXR5GAQgASgBUgZidXlRdHkSFgoGYnV5QW10GAUgASgBUgZidXlBbXQSGAoHc2VsbFF0eRgGIAEoAVIHc2VsbFF0eRIYCgdzZWxsQW10GAcgASgBUgdzZWxsQW10');
@$core.Deprecated('Use netFlowInputDescriptor instead')
const NetFlowInput$json = const {
  '1': 'NetFlowInput',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 11, '6': '.market_api.NullableString', '10': 'userId'},
    const {'1': 'indexCd', '3': 2, '4': 1, '5': 5, '10': 'indexCd'},
    const {'1': 'tn', '3': 3, '4': 1, '5': 5, '10': 'tn'},
    const {'1': 'authenCode', '3': 4, '4': 1, '5': 9, '10': 'authenCode'},
  ],
};

/// Descriptor for `NetFlowInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List netFlowInputDescriptor = $convert.base64Decode('CgxOZXRGbG93SW5wdXQSMgoGdXNlcklkGAEgASgLMhoubWFya2V0X2FwaS5OdWxsYWJsZVN0cmluZ1IGdXNlcklkEhgKB2luZGV4Q2QYAiABKAVSB2luZGV4Q2QSDgoCdG4YAyABKAVSAnRuEh4KCmF1dGhlbkNvZGUYBCABKAlSCmF1dGhlbkNvZGU=');
@$core.Deprecated('Use marketNetFlowResponseDescriptor instead')
const MarketNetFlowResponse$json = const {
  '1': 'MarketNetFlowResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'marketNetFlowList', '3': 4, '4': 3, '5': 11, '6': '.market_api.MarketNetFlow', '10': 'marketNetFlowList'},
  ],
};

/// Descriptor for `MarketNetFlowResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketNetFlowResponseDescriptor = $convert.base64Decode('ChVNYXJrZXROZXRGbG93UmVzcG9uc2USFgoGc3RhdHVzGAEgASgFUgZzdGF0dXMSFAoFZXJyb3IYAiABKAlSBWVycm9yEhgKB21lc3NhZ2UYAyABKAlSB21lc3NhZ2USRwoRbWFya2V0TmV0Rmxvd0xpc3QYBCADKAsyGS5tYXJrZXRfYXBpLk1hcmtldE5ldEZsb3dSEW1hcmtldE5ldEZsb3dMaXN0');
@$core.Deprecated('Use marketNetFlowDescriptor instead')
const MarketNetFlow$json = const {
  '1': 'MarketNetFlow',
  '2': const [
    const {'1': 'tradingDate', '3': 1, '4': 1, '5': 5, '10': 'tradingDate'},
    const {'1': 'indexCd', '3': 2, '4': 1, '5': 5, '10': 'indexCd'},
    const {'1': 'time', '3': 3, '4': 1, '5': 3, '10': 'time'},
    const {'1': 'buyQty', '3': 4, '4': 1, '5': 1, '10': 'buyQty'},
    const {'1': 'buyAmt', '3': 5, '4': 1, '5': 1, '10': 'buyAmt'},
    const {'1': 'sellQty', '3': 6, '4': 1, '5': 1, '10': 'sellQty'},
    const {'1': 'sellAmt', '3': 7, '4': 1, '5': 1, '10': 'sellAmt'},
    const {'1': 'netAmt', '3': 8, '4': 1, '5': 1, '10': 'netAmt'},
  ],
};

/// Descriptor for `MarketNetFlow`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketNetFlowDescriptor = $convert.base64Decode('Cg1NYXJrZXROZXRGbG93EiAKC3RyYWRpbmdEYXRlGAEgASgFUgt0cmFkaW5nRGF0ZRIYCgdpbmRleENkGAIgASgFUgdpbmRleENkEhIKBHRpbWUYAyABKANSBHRpbWUSFgoGYnV5UXR5GAQgASgBUgZidXlRdHkSFgoGYnV5QW10GAUgASgBUgZidXlBbXQSGAoHc2VsbFF0eRgGIAEoAVIHc2VsbFF0eRIYCgdzZWxsQW10GAcgASgBUgdzZWxsQW10EhYKBm5ldEFtdBgIIAEoAVIGbmV0QW10');
@$core.Deprecated('Use secQuotesCapProDescriptor instead')
const SecQuotesCapPro$json = const {
  '1': 'SecQuotesCapPro',
  '2': const [
    const {'1': 'marketCd', '3': 1, '4': 1, '5': 9, '10': 'marketCd'},
    const {'1': 'tradeDate', '3': 2, '4': 1, '5': 5, '10': 'tradeDate'},
    const {'1': 'secCd', '3': 3, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'capTime', '3': 4, '4': 1, '5': 3, '10': 'capTime'},
    const {'1': 'openPrice', '3': 5, '4': 1, '5': 1, '10': 'openPrice'},
    const {'1': 'openQty', '3': 6, '4': 1, '5': 1, '10': 'openQty'},
    const {'1': 'highestPrice', '3': 7, '4': 1, '5': 1, '10': 'highestPrice'},
    const {'1': 'lowestPrice', '3': 8, '4': 1, '5': 1, '10': 'lowestPrice'},
    const {'1': 'closePrice', '3': 9, '4': 1, '5': 1, '10': 'closePrice'},
    const {'1': 'closeQty', '3': 10, '4': 1, '5': 1, '10': 'closeQty'},
  ],
};

/// Descriptor for `SecQuotesCapPro`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List secQuotesCapProDescriptor = $convert.base64Decode('Cg9TZWNRdW90ZXNDYXBQcm8SGgoIbWFya2V0Q2QYASABKAlSCG1hcmtldENkEhwKCXRyYWRlRGF0ZRgCIAEoBVIJdHJhZGVEYXRlEhQKBXNlY0NkGAMgASgJUgVzZWNDZBIYCgdjYXBUaW1lGAQgASgDUgdjYXBUaW1lEhwKCW9wZW5QcmljZRgFIAEoAVIJb3BlblByaWNlEhgKB29wZW5RdHkYBiABKAFSB29wZW5RdHkSIgoMaGlnaGVzdFByaWNlGAcgASgBUgxoaWdoZXN0UHJpY2USIAoLbG93ZXN0UHJpY2UYCCABKAFSC2xvd2VzdFByaWNlEh4KCmNsb3NlUHJpY2UYCSABKAFSCmNsb3NlUHJpY2USGgoIY2xvc2VRdHkYCiABKAFSCGNsb3NlUXR5');
@$core.Deprecated('Use indexCapProDescriptor instead')
const IndexCapPro$json = const {
  '1': 'IndexCapPro',
  '2': const [
    const {'1': 'indexCd', '3': 1, '4': 1, '5': 9, '10': 'indexCd'},
    const {'1': 'capTime', '3': 2, '4': 1, '5': 3, '10': 'capTime'},
    const {'1': 'openIndex', '3': 3, '4': 1, '5': 1, '10': 'openIndex'},
    const {'1': 'openQty', '3': 4, '4': 1, '5': 1, '10': 'openQty'},
    const {'1': 'highestIndex', '3': 5, '4': 1, '5': 1, '10': 'highestIndex'},
    const {'1': 'lowestIndex', '3': 6, '4': 1, '5': 1, '10': 'lowestIndex'},
    const {'1': 'closeIndex', '3': 7, '4': 1, '5': 1, '10': 'closeIndex'},
    const {'1': 'closeQty', '3': 8, '4': 1, '5': 1, '10': 'closeQty'},
  ],
};

/// Descriptor for `IndexCapPro`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List indexCapProDescriptor = $convert.base64Decode('CgtJbmRleENhcFBybxIYCgdpbmRleENkGAEgASgJUgdpbmRleENkEhgKB2NhcFRpbWUYAiABKANSB2NhcFRpbWUSHAoJb3BlbkluZGV4GAMgASgBUglvcGVuSW5kZXgSGAoHb3BlblF0eRgEIAEoAVIHb3BlblF0eRIiCgxoaWdoZXN0SW5kZXgYBSABKAFSDGhpZ2hlc3RJbmRleBIgCgtsb3dlc3RJbmRleBgGIAEoAVILbG93ZXN0SW5kZXgSHgoKY2xvc2VJbmRleBgHIAEoAVIKY2xvc2VJbmRleBIaCghjbG9zZVF0eRgIIAEoAVIIY2xvc2VRdHk=');
@$core.Deprecated('Use secTimeSaleCapDescriptor instead')
const SecTimeSaleCap$json = const {
  '1': 'SecTimeSaleCap',
  '2': const [
    const {'1': 'secCd', '3': 1, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'secTimeSaleList', '3': 2, '4': 3, '5': 11, '6': '.market_api.SecTimeSalePro', '10': 'secTimeSaleList'},
  ],
};

/// Descriptor for `SecTimeSaleCap`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List secTimeSaleCapDescriptor = $convert.base64Decode('Cg5TZWNUaW1lU2FsZUNhcBIUCgVzZWNDZBgBIAEoCVIFc2VjQ2QSRAoPc2VjVGltZVNhbGVMaXN0GAIgAygLMhoubWFya2V0X2FwaS5TZWNUaW1lU2FsZVByb1IPc2VjVGltZVNhbGVMaXN0');
@$core.Deprecated('Use secTimeSaleProDescriptor instead')
const SecTimeSalePro$json = const {
  '1': 'SecTimeSalePro',
  '2': const [
    const {'1': 'tradeDate', '3': 1, '4': 1, '5': 5, '10': 'tradeDate'},
    const {'1': 'secCd', '3': 2, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'matPrice', '3': 3, '4': 1, '5': 1, '10': 'matPrice'},
    const {'1': 'buyQty', '3': 4, '4': 1, '5': 1, '10': 'buyQty'},
    const {'1': 'buyAmt', '3': 5, '4': 1, '5': 1, '10': 'buyAmt'},
    const {'1': 'buyPercent', '3': 6, '4': 1, '5': 1, '10': 'buyPercent'},
    const {'1': 'sellQty', '3': 7, '4': 1, '5': 1, '10': 'sellQty'},
    const {'1': 'sellAmt', '3': 8, '4': 1, '5': 1, '10': 'sellAmt'},
    const {'1': 'sellPercent', '3': 9, '4': 1, '5': 1, '10': 'sellPercent'},
    const {'1': 'totalQty', '3': 10, '4': 1, '5': 1, '10': 'totalQty'},
    const {'1': 'totalAmt', '3': 11, '4': 1, '5': 1, '10': 'totalAmt'},
    const {'1': 'percentByTotal', '3': 12, '4': 1, '5': 1, '10': 'percentByTotal'},
    const {'1': 'colorCode', '3': 13, '4': 1, '5': 14, '6': '.market_api.STOCK_COLOR_CODE', '10': 'colorCode'},
  ],
};

/// Descriptor for `SecTimeSalePro`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List secTimeSaleProDescriptor = $convert.base64Decode('Cg5TZWNUaW1lU2FsZVBybxIcCgl0cmFkZURhdGUYASABKAVSCXRyYWRlRGF0ZRIUCgVzZWNDZBgCIAEoCVIFc2VjQ2QSGgoIbWF0UHJpY2UYAyABKAFSCG1hdFByaWNlEhYKBmJ1eVF0eRgEIAEoAVIGYnV5UXR5EhYKBmJ1eUFtdBgFIAEoAVIGYnV5QW10Eh4KCmJ1eVBlcmNlbnQYBiABKAFSCmJ1eVBlcmNlbnQSGAoHc2VsbFF0eRgHIAEoAVIHc2VsbFF0eRIYCgdzZWxsQW10GAggASgBUgdzZWxsQW10EiAKC3NlbGxQZXJjZW50GAkgASgBUgtzZWxsUGVyY2VudBIaCgh0b3RhbFF0eRgKIAEoAVIIdG90YWxRdHkSGgoIdG90YWxBbXQYCyABKAFSCHRvdGFsQW10EiYKDnBlcmNlbnRCeVRvdGFsGAwgASgBUg5wZXJjZW50QnlUb3RhbBI6Cgljb2xvckNvZGUYDSABKA4yHC5tYXJrZXRfYXBpLlNUT0NLX0NPTE9SX0NPREVSCWNvbG9yQ29kZQ==');
@$core.Deprecated('Use marketShareInputDescriptor instead')
const MarketShareInput$json = const {
  '1': 'MarketShareInput',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 11, '6': '.market_api.NullableString', '10': 'userID'},
    const {'1': 'type', '3': 2, '4': 1, '5': 11, '6': '.market_api.NullableInt32', '10': 'type'},
    const {'1': 'industryIdStr', '3': 3, '4': 1, '5': 11, '6': '.market_api.NullableString', '10': 'industryIdStr'},
    const {'1': 'authenCode', '3': 4, '4': 1, '5': 9, '10': 'authenCode'},
  ],
};

/// Descriptor for `MarketShareInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketShareInputDescriptor = $convert.base64Decode('ChBNYXJrZXRTaGFyZUlucHV0EjIKBnVzZXJJRBgBIAEoCzIaLm1hcmtldF9hcGkuTnVsbGFibGVTdHJpbmdSBnVzZXJJRBItCgR0eXBlGAIgASgLMhkubWFya2V0X2FwaS5OdWxsYWJsZUludDMyUgR0eXBlEkAKDWluZHVzdHJ5SWRTdHIYAyABKAsyGi5tYXJrZXRfYXBpLk51bGxhYmxlU3RyaW5nUg1pbmR1c3RyeUlkU3RyEh4KCmF1dGhlbkNvZGUYBCABKAlSCmF1dGhlbkNvZGU=');
@$core.Deprecated('Use marketShareResponseDescriptor instead')
const MarketShareResponse$json = const {
  '1': 'MarketShareResponse',
  '2': const [
    const {'1': 'marketShareList', '3': 1, '4': 3, '5': 11, '6': '.market_api.MarketSharePro', '10': 'marketShareList'},
  ],
};

/// Descriptor for `MarketShareResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketShareResponseDescriptor = $convert.base64Decode('ChNNYXJrZXRTaGFyZVJlc3BvbnNlEkQKD21hcmtldFNoYXJlTGlzdBgBIAMoCzIaLm1hcmtldF9hcGkuTWFya2V0U2hhcmVQcm9SD21hcmtldFNoYXJlTGlzdA==');
@$core.Deprecated('Use marketShareProDescriptor instead')
const MarketSharePro$json = const {
  '1': 'MarketSharePro',
  '2': const [
    const {'1': 'secCd', '3': 1, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'secType', '3': 2, '4': 1, '5': 5, '10': 'secType'},
    const {'1': 'type', '3': 3, '4': 1, '5': 5, '10': 'type'},
    const {'1': 'period', '3': 4, '4': 1, '5': 5, '10': 'period'},
    const {'1': 'buyQty', '3': 5, '4': 1, '5': 1, '10': 'buyQty'},
    const {'1': 'buyAmt', '3': 6, '4': 1, '5': 1, '10': 'buyAmt'},
    const {'1': 'sellQty', '3': 7, '4': 1, '5': 1, '10': 'sellQty'},
    const {'1': 'sellAmt', '3': 8, '4': 1, '5': 1, '10': 'sellAmt'},
    const {'1': 'netAmt', '3': 9, '4': 1, '5': 1, '10': 'netAmt'},
    const {'1': 'openPrice', '3': 10, '4': 1, '5': 1, '10': 'openPrice'},
    const {'1': 'closePrice', '3': 11, '4': 1, '5': 1, '10': 'closePrice'},
    const {'1': 'highPrice', '3': 12, '4': 1, '5': 1, '10': 'highPrice'},
    const {'1': 'lowPrice', '3': 13, '4': 1, '5': 1, '10': 'lowPrice'},
    const {'1': 'changePercent', '3': 14, '4': 1, '5': 1, '10': 'changePercent'},
    const {'1': 'changePoint', '3': 15, '4': 1, '5': 1, '10': 'changePoint'},
    const {'1': 'buyForeignQty', '3': 16, '4': 1, '5': 1, '10': 'buyForeignQty'},
    const {'1': 'buyForeignAmt', '3': 17, '4': 1, '5': 1, '10': 'buyForeignAmt'},
    const {'1': 'sellForeignQty', '3': 18, '4': 1, '5': 1, '10': 'sellForeignQty'},
    const {'1': 'sellForeignAmt', '3': 19, '4': 1, '5': 1, '10': 'sellForeignAmt'},
    const {'1': 'totalQty', '3': 20, '4': 1, '5': 1, '10': 'totalQty'},
    const {'1': 'totalAmt', '3': 21, '4': 1, '5': 1, '10': 'totalAmt'},
  ],
};

/// Descriptor for `MarketSharePro`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketShareProDescriptor = $convert.base64Decode('Cg5NYXJrZXRTaGFyZVBybxIUCgVzZWNDZBgBIAEoCVIFc2VjQ2QSGAoHc2VjVHlwZRgCIAEoBVIHc2VjVHlwZRISCgR0eXBlGAMgASgFUgR0eXBlEhYKBnBlcmlvZBgEIAEoBVIGcGVyaW9kEhYKBmJ1eVF0eRgFIAEoAVIGYnV5UXR5EhYKBmJ1eUFtdBgGIAEoAVIGYnV5QW10EhgKB3NlbGxRdHkYByABKAFSB3NlbGxRdHkSGAoHc2VsbEFtdBgIIAEoAVIHc2VsbEFtdBIWCgZuZXRBbXQYCSABKAFSBm5ldEFtdBIcCglvcGVuUHJpY2UYCiABKAFSCW9wZW5QcmljZRIeCgpjbG9zZVByaWNlGAsgASgBUgpjbG9zZVByaWNlEhwKCWhpZ2hQcmljZRgMIAEoAVIJaGlnaFByaWNlEhoKCGxvd1ByaWNlGA0gASgBUghsb3dQcmljZRIkCg1jaGFuZ2VQZXJjZW50GA4gASgBUg1jaGFuZ2VQZXJjZW50EiAKC2NoYW5nZVBvaW50GA8gASgBUgtjaGFuZ2VQb2ludBIkCg1idXlGb3JlaWduUXR5GBAgASgBUg1idXlGb3JlaWduUXR5EiQKDWJ1eUZvcmVpZ25BbXQYESABKAFSDWJ1eUZvcmVpZ25BbXQSJgoOc2VsbEZvcmVpZ25RdHkYEiABKAFSDnNlbGxGb3JlaWduUXR5EiYKDnNlbGxGb3JlaWduQW10GBMgASgBUg5zZWxsRm9yZWlnbkFtdBIaCgh0b3RhbFF0eRgUIAEoAVIIdG90YWxRdHkSGgoIdG90YWxBbXQYFSABKAFSCHRvdGFsQW10');
@$core.Deprecated('Use marketShareProCaptureDescriptor instead')
const MarketShareProCapture$json = const {
  '1': 'MarketShareProCapture',
  '2': const [
    const {'1': 'tradeDate', '3': 1, '4': 1, '5': 5, '10': 'tradeDate'},
    const {'1': 'marketShareProList', '3': 2, '4': 3, '5': 11, '6': '.market_api.MarketSharePro', '10': 'marketShareProList'},
  ],
};

/// Descriptor for `MarketShareProCapture`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketShareProCaptureDescriptor = $convert.base64Decode('ChVNYXJrZXRTaGFyZVByb0NhcHR1cmUSHAoJdHJhZGVEYXRlGAEgASgFUgl0cmFkZURhdGUSSgoSbWFya2V0U2hhcmVQcm9MaXN0GAIgAygLMhoubWFya2V0X2FwaS5NYXJrZXRTaGFyZVByb1ISbWFya2V0U2hhcmVQcm9MaXN0');
@$core.Deprecated('Use timeSaleInputDescriptor instead')
const TimeSaleInput$json = const {
  '1': 'TimeSaleInput',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 11, '6': '.market_api.NullableString', '10': 'userID'},
    const {'1': 'secCd', '3': 2, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'tn', '3': 3, '4': 1, '5': 5, '10': 'tn'},
    const {'1': 'authenCode', '3': 4, '4': 1, '5': 9, '10': 'authenCode'},
  ],
};

/// Descriptor for `TimeSaleInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timeSaleInputDescriptor = $convert.base64Decode('Cg1UaW1lU2FsZUlucHV0EjIKBnVzZXJJRBgBIAEoCzIaLm1hcmtldF9hcGkuTnVsbGFibGVTdHJpbmdSBnVzZXJJRBIUCgVzZWNDZBgCIAEoCVIFc2VjQ2QSDgoCdG4YAyABKAVSAnRuEh4KCmF1dGhlbkNvZGUYBCABKAlSCmF1dGhlbkNvZGU=');
@$core.Deprecated('Use timeSaleResponseDescriptor instead')
const TimeSaleResponse$json = const {
  '1': 'TimeSaleResponse',
  '2': const [
    const {'1': 'secTimeSaleList', '3': 1, '4': 3, '5': 11, '6': '.market_api.SecTimeSalePro', '10': 'secTimeSaleList'},
  ],
};

/// Descriptor for `TimeSaleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timeSaleResponseDescriptor = $convert.base64Decode('ChBUaW1lU2FsZVJlc3BvbnNlEkQKD3NlY1RpbWVTYWxlTGlzdBgBIAMoCzIaLm1hcmtldF9hcGkuU2VjVGltZVNhbGVQcm9SD3NlY1RpbWVTYWxlTGlzdA==');
@$core.Deprecated('Use internalMSInputDescriptor instead')
const InternalMSInput$json = const {
  '1': 'InternalMSInput',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 11, '6': '.market_api.NullableString', '10': 'userID'},
    const {'1': 'side', '3': 2, '4': 1, '5': 5, '10': 'side'},
    const {'1': 'indexCdStr', '3': 3, '4': 1, '5': 9, '10': 'indexCdStr'},
    const {'1': 'industryIDStr', '3': 4, '4': 1, '5': 9, '10': 'industryIDStr'},
    const {'1': 'type', '3': 5, '4': 1, '5': 5, '10': 'type'},
    const {'1': 'orderFieldType', '3': 6, '4': 1, '5': 5, '10': 'orderFieldType'},
    const {'1': 'orderType', '3': 7, '4': 1, '5': 14, '6': '.market_api.ORDER_TYPE', '10': 'orderType'},
    const {'1': 'offset', '3': 8, '4': 1, '5': 5, '10': 'offset'},
    const {'1': 'limit', '3': 9, '4': 1, '5': 5, '10': 'limit'},
    const {'1': 'authenCode', '3': 10, '4': 1, '5': 9, '10': 'authenCode'},
  ],
};

/// Descriptor for `InternalMSInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List internalMSInputDescriptor = $convert.base64Decode('Cg9JbnRlcm5hbE1TSW5wdXQSMgoGdXNlcklEGAEgASgLMhoubWFya2V0X2FwaS5OdWxsYWJsZVN0cmluZ1IGdXNlcklEEhIKBHNpZGUYAiABKAVSBHNpZGUSHgoKaW5kZXhDZFN0chgDIAEoCVIKaW5kZXhDZFN0chIkCg1pbmR1c3RyeUlEU3RyGAQgASgJUg1pbmR1c3RyeUlEU3RyEhIKBHR5cGUYBSABKAVSBHR5cGUSJgoOb3JkZXJGaWVsZFR5cGUYBiABKAVSDm9yZGVyRmllbGRUeXBlEjQKCW9yZGVyVHlwZRgHIAEoDjIWLm1hcmtldF9hcGkuT1JERVJfVFlQRVIJb3JkZXJUeXBlEhYKBm9mZnNldBgIIAEoBVIGb2Zmc2V0EhQKBWxpbWl0GAkgASgFUgVsaW1pdBIeCgphdXRoZW5Db2RlGAogASgJUgphdXRoZW5Db2Rl');
@$core.Deprecated('Use internalMSDescriptor instead')
const InternalMS$json = const {
  '1': 'InternalMS',
  '2': const [
    const {'1': 'secCd', '3': 1, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'changePercent', '3': 2, '4': 1, '5': 1, '10': 'changePercent'},
    const {'1': 'changePoint', '3': 3, '4': 1, '5': 1, '10': 'changePoint'},
    const {'1': 'closePrice', '3': 4, '4': 1, '5': 1, '10': 'closePrice'},
    const {'1': 'colorCode', '3': 5, '4': 1, '5': 14, '6': '.market_api.STOCK_COLOR_CODE', '10': 'colorCode'},
    const {'1': 'buyForeignQty', '3': 6, '4': 1, '5': 1, '10': 'buyForeignQty'},
    const {'1': 'sellForeignQty', '3': 7, '4': 1, '5': 1, '10': 'sellForeignQty'},
    const {'1': 'netForeignQty', '3': 8, '4': 1, '5': 1, '10': 'netForeignQty'},
    const {'1': 'buyForeignAmt', '3': 9, '4': 1, '5': 1, '10': 'buyForeignAmt'},
    const {'1': 'sellForeignAmt', '3': 10, '4': 1, '5': 1, '10': 'sellForeignAmt'},
    const {'1': 'netForeignAmt', '3': 11, '4': 1, '5': 1, '10': 'netForeignAmt'},
  ],
};

/// Descriptor for `InternalMS`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List internalMSDescriptor = $convert.base64Decode('CgpJbnRlcm5hbE1TEhQKBXNlY0NkGAEgASgJUgVzZWNDZBIkCg1jaGFuZ2VQZXJjZW50GAIgASgBUg1jaGFuZ2VQZXJjZW50EiAKC2NoYW5nZVBvaW50GAMgASgBUgtjaGFuZ2VQb2ludBIeCgpjbG9zZVByaWNlGAQgASgBUgpjbG9zZVByaWNlEjoKCWNvbG9yQ29kZRgFIAEoDjIcLm1hcmtldF9hcGkuU1RPQ0tfQ09MT1JfQ09ERVIJY29sb3JDb2RlEiQKDWJ1eUZvcmVpZ25RdHkYBiABKAFSDWJ1eUZvcmVpZ25RdHkSJgoOc2VsbEZvcmVpZ25RdHkYByABKAFSDnNlbGxGb3JlaWduUXR5EiQKDW5ldEZvcmVpZ25RdHkYCCABKAFSDW5ldEZvcmVpZ25RdHkSJAoNYnV5Rm9yZWlnbkFtdBgJIAEoAVINYnV5Rm9yZWlnbkFtdBImCg5zZWxsRm9yZWlnbkFtdBgKIAEoAVIOc2VsbEZvcmVpZ25BbXQSJAoNbmV0Rm9yZWlnbkFtdBgLIAEoAVINbmV0Rm9yZWlnbkFtdA==');
@$core.Deprecated('Use internalMSResponseDescriptor instead')
const InternalMSResponse$json = const {
  '1': 'InternalMSResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'internalMSList', '3': 4, '4': 3, '5': 11, '6': '.market_api.InternalMS', '10': 'internalMSList'},
  ],
};

/// Descriptor for `InternalMSResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List internalMSResponseDescriptor = $convert.base64Decode('ChJJbnRlcm5hbE1TUmVzcG9uc2USFgoGc3RhdHVzGAEgASgFUgZzdGF0dXMSFAoFZXJyb3IYAiABKAlSBWVycm9yEhgKB21lc3NhZ2UYAyABKAlSB21lc3NhZ2USPgoOaW50ZXJuYWxNU0xpc3QYBCADKAsyFi5tYXJrZXRfYXBpLkludGVybmFsTVNSDmludGVybmFsTVNMaXN0');
@$core.Deprecated('Use topSecChangedInputDescriptor instead')
const TopSecChangedInput$json = const {
  '1': 'TopSecChangedInput',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 9, '10': 'userID'},
    const {'1': 'marketCd', '3': 2, '4': 1, '5': 9, '10': 'marketCd'},
    const {'1': 'changedType', '3': 3, '4': 1, '5': 5, '10': 'changedType'},
    const {'1': 'periodType', '3': 4, '4': 1, '5': 5, '10': 'periodType'},
    const {'1': 'orderFieldType', '3': 5, '4': 1, '5': 5, '10': 'orderFieldType'},
    const {'1': 'orderType', '3': 6, '4': 1, '5': 14, '6': '.market_api.ORDER_TYPE', '10': 'orderType'},
    const {'1': 'offset', '3': 7, '4': 1, '5': 5, '10': 'offset'},
    const {'1': 'limit', '3': 8, '4': 1, '5': 5, '10': 'limit'},
    const {'1': 'authenCode', '3': 9, '4': 1, '5': 9, '10': 'authenCode'},
  ],
};

/// Descriptor for `TopSecChangedInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topSecChangedInputDescriptor = $convert.base64Decode('ChJUb3BTZWNDaGFuZ2VkSW5wdXQSFgoGdXNlcklEGAEgASgJUgZ1c2VySUQSGgoIbWFya2V0Q2QYAiABKAlSCG1hcmtldENkEiAKC2NoYW5nZWRUeXBlGAMgASgFUgtjaGFuZ2VkVHlwZRIeCgpwZXJpb2RUeXBlGAQgASgFUgpwZXJpb2RUeXBlEiYKDm9yZGVyRmllbGRUeXBlGAUgASgFUg5vcmRlckZpZWxkVHlwZRI0CglvcmRlclR5cGUYBiABKA4yFi5tYXJrZXRfYXBpLk9SREVSX1RZUEVSCW9yZGVyVHlwZRIWCgZvZmZzZXQYByABKAVSBm9mZnNldBIUCgVsaW1pdBgIIAEoBVIFbGltaXQSHgoKYXV0aGVuQ29kZRgJIAEoCVIKYXV0aGVuQ29kZQ==');
@$core.Deprecated('Use topSecChangedResponseDescriptor instead')
const TopSecChangedResponse$json = const {
  '1': 'TopSecChangedResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'topSecChanged', '3': 4, '4': 3, '5': 11, '6': '.market_api.TopSecChangedResponse.TopSecChangedInfo', '10': 'topSecChanged'},
  ],
  '3': const [TopSecChangedResponse_TopSecChangedInfo$json],
};

@$core.Deprecated('Use topSecChangedResponseDescriptor instead')
const TopSecChangedResponse_TopSecChangedInfo$json = const {
  '1': 'TopSecChangedInfo',
  '2': const [
    const {'1': 'secCd', '3': 1, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'totalAmt', '3': 2, '4': 1, '5': 1, '10': 'totalAmt'},
    const {'1': 'totalQty', '3': 3, '4': 1, '5': 1, '10': 'totalQty'},
    const {'1': 'closePrice', '3': 4, '4': 1, '5': 1, '10': 'closePrice'},
    const {'1': 'changePoint', '3': 5, '4': 1, '5': 1, '10': 'changePoint'},
    const {'1': 'changePercent', '3': 6, '4': 1, '5': 1, '10': 'changePercent'},
    const {'1': 'changeHighLow', '3': 7, '4': 1, '5': 1, '10': 'changeHighLow'},
    const {'1': 'colorCode', '3': 8, '4': 1, '5': 14, '6': '.market_api.STOCK_COLOR_CODE', '10': 'colorCode'},
  ],
};

/// Descriptor for `TopSecChangedResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topSecChangedResponseDescriptor = $convert.base64Decode('ChVUb3BTZWNDaGFuZ2VkUmVzcG9uc2USFgoGc3RhdHVzGAEgASgFUgZzdGF0dXMSFAoFZXJyb3IYAiABKAlSBWVycm9yEhgKB21lc3NhZ2UYAyABKAlSB21lc3NhZ2USWQoNdG9wU2VjQ2hhbmdlZBgEIAMoCzIzLm1hcmtldF9hcGkuVG9wU2VjQ2hhbmdlZFJlc3BvbnNlLlRvcFNlY0NoYW5nZWRJbmZvUg10b3BTZWNDaGFuZ2VkGqsCChFUb3BTZWNDaGFuZ2VkSW5mbxIUCgVzZWNDZBgBIAEoCVIFc2VjQ2QSGgoIdG90YWxBbXQYAiABKAFSCHRvdGFsQW10EhoKCHRvdGFsUXR5GAMgASgBUgh0b3RhbFF0eRIeCgpjbG9zZVByaWNlGAQgASgBUgpjbG9zZVByaWNlEiAKC2NoYW5nZVBvaW50GAUgASgBUgtjaGFuZ2VQb2ludBIkCg1jaGFuZ2VQZXJjZW50GAYgASgBUg1jaGFuZ2VQZXJjZW50EiQKDWNoYW5nZUhpZ2hMb3cYByABKAFSDWNoYW5nZUhpZ2hMb3cSOgoJY29sb3JDb2RlGAggASgOMhwubWFya2V0X2FwaS5TVE9DS19DT0xPUl9DT0RFUgljb2xvckNvZGU=');
@$core.Deprecated('Use secDividendInputDescriptor instead')
const SecDividendInput$json = const {
  '1': 'SecDividendInput',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 9, '10': 'userID'},
    const {'1': 'secCd', '3': 2, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'authenCode', '3': 3, '4': 1, '5': 9, '10': 'authenCode'},
  ],
};

/// Descriptor for `SecDividendInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List secDividendInputDescriptor = $convert.base64Decode('ChBTZWNEaXZpZGVuZElucHV0EhYKBnVzZXJJRBgBIAEoCVIGdXNlcklEEhQKBXNlY0NkGAIgASgJUgVzZWNDZBIeCgphdXRoZW5Db2RlGAMgASgJUgphdXRoZW5Db2Rl');
@$core.Deprecated('Use secDividendResponseDescriptor instead')
const SecDividendResponse$json = const {
  '1': 'SecDividendResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'secDividendInfo', '3': 4, '4': 1, '5': 11, '6': '.market_api.SecDividendInfo', '10': 'secDividendInfo'},
  ],
};

/// Descriptor for `SecDividendResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List secDividendResponseDescriptor = $convert.base64Decode('ChNTZWNEaXZpZGVuZFJlc3BvbnNlEhYKBnN0YXR1cxgBIAEoBVIGc3RhdHVzEhQKBWVycm9yGAIgASgJUgVlcnJvchIYCgdtZXNzYWdlGAMgASgJUgdtZXNzYWdlEkUKD3NlY0RpdmlkZW5kSW5mbxgEIAEoCzIbLm1hcmtldF9hcGkuU2VjRGl2aWRlbmRJbmZvUg9zZWNEaXZpZGVuZEluZm8=');
@$core.Deprecated('Use marketIndexInputDescriptor instead')
const MarketIndexInput$json = const {
  '1': 'MarketIndexInput',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 9, '10': 'userID'},
    const {'1': 'indexCdList', '3': 2, '4': 1, '5': 9, '10': 'indexCdList'},
    const {'1': 'authenCode', '3': 3, '4': 1, '5': 9, '10': 'authenCode'},
  ],
};

/// Descriptor for `MarketIndexInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketIndexInputDescriptor = $convert.base64Decode('ChBNYXJrZXRJbmRleElucHV0EhYKBnVzZXJJRBgBIAEoCVIGdXNlcklEEiAKC2luZGV4Q2RMaXN0GAIgASgJUgtpbmRleENkTGlzdBIeCgphdXRoZW5Db2RlGAMgASgJUgphdXRoZW5Db2Rl');
@$core.Deprecated('Use marketIndexInfoDescriptor instead')
const MarketIndexInfo$json = const {
  '1': 'MarketIndexInfo',
  '2': const [
    const {'1': 'indexCd', '3': 1, '4': 1, '5': 5, '10': 'indexCd'},
    const {'1': 'openIndex', '3': 2, '4': 1, '5': 1, '10': 'openIndex'},
    const {'1': 'marketIndex', '3': 3, '4': 1, '5': 1, '10': 'marketIndex'},
    const {'1': 'changeIndex', '3': 4, '4': 1, '5': 1, '10': 'changeIndex'},
    const {'1': 'changePercent', '3': 5, '4': 1, '5': 1, '10': 'changePercent'},
    const {'1': 'totalQty', '3': 6, '4': 1, '5': 1, '10': 'totalQty'},
    const {'1': 'totalAmt', '3': 7, '4': 1, '5': 1, '10': 'totalAmt'},
    const {'1': 'colorCode', '3': 8, '4': 1, '5': 14, '6': '.market_api.INDEX_COLOR_CODE', '10': 'colorCode'},
    const {'1': 'highestIndex', '3': 9, '4': 1, '5': 1, '10': 'highestIndex'},
    const {'1': 'lowestIndex', '3': 10, '4': 1, '5': 1, '10': 'lowestIndex'},
    const {'1': 'totalBuyForeignAmt', '3': 11, '4': 1, '5': 1, '10': 'totalBuyForeignAmt'},
    const {'1': 'totalSellForeignAmt', '3': 12, '4': 1, '5': 1, '10': 'totalSellForeignAmt'},
    const {'1': 'advances', '3': 13, '4': 1, '5': 1, '10': 'advances'},
    const {'1': 'declenes', '3': 14, '4': 1, '5': 1, '10': 'declenes'},
    const {'1': 'noChange', '3': 15, '4': 1, '5': 1, '10': 'noChange'},
    const {'1': 'indexTime', '3': 16, '4': 3, '5': 11, '6': '.market_api.MarketIndexInfo.IndexTime', '10': 'indexTime'},
    const {'1': 'state', '3': 17, '4': 1, '5': 14, '6': '.market_api.INDEX_STATE', '10': 'state'},
  ],
  '3': const [MarketIndexInfo_IndexTime$json],
};

@$core.Deprecated('Use marketIndexInfoDescriptor instead')
const MarketIndexInfo_IndexTime$json = const {
  '1': 'IndexTime',
  '2': const [
    const {'1': 'time', '3': 1, '4': 1, '5': 3, '10': 'time'},
    const {'1': 'val', '3': 2, '4': 1, '5': 1, '10': 'val'},
  ],
};

/// Descriptor for `MarketIndexInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketIndexInfoDescriptor = $convert.base64Decode('Cg9NYXJrZXRJbmRleEluZm8SGAoHaW5kZXhDZBgBIAEoBVIHaW5kZXhDZBIcCglvcGVuSW5kZXgYAiABKAFSCW9wZW5JbmRleBIgCgttYXJrZXRJbmRleBgDIAEoAVILbWFya2V0SW5kZXgSIAoLY2hhbmdlSW5kZXgYBCABKAFSC2NoYW5nZUluZGV4EiQKDWNoYW5nZVBlcmNlbnQYBSABKAFSDWNoYW5nZVBlcmNlbnQSGgoIdG90YWxRdHkYBiABKAFSCHRvdGFsUXR5EhoKCHRvdGFsQW10GAcgASgBUgh0b3RhbEFtdBI6Cgljb2xvckNvZGUYCCABKA4yHC5tYXJrZXRfYXBpLklOREVYX0NPTE9SX0NPREVSCWNvbG9yQ29kZRIiCgxoaWdoZXN0SW5kZXgYCSABKAFSDGhpZ2hlc3RJbmRleBIgCgtsb3dlc3RJbmRleBgKIAEoAVILbG93ZXN0SW5kZXgSLgoSdG90YWxCdXlGb3JlaWduQW10GAsgASgBUhJ0b3RhbEJ1eUZvcmVpZ25BbXQSMAoTdG90YWxTZWxsRm9yZWlnbkFtdBgMIAEoAVITdG90YWxTZWxsRm9yZWlnbkFtdBIaCghhZHZhbmNlcxgNIAEoAVIIYWR2YW5jZXMSGgoIZGVjbGVuZXMYDiABKAFSCGRlY2xlbmVzEhoKCG5vQ2hhbmdlGA8gASgBUghub0NoYW5nZRJDCglpbmRleFRpbWUYECADKAsyJS5tYXJrZXRfYXBpLk1hcmtldEluZGV4SW5mby5JbmRleFRpbWVSCWluZGV4VGltZRItCgVzdGF0ZRgRIAEoDjIXLm1hcmtldF9hcGkuSU5ERVhfU1RBVEVSBXN0YXRlGjEKCUluZGV4VGltZRISCgR0aW1lGAEgASgDUgR0aW1lEhAKA3ZhbBgCIAEoAVIDdmFs');
@$core.Deprecated('Use marketWorldIndexInputDescriptor instead')
const MarketWorldIndexInput$json = const {
  '1': 'MarketWorldIndexInput',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 9, '10': 'userID'},
    const {'1': 'authenCode', '3': 2, '4': 1, '5': 9, '10': 'authenCode'},
  ],
};

/// Descriptor for `MarketWorldIndexInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketWorldIndexInputDescriptor = $convert.base64Decode('ChVNYXJrZXRXb3JsZEluZGV4SW5wdXQSFgoGdXNlcklEGAEgASgJUgZ1c2VySUQSHgoKYXV0aGVuQ29kZRgCIAEoCVIKYXV0aGVuQ29kZQ==');
@$core.Deprecated('Use marketWorldIndexInfoDescriptor instead')
const MarketWorldIndexInfo$json = const {
  '1': 'MarketWorldIndexInfo',
  '2': const [
    const {'1': 'indexCd', '3': 1, '4': 1, '5': 5, '10': 'indexCd'},
    const {'1': 'symbol', '3': 2, '4': 1, '5': 9, '10': 'symbol'},
    const {'1': 'time', '3': 3, '4': 1, '5': 1, '10': 'time'},
    const {'1': 'flag', '3': 4, '4': 1, '5': 9, '10': 'flag'},
    const {'1': 'open', '3': 5, '4': 1, '5': 1, '10': 'open'},
    const {'1': 'last', '3': 7, '4': 1, '5': 1, '10': 'last'},
    const {'1': 'chgPct', '3': 8, '4': 1, '5': 1, '10': 'chgPct'},
    const {'1': 'chg', '3': 9, '4': 1, '5': 1, '10': 'chg'},
    const {'1': 'volume', '3': 10, '4': 1, '5': 1, '10': 'volume'},
    const {'1': 'colorCode', '3': 11, '4': 1, '5': 14, '6': '.market_api.INDEX_COLOR_CODE', '10': 'colorCode'},
    const {'1': 'indexTime', '3': 12, '4': 3, '5': 11, '6': '.market_api.MarketWorldIndexInfo.IndexTime', '10': 'indexTime'},
  ],
  '3': const [MarketWorldIndexInfo_IndexTime$json],
};

@$core.Deprecated('Use marketWorldIndexInfoDescriptor instead')
const MarketWorldIndexInfo_IndexTime$json = const {
  '1': 'IndexTime',
  '2': const [
    const {'1': 'time', '3': 1, '4': 1, '5': 3, '10': 'time'},
    const {'1': 'val', '3': 2, '4': 1, '5': 1, '10': 'val'},
  ],
};

/// Descriptor for `MarketWorldIndexInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketWorldIndexInfoDescriptor = $convert.base64Decode('ChRNYXJrZXRXb3JsZEluZGV4SW5mbxIYCgdpbmRleENkGAEgASgFUgdpbmRleENkEhYKBnN5bWJvbBgCIAEoCVIGc3ltYm9sEhIKBHRpbWUYAyABKAFSBHRpbWUSEgoEZmxhZxgEIAEoCVIEZmxhZxISCgRvcGVuGAUgASgBUgRvcGVuEhIKBGxhc3QYByABKAFSBGxhc3QSFgoGY2hnUGN0GAggASgBUgZjaGdQY3QSEAoDY2hnGAkgASgBUgNjaGcSFgoGdm9sdW1lGAogASgBUgZ2b2x1bWUSOgoJY29sb3JDb2RlGAsgASgOMhwubWFya2V0X2FwaS5JTkRFWF9DT0xPUl9DT0RFUgljb2xvckNvZGUSSAoJaW5kZXhUaW1lGAwgAygLMioubWFya2V0X2FwaS5NYXJrZXRXb3JsZEluZGV4SW5mby5JbmRleFRpbWVSCWluZGV4VGltZRoxCglJbmRleFRpbWUSEgoEdGltZRgBIAEoA1IEdGltZRIQCgN2YWwYAiABKAFSA3ZhbA==');
@$core.Deprecated('Use secQuotesDetailInputDescriptor instead')
const SecQuotesDetailInput$json = const {
  '1': 'SecQuotesDetailInput',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 9, '10': 'userID'},
    const {'1': 'secCd', '3': 2, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'authenCode', '3': 3, '4': 1, '5': 9, '10': 'authenCode'},
  ],
};

/// Descriptor for `SecQuotesDetailInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List secQuotesDetailInputDescriptor = $convert.base64Decode('ChRTZWNRdW90ZXNEZXRhaWxJbnB1dBIWCgZ1c2VySUQYASABKAlSBnVzZXJJRBIUCgVzZWNDZBgCIAEoCVIFc2VjQ2QSHgoKYXV0aGVuQ29kZRgDIAEoCVIKYXV0aGVuQ29kZQ==');
@$core.Deprecated('Use secQuotesDetailResponseDescriptor instead')
const SecQuotesDetailResponse$json = const {
  '1': 'SecQuotesDetailResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'secDetailInfo', '3': 4, '4': 1, '5': 11, '6': '.market_api.SecQuotesDetailResponse.SecDetailInfo', '10': 'secDetailInfo'},
  ],
  '3': const [SecQuotesDetailResponse_SecDetailInfo$json],
};

@$core.Deprecated('Use secQuotesDetailResponseDescriptor instead')
const SecQuotesDetailResponse_SecDetailInfo$json = const {
  '1': 'SecDetailInfo',
  '2': const [
    const {'1': 'marketCd', '3': 1, '4': 1, '5': 9, '10': 'marketCd'},
    const {'1': 'secCd', '3': 2, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'secName', '3': 3, '4': 1, '5': 9, '10': 'secName'},
    const {'1': 'secType', '3': 4, '4': 1, '5': 5, '10': 'secType'},
    const {'1': 'basicPrice', '3': 5, '4': 1, '5': 1, '10': 'basicPrice'},
    const {'1': 'ceilingPrice', '3': 6, '4': 1, '5': 1, '10': 'ceilingPrice'},
    const {'1': 'floorPrice', '3': 7, '4': 1, '5': 1, '10': 'floorPrice'},
    const {'1': 'highestPrice', '3': 8, '4': 1, '5': 1, '10': 'highestPrice'},
    const {'1': 'lowestPrice', '3': 9, '4': 1, '5': 1, '10': 'lowestPrice'},
    const {'1': 'avgPrice', '3': 10, '4': 1, '5': 1, '10': 'avgPrice'},
    const {'1': 'lastPrice', '3': 11, '4': 1, '5': 1, '10': 'lastPrice'},
    const {'1': 'lastQty', '3': 12, '4': 1, '5': 1, '10': 'lastQty'},
    const {'1': 'totalQty', '3': 13, '4': 1, '5': 1, '10': 'totalQty'},
    const {'1': 'totalAmt', '3': 14, '4': 1, '5': 1, '10': 'totalAmt'},
    const {'1': 'totalPtQty', '3': 15, '4': 1, '5': 1, '10': 'totalPtQty'},
    const {'1': 'totalPtAmt', '3': 16, '4': 1, '5': 1, '10': 'totalPtAmt'},
    const {'1': 'sellForeignQty', '3': 17, '4': 1, '5': 1, '10': 'sellForeignQty'},
    const {'1': 'buyForeignQty', '3': 18, '4': 1, '5': 1, '10': 'buyForeignQty'},
    const {'1': 'changePoint', '3': 19, '4': 1, '5': 1, '10': 'changePoint'},
    const {'1': 'changePercent', '3': 20, '4': 1, '5': 1, '10': 'changePercent'},
    const {'1': 'totalRoom', '3': 21, '4': 1, '5': 1, '10': 'totalRoom'},
    const {'1': 'currentRoom', '3': 22, '4': 1, '5': 1, '10': 'currentRoom'},
    const {'1': 'w52High', '3': 23, '4': 1, '5': 1, '10': 'w52High'},
    const {'1': 'w52Low', '3': 24, '4': 1, '5': 1, '10': 'w52Low'},
    const {'1': 'best1BidPriceStr', '3': 25, '4': 1, '5': 9, '10': 'best1BidPriceStr'},
    const {'1': 'best1BidPrice', '3': 26, '4': 1, '5': 1, '10': 'best1BidPrice'},
    const {'1': 'best1BidQty', '3': 27, '4': 1, '5': 1, '10': 'best1BidQty'},
    const {'1': 'best2BidPrice', '3': 28, '4': 1, '5': 1, '10': 'best2BidPrice'},
    const {'1': 'best2BidQty', '3': 29, '4': 1, '5': 1, '10': 'best2BidQty'},
    const {'1': 'best3BidPrice', '3': 30, '4': 1, '5': 1, '10': 'best3BidPrice'},
    const {'1': 'best3BidQty', '3': 31, '4': 1, '5': 1, '10': 'best3BidQty'},
    const {'1': 'best4BidQty', '3': 32, '4': 1, '5': 1, '10': 'best4BidQty'},
    const {'1': 'best1OfferPriceStr', '3': 33, '4': 1, '5': 9, '10': 'best1OfferPriceStr'},
    const {'1': 'best1OfferPrice', '3': 34, '4': 1, '5': 1, '10': 'best1OfferPrice'},
    const {'1': 'best1OfferQty', '3': 35, '4': 1, '5': 1, '10': 'best1OfferQty'},
    const {'1': 'best2OfferPrice', '3': 36, '4': 1, '5': 1, '10': 'best2OfferPrice'},
    const {'1': 'best2OfferQty', '3': 37, '4': 1, '5': 1, '10': 'best2OfferQty'},
    const {'1': 'best3OfferPrice', '3': 38, '4': 1, '5': 1, '10': 'best3OfferPrice'},
    const {'1': 'best3OfferQty', '3': 39, '4': 1, '5': 1, '10': 'best3OfferQty'},
    const {'1': 'best4OfferQty', '3': 40, '4': 1, '5': 1, '10': 'best4OfferQty'},
    const {'1': 'listedQty', '3': 41, '4': 1, '5': 1, '10': 'listedQty'},
    const {'1': 'tradeQty', '3': 42, '4': 1, '5': 1, '10': 'tradeQty'},
    const {'1': 'tradePercent', '3': 43, '4': 1, '5': 1, '10': 'tradePercent'},
    const {'1': 'esp', '3': 44, '4': 1, '5': 1, '10': 'esp'},
    const {'1': 'pe', '3': 45, '4': 1, '5': 1, '10': 'pe'},
    const {'1': 'pb', '3': 46, '4': 1, '5': 1, '10': 'pb'},
    const {'1': 'ps', '3': 47, '4': 1, '5': 1, '10': 'ps'},
    const {'1': 'bookValue', '3': 48, '4': 1, '5': 1, '10': 'bookValue'},
    const {'1': 'dividendAmt', '3': 49, '4': 1, '5': 1, '10': 'dividendAmt'},
    const {'1': 'dividendRate', '3': 50, '4': 1, '5': 1, '10': 'dividendRate'},
    const {'1': 'openPrice', '3': 51, '4': 1, '5': 1, '10': 'openPrice'},
    const {'1': 'closePrice', '3': 52, '4': 1, '5': 1, '10': 'closePrice'},
    const {'1': 'roe', '3': 53, '4': 1, '5': 1, '10': 'roe'},
    const {'1': 'roa', '3': 54, '4': 1, '5': 1, '10': 'roa'},
    const {'1': 'turnoverRate', '3': 55, '4': 1, '5': 1, '10': 'turnoverRate'},
    const {'1': 'range', '3': 56, '4': 1, '5': 1, '10': 'range'},
    const {'1': 'secNameEn', '3': 57, '4': 1, '5': 9, '10': 'secNameEn'},
    const {'1': 'baseSecCd', '3': 58, '4': 1, '5': 11, '6': '.market_api.NullableString', '10': 'baseSecCd'},
    const {'1': 'issuer', '3': 59, '4': 1, '5': 11, '6': '.market_api.NullableString', '10': 'issuer'},
    const {'1': 'basePrice', '3': 60, '4': 1, '5': 1, '10': 'basePrice'},
    const {'1': 'execPrice', '3': 61, '4': 1, '5': 1, '10': 'execPrice'},
    const {'1': 'basePriceCp', '3': 62, '4': 1, '5': 1, '10': 'basePriceCp'},
    const {'1': 'bfPrice', '3': 63, '4': 1, '5': 1, '10': 'bfPrice'},
    const {'1': 'bbPrice', '3': 64, '4': 1, '5': 1, '10': 'bbPrice'},
    const {'1': 'bcPrice', '3': 65, '4': 1, '5': 1, '10': 'bcPrice'},
    const {'1': 'lastTradeDate', '3': 66, '4': 1, '5': 5, '10': 'lastTradeDate'},
    const {'1': 'baseSecPriceColor', '3': 67, '4': 1, '5': 14, '6': '.market_api.STOCK_COLOR_CODE', '10': 'baseSecPriceColor'},
    const {'1': 'hasRightExec', '3': 68, '4': 1, '5': 5, '10': 'hasRightExec'},
    const {'1': 'execRatio', '3': 69, '4': 1, '5': 11, '6': '.market_api.NullableString', '10': 'execRatio'},
    const {'1': 'marketCap', '3': 70, '4': 1, '5': 1, '10': 'marketCap'},
  ],
};

/// Descriptor for `SecQuotesDetailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List secQuotesDetailResponseDescriptor = $convert.base64Decode('ChdTZWNRdW90ZXNEZXRhaWxSZXNwb25zZRIWCgZzdGF0dXMYASABKAVSBnN0YXR1cxIUCgVlcnJvchgCIAEoCVIFZXJyb3ISGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZRJXCg1zZWNEZXRhaWxJbmZvGAQgASgLMjEubWFya2V0X2FwaS5TZWNRdW90ZXNEZXRhaWxSZXNwb25zZS5TZWNEZXRhaWxJbmZvUg1zZWNEZXRhaWxJbmZvGqUSCg1TZWNEZXRhaWxJbmZvEhoKCG1hcmtldENkGAEgASgJUghtYXJrZXRDZBIUCgVzZWNDZBgCIAEoCVIFc2VjQ2QSGAoHc2VjTmFtZRgDIAEoCVIHc2VjTmFtZRIYCgdzZWNUeXBlGAQgASgFUgdzZWNUeXBlEh4KCmJhc2ljUHJpY2UYBSABKAFSCmJhc2ljUHJpY2USIgoMY2VpbGluZ1ByaWNlGAYgASgBUgxjZWlsaW5nUHJpY2USHgoKZmxvb3JQcmljZRgHIAEoAVIKZmxvb3JQcmljZRIiCgxoaWdoZXN0UHJpY2UYCCABKAFSDGhpZ2hlc3RQcmljZRIgCgtsb3dlc3RQcmljZRgJIAEoAVILbG93ZXN0UHJpY2USGgoIYXZnUHJpY2UYCiABKAFSCGF2Z1ByaWNlEhwKCWxhc3RQcmljZRgLIAEoAVIJbGFzdFByaWNlEhgKB2xhc3RRdHkYDCABKAFSB2xhc3RRdHkSGgoIdG90YWxRdHkYDSABKAFSCHRvdGFsUXR5EhoKCHRvdGFsQW10GA4gASgBUgh0b3RhbEFtdBIeCgp0b3RhbFB0UXR5GA8gASgBUgp0b3RhbFB0UXR5Eh4KCnRvdGFsUHRBbXQYECABKAFSCnRvdGFsUHRBbXQSJgoOc2VsbEZvcmVpZ25RdHkYESABKAFSDnNlbGxGb3JlaWduUXR5EiQKDWJ1eUZvcmVpZ25RdHkYEiABKAFSDWJ1eUZvcmVpZ25RdHkSIAoLY2hhbmdlUG9pbnQYEyABKAFSC2NoYW5nZVBvaW50EiQKDWNoYW5nZVBlcmNlbnQYFCABKAFSDWNoYW5nZVBlcmNlbnQSHAoJdG90YWxSb29tGBUgASgBUgl0b3RhbFJvb20SIAoLY3VycmVudFJvb20YFiABKAFSC2N1cnJlbnRSb29tEhgKB3c1MkhpZ2gYFyABKAFSB3c1MkhpZ2gSFgoGdzUyTG93GBggASgBUgZ3NTJMb3cSKgoQYmVzdDFCaWRQcmljZVN0chgZIAEoCVIQYmVzdDFCaWRQcmljZVN0chIkCg1iZXN0MUJpZFByaWNlGBogASgBUg1iZXN0MUJpZFByaWNlEiAKC2Jlc3QxQmlkUXR5GBsgASgBUgtiZXN0MUJpZFF0eRIkCg1iZXN0MkJpZFByaWNlGBwgASgBUg1iZXN0MkJpZFByaWNlEiAKC2Jlc3QyQmlkUXR5GB0gASgBUgtiZXN0MkJpZFF0eRIkCg1iZXN0M0JpZFByaWNlGB4gASgBUg1iZXN0M0JpZFByaWNlEiAKC2Jlc3QzQmlkUXR5GB8gASgBUgtiZXN0M0JpZFF0eRIgCgtiZXN0NEJpZFF0eRggIAEoAVILYmVzdDRCaWRRdHkSLgoSYmVzdDFPZmZlclByaWNlU3RyGCEgASgJUhJiZXN0MU9mZmVyUHJpY2VTdHISKAoPYmVzdDFPZmZlclByaWNlGCIgASgBUg9iZXN0MU9mZmVyUHJpY2USJAoNYmVzdDFPZmZlclF0eRgjIAEoAVINYmVzdDFPZmZlclF0eRIoCg9iZXN0Mk9mZmVyUHJpY2UYJCABKAFSD2Jlc3QyT2ZmZXJQcmljZRIkCg1iZXN0Mk9mZmVyUXR5GCUgASgBUg1iZXN0Mk9mZmVyUXR5EigKD2Jlc3QzT2ZmZXJQcmljZRgmIAEoAVIPYmVzdDNPZmZlclByaWNlEiQKDWJlc3QzT2ZmZXJRdHkYJyABKAFSDWJlc3QzT2ZmZXJRdHkSJAoNYmVzdDRPZmZlclF0eRgoIAEoAVINYmVzdDRPZmZlclF0eRIcCglsaXN0ZWRRdHkYKSABKAFSCWxpc3RlZFF0eRIaCgh0cmFkZVF0eRgqIAEoAVIIdHJhZGVRdHkSIgoMdHJhZGVQZXJjZW50GCsgASgBUgx0cmFkZVBlcmNlbnQSEAoDZXNwGCwgASgBUgNlc3ASDgoCcGUYLSABKAFSAnBlEg4KAnBiGC4gASgBUgJwYhIOCgJwcxgvIAEoAVICcHMSHAoJYm9va1ZhbHVlGDAgASgBUglib29rVmFsdWUSIAoLZGl2aWRlbmRBbXQYMSABKAFSC2RpdmlkZW5kQW10EiIKDGRpdmlkZW5kUmF0ZRgyIAEoAVIMZGl2aWRlbmRSYXRlEhwKCW9wZW5QcmljZRgzIAEoAVIJb3BlblByaWNlEh4KCmNsb3NlUHJpY2UYNCABKAFSCmNsb3NlUHJpY2USEAoDcm9lGDUgASgBUgNyb2USEAoDcm9hGDYgASgBUgNyb2ESIgoMdHVybm92ZXJSYXRlGDcgASgBUgx0dXJub3ZlclJhdGUSFAoFcmFuZ2UYOCABKAFSBXJhbmdlEhwKCXNlY05hbWVFbhg5IAEoCVIJc2VjTmFtZUVuEjgKCWJhc2VTZWNDZBg6IAEoCzIaLm1hcmtldF9hcGkuTnVsbGFibGVTdHJpbmdSCWJhc2VTZWNDZBIyCgZpc3N1ZXIYOyABKAsyGi5tYXJrZXRfYXBpLk51bGxhYmxlU3RyaW5nUgZpc3N1ZXISHAoJYmFzZVByaWNlGDwgASgBUgliYXNlUHJpY2USHAoJZXhlY1ByaWNlGD0gASgBUglleGVjUHJpY2USIAoLYmFzZVByaWNlQ3AYPiABKAFSC2Jhc2VQcmljZUNwEhgKB2JmUHJpY2UYPyABKAFSB2JmUHJpY2USGAoHYmJQcmljZRhAIAEoAVIHYmJQcmljZRIYCgdiY1ByaWNlGEEgASgBUgdiY1ByaWNlEiQKDWxhc3RUcmFkZURhdGUYQiABKAVSDWxhc3RUcmFkZURhdGUSSgoRYmFzZVNlY1ByaWNlQ29sb3IYQyABKA4yHC5tYXJrZXRfYXBpLlNUT0NLX0NPTE9SX0NPREVSEWJhc2VTZWNQcmljZUNvbG9yEiIKDGhhc1JpZ2h0RXhlYxhEIAEoBVIMaGFzUmlnaHRFeGVjEjgKCWV4ZWNSYXRpbxhFIAEoCzIaLm1hcmtldF9hcGkuTnVsbGFibGVTdHJpbmdSCWV4ZWNSYXRpbxIcCgltYXJrZXRDYXAYRiABKAFSCW1hcmtldENhcA==');
@$core.Deprecated('Use marketQuotesInputDescriptor instead')
const MarketQuotesInput$json = const {
  '1': 'MarketQuotesInput',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 9, '10': 'userID'},
    const {'1': 'indexCd', '3': 2, '4': 1, '5': 9, '10': 'indexCd'},
    const {'1': 'authenCode', '3': 3, '4': 1, '5': 9, '10': 'authenCode'},
  ],
};

/// Descriptor for `MarketQuotesInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketQuotesInputDescriptor = $convert.base64Decode('ChFNYXJrZXRRdW90ZXNJbnB1dBIWCgZ1c2VySUQYASABKAlSBnVzZXJJRBIYCgdpbmRleENkGAIgASgJUgdpbmRleENkEh4KCmF1dGhlbkNvZGUYAyABKAlSCmF1dGhlbkNvZGU=');
@$core.Deprecated('Use marketQuotesResponseDescriptor instead')
const MarketQuotesResponse$json = const {
  '1': 'MarketQuotesResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'marketQuotesInfo', '3': 4, '4': 1, '5': 11, '6': '.market_api.MarketQuotesResponse.MarketQuotesInfo', '10': 'marketQuotesInfo'},
  ],
  '3': const [MarketQuotesResponse_MarketQuotesInfo$json],
};

@$core.Deprecated('Use marketQuotesResponseDescriptor instead')
const MarketQuotesResponse_MarketQuotesInfo$json = const {
  '1': 'MarketQuotesInfo',
  '2': const [
    const {'1': 'indexCd', '3': 1, '4': 1, '5': 5, '10': 'indexCd'},
    const {'1': 'state', '3': 2, '4': 1, '5': 9, '10': 'state'},
    const {'1': 'totalTrade', '3': 3, '4': 1, '5': 1, '10': 'totalTrade'},
    const {'1': 'totalAmt', '3': 4, '4': 1, '5': 1, '10': 'totalAmt'},
    const {'1': 'totalQty', '3': 5, '4': 1, '5': 1, '10': 'totalQty'},
    const {'1': 'totalTradePt', '3': 6, '4': 1, '5': 1, '10': 'totalTradePt'},
    const {'1': 'totalAmtPt', '3': 7, '4': 1, '5': 1, '10': 'totalAmtPt'},
    const {'1': 'totalQtyPt', '3': 8, '4': 1, '5': 1, '10': 'totalQtyPt'},
    const {'1': 'marketIndex', '3': 9, '4': 1, '5': 1, '10': 'marketIndex'},
    const {'1': 'changeIndex', '3': 10, '4': 1, '5': 1, '10': 'changeIndex'},
    const {'1': 'changeIndexPercent', '3': 11, '4': 1, '5': 1, '10': 'changeIndexPercent'},
    const {'1': 'openIndex', '3': 12, '4': 1, '5': 1, '10': 'openIndex'},
    const {'1': 'highestIndex', '3': 13, '4': 1, '5': 1, '10': 'highestIndex'},
    const {'1': 'lowestIndex', '3': 14, '4': 1, '5': 1, '10': 'lowestIndex'},
    const {'1': 'advances', '3': 15, '4': 1, '5': 1, '10': 'advances'},
    const {'1': 'noChange', '3': 16, '4': 1, '5': 1, '10': 'noChange'},
    const {'1': 'declenes', '3': 17, '4': 1, '5': 1, '10': 'declenes'},
    const {'1': 'floor', '3': 18, '4': 1, '5': 1, '10': 'floor'},
    const {'1': 'ceiling', '3': 19, '4': 1, '5': 1, '10': 'ceiling'},
    const {'1': 'totalBuy', '3': 20, '4': 1, '5': 1, '10': 'totalBuy'},
    const {'1': 'totalSell', '3': 21, '4': 1, '5': 1, '10': 'totalSell'},
    const {'1': 'totalBuyForeignQty', '3': 22, '4': 1, '5': 1, '10': 'totalBuyForeignQty'},
    const {'1': 'totalSellForeignQty', '3': 23, '4': 1, '5': 1, '10': 'totalSellForeignQty'},
    const {'1': 'totalBuyForeignAmt', '3': 24, '4': 1, '5': 1, '10': 'totalBuyForeignAmt'},
    const {'1': 'totalSellForeignAmt', '3': 25, '4': 1, '5': 1, '10': 'totalSellForeignAmt'},
  ],
};

/// Descriptor for `MarketQuotesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketQuotesResponseDescriptor = $convert.base64Decode('ChRNYXJrZXRRdW90ZXNSZXNwb25zZRIWCgZzdGF0dXMYASABKAVSBnN0YXR1cxIUCgVlcnJvchgCIAEoCVIFZXJyb3ISGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZRJdChBtYXJrZXRRdW90ZXNJbmZvGAQgASgLMjEubWFya2V0X2FwaS5NYXJrZXRRdW90ZXNSZXNwb25zZS5NYXJrZXRRdW90ZXNJbmZvUhBtYXJrZXRRdW90ZXNJbmZvGtgGChBNYXJrZXRRdW90ZXNJbmZvEhgKB2luZGV4Q2QYASABKAVSB2luZGV4Q2QSFAoFc3RhdGUYAiABKAlSBXN0YXRlEh4KCnRvdGFsVHJhZGUYAyABKAFSCnRvdGFsVHJhZGUSGgoIdG90YWxBbXQYBCABKAFSCHRvdGFsQW10EhoKCHRvdGFsUXR5GAUgASgBUgh0b3RhbFF0eRIiCgx0b3RhbFRyYWRlUHQYBiABKAFSDHRvdGFsVHJhZGVQdBIeCgp0b3RhbEFtdFB0GAcgASgBUgp0b3RhbEFtdFB0Eh4KCnRvdGFsUXR5UHQYCCABKAFSCnRvdGFsUXR5UHQSIAoLbWFya2V0SW5kZXgYCSABKAFSC21hcmtldEluZGV4EiAKC2NoYW5nZUluZGV4GAogASgBUgtjaGFuZ2VJbmRleBIuChJjaGFuZ2VJbmRleFBlcmNlbnQYCyABKAFSEmNoYW5nZUluZGV4UGVyY2VudBIcCglvcGVuSW5kZXgYDCABKAFSCW9wZW5JbmRleBIiCgxoaWdoZXN0SW5kZXgYDSABKAFSDGhpZ2hlc3RJbmRleBIgCgtsb3dlc3RJbmRleBgOIAEoAVILbG93ZXN0SW5kZXgSGgoIYWR2YW5jZXMYDyABKAFSCGFkdmFuY2VzEhoKCG5vQ2hhbmdlGBAgASgBUghub0NoYW5nZRIaCghkZWNsZW5lcxgRIAEoAVIIZGVjbGVuZXMSFAoFZmxvb3IYEiABKAFSBWZsb29yEhgKB2NlaWxpbmcYEyABKAFSB2NlaWxpbmcSGgoIdG90YWxCdXkYFCABKAFSCHRvdGFsQnV5EhwKCXRvdGFsU2VsbBgVIAEoAVIJdG90YWxTZWxsEi4KEnRvdGFsQnV5Rm9yZWlnblF0eRgWIAEoAVISdG90YWxCdXlGb3JlaWduUXR5EjAKE3RvdGFsU2VsbEZvcmVpZ25RdHkYFyABKAFSE3RvdGFsU2VsbEZvcmVpZ25RdHkSLgoSdG90YWxCdXlGb3JlaWduQW10GBggASgBUhJ0b3RhbEJ1eUZvcmVpZ25BbXQSMAoTdG90YWxTZWxsRm9yZWlnbkFtdBgZIAEoAVITdG90YWxTZWxsRm9yZWlnbkFtdA==');
@$core.Deprecated('Use secDividendInfoDescriptor instead')
const SecDividendInfo$json = const {
  '1': 'SecDividendInfo',
  '2': const [
    const {'1': 'tradeDate', '3': 1, '4': 1, '5': 5, '10': 'tradeDate'},
    const {'1': 'secCd', '3': 2, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'time', '3': 3, '4': 1, '5': 3, '10': 'time'},
    const {'1': 'buyCount1', '3': 4, '4': 1, '5': 5, '10': 'buyCount1'},
    const {'1': 'buyAmt1', '3': 5, '4': 1, '5': 1, '10': 'buyAmt1'},
    const {'1': 'buyCount2', '3': 6, '4': 1, '5': 5, '10': 'buyCount2'},
    const {'1': 'buyAmt2', '3': 7, '4': 1, '5': 1, '10': 'buyAmt2'},
    const {'1': 'buyCount3', '3': 8, '4': 1, '5': 5, '10': 'buyCount3'},
    const {'1': 'buyAmt3', '3': 9, '4': 1, '5': 1, '10': 'buyAmt3'},
    const {'1': 'sellCount1', '3': 10, '4': 1, '5': 5, '10': 'sellCount1'},
    const {'1': 'sellAmt1', '3': 11, '4': 1, '5': 1, '10': 'sellAmt1'},
    const {'1': 'sellCount2', '3': 12, '4': 1, '5': 5, '10': 'sellCount2'},
    const {'1': 'sellAmt2', '3': 13, '4': 1, '5': 1, '10': 'sellAmt2'},
    const {'1': 'sellCount3', '3': 14, '4': 1, '5': 5, '10': 'sellCount3'},
    const {'1': 'sellAmt3', '3': 15, '4': 1, '5': 1, '10': 'sellAmt3'},
  ],
};

/// Descriptor for `SecDividendInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List secDividendInfoDescriptor = $convert.base64Decode('Cg9TZWNEaXZpZGVuZEluZm8SHAoJdHJhZGVEYXRlGAEgASgFUgl0cmFkZURhdGUSFAoFc2VjQ2QYAiABKAlSBXNlY0NkEhIKBHRpbWUYAyABKANSBHRpbWUSHAoJYnV5Q291bnQxGAQgASgFUglidXlDb3VudDESGAoHYnV5QW10MRgFIAEoAVIHYnV5QW10MRIcCglidXlDb3VudDIYBiABKAVSCWJ1eUNvdW50MhIYCgdidXlBbXQyGAcgASgBUgdidXlBbXQyEhwKCWJ1eUNvdW50MxgIIAEoBVIJYnV5Q291bnQzEhgKB2J1eUFtdDMYCSABKAFSB2J1eUFtdDMSHgoKc2VsbENvdW50MRgKIAEoBVIKc2VsbENvdW50MRIaCghzZWxsQW10MRgLIAEoAVIIc2VsbEFtdDESHgoKc2VsbENvdW50MhgMIAEoBVIKc2VsbENvdW50MhIaCghzZWxsQW10MhgNIAEoAVIIc2VsbEFtdDISHgoKc2VsbENvdW50MxgOIAEoBVIKc2VsbENvdW50MxIaCghzZWxsQW10MxgPIAEoAVIIc2VsbEFtdDM=');
@$core.Deprecated('Use secIntradayInputDescriptor instead')
const SecIntradayInput$json = const {
  '1': 'SecIntradayInput',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 9, '10': 'userID'},
    const {'1': 'secCd', '3': 2, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'offset', '3': 3, '4': 1, '5': 5, '10': 'offset'},
    const {'1': 'limit', '3': 4, '4': 1, '5': 5, '10': 'limit'},
    const {'1': 'authenCode', '3': 5, '4': 1, '5': 9, '10': 'authenCode'},
  ],
};

/// Descriptor for `SecIntradayInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List secIntradayInputDescriptor = $convert.base64Decode('ChBTZWNJbnRyYWRheUlucHV0EhYKBnVzZXJJRBgBIAEoCVIGdXNlcklEEhQKBXNlY0NkGAIgASgJUgVzZWNDZBIWCgZvZmZzZXQYAyABKAVSBm9mZnNldBIUCgVsaW1pdBgEIAEoBVIFbGltaXQSHgoKYXV0aGVuQ29kZRgFIAEoCVIKYXV0aGVuQ29kZQ==');
@$core.Deprecated('Use secIntradayResponseDescriptor instead')
const SecIntradayResponse$json = const {
  '1': 'SecIntradayResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'secIntradayInfo', '3': 4, '4': 3, '5': 11, '6': '.market_api.SecIntradayResponse.SecIntradayInfo', '10': 'secIntradayInfo'},
  ],
  '3': const [SecIntradayResponse_SecIntradayInfo$json],
};

@$core.Deprecated('Use secIntradayResponseDescriptor instead')
const SecIntradayResponse_SecIntradayInfo$json = const {
  '1': 'SecIntradayInfo',
  '2': const [
    const {'1': 'time', '3': 1, '4': 1, '5': 9, '10': 'time'},
    const {'1': 'price', '3': 2, '4': 1, '5': 1, '10': 'price'},
    const {'1': 'qty', '3': 3, '4': 1, '5': 1, '10': 'qty'},
    const {'1': 'colorCode', '3': 4, '4': 1, '5': 14, '6': '.market_api.STOCK_COLOR_CODE', '10': 'colorCode'},
    const {'1': 'side', '3': 5, '4': 1, '5': 11, '6': '.market_api.NullableString', '10': 'side'},
  ],
};

/// Descriptor for `SecIntradayResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List secIntradayResponseDescriptor = $convert.base64Decode('ChNTZWNJbnRyYWRheVJlc3BvbnNlEhYKBnN0YXR1cxgBIAEoBVIGc3RhdHVzEhQKBWVycm9yGAIgASgJUgVlcnJvchIYCgdtZXNzYWdlGAMgASgJUgdtZXNzYWdlElkKD3NlY0ludHJhZGF5SW5mbxgEIAMoCzIvLm1hcmtldF9hcGkuU2VjSW50cmFkYXlSZXNwb25zZS5TZWNJbnRyYWRheUluZm9SD3NlY0ludHJhZGF5SW5mbxq5AQoPU2VjSW50cmFkYXlJbmZvEhIKBHRpbWUYASABKAlSBHRpbWUSFAoFcHJpY2UYAiABKAFSBXByaWNlEhAKA3F0eRgDIAEoAVIDcXR5EjoKCWNvbG9yQ29kZRgEIAEoDjIcLm1hcmtldF9hcGkuU1RPQ0tfQ09MT1JfQ09ERVIJY29sb3JDb2RlEi4KBHNpZGUYBSABKAsyGi5tYXJrZXRfYXBpLk51bGxhYmxlU3RyaW5nUgRzaWRl');
@$core.Deprecated('Use screenerInputDescriptor instead')
const ScreenerInput$json = const {
  '1': 'ScreenerInput',
  '2': const [
    const {'1': 'marketCd', '3': 1, '4': 1, '5': 11, '6': '.market_api.NullableString', '10': 'marketCd'},
    const {'1': 'industries', '3': 2, '4': 1, '5': 11, '6': '.market_api.NullableString', '10': 'industries'},
    const {'1': 'quotesIndicators', '3': 3, '4': 1, '5': 11, '6': '.market_api.NullableString', '10': 'quotesIndicators'},
    const {'1': 'financialIndicators', '3': 4, '4': 1, '5': 11, '6': '.market_api.NullableString', '10': 'financialIndicators'},
    const {'1': 'technicalIndicators', '3': 5, '4': 1, '5': 11, '6': '.market_api.NullableString', '10': 'technicalIndicators'},
    const {'1': 'orderFieldType', '3': 6, '4': 1, '5': 5, '10': 'orderFieldType'},
    const {'1': 'orderType', '3': 7, '4': 1, '5': 5, '10': 'orderType'},
    const {'1': 'offset', '3': 8, '4': 1, '5': 5, '10': 'offset'},
    const {'1': 'limit', '3': 9, '4': 1, '5': 5, '10': 'limit'},
    const {'1': 'authenCode', '3': 10, '4': 1, '5': 9, '10': 'authenCode'},
  ],
};

/// Descriptor for `ScreenerInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List screenerInputDescriptor = $convert.base64Decode('Cg1TY3JlZW5lcklucHV0EjYKCG1hcmtldENkGAEgASgLMhoubWFya2V0X2FwaS5OdWxsYWJsZVN0cmluZ1IIbWFya2V0Q2QSOgoKaW5kdXN0cmllcxgCIAEoCzIaLm1hcmtldF9hcGkuTnVsbGFibGVTdHJpbmdSCmluZHVzdHJpZXMSRgoQcXVvdGVzSW5kaWNhdG9ycxgDIAEoCzIaLm1hcmtldF9hcGkuTnVsbGFibGVTdHJpbmdSEHF1b3Rlc0luZGljYXRvcnMSTAoTZmluYW5jaWFsSW5kaWNhdG9ycxgEIAEoCzIaLm1hcmtldF9hcGkuTnVsbGFibGVTdHJpbmdSE2ZpbmFuY2lhbEluZGljYXRvcnMSTAoTdGVjaG5pY2FsSW5kaWNhdG9ycxgFIAEoCzIaLm1hcmtldF9hcGkuTnVsbGFibGVTdHJpbmdSE3RlY2huaWNhbEluZGljYXRvcnMSJgoOb3JkZXJGaWVsZFR5cGUYBiABKAVSDm9yZGVyRmllbGRUeXBlEhwKCW9yZGVyVHlwZRgHIAEoBVIJb3JkZXJUeXBlEhYKBm9mZnNldBgIIAEoBVIGb2Zmc2V0EhQKBWxpbWl0GAkgASgFUgVsaW1pdBIeCgphdXRoZW5Db2RlGAogASgJUgphdXRoZW5Db2Rl');
@$core.Deprecated('Use screenerResponseDescriptor instead')
const ScreenerResponse$json = const {
  '1': 'ScreenerResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'totalRecords', '3': 4, '4': 1, '5': 5, '10': 'totalRecords'},
    const {'1': 'secDetailInfo', '3': 5, '4': 3, '5': 11, '6': '.market_api.ScreenerResponse.SecDetailInfo', '10': 'secDetailInfo'},
  ],
  '3': const [ScreenerResponse_SecDetailInfo$json],
};

@$core.Deprecated('Use screenerResponseDescriptor instead')
const ScreenerResponse_SecDetailInfo$json = const {
  '1': 'SecDetailInfo',
  '2': const [
    const {'1': 'marketCd', '3': 4, '4': 1, '5': 9, '10': 'marketCd'},
    const {'1': 'secCd', '3': 1, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'secName', '3': 2, '4': 1, '5': 9, '10': 'secName'},
    const {'1': 'secType', '3': 3, '4': 1, '5': 5, '10': 'secType'},
    const {'1': 'basicPrice', '3': 5, '4': 1, '5': 1, '10': 'basicPrice'},
    const {'1': 'ceilingPrice', '3': 6, '4': 1, '5': 1, '10': 'ceilingPrice'},
    const {'1': 'floorPrice', '3': 7, '4': 1, '5': 1, '10': 'floorPrice'},
    const {'1': 'highestPrice', '3': 8, '4': 1, '5': 1, '10': 'highestPrice'},
    const {'1': 'lowestPrice', '3': 9, '4': 1, '5': 1, '10': 'lowestPrice'},
    const {'1': 'avgPrice', '3': 10, '4': 1, '5': 1, '10': 'avgPrice'},
    const {'1': 'lastPrice', '3': 11, '4': 1, '5': 1, '10': 'lastPrice'},
    const {'1': 'lastQty', '3': 12, '4': 1, '5': 1, '10': 'lastQty'},
    const {'1': 'totalQty', '3': 13, '4': 1, '5': 1, '10': 'totalQty'},
    const {'1': 'totalAmt', '3': 14, '4': 1, '5': 1, '10': 'totalAmt'},
    const {'1': 'totalPtQty', '3': 15, '4': 1, '5': 1, '10': 'totalPtQty'},
    const {'1': 'totalPtAmt', '3': 16, '4': 1, '5': 1, '10': 'totalPtAmt'},
    const {'1': 'sellForeignQty', '3': 17, '4': 1, '5': 1, '10': 'sellForeignQty'},
    const {'1': 'buyForeignQty', '3': 18, '4': 1, '5': 1, '10': 'buyForeignQty'},
    const {'1': 'changePoint', '3': 19, '4': 1, '5': 1, '10': 'changePoint'},
    const {'1': 'changePercent', '3': 20, '4': 1, '5': 1, '10': 'changePercent'},
    const {'1': 'totalRoom', '3': 21, '4': 1, '5': 1, '10': 'totalRoom'},
    const {'1': 'currentRoom', '3': 22, '4': 1, '5': 1, '10': 'currentRoom'},
    const {'1': 'w52High', '3': 23, '4': 1, '5': 1, '10': 'w52High'},
    const {'1': 'w52Low', '3': 24, '4': 1, '5': 1, '10': 'w52Low'},
    const {'1': 'best1BidPriceStr', '3': 25, '4': 1, '5': 9, '10': 'best1BidPriceStr'},
    const {'1': 'best1BidPrice', '3': 26, '4': 1, '5': 1, '10': 'best1BidPrice'},
    const {'1': 'best1BidQty', '3': 27, '4': 1, '5': 1, '10': 'best1BidQty'},
    const {'1': 'best2BidPrice', '3': 28, '4': 1, '5': 1, '10': 'best2BidPrice'},
    const {'1': 'best2BidQty', '3': 29, '4': 1, '5': 1, '10': 'best2BidQty'},
    const {'1': 'best3BidPrice', '3': 30, '4': 1, '5': 1, '10': 'best3BidPrice'},
    const {'1': 'best3BidQty', '3': 31, '4': 1, '5': 1, '10': 'best3BidQty'},
    const {'1': 'best4BidQty', '3': 32, '4': 1, '5': 1, '10': 'best4BidQty'},
    const {'1': 'best1OfferPriceStr', '3': 33, '4': 1, '5': 9, '10': 'best1OfferPriceStr'},
    const {'1': 'best1OfferPrice', '3': 34, '4': 1, '5': 1, '10': 'best1OfferPrice'},
    const {'1': 'best1OfferQty', '3': 35, '4': 1, '5': 1, '10': 'best1OfferQty'},
    const {'1': 'best2OfferPrice', '3': 36, '4': 1, '5': 1, '10': 'best2OfferPrice'},
    const {'1': 'best2OfferQty', '3': 37, '4': 1, '5': 1, '10': 'best2OfferQty'},
    const {'1': 'best3OfferPrice', '3': 38, '4': 1, '5': 1, '10': 'best3OfferPrice'},
    const {'1': 'best3OfferQty', '3': 39, '4': 1, '5': 1, '10': 'best3OfferQty'},
    const {'1': 'best4OfferQty', '3': 40, '4': 1, '5': 1, '10': 'best4OfferQty'},
    const {'1': 'listedQty', '3': 41, '4': 1, '5': 1, '10': 'listedQty'},
    const {'1': 'tradeQty', '3': 42, '4': 1, '5': 1, '10': 'tradeQty'},
    const {'1': 'tradePercent', '3': 43, '4': 1, '5': 1, '10': 'tradePercent'},
    const {'1': 'esp', '3': 44, '4': 1, '5': 1, '10': 'esp'},
    const {'1': 'pe', '3': 45, '4': 1, '5': 1, '10': 'pe'},
    const {'1': 'pb', '3': 46, '4': 1, '5': 1, '10': 'pb'},
    const {'1': 'ps', '3': 47, '4': 1, '5': 1, '10': 'ps'},
    const {'1': 'bookValue', '3': 48, '4': 1, '5': 1, '10': 'bookValue'},
    const {'1': 'dividendAmt', '3': 49, '4': 1, '5': 1, '10': 'dividendAmt'},
    const {'1': 'dividendRate', '3': 50, '4': 1, '5': 1, '10': 'dividendRate'},
    const {'1': 'secNameEn', '3': 51, '4': 1, '5': 9, '10': 'secNameEn'},
    const {'1': 'marketCap', '3': 52, '4': 1, '5': 1, '10': 'marketCap'},
    const {'1': 'roa', '3': 53, '4': 1, '5': 1, '10': 'roa'},
    const {'1': 'roe', '3': 54, '4': 1, '5': 1, '10': 'roe'},
    const {'1': 'netSale', '3': 55, '4': 1, '5': 1, '10': 'netSale'},
    const {'1': 'colorCode', '3': 56, '4': 1, '5': 14, '6': '.market_api.STOCK_COLOR_CODE', '10': 'colorCode'},
  ],
};

/// Descriptor for `ScreenerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List screenerResponseDescriptor = $convert.base64Decode('ChBTY3JlZW5lclJlc3BvbnNlEhYKBnN0YXR1cxgBIAEoBVIGc3RhdHVzEhQKBWVycm9yGAIgASgJUgVlcnJvchIYCgdtZXNzYWdlGAMgASgJUgdtZXNzYWdlEiIKDHRvdGFsUmVjb3JkcxgEIAEoBVIMdG90YWxSZWNvcmRzElAKDXNlY0RldGFpbEluZm8YBSADKAsyKi5tYXJrZXRfYXBpLlNjcmVlbmVyUmVzcG9uc2UuU2VjRGV0YWlsSW5mb1INc2VjRGV0YWlsSW5mbxqZDgoNU2VjRGV0YWlsSW5mbxIaCghtYXJrZXRDZBgEIAEoCVIIbWFya2V0Q2QSFAoFc2VjQ2QYASABKAlSBXNlY0NkEhgKB3NlY05hbWUYAiABKAlSB3NlY05hbWUSGAoHc2VjVHlwZRgDIAEoBVIHc2VjVHlwZRIeCgpiYXNpY1ByaWNlGAUgASgBUgpiYXNpY1ByaWNlEiIKDGNlaWxpbmdQcmljZRgGIAEoAVIMY2VpbGluZ1ByaWNlEh4KCmZsb29yUHJpY2UYByABKAFSCmZsb29yUHJpY2USIgoMaGlnaGVzdFByaWNlGAggASgBUgxoaWdoZXN0UHJpY2USIAoLbG93ZXN0UHJpY2UYCSABKAFSC2xvd2VzdFByaWNlEhoKCGF2Z1ByaWNlGAogASgBUghhdmdQcmljZRIcCglsYXN0UHJpY2UYCyABKAFSCWxhc3RQcmljZRIYCgdsYXN0UXR5GAwgASgBUgdsYXN0UXR5EhoKCHRvdGFsUXR5GA0gASgBUgh0b3RhbFF0eRIaCgh0b3RhbEFtdBgOIAEoAVIIdG90YWxBbXQSHgoKdG90YWxQdFF0eRgPIAEoAVIKdG90YWxQdFF0eRIeCgp0b3RhbFB0QW10GBAgASgBUgp0b3RhbFB0QW10EiYKDnNlbGxGb3JlaWduUXR5GBEgASgBUg5zZWxsRm9yZWlnblF0eRIkCg1idXlGb3JlaWduUXR5GBIgASgBUg1idXlGb3JlaWduUXR5EiAKC2NoYW5nZVBvaW50GBMgASgBUgtjaGFuZ2VQb2ludBIkCg1jaGFuZ2VQZXJjZW50GBQgASgBUg1jaGFuZ2VQZXJjZW50EhwKCXRvdGFsUm9vbRgVIAEoAVIJdG90YWxSb29tEiAKC2N1cnJlbnRSb29tGBYgASgBUgtjdXJyZW50Um9vbRIYCgd3NTJIaWdoGBcgASgBUgd3NTJIaWdoEhYKBnc1MkxvdxgYIAEoAVIGdzUyTG93EioKEGJlc3QxQmlkUHJpY2VTdHIYGSABKAlSEGJlc3QxQmlkUHJpY2VTdHISJAoNYmVzdDFCaWRQcmljZRgaIAEoAVINYmVzdDFCaWRQcmljZRIgCgtiZXN0MUJpZFF0eRgbIAEoAVILYmVzdDFCaWRRdHkSJAoNYmVzdDJCaWRQcmljZRgcIAEoAVINYmVzdDJCaWRQcmljZRIgCgtiZXN0MkJpZFF0eRgdIAEoAVILYmVzdDJCaWRRdHkSJAoNYmVzdDNCaWRQcmljZRgeIAEoAVINYmVzdDNCaWRQcmljZRIgCgtiZXN0M0JpZFF0eRgfIAEoAVILYmVzdDNCaWRRdHkSIAoLYmVzdDRCaWRRdHkYICABKAFSC2Jlc3Q0QmlkUXR5Ei4KEmJlc3QxT2ZmZXJQcmljZVN0chghIAEoCVISYmVzdDFPZmZlclByaWNlU3RyEigKD2Jlc3QxT2ZmZXJQcmljZRgiIAEoAVIPYmVzdDFPZmZlclByaWNlEiQKDWJlc3QxT2ZmZXJRdHkYIyABKAFSDWJlc3QxT2ZmZXJRdHkSKAoPYmVzdDJPZmZlclByaWNlGCQgASgBUg9iZXN0Mk9mZmVyUHJpY2USJAoNYmVzdDJPZmZlclF0eRglIAEoAVINYmVzdDJPZmZlclF0eRIoCg9iZXN0M09mZmVyUHJpY2UYJiABKAFSD2Jlc3QzT2ZmZXJQcmljZRIkCg1iZXN0M09mZmVyUXR5GCcgASgBUg1iZXN0M09mZmVyUXR5EiQKDWJlc3Q0T2ZmZXJRdHkYKCABKAFSDWJlc3Q0T2ZmZXJRdHkSHAoJbGlzdGVkUXR5GCkgASgBUglsaXN0ZWRRdHkSGgoIdHJhZGVRdHkYKiABKAFSCHRyYWRlUXR5EiIKDHRyYWRlUGVyY2VudBgrIAEoAVIMdHJhZGVQZXJjZW50EhAKA2VzcBgsIAEoAVIDZXNwEg4KAnBlGC0gASgBUgJwZRIOCgJwYhguIAEoAVICcGISDgoCcHMYLyABKAFSAnBzEhwKCWJvb2tWYWx1ZRgwIAEoAVIJYm9va1ZhbHVlEiAKC2RpdmlkZW5kQW10GDEgASgBUgtkaXZpZGVuZEFtdBIiCgxkaXZpZGVuZFJhdGUYMiABKAFSDGRpdmlkZW5kUmF0ZRIcCglzZWNOYW1lRW4YMyABKAlSCXNlY05hbWVFbhIcCgltYXJrZXRDYXAYNCABKAFSCW1hcmtldENhcBIQCgNyb2EYNSABKAFSA3JvYRIQCgNyb2UYNiABKAFSA3JvZRIYCgduZXRTYWxlGDcgASgBUgduZXRTYWxlEjoKCWNvbG9yQ29kZRg4IAEoDjIcLm1hcmtldF9hcGkuU1RPQ0tfQ09MT1JfQ09ERVIJY29sb3JDb2Rl');
@$core.Deprecated('Use topMarketCapInputDescriptor instead')
const TopMarketCapInput$json = const {
  '1': 'TopMarketCapInput',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 9, '10': 'userID'},
    const {'1': 'marketCd', '3': 2, '4': 1, '5': 9, '10': 'marketCd'},
    const {'1': 'offset', '3': 3, '4': 1, '5': 5, '10': 'offset'},
    const {'1': 'limit', '3': 4, '4': 1, '5': 5, '10': 'limit'},
    const {'1': 'authenCode', '3': 5, '4': 1, '5': 9, '10': 'authenCode'},
  ],
};

/// Descriptor for `TopMarketCapInput`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topMarketCapInputDescriptor = $convert.base64Decode('ChFUb3BNYXJrZXRDYXBJbnB1dBIWCgZ1c2VySUQYASABKAlSBnVzZXJJRBIaCghtYXJrZXRDZBgCIAEoCVIIbWFya2V0Q2QSFgoGb2Zmc2V0GAMgASgFUgZvZmZzZXQSFAoFbGltaXQYBCABKAVSBWxpbWl0Eh4KCmF1dGhlbkNvZGUYBSABKAlSCmF1dGhlbkNvZGU=');
@$core.Deprecated('Use topMarketCapResponseDescriptor instead')
const TopMarketCapResponse$json = const {
  '1': 'TopMarketCapResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 5, '10': 'status'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'topMarketCapInfo', '3': 4, '4': 3, '5': 11, '6': '.market_api.TopMarketCapResponse.TopMarketCapInfo', '10': 'topMarketCapInfo'},
  ],
  '3': const [TopMarketCapResponse_TopMarketCapInfo$json],
};

@$core.Deprecated('Use topMarketCapResponseDescriptor instead')
const TopMarketCapResponse_TopMarketCapInfo$json = const {
  '1': 'TopMarketCapInfo',
  '2': const [
    const {'1': 'secCd', '3': 1, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'changePoint', '3': 2, '4': 1, '5': 1, '10': 'changePoint'},
    const {'1': 'changePercent', '3': 3, '4': 1, '5': 1, '10': 'changePercent'},
    const {'1': 'marketCap', '3': 4, '4': 1, '5': 1, '10': 'marketCap'},
    const {'1': 'colorCode', '3': 5, '4': 1, '5': 14, '6': '.market_api.STOCK_COLOR_CODE', '10': 'colorCode'},
  ],
};

/// Descriptor for `TopMarketCapResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topMarketCapResponseDescriptor = $convert.base64Decode('ChRUb3BNYXJrZXRDYXBSZXNwb25zZRIWCgZzdGF0dXMYASABKAVSBnN0YXR1cxIUCgVlcnJvchgCIAEoCVIFZXJyb3ISGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZRJdChB0b3BNYXJrZXRDYXBJbmZvGAQgAygLMjEubWFya2V0X2FwaS5Ub3BNYXJrZXRDYXBSZXNwb25zZS5Ub3BNYXJrZXRDYXBJbmZvUhB0b3BNYXJrZXRDYXBJbmZvGsoBChBUb3BNYXJrZXRDYXBJbmZvEhQKBXNlY0NkGAEgASgJUgVzZWNDZBIgCgtjaGFuZ2VQb2ludBgCIAEoAVILY2hhbmdlUG9pbnQSJAoNY2hhbmdlUGVyY2VudBgDIAEoAVINY2hhbmdlUGVyY2VudBIcCgltYXJrZXRDYXAYBCABKAFSCW1hcmtldENhcBI6Cgljb2xvckNvZGUYBSABKA4yHC5tYXJrZXRfYXBpLlNUT0NLX0NPTE9SX0NPREVSCWNvbG9yQ29kZQ==');
@$core.Deprecated('Use systemStateDescriptor instead')
const SystemState$json = const {
  '1': 'SystemState',
  '2': const [
    const {'1': 'tradeDate', '3': 1, '4': 1, '5': 5, '10': 'tradeDate'},
    const {'1': 'status', '3': 2, '4': 1, '5': 14, '6': '.market_api.SystemState.StatusCode', '10': 'status'},
  ],
  '4': const [SystemState_StatusCode$json],
};

@$core.Deprecated('Use systemStateDescriptor instead')
const SystemState_StatusCode$json = const {
  '1': 'StatusCode',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'BOD', '2': 1},
    const {'1': 'AVAILABLE', '2': 2},
    const {'1': 'EOD', '2': 3},
    const {'1': 'ATO', '2': 4},
    const {'1': 'OPEN', '2': 5},
    const {'1': 'ATC', '2': 6},
    const {'1': 'CLOSE', '2': 7},
  ],
};

/// Descriptor for `SystemState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List systemStateDescriptor = $convert.base64Decode('CgtTeXN0ZW1TdGF0ZRIcCgl0cmFkZURhdGUYASABKAVSCXRyYWRlRGF0ZRI6CgZzdGF0dXMYAiABKA4yIi5tYXJrZXRfYXBpLlN5c3RlbVN0YXRlLlN0YXR1c0NvZGVSBnN0YXR1cyJeCgpTdGF0dXNDb2RlEggKBE5PTkUQABIHCgNCT0QQARINCglBVkFJTEFCTEUQAhIHCgNFT0QQAxIHCgNBVE8QBBIICgRPUEVOEAUSBwoDQVRDEAYSCQoFQ0xPU0UQBw==');
@$core.Deprecated('Use indexUpdateDescriptor instead')
const IndexUpdate$json = const {
  '1': 'IndexUpdate',
  '2': const [
    const {'1': 'indexCd', '3': 1, '4': 1, '5': 5, '10': 'indexCd'},
    const {'1': 'index', '3': 2, '4': 1, '5': 1, '10': 'index'},
    const {'1': 'changeIndex', '3': 3, '4': 1, '5': 1, '10': 'changeIndex'},
    const {'1': 'totalTrade', '3': 4, '4': 1, '5': 5, '10': 'totalTrade'},
    const {'1': 'totalQty', '3': 5, '4': 1, '5': 1, '10': 'totalQty'},
    const {'1': 'totalAmt', '3': 6, '4': 1, '5': 1, '10': 'totalAmt'},
    const {'1': 'openIndex', '3': 7, '4': 1, '5': 1, '10': 'openIndex'},
    const {'1': 'highIndex', '3': 8, '4': 1, '5': 1, '10': 'highIndex'},
    const {'1': 'lowIndex', '3': 9, '4': 1, '5': 1, '10': 'lowIndex'},
    const {'1': 'advances', '3': 10, '4': 1, '5': 5, '10': 'advances'},
    const {'1': 'noChange', '3': 11, '4': 1, '5': 5, '10': 'noChange'},
    const {'1': 'declenes', '3': 12, '4': 1, '5': 5, '10': 'declenes'},
    const {'1': 'ceiling', '3': 13, '4': 1, '5': 5, '10': 'ceiling'},
    const {'1': 'floor', '3': 14, '4': 1, '5': 5, '10': 'floor'},
    const {'1': 'state', '3': 15, '4': 1, '5': 14, '6': '.market_api.INDEX_STATE', '10': 'state'},
    const {'1': 'colorCode', '3': 16, '4': 1, '5': 14, '6': '.market_api.INDEX_COLOR_CODE', '10': 'colorCode'},
    const {'1': 'changePercent', '3': 17, '4': 1, '5': 1, '10': 'changePercent'},
    const {'1': 'updTime', '3': 18, '4': 1, '5': 3, '10': 'updTime'},
  ],
};

/// Descriptor for `IndexUpdate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List indexUpdateDescriptor = $convert.base64Decode('CgtJbmRleFVwZGF0ZRIYCgdpbmRleENkGAEgASgFUgdpbmRleENkEhQKBWluZGV4GAIgASgBUgVpbmRleBIgCgtjaGFuZ2VJbmRleBgDIAEoAVILY2hhbmdlSW5kZXgSHgoKdG90YWxUcmFkZRgEIAEoBVIKdG90YWxUcmFkZRIaCgh0b3RhbFF0eRgFIAEoAVIIdG90YWxRdHkSGgoIdG90YWxBbXQYBiABKAFSCHRvdGFsQW10EhwKCW9wZW5JbmRleBgHIAEoAVIJb3BlbkluZGV4EhwKCWhpZ2hJbmRleBgIIAEoAVIJaGlnaEluZGV4EhoKCGxvd0luZGV4GAkgASgBUghsb3dJbmRleBIaCghhZHZhbmNlcxgKIAEoBVIIYWR2YW5jZXMSGgoIbm9DaGFuZ2UYCyABKAVSCG5vQ2hhbmdlEhoKCGRlY2xlbmVzGAwgASgFUghkZWNsZW5lcxIYCgdjZWlsaW5nGA0gASgFUgdjZWlsaW5nEhQKBWZsb29yGA4gASgFUgVmbG9vchItCgVzdGF0ZRgPIAEoDjIXLm1hcmtldF9hcGkuSU5ERVhfU1RBVEVSBXN0YXRlEjoKCWNvbG9yQ29kZRgQIAEoDjIcLm1hcmtldF9hcGkuSU5ERVhfQ09MT1JfQ09ERVIJY29sb3JDb2RlEiQKDWNoYW5nZVBlcmNlbnQYESABKAFSDWNoYW5nZVBlcmNlbnQSGAoHdXBkVGltZRgSIAEoA1IHdXBkVGltZQ==');
@$core.Deprecated('Use topPriceDescriptor instead')
const TopPrice$json = const {
  '1': 'TopPrice',
  '2': const [
    const {'1': 'secCd', '3': 1, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'totalBidQty', '3': 2, '4': 1, '5': 1, '10': 'totalBidQty'},
    const {'1': 'totalOfferQty', '3': 3, '4': 1, '5': 1, '10': 'totalOfferQty'},
    const {'1': 'topPriceBid', '3': 4, '4': 3, '5': 11, '6': '.market_api.TopPrice.TopPriceDetail', '10': 'topPriceBid'},
    const {'1': 'topPriceOffer', '3': 5, '4': 3, '5': 11, '6': '.market_api.TopPrice.TopPriceDetail', '10': 'topPriceOffer'},
  ],
  '3': const [TopPrice_TopPriceDetail$json],
};

@$core.Deprecated('Use topPriceDescriptor instead')
const TopPrice_TopPriceDetail$json = const {
  '1': 'TopPriceDetail',
  '2': const [
    const {'1': 'top', '3': 1, '4': 1, '5': 5, '10': 'top'},
    const {'1': 'price', '3': 2, '4': 1, '5': 9, '10': 'price'},
    const {'1': 'qty', '3': 3, '4': 1, '5': 1, '10': 'qty'},
  ],
};

/// Descriptor for `TopPrice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topPriceDescriptor = $convert.base64Decode('CghUb3BQcmljZRIUCgVzZWNDZBgBIAEoCVIFc2VjQ2QSIAoLdG90YWxCaWRRdHkYAiABKAFSC3RvdGFsQmlkUXR5EiQKDXRvdGFsT2ZmZXJRdHkYAyABKAFSDXRvdGFsT2ZmZXJRdHkSRQoLdG9wUHJpY2VCaWQYBCADKAsyIy5tYXJrZXRfYXBpLlRvcFByaWNlLlRvcFByaWNlRGV0YWlsUgt0b3BQcmljZUJpZBJJCg10b3BQcmljZU9mZmVyGAUgAygLMiMubWFya2V0X2FwaS5Ub3BQcmljZS5Ub3BQcmljZURldGFpbFINdG9wUHJpY2VPZmZlchpKCg5Ub3BQcmljZURldGFpbBIQCgN0b3AYASABKAVSA3RvcBIUCgVwcmljZRgCIAEoCVIFcHJpY2USEAoDcXR5GAMgASgBUgNxdHk=');
@$core.Deprecated('Use lastSaleDescriptor instead')
const LastSale$json = const {
  '1': 'LastSale',
  '2': const [
    const {'1': 'marketCd', '3': 1, '4': 1, '5': 9, '10': 'marketCd'},
    const {'1': 'secCd', '3': 2, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'changePoint', '3': 3, '4': 1, '5': 1, '10': 'changePoint'},
    const {'1': 'changePercent', '3': 4, '4': 1, '5': 1, '10': 'changePercent'},
    const {'1': 'lastPrice', '3': 5, '4': 1, '5': 1, '10': 'lastPrice'},
    const {'1': 'lastQty', '3': 6, '4': 1, '5': 1, '10': 'lastQty'},
    const {'1': 'lastAmt', '3': 7, '4': 1, '5': 1, '10': 'lastAmt'},
    const {'1': 'totalQty', '3': 8, '4': 1, '5': 1, '10': 'totalQty'},
    const {'1': 'totalAmt', '3': 9, '4': 1, '5': 1, '10': 'totalAmt'},
    const {'1': 'hightPrice', '3': 10, '4': 1, '5': 1, '10': 'hightPrice'},
    const {'1': 'lowPrice', '3': 11, '4': 1, '5': 1, '10': 'lowPrice'},
    const {'1': 'avgPrice', '3': 12, '4': 1, '5': 1, '10': 'avgPrice'},
    const {'1': 'side', '3': 13, '4': 1, '5': 11, '6': '.market_api.NullableString', '10': 'side'},
    const {'1': 'colorCode', '3': 14, '4': 1, '5': 14, '6': '.market_api.STOCK_COLOR_CODE', '10': 'colorCode'},
    const {'1': 'matTime', '3': 15, '4': 1, '5': 5, '10': 'matTime'},
  ],
};

/// Descriptor for `LastSale`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lastSaleDescriptor = $convert.base64Decode('CghMYXN0U2FsZRIaCghtYXJrZXRDZBgBIAEoCVIIbWFya2V0Q2QSFAoFc2VjQ2QYAiABKAlSBXNlY0NkEiAKC2NoYW5nZVBvaW50GAMgASgBUgtjaGFuZ2VQb2ludBIkCg1jaGFuZ2VQZXJjZW50GAQgASgBUg1jaGFuZ2VQZXJjZW50EhwKCWxhc3RQcmljZRgFIAEoAVIJbGFzdFByaWNlEhgKB2xhc3RRdHkYBiABKAFSB2xhc3RRdHkSGAoHbGFzdEFtdBgHIAEoAVIHbGFzdEFtdBIaCgh0b3RhbFF0eRgIIAEoAVIIdG90YWxRdHkSGgoIdG90YWxBbXQYCSABKAFSCHRvdGFsQW10Eh4KCmhpZ2h0UHJpY2UYCiABKAFSCmhpZ2h0UHJpY2USGgoIbG93UHJpY2UYCyABKAFSCGxvd1ByaWNlEhoKCGF2Z1ByaWNlGAwgASgBUghhdmdQcmljZRIuCgRzaWRlGA0gASgLMhoubWFya2V0X2FwaS5OdWxsYWJsZVN0cmluZ1IEc2lkZRI6Cgljb2xvckNvZGUYDiABKA4yHC5tYXJrZXRfYXBpLlNUT0NLX0NPTE9SX0NPREVSCWNvbG9yQ29kZRIYCgdtYXRUaW1lGA8gASgFUgdtYXRUaW1l');
@$core.Deprecated('Use foreignRoomDescriptor instead')
const ForeignRoom$json = const {
  '1': 'ForeignRoom',
  '2': const [
    const {'1': 'secCd', '3': 1, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'totalRoom', '3': 2, '4': 1, '5': 1, '10': 'totalRoom'},
    const {'1': 'currentRoom', '3': 3, '4': 1, '5': 1, '10': 'currentRoom'},
    const {'1': 'buyForeignQty', '3': 4, '4': 1, '5': 1, '10': 'buyForeignQty'},
    const {'1': 'buyForeignAmt', '3': 5, '4': 1, '5': 1, '10': 'buyForeignAmt'},
    const {'1': 'sellForeignQty', '3': 6, '4': 1, '5': 1, '10': 'sellForeignQty'},
    const {'1': 'sellForeignAmt', '3': 7, '4': 1, '5': 1, '10': 'sellForeignAmt'},
  ],
};

/// Descriptor for `ForeignRoom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List foreignRoomDescriptor = $convert.base64Decode('CgtGb3JlaWduUm9vbRIUCgVzZWNDZBgBIAEoCVIFc2VjQ2QSHAoJdG90YWxSb29tGAIgASgBUgl0b3RhbFJvb20SIAoLY3VycmVudFJvb20YAyABKAFSC2N1cnJlbnRSb29tEiQKDWJ1eUZvcmVpZ25RdHkYBCABKAFSDWJ1eUZvcmVpZ25RdHkSJAoNYnV5Rm9yZWlnbkFtdBgFIAEoAVINYnV5Rm9yZWlnbkFtdBImCg5zZWxsRm9yZWlnblF0eRgGIAEoAVIOc2VsbEZvcmVpZ25RdHkSJgoOc2VsbEZvcmVpZ25BbXQYByABKAFSDnNlbGxGb3JlaWduQW10');
@$core.Deprecated('Use nullableStringDescriptor instead')
const NullableString$json = const {
  '1': 'NullableString',
  '2': const [
    const {'1': 'null', '3': 1, '4': 1, '5': 14, '6': '.google.protobuf.NullValue', '9': 0, '10': 'null'},
    const {'1': 'data', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'data'},
  ],
  '8': const [
    const {'1': 'kind'},
  ],
};

/// Descriptor for `NullableString`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nullableStringDescriptor = $convert.base64Decode('Cg5OdWxsYWJsZVN0cmluZxIwCgRudWxsGAEgASgOMhouZ29vZ2xlLnByb3RvYnVmLk51bGxWYWx1ZUgAUgRudWxsEhQKBGRhdGEYAiABKAlIAFIEZGF0YUIGCgRraW5k');
@$core.Deprecated('Use nullableInt32Descriptor instead')
const NullableInt32$json = const {
  '1': 'NullableInt32',
  '2': const [
    const {'1': 'null', '3': 1, '4': 1, '5': 14, '6': '.google.protobuf.NullValue', '9': 0, '10': 'null'},
    const {'1': 'data', '3': 2, '4': 1, '5': 5, '9': 0, '10': 'data'},
  ],
  '8': const [
    const {'1': 'kind'},
  ],
};

/// Descriptor for `NullableInt32`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nullableInt32Descriptor = $convert.base64Decode('Cg1OdWxsYWJsZUludDMyEjAKBG51bGwYASABKA4yGi5nb29nbGUucHJvdG9idWYuTnVsbFZhbHVlSABSBG51bGwSFAoEZGF0YRgCIAEoBUgAUgRkYXRhQgYKBGtpbmQ=');
@$core.Deprecated('Use nullableInt64Descriptor instead')
const NullableInt64$json = const {
  '1': 'NullableInt64',
  '2': const [
    const {'1': 'null', '3': 1, '4': 1, '5': 14, '6': '.google.protobuf.NullValue', '9': 0, '10': 'null'},
    const {'1': 'data', '3': 2, '4': 1, '5': 3, '9': 0, '10': 'data'},
  ],
  '8': const [
    const {'1': 'kind'},
  ],
};

/// Descriptor for `NullableInt64`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nullableInt64Descriptor = $convert.base64Decode('Cg1OdWxsYWJsZUludDY0EjAKBG51bGwYASABKA4yGi5nb29nbGUucHJvdG9idWYuTnVsbFZhbHVlSABSBG51bGwSFAoEZGF0YRgCIAEoA0gAUgRkYXRhQgYKBGtpbmQ=');
@$core.Deprecated('Use nullableDoubleDescriptor instead')
const NullableDouble$json = const {
  '1': 'NullableDouble',
  '2': const [
    const {'1': 'null', '3': 1, '4': 1, '5': 14, '6': '.google.protobuf.NullValue', '9': 0, '10': 'null'},
    const {'1': 'data', '3': 2, '4': 1, '5': 1, '9': 0, '10': 'data'},
  ],
  '8': const [
    const {'1': 'kind'},
  ],
};

/// Descriptor for `NullableDouble`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nullableDoubleDescriptor = $convert.base64Decode('Cg5OdWxsYWJsZURvdWJsZRIwCgRudWxsGAEgASgOMhouZ29vZ2xlLnByb3RvYnVmLk51bGxWYWx1ZUgAUgRudWxsEhQKBGRhdGEYAiABKAFIAFIEZGF0YUIGCgRraW5k');
@$core.Deprecated('Use marketInitDataParamDescriptor instead')
const MarketInitDataParam$json = const {
  '1': 'MarketInitDataParam',
  '2': const [
    const {'1': 'channel', '3': 1, '4': 1, '5': 5, '10': 'channel'},
    const {'1': 'authenCode', '3': 2, '4': 1, '5': 9, '10': 'authenCode'},
  ],
};

/// Descriptor for `MarketInitDataParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketInitDataParamDescriptor = $convert.base64Decode('ChNNYXJrZXRJbml0RGF0YVBhcmFtEhgKB2NoYW5uZWwYASABKAVSB2NoYW5uZWwSHgoKYXV0aGVuQ29kZRgCIAEoCVIKYXV0aGVuQ29kZQ==');
@$core.Deprecated('Use marketInitDataResponseDescriptor instead')
const MarketInitDataResponse$json = const {
  '1': 'MarketInitDataResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 5, '10': 'result'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'items', '3': 4, '4': 1, '5': 11, '6': '.market_api.MarketInitDataItem', '10': 'items'},
  ],
};

/// Descriptor for `MarketInitDataResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketInitDataResponseDescriptor = $convert.base64Decode('ChZNYXJrZXRJbml0RGF0YVJlc3BvbnNlEhYKBnJlc3VsdBgBIAEoBVIGcmVzdWx0EhQKBWVycm9yGAIgASgJUgVlcnJvchIYCgdtZXNzYWdlGAMgASgJUgdtZXNzYWdlEjQKBWl0ZW1zGAQgASgLMh4ubWFya2V0X2FwaS5NYXJrZXRJbml0RGF0YUl0ZW1SBWl0ZW1z');
@$core.Deprecated('Use marketInitDataItemDescriptor instead')
const MarketInitDataItem$json = const {
  '1': 'MarketInitDataItem',
  '2': const [
    const {'1': 'basketInfoList', '3': 1, '4': 1, '5': 11, '6': '.market_api.MrktBasketInfoList', '10': 'basketInfoList'},
    const {'1': 'mrktindustriesList', '3': 2, '4': 1, '5': 11, '6': '.market_api.MrktindustriesList', '10': 'mrktindustriesList'},
  ],
};

/// Descriptor for `MarketInitDataItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketInitDataItemDescriptor = $convert.base64Decode('ChJNYXJrZXRJbml0RGF0YUl0ZW0SRgoOYmFza2V0SW5mb0xpc3QYASABKAsyHi5tYXJrZXRfYXBpLk1ya3RCYXNrZXRJbmZvTGlzdFIOYmFza2V0SW5mb0xpc3QSTgoSbXJrdGluZHVzdHJpZXNMaXN0GAIgASgLMh4ubWFya2V0X2FwaS5Ncmt0aW5kdXN0cmllc0xpc3RSEm1ya3RpbmR1c3RyaWVzTGlzdA==');
@$core.Deprecated('Use mrktBasketInfoListDescriptor instead')
const MrktBasketInfoList$json = const {
  '1': 'MrktBasketInfoList',
  '2': const [
    const {'1': 'itemBasketInfo', '3': 1, '4': 3, '5': 11, '6': '.market_api.MrktBasketInfoItem', '10': 'itemBasketInfo'},
  ],
};

/// Descriptor for `MrktBasketInfoList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mrktBasketInfoListDescriptor = $convert.base64Decode('ChJNcmt0QmFza2V0SW5mb0xpc3QSRgoOaXRlbUJhc2tldEluZm8YASADKAsyHi5tYXJrZXRfYXBpLk1ya3RCYXNrZXRJbmZvSXRlbVIOaXRlbUJhc2tldEluZm8=');
@$core.Deprecated('Use mrktindustriesListDescriptor instead')
const MrktindustriesList$json = const {
  '1': 'MrktindustriesList',
  '2': const [
    const {'1': 'itemMrktindustries', '3': 1, '4': 3, '5': 11, '6': '.market_api.MrktindustriesItem', '10': 'itemMrktindustries'},
  ],
};

/// Descriptor for `MrktindustriesList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mrktindustriesListDescriptor = $convert.base64Decode('ChJNcmt0aW5kdXN0cmllc0xpc3QSTgoSaXRlbU1ya3RpbmR1c3RyaWVzGAEgAygLMh4ubWFya2V0X2FwaS5Ncmt0aW5kdXN0cmllc0l0ZW1SEml0ZW1Ncmt0aW5kdXN0cmllcw==');
@$core.Deprecated('Use mrktBasketInfoItemDescriptor instead')
const MrktBasketInfoItem$json = const {
  '1': 'MrktBasketInfoItem',
  '2': const [
    const {'1': 'indexCd', '3': 1, '4': 1, '5': 5, '10': 'indexCd'},
    const {'1': 'indexName', '3': 2, '4': 1, '5': 9, '10': 'indexName'},
    const {'1': 'secCdList', '3': 3, '4': 1, '5': 9, '10': 'secCdList'},
  ],
};

/// Descriptor for `MrktBasketInfoItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mrktBasketInfoItemDescriptor = $convert.base64Decode('ChJNcmt0QmFza2V0SW5mb0l0ZW0SGAoHaW5kZXhDZBgBIAEoBVIHaW5kZXhDZBIcCglpbmRleE5hbWUYAiABKAlSCWluZGV4TmFtZRIcCglzZWNDZExpc3QYAyABKAlSCXNlY0NkTGlzdA==');
@$core.Deprecated('Use mrktindustriesItemDescriptor instead')
const MrktindustriesItem$json = const {
  '1': 'MrktindustriesItem',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'nameVn', '3': 3, '4': 1, '5': 9, '10': 'nameVn'},
    const {'1': 'nameEn', '3': 4, '4': 1, '5': 9, '10': 'nameEn'},
    const {'1': 'secCdList', '3': 5, '4': 1, '5': 9, '10': 'secCdList'},
  ],
};

/// Descriptor for `MrktindustriesItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mrktindustriesItemDescriptor = $convert.base64Decode('ChJNcmt0aW5kdXN0cmllc0l0ZW0SDgoCaWQYASABKAVSAmlkEhIKBGNvZGUYAiABKAlSBGNvZGUSFgoGbmFtZVZuGAMgASgJUgZuYW1lVm4SFgoGbmFtZUVuGAQgASgJUgZuYW1lRW4SHAoJc2VjQ2RMaXN0GAUgASgJUglzZWNDZExpc3Q=');
@$core.Deprecated('Use mrktSecInfoItemDescriptor instead')
const MrktSecInfoItem$json = const {
  '1': 'MrktSecInfoItem',
  '2': const [
    const {'1': 'secCd', '3': 1, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'secType', '3': 2, '4': 1, '5': 5, '10': 'secType'},
    const {'1': 'secName', '3': 3, '4': 1, '5': 9, '10': 'secName'},
    const {'1': 'secNameEn', '3': 4, '4': 1, '5': 9, '10': 'secNameEn'},
    const {'1': 'marketCd', '3': 5, '4': 1, '5': 5, '10': 'marketCd'},
    const {'1': 'maxRate', '3': 6, '4': 1, '5': 2, '10': 'maxRate'},
    const {'1': 'listedQty', '3': 7, '4': 1, '5': 2, '10': 'listedQty'},
  ],
};

/// Descriptor for `MrktSecInfoItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mrktSecInfoItemDescriptor = $convert.base64Decode('Cg9Ncmt0U2VjSW5mb0l0ZW0SFAoFc2VjQ2QYASABKAlSBXNlY0NkEhgKB3NlY1R5cGUYAiABKAVSB3NlY1R5cGUSGAoHc2VjTmFtZRgDIAEoCVIHc2VjTmFtZRIcCglzZWNOYW1lRW4YBCABKAlSCXNlY05hbWVFbhIaCghtYXJrZXRDZBgFIAEoBVIIbWFya2V0Q2QSGAoHbWF4UmF0ZRgGIAEoAlIHbWF4UmF0ZRIcCglsaXN0ZWRRdHkYByABKAJSCWxpc3RlZFF0eQ==');
@$core.Deprecated('Use mrktSecInfoResponseDescriptor instead')
const MrktSecInfoResponse$json = const {
  '1': 'MrktSecInfoResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 5, '10': 'result'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'data', '3': 4, '4': 3, '5': 11, '6': '.market_api.MrktSecInfoItem', '10': 'data'},
  ],
};

/// Descriptor for `MrktSecInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mrktSecInfoResponseDescriptor = $convert.base64Decode('ChNNcmt0U2VjSW5mb1Jlc3BvbnNlEhYKBnJlc3VsdBgBIAEoBVIGcmVzdWx0EhQKBWVycm9yGAIgASgJUgVlcnJvchIYCgdtZXNzYWdlGAMgASgJUgdtZXNzYWdlEi8KBGRhdGEYBCADKAsyGy5tYXJrZXRfYXBpLk1ya3RTZWNJbmZvSXRlbVIEZGF0YQ==');
@$core.Deprecated('Use mrktSecInfoParamDescriptor instead')
const MrktSecInfoParam$json = const {
  '1': 'MrktSecInfoParam',
  '2': const [
    const {'1': 'authenCode', '3': 1, '4': 1, '5': 9, '10': 'authenCode'},
  ],
};

/// Descriptor for `MrktSecInfoParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mrktSecInfoParamDescriptor = $convert.base64Decode('ChBNcmt0U2VjSW5mb1BhcmFtEh4KCmF1dGhlbkNvZGUYASABKAlSCmF1dGhlbkNvZGU=');
@$core.Deprecated('Use mrktAdvItemDescriptor instead')
const MrktAdvItem$json = const {
  '1': 'MrktAdvItem',
  '2': const [
    const {'1': 'tradeDate', '3': 1, '4': 1, '5': 5, '10': 'tradeDate'},
    const {'1': 'advTime', '3': 2, '4': 1, '5': 5, '10': 'advTime'},
    const {'1': 'secCd', '3': 3, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'qty', '3': 4, '4': 1, '5': 3, '10': 'qty'},
    const {'1': 'price', '3': 5, '4': 1, '5': 2, '10': 'price'},
    const {'1': 'colorCode', '3': 6, '4': 1, '5': 14, '6': '.market_api.STOCK_COLOR_CODE', '10': 'colorCode'},
  ],
};

/// Descriptor for `MrktAdvItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mrktAdvItemDescriptor = $convert.base64Decode('CgtNcmt0QWR2SXRlbRIcCgl0cmFkZURhdGUYASABKAVSCXRyYWRlRGF0ZRIYCgdhZHZUaW1lGAIgASgFUgdhZHZUaW1lEhQKBXNlY0NkGAMgASgJUgVzZWNDZBIQCgNxdHkYBCABKANSA3F0eRIUCgVwcmljZRgFIAEoAlIFcHJpY2USOgoJY29sb3JDb2RlGAYgASgOMhwubWFya2V0X2FwaS5TVE9DS19DT0xPUl9DT0RFUgljb2xvckNvZGU=');
@$core.Deprecated('Use mrktMatchPtItemDescriptor instead')
const MrktMatchPtItem$json = const {
  '1': 'MrktMatchPtItem',
  '2': const [
    const {'1': 'tradeDate', '3': 1, '4': 1, '5': 5, '10': 'tradeDate'},
    const {'1': 'matTime', '3': 2, '4': 1, '5': 5, '10': 'matTime'},
    const {'1': 'confirmNo', '3': 3, '4': 1, '5': 9, '10': 'confirmNo'},
    const {'1': 'secCd', '3': 4, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'marketCd', '3': 5, '4': 1, '5': 5, '10': 'marketCd'},
    const {'1': 'matQty', '3': 6, '4': 1, '5': 3, '10': 'matQty'},
    const {'1': 'matPrice', '3': 7, '4': 1, '5': 2, '10': 'matPrice'},
    const {'1': 'colorCode', '3': 8, '4': 1, '5': 14, '6': '.market_api.STOCK_COLOR_CODE', '10': 'colorCode'},
  ],
};

/// Descriptor for `MrktMatchPtItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mrktMatchPtItemDescriptor = $convert.base64Decode('Cg9Ncmt0TWF0Y2hQdEl0ZW0SHAoJdHJhZGVEYXRlGAEgASgFUgl0cmFkZURhdGUSGAoHbWF0VGltZRgCIAEoBVIHbWF0VGltZRIcCgljb25maXJtTm8YAyABKAlSCWNvbmZpcm1ObxIUCgVzZWNDZBgEIAEoCVIFc2VjQ2QSGgoIbWFya2V0Q2QYBSABKAVSCG1hcmtldENkEhYKBm1hdFF0eRgGIAEoA1IGbWF0UXR5EhoKCG1hdFByaWNlGAcgASgCUghtYXRQcmljZRI6Cgljb2xvckNvZGUYCCABKA4yHC5tYXJrZXRfYXBpLlNUT0NLX0NPTE9SX0NPREVSCWNvbG9yQ29kZQ==');
@$core.Deprecated('Use putThroughDataDescriptor instead')
const PutThroughData$json = const {
  '1': 'PutThroughData',
  '2': const [
    const {'1': 'sellList', '3': 1, '4': 3, '5': 11, '6': '.market_api.MrktAdvItem', '10': 'sellList'},
    const {'1': 'buyList', '3': 2, '4': 3, '5': 11, '6': '.market_api.MrktAdvItem', '10': 'buyList'},
    const {'1': 'matchPtList', '3': 3, '4': 3, '5': 11, '6': '.market_api.MrktMatchPtItem', '10': 'matchPtList'},
  ],
};

/// Descriptor for `PutThroughData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List putThroughDataDescriptor = $convert.base64Decode('Cg5QdXRUaHJvdWdoRGF0YRIzCghzZWxsTGlzdBgBIAMoCzIXLm1hcmtldF9hcGkuTXJrdEFkdkl0ZW1SCHNlbGxMaXN0EjEKB2J1eUxpc3QYAiADKAsyFy5tYXJrZXRfYXBpLk1ya3RBZHZJdGVtUgdidXlMaXN0Ej0KC21hdGNoUHRMaXN0GAMgAygLMhsubWFya2V0X2FwaS5Ncmt0TWF0Y2hQdEl0ZW1SC21hdGNoUHRMaXN0');
@$core.Deprecated('Use putThroughResponseDescriptor instead')
const PutThroughResponse$json = const {
  '1': 'PutThroughResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 5, '10': 'result'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'data', '3': 4, '4': 1, '5': 11, '6': '.market_api.PutThroughData', '10': 'data'},
  ],
};

/// Descriptor for `PutThroughResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List putThroughResponseDescriptor = $convert.base64Decode('ChJQdXRUaHJvdWdoUmVzcG9uc2USFgoGcmVzdWx0GAEgASgFUgZyZXN1bHQSFAoFZXJyb3IYAiABKAlSBWVycm9yEhgKB21lc3NhZ2UYAyABKAlSB21lc3NhZ2USLgoEZGF0YRgEIAEoCzIaLm1hcmtldF9hcGkuUHV0VGhyb3VnaERhdGFSBGRhdGE=');
@$core.Deprecated('Use putThroughParamDescriptor instead')
const PutThroughParam$json = const {
  '1': 'PutThroughParam',
  '2': const [
    const {'1': 'authenCode', '3': 1, '4': 1, '5': 9, '10': 'authenCode'},
    const {'1': 'marketCd', '3': 2, '4': 1, '5': 5, '10': 'marketCd'},
    const {'1': 'tradeDate', '3': 3, '4': 1, '5': 5, '10': 'tradeDate'},
  ],
};

/// Descriptor for `PutThroughParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List putThroughParamDescriptor = $convert.base64Decode('Cg9QdXRUaHJvdWdoUGFyYW0SHgoKYXV0aGVuQ29kZRgBIAEoCVIKYXV0aGVuQ29kZRIaCghtYXJrZXRDZBgCIAEoBVIIbWFya2V0Q2QSHAoJdHJhZGVEYXRlGAMgASgFUgl0cmFkZURhdGU=');
@$core.Deprecated('Use topIndexContributionItemDescriptor instead')
const TopIndexContributionItem$json = const {
  '1': 'TopIndexContributionItem',
  '2': const [
    const {'1': 'secCd', '3': 1, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'contributeVal', '3': 2, '4': 1, '5': 1, '10': 'contributeVal'},
    const {'1': 'contributePercent', '3': 3, '4': 1, '5': 1, '10': 'contributePercent'},
  ],
};

/// Descriptor for `TopIndexContributionItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topIndexContributionItemDescriptor = $convert.base64Decode('ChhUb3BJbmRleENvbnRyaWJ1dGlvbkl0ZW0SFAoFc2VjQ2QYASABKAlSBXNlY0NkEiQKDWNvbnRyaWJ1dGVWYWwYAiABKAFSDWNvbnRyaWJ1dGVWYWwSLAoRY29udHJpYnV0ZVBlcmNlbnQYAyABKAFSEWNvbnRyaWJ1dGVQZXJjZW50');
@$core.Deprecated('Use topIndexContributionDataDescriptor instead')
const TopIndexContributionData$json = const {
  '1': 'TopIndexContributionData',
  '2': const [
    const {'1': 'topIncrease', '3': 1, '4': 3, '5': 11, '6': '.market_api.TopIndexContributionItem', '10': 'topIncrease'},
    const {'1': 'topDecrease', '3': 2, '4': 3, '5': 11, '6': '.market_api.TopIndexContributionItem', '10': 'topDecrease'},
  ],
};

/// Descriptor for `TopIndexContributionData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topIndexContributionDataDescriptor = $convert.base64Decode('ChhUb3BJbmRleENvbnRyaWJ1dGlvbkRhdGESRgoLdG9wSW5jcmVhc2UYASADKAsyJC5tYXJrZXRfYXBpLlRvcEluZGV4Q29udHJpYnV0aW9uSXRlbVILdG9wSW5jcmVhc2USRgoLdG9wRGVjcmVhc2UYAiADKAsyJC5tYXJrZXRfYXBpLlRvcEluZGV4Q29udHJpYnV0aW9uSXRlbVILdG9wRGVjcmVhc2U=');
@$core.Deprecated('Use topIndexContributionResponseDescriptor instead')
const TopIndexContributionResponse$json = const {
  '1': 'TopIndexContributionResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 5, '10': 'result'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'data', '3': 4, '4': 1, '5': 11, '6': '.market_api.TopIndexContributionData', '10': 'data'},
  ],
};

/// Descriptor for `TopIndexContributionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topIndexContributionResponseDescriptor = $convert.base64Decode('ChxUb3BJbmRleENvbnRyaWJ1dGlvblJlc3BvbnNlEhYKBnJlc3VsdBgBIAEoBVIGcmVzdWx0EhQKBWVycm9yGAIgASgJUgVlcnJvchIYCgdtZXNzYWdlGAMgASgJUgdtZXNzYWdlEjgKBGRhdGEYBCABKAsyJC5tYXJrZXRfYXBpLlRvcEluZGV4Q29udHJpYnV0aW9uRGF0YVIEZGF0YQ==');
@$core.Deprecated('Use topIndexContributionParamDescriptor instead')
const TopIndexContributionParam$json = const {
  '1': 'TopIndexContributionParam',
  '2': const [
    const {'1': 'authenCode', '3': 1, '4': 1, '5': 9, '10': 'authenCode'},
    const {'1': 'marketCd', '3': 2, '4': 1, '5': 5, '10': 'marketCd'},
  ],
};

/// Descriptor for `TopIndexContributionParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topIndexContributionParamDescriptor = $convert.base64Decode('ChlUb3BJbmRleENvbnRyaWJ1dGlvblBhcmFtEh4KCmF1dGhlbkNvZGUYASABKAlSCmF1dGhlbkNvZGUSGgoIbWFya2V0Q2QYAiABKAVSCG1hcmtldENk');
@$core.Deprecated('Use marketBreadthItemDescriptor instead')
const MarketBreadthItem$json = const {
  '1': 'MarketBreadthItem',
  '2': const [
    const {'1': 'secCd', '3': 1, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'contributeVal', '3': 2, '4': 1, '5': 1, '10': 'contributeVal'},
    const {'1': 'contributePercent', '3': 3, '4': 1, '5': 1, '10': 'contributePercent'},
    const {'1': 'marketCd', '3': 4, '4': 1, '5': 5, '10': 'marketCd'},
    const {'1': 'avgAmt5d', '3': 5, '4': 1, '5': 1, '10': 'avgAmt5d'},
    const {'1': 'marketCapWeight', '3': 6, '4': 1, '5': 1, '10': 'marketCapWeight'},
    const {'1': 'colorCode', '3': 7, '4': 1, '5': 14, '6': '.market_api.STOCK_COLOR_CODE', '10': 'colorCode'},
  ],
};

/// Descriptor for `MarketBreadthItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketBreadthItemDescriptor = $convert.base64Decode('ChFNYXJrZXRCcmVhZHRoSXRlbRIUCgVzZWNDZBgBIAEoCVIFc2VjQ2QSJAoNY29udHJpYnV0ZVZhbBgCIAEoAVINY29udHJpYnV0ZVZhbBIsChFjb250cmlidXRlUGVyY2VudBgDIAEoAVIRY29udHJpYnV0ZVBlcmNlbnQSGgoIbWFya2V0Q2QYBCABKAVSCG1hcmtldENkEhoKCGF2Z0FtdDVkGAUgASgBUghhdmdBbXQ1ZBIoCg9tYXJrZXRDYXBXZWlnaHQYBiABKAFSD21hcmtldENhcFdlaWdodBI6Cgljb2xvckNvZGUYByABKA4yHC5tYXJrZXRfYXBpLlNUT0NLX0NPTE9SX0NPREVSCWNvbG9yQ29kZQ==');
@$core.Deprecated('Use marketBreadthResponseDescriptor instead')
const MarketBreadthResponse$json = const {
  '1': 'MarketBreadthResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 5, '10': 'result'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'data', '3': 4, '4': 3, '5': 11, '6': '.market_api.MarketBreadthItem', '10': 'data'},
  ],
};

/// Descriptor for `MarketBreadthResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketBreadthResponseDescriptor = $convert.base64Decode('ChVNYXJrZXRCcmVhZHRoUmVzcG9uc2USFgoGcmVzdWx0GAEgASgFUgZyZXN1bHQSFAoFZXJyb3IYAiABKAlSBWVycm9yEhgKB21lc3NhZ2UYAyABKAlSB21lc3NhZ2USMQoEZGF0YRgEIAMoCzIdLm1hcmtldF9hcGkuTWFya2V0QnJlYWR0aEl0ZW1SBGRhdGE=');
@$core.Deprecated('Use marketLiquidityItemDescriptor instead')
const MarketLiquidityItem$json = const {
  '1': 'MarketLiquidityItem',
  '2': const [
    const {'1': 'tradeDate', '3': 1, '4': 1, '5': 1, '10': 'tradeDate'},
    const {'1': 'indexCd', '3': 2, '4': 1, '5': 1, '10': 'indexCd'},
    const {'1': 'time', '3': 3, '4': 1, '5': 9, '10': 'time'},
    const {'1': 'valueT0', '3': 4, '4': 1, '5': 1, '10': 'valueT0'},
    const {'1': 'valueT1', '3': 5, '4': 1, '5': 1, '10': 'valueT1'},
    const {'1': 'valueT5', '3': 6, '4': 1, '5': 1, '10': 'valueT5'},
    const {'1': 'valueT10', '3': 7, '4': 1, '5': 1, '10': 'valueT10'},
    const {'1': 'valueT30', '3': 8, '4': 1, '5': 1, '10': 'valueT30'},
  ],
};

/// Descriptor for `MarketLiquidityItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketLiquidityItemDescriptor = $convert.base64Decode('ChNNYXJrZXRMaXF1aWRpdHlJdGVtEhwKCXRyYWRlRGF0ZRgBIAEoAVIJdHJhZGVEYXRlEhgKB2luZGV4Q2QYAiABKAFSB2luZGV4Q2QSEgoEdGltZRgDIAEoCVIEdGltZRIYCgd2YWx1ZVQwGAQgASgBUgd2YWx1ZVQwEhgKB3ZhbHVlVDEYBSABKAFSB3ZhbHVlVDESGAoHdmFsdWVUNRgGIAEoAVIHdmFsdWVUNRIaCgh2YWx1ZVQxMBgHIAEoAVIIdmFsdWVUMTASGgoIdmFsdWVUMzAYCCABKAFSCHZhbHVlVDMw');
@$core.Deprecated('Use marketLiquidityResponseDescriptor instead')
const MarketLiquidityResponse$json = const {
  '1': 'MarketLiquidityResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 5, '10': 'result'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'data', '3': 4, '4': 3, '5': 11, '6': '.market_api.MarketLiquidityItem', '10': 'data'},
  ],
};

/// Descriptor for `MarketLiquidityResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketLiquidityResponseDescriptor = $convert.base64Decode('ChdNYXJrZXRMaXF1aWRpdHlSZXNwb25zZRIWCgZyZXN1bHQYASABKAVSBnJlc3VsdBIUCgVlcnJvchgCIAEoCVIFZXJyb3ISGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZRIzCgRkYXRhGAQgAygLMh8ubWFya2V0X2FwaS5NYXJrZXRMaXF1aWRpdHlJdGVtUgRkYXRh');
@$core.Deprecated('Use topIndustriesTradeForeignItemDescriptor instead')
const TopIndustriesTradeForeignItem$json = const {
  '1': 'TopIndustriesTradeForeignItem',
  '2': const [
    const {'1': 'marketCd', '3': 1, '4': 1, '5': 5, '10': 'marketCd'},
    const {'1': 'industryNameVi', '3': 2, '4': 1, '5': 9, '10': 'industryNameVi'},
    const {'1': 'industryNameEn', '3': 3, '4': 1, '5': 9, '10': 'industryNameEn'},
    const {'1': 'buyForeignQty', '3': 4, '4': 1, '5': 1, '10': 'buyForeignQty'},
    const {'1': 'sellForeignQty', '3': 5, '4': 1, '5': 1, '10': 'sellForeignQty'},
    const {'1': 'netForeignQty', '3': 6, '4': 1, '5': 1, '10': 'netForeignQty'},
    const {'1': 'buyForeignAmt', '3': 7, '4': 1, '5': 1, '10': 'buyForeignAmt'},
    const {'1': 'sellForeignAmt', '3': 8, '4': 1, '5': 1, '10': 'sellForeignAmt'},
    const {'1': 'netForeignAmt', '3': 9, '4': 1, '5': 1, '10': 'netForeignAmt'},
  ],
};

/// Descriptor for `TopIndustriesTradeForeignItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topIndustriesTradeForeignItemDescriptor = $convert.base64Decode('Ch1Ub3BJbmR1c3RyaWVzVHJhZGVGb3JlaWduSXRlbRIaCghtYXJrZXRDZBgBIAEoBVIIbWFya2V0Q2QSJgoOaW5kdXN0cnlOYW1lVmkYAiABKAlSDmluZHVzdHJ5TmFtZVZpEiYKDmluZHVzdHJ5TmFtZUVuGAMgASgJUg5pbmR1c3RyeU5hbWVFbhIkCg1idXlGb3JlaWduUXR5GAQgASgBUg1idXlGb3JlaWduUXR5EiYKDnNlbGxGb3JlaWduUXR5GAUgASgBUg5zZWxsRm9yZWlnblF0eRIkCg1uZXRGb3JlaWduUXR5GAYgASgBUg1uZXRGb3JlaWduUXR5EiQKDWJ1eUZvcmVpZ25BbXQYByABKAFSDWJ1eUZvcmVpZ25BbXQSJgoOc2VsbEZvcmVpZ25BbXQYCCABKAFSDnNlbGxGb3JlaWduQW10EiQKDW5ldEZvcmVpZ25BbXQYCSABKAFSDW5ldEZvcmVpZ25BbXQ=');
@$core.Deprecated('Use topIndustriesTradeForeignResponseDescriptor instead')
const TopIndustriesTradeForeignResponse$json = const {
  '1': 'TopIndustriesTradeForeignResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 5, '10': 'result'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'data', '3': 4, '4': 3, '5': 11, '6': '.market_api.TopIndustriesTradeForeignItem', '10': 'data'},
  ],
};

/// Descriptor for `TopIndustriesTradeForeignResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topIndustriesTradeForeignResponseDescriptor = $convert.base64Decode('CiFUb3BJbmR1c3RyaWVzVHJhZGVGb3JlaWduUmVzcG9uc2USFgoGcmVzdWx0GAEgASgFUgZyZXN1bHQSFAoFZXJyb3IYAiABKAlSBWVycm9yEhgKB21lc3NhZ2UYAyABKAlSB21lc3NhZ2USPQoEZGF0YRgEIAMoCzIpLm1hcmtldF9hcGkuVG9wSW5kdXN0cmllc1RyYWRlRm9yZWlnbkl0ZW1SBGRhdGE=');
@$core.Deprecated('Use topIndustriesContributionItemDescriptor instead')
const TopIndustriesContributionItem$json = const {
  '1': 'TopIndustriesContributionItem',
  '2': const [
    const {'1': 'marketCd', '3': 1, '4': 1, '5': 5, '10': 'marketCd'},
    const {'1': 'industryNameVi', '3': 2, '4': 1, '5': 9, '10': 'industryNameVi'},
    const {'1': 'industryNameEn', '3': 3, '4': 1, '5': 9, '10': 'industryNameEn'},
    const {'1': 'contributeVal', '3': 4, '4': 1, '5': 1, '10': 'contributeVal'},
    const {'1': 'contributePercent', '3': 5, '4': 1, '5': 1, '10': 'contributePercent'},
  ],
};

/// Descriptor for `TopIndustriesContributionItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topIndustriesContributionItemDescriptor = $convert.base64Decode('Ch1Ub3BJbmR1c3RyaWVzQ29udHJpYnV0aW9uSXRlbRIaCghtYXJrZXRDZBgBIAEoBVIIbWFya2V0Q2QSJgoOaW5kdXN0cnlOYW1lVmkYAiABKAlSDmluZHVzdHJ5TmFtZVZpEiYKDmluZHVzdHJ5TmFtZUVuGAMgASgJUg5pbmR1c3RyeU5hbWVFbhIkCg1jb250cmlidXRlVmFsGAQgASgBUg1jb250cmlidXRlVmFsEiwKEWNvbnRyaWJ1dGVQZXJjZW50GAUgASgBUhFjb250cmlidXRlUGVyY2VudA==');
@$core.Deprecated('Use topIndustriesContributionResponseDescriptor instead')
const TopIndustriesContributionResponse$json = const {
  '1': 'TopIndustriesContributionResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 5, '10': 'result'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'data', '3': 4, '4': 3, '5': 11, '6': '.market_api.TopIndustriesContributionItem', '10': 'data'},
  ],
};

/// Descriptor for `TopIndustriesContributionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topIndustriesContributionResponseDescriptor = $convert.base64Decode('CiFUb3BJbmR1c3RyaWVzQ29udHJpYnV0aW9uUmVzcG9uc2USFgoGcmVzdWx0GAEgASgFUgZyZXN1bHQSFAoFZXJyb3IYAiABKAlSBWVycm9yEhgKB21lc3NhZ2UYAyABKAlSB21lc3NhZ2USPQoEZGF0YRgEIAMoCzIpLm1hcmtldF9hcGkuVG9wSW5kdXN0cmllc0NvbnRyaWJ1dGlvbkl0ZW1SBGRhdGE=');
@$core.Deprecated('Use topIndustriesTradeItemDescriptor instead')
const TopIndustriesTradeItem$json = const {
  '1': 'TopIndustriesTradeItem',
  '2': const [
    const {'1': 'marketCd', '3': 1, '4': 1, '5': 5, '10': 'marketCd'},
    const {'1': 'industryNameVi', '3': 2, '4': 1, '5': 9, '10': 'industryNameVi'},
    const {'1': 'industryNameEn', '3': 3, '4': 1, '5': 9, '10': 'industryNameEn'},
    const {'1': 'industrySumMarketAmt', '3': 4, '4': 1, '5': 1, '10': 'industrySumMarketAmt'},
    const {'1': 'contributePercent', '3': 5, '4': 1, '5': 1, '10': 'contributePercent'},
  ],
};

/// Descriptor for `TopIndustriesTradeItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topIndustriesTradeItemDescriptor = $convert.base64Decode('ChZUb3BJbmR1c3RyaWVzVHJhZGVJdGVtEhoKCG1hcmtldENkGAEgASgFUghtYXJrZXRDZBImCg5pbmR1c3RyeU5hbWVWaRgCIAEoCVIOaW5kdXN0cnlOYW1lVmkSJgoOaW5kdXN0cnlOYW1lRW4YAyABKAlSDmluZHVzdHJ5TmFtZUVuEjIKFGluZHVzdHJ5U3VtTWFya2V0QW10GAQgASgBUhRpbmR1c3RyeVN1bU1hcmtldEFtdBIsChFjb250cmlidXRlUGVyY2VudBgFIAEoAVIRY29udHJpYnV0ZVBlcmNlbnQ=');
@$core.Deprecated('Use topIndustriesTradeResponseDescriptor instead')
const TopIndustriesTradeResponse$json = const {
  '1': 'TopIndustriesTradeResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 5, '10': 'result'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'data', '3': 4, '4': 3, '5': 11, '6': '.market_api.TopIndustriesTradeItem', '10': 'data'},
  ],
};

/// Descriptor for `TopIndustriesTradeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topIndustriesTradeResponseDescriptor = $convert.base64Decode('ChpUb3BJbmR1c3RyaWVzVHJhZGVSZXNwb25zZRIWCgZyZXN1bHQYASABKAVSBnJlc3VsdBIUCgVlcnJvchgCIAEoCVIFZXJyb3ISGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZRI2CgRkYXRhGAQgAygLMiIubWFya2V0X2FwaS5Ub3BJbmR1c3RyaWVzVHJhZGVJdGVtUgRkYXRh');
@$core.Deprecated('Use marketBreadthParamDescriptor instead')
const MarketBreadthParam$json = const {
  '1': 'MarketBreadthParam',
  '2': const [
    const {'1': 'authenCode', '3': 1, '4': 1, '5': 9, '10': 'authenCode'},
    const {'1': 'marketCd', '3': 2, '4': 1, '5': 5, '10': 'marketCd'},
  ],
};

/// Descriptor for `MarketBreadthParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketBreadthParamDescriptor = $convert.base64Decode('ChJNYXJrZXRCcmVhZHRoUGFyYW0SHgoKYXV0aGVuQ29kZRgBIAEoCVIKYXV0aGVuQ29kZRIaCghtYXJrZXRDZBgCIAEoBVIIbWFya2V0Q2Q=');
@$core.Deprecated('Use marketLiquidityParamDescriptor instead')
const MarketLiquidityParam$json = const {
  '1': 'MarketLiquidityParam',
  '2': const [
    const {'1': 'authenCode', '3': 1, '4': 1, '5': 9, '10': 'authenCode'},
    const {'1': 'marketCd', '3': 2, '4': 1, '5': 5, '10': 'marketCd'},
  ],
};

/// Descriptor for `MarketLiquidityParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketLiquidityParamDescriptor = $convert.base64Decode('ChRNYXJrZXRMaXF1aWRpdHlQYXJhbRIeCgphdXRoZW5Db2RlGAEgASgJUgphdXRoZW5Db2RlEhoKCG1hcmtldENkGAIgASgFUghtYXJrZXRDZA==');
@$core.Deprecated('Use topIndustriesTradeForeignParamDescriptor instead')
const TopIndustriesTradeForeignParam$json = const {
  '1': 'TopIndustriesTradeForeignParam',
  '2': const [
    const {'1': 'authenCode', '3': 1, '4': 1, '5': 9, '10': 'authenCode'},
    const {'1': 'marketCd', '3': 2, '4': 1, '5': 5, '10': 'marketCd'},
  ],
};

/// Descriptor for `TopIndustriesTradeForeignParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topIndustriesTradeForeignParamDescriptor = $convert.base64Decode('Ch5Ub3BJbmR1c3RyaWVzVHJhZGVGb3JlaWduUGFyYW0SHgoKYXV0aGVuQ29kZRgBIAEoCVIKYXV0aGVuQ29kZRIaCghtYXJrZXRDZBgCIAEoBVIIbWFya2V0Q2Q=');
@$core.Deprecated('Use topIndustriesContributionParamDescriptor instead')
const TopIndustriesContributionParam$json = const {
  '1': 'TopIndustriesContributionParam',
  '2': const [
    const {'1': 'authenCode', '3': 1, '4': 1, '5': 9, '10': 'authenCode'},
    const {'1': 'marketCd', '3': 2, '4': 1, '5': 5, '10': 'marketCd'},
  ],
};

/// Descriptor for `TopIndustriesContributionParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topIndustriesContributionParamDescriptor = $convert.base64Decode('Ch5Ub3BJbmR1c3RyaWVzQ29udHJpYnV0aW9uUGFyYW0SHgoKYXV0aGVuQ29kZRgBIAEoCVIKYXV0aGVuQ29kZRIaCghtYXJrZXRDZBgCIAEoBVIIbWFya2V0Q2Q=');
@$core.Deprecated('Use topIndustriesTradeParamDescriptor instead')
const TopIndustriesTradeParam$json = const {
  '1': 'TopIndustriesTradeParam',
  '2': const [
    const {'1': 'authenCode', '3': 1, '4': 1, '5': 9, '10': 'authenCode'},
    const {'1': 'marketCd', '3': 2, '4': 1, '5': 5, '10': 'marketCd'},
  ],
};

/// Descriptor for `TopIndustriesTradeParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List topIndustriesTradeParamDescriptor = $convert.base64Decode('ChdUb3BJbmR1c3RyaWVzVHJhZGVQYXJhbRIeCgphdXRoZW5Db2RlGAEgASgJUgphdXRoZW5Db2RlEhoKCG1hcmtldENkGAIgASgFUghtYXJrZXRDZA==');
@$core.Deprecated('Use industriesHeatMapParamDescriptor instead')
const IndustriesHeatMapParam$json = const {
  '1': 'IndustriesHeatMapParam',
  '2': const [
    const {'1': 'authenCode', '3': 1, '4': 1, '5': 9, '10': 'authenCode'},
    const {'1': 'industriesId', '3': 2, '4': 1, '5': 5, '10': 'industriesId'},
  ],
};

/// Descriptor for `IndustriesHeatMapParam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List industriesHeatMapParamDescriptor = $convert.base64Decode('ChZJbmR1c3RyaWVzSGVhdE1hcFBhcmFtEh4KCmF1dGhlbkNvZGUYASABKAlSCmF1dGhlbkNvZGUSIgoMaW5kdXN0cmllc0lkGAIgASgFUgxpbmR1c3RyaWVzSWQ=');
@$core.Deprecated('Use basePriceUpdateDescriptor instead')
const BasePriceUpdate$json = const {
  '1': 'BasePriceUpdate',
  '2': const [
    const {'1': 'secCd', '3': 1, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'baseSecCd', '3': 2, '4': 1, '5': 9, '10': 'baseSecCd'},
    const {'1': 'basePrice', '3': 3, '4': 1, '5': 1, '10': 'basePrice'},
    const {'1': 'basePriceCp', '3': 4, '4': 1, '5': 1, '10': 'basePriceCp'},
  ],
};

/// Descriptor for `BasePriceUpdate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List basePriceUpdateDescriptor = $convert.base64Decode('Cg9CYXNlUHJpY2VVcGRhdGUSFAoFc2VjQ2QYASABKAlSBXNlY0NkEhwKCWJhc2VTZWNDZBgCIAEoCVIJYmFzZVNlY0NkEhwKCWJhc2VQcmljZRgDIAEoAVIJYmFzZVByaWNlEiAKC2Jhc2VQcmljZUNwGAQgASgBUgtiYXNlUHJpY2VDcA==');
@$core.Deprecated('Use anyMessageDescriptor instead')
const AnyMessage$json = const {
  '1': 'AnyMessage',
  '2': const [
    const {'1': 'type_url', '3': 1, '4': 1, '5': 9, '10': 'typeUrl'},
    const {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
};

/// Descriptor for `AnyMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List anyMessageDescriptor = $convert.base64Decode('CgpBbnlNZXNzYWdlEhkKCHR5cGVfdXJsGAEgASgJUgd0eXBlVXJsEhQKBXZhbHVlGAIgASgMUgV2YWx1ZQ==');
@$core.Deprecated('Use projectOpenDescriptor instead')
const ProjectOpen$json = const {
  '1': 'ProjectOpen',
  '2': const [
    const {'1': 'secCd', '3': 1, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'price', '3': 2, '4': 1, '5': 1, '10': 'price'},
    const {'1': 'qty', '3': 3, '4': 1, '5': 1, '10': 'qty'},
    const {'1': 'changePoint', '3': 4, '4': 1, '5': 1, '10': 'changePoint'},
    const {'1': 'changePercent', '3': 5, '4': 1, '5': 1, '10': 'changePercent'},
    const {'1': 'colorCode', '3': 6, '4': 1, '5': 14, '6': '.market_api.STOCK_COLOR_CODE', '10': 'colorCode'},
    const {'1': 'updTime', '3': 7, '4': 1, '5': 5, '10': 'updTime'},
  ],
};

/// Descriptor for `ProjectOpen`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectOpenDescriptor = $convert.base64Decode('CgtQcm9qZWN0T3BlbhIUCgVzZWNDZBgBIAEoCVIFc2VjQ2QSFAoFcHJpY2UYAiABKAFSBXByaWNlEhAKA3F0eRgDIAEoAVIDcXR5EiAKC2NoYW5nZVBvaW50GAQgASgBUgtjaGFuZ2VQb2ludBIkCg1jaGFuZ2VQZXJjZW50GAUgASgBUg1jaGFuZ2VQZXJjZW50EjoKCWNvbG9yQ29kZRgGIAEoDjIcLm1hcmtldF9hcGkuU1RPQ0tfQ09MT1JfQ09ERVIJY29sb3JDb2RlEhgKB3VwZFRpbWUYByABKAVSB3VwZFRpbWU=');
@$core.Deprecated('Use industriesHeatMapItemDescriptor instead')
const IndustriesHeatMapItem$json = const {
  '1': 'IndustriesHeatMapItem',
  '2': const [
    const {'1': 'industryId', '3': 1, '4': 1, '5': 5, '10': 'industryId'},
    const {'1': 'secCd', '3': 2, '4': 1, '5': 9, '10': 'secCd'},
    const {'1': 'lastPrice', '3': 3, '4': 1, '5': 1, '10': 'lastPrice'},
    const {'1': 'changePoint', '3': 4, '4': 1, '5': 1, '10': 'changePoint'},
    const {'1': 'changePercent', '3': 5, '4': 1, '5': 1, '10': 'changePercent'},
    const {'1': 'marketCap', '3': 6, '4': 1, '5': 1, '10': 'marketCap'},
  ],
};

/// Descriptor for `IndustriesHeatMapItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List industriesHeatMapItemDescriptor = $convert.base64Decode('ChVJbmR1c3RyaWVzSGVhdE1hcEl0ZW0SHgoKaW5kdXN0cnlJZBgBIAEoBVIKaW5kdXN0cnlJZBIUCgVzZWNDZBgCIAEoCVIFc2VjQ2QSHAoJbGFzdFByaWNlGAMgASgBUglsYXN0UHJpY2USIAoLY2hhbmdlUG9pbnQYBCABKAFSC2NoYW5nZVBvaW50EiQKDWNoYW5nZVBlcmNlbnQYBSABKAFSDWNoYW5nZVBlcmNlbnQSHAoJbWFya2V0Q2FwGAYgASgBUgltYXJrZXRDYXA=');
@$core.Deprecated('Use industriesHeatMapResponseDescriptor instead')
const IndustriesHeatMapResponse$json = const {
  '1': 'IndustriesHeatMapResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 5, '10': 'result'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'data', '3': 4, '4': 3, '5': 11, '6': '.market_api.IndustriesHeatMapItem', '10': 'data'},
  ],
};

/// Descriptor for `IndustriesHeatMapResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List industriesHeatMapResponseDescriptor = $convert.base64Decode('ChlJbmR1c3RyaWVzSGVhdE1hcFJlc3BvbnNlEhYKBnJlc3VsdBgBIAEoBVIGcmVzdWx0EhQKBWVycm9yGAIgASgJUgVlcnJvchIYCgdtZXNzYWdlGAMgASgJUgdtZXNzYWdlEjUKBGRhdGEYBCADKAsyIS5tYXJrZXRfYXBpLkluZHVzdHJpZXNIZWF0TWFwSXRlbVIEZGF0YQ==');
