///
//  Generated code. Do not modify.
//  source: auto_trading.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ORDER_TYPE extends $pb.ProtobufEnum {
  static const ORDER_TYPE ORDER_DEFAULT = ORDER_TYPE._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ORDER_DEFAULT');
  static const ORDER_TYPE ORDER_UP = ORDER_TYPE._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ORDER_UP');
  static const ORDER_TYPE ORDER_DOWN = ORDER_TYPE._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ORDER_DOWN');

  static const $core.List<ORDER_TYPE> values = <ORDER_TYPE> [
    ORDER_DEFAULT,
    ORDER_UP,
    ORDER_DOWN,
  ];

  static final $core.Map<$core.int, ORDER_TYPE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ORDER_TYPE? valueOf($core.int value) => _byValue[value];

  const ORDER_TYPE._($core.int v, $core.String n) : super(v, n);
}

class STOCK_COLOR_CODE extends $pb.ProtobufEnum {
  static const STOCK_COLOR_CODE BASIC_PRICE = STOCK_COLOR_CODE._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BASIC_PRICE');
  static const STOCK_COLOR_CODE CEILING_PRICE = STOCK_COLOR_CODE._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CEILING_PRICE');
  static const STOCK_COLOR_CODE FLOOR_PRICE = STOCK_COLOR_CODE._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FLOOR_PRICE');
  static const STOCK_COLOR_CODE UP_PRICE = STOCK_COLOR_CODE._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UP_PRICE');
  static const STOCK_COLOR_CODE DOWN_PRICE = STOCK_COLOR_CODE._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DOWN_PRICE');

  static const $core.List<STOCK_COLOR_CODE> values = <STOCK_COLOR_CODE> [
    BASIC_PRICE,
    CEILING_PRICE,
    FLOOR_PRICE,
    UP_PRICE,
    DOWN_PRICE,
  ];

  static final $core.Map<$core.int, STOCK_COLOR_CODE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static STOCK_COLOR_CODE? valueOf($core.int value) => _byValue[value];

  const STOCK_COLOR_CODE._($core.int v, $core.String n) : super(v, n);
}

class INDEX_COLOR_CODE extends $pb.ProtobufEnum {
  static const INDEX_COLOR_CODE NONE = INDEX_COLOR_CODE._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONE');
  static const INDEX_COLOR_CODE OPEN_INDEX = INDEX_COLOR_CODE._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OPEN_INDEX');
  static const INDEX_COLOR_CODE UP_INDEX = INDEX_COLOR_CODE._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UP_INDEX');
  static const INDEX_COLOR_CODE DOWN_INDEX = INDEX_COLOR_CODE._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DOWN_INDEX');

  static const $core.List<INDEX_COLOR_CODE> values = <INDEX_COLOR_CODE> [
    NONE,
    OPEN_INDEX,
    UP_INDEX,
    DOWN_INDEX,
  ];

  static final $core.Map<$core.int, INDEX_COLOR_CODE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static INDEX_COLOR_CODE? valueOf($core.int value) => _byValue[value];

  const INDEX_COLOR_CODE._($core.int v, $core.String n) : super(v, n);
}

class INDEX_STATE extends $pb.ProtobufEnum {
  static const INDEX_STATE S = INDEX_STATE._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S');
  static const INDEX_STATE P = INDEX_STATE._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'P');
  static const INDEX_STATE O = INDEX_STATE._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'O');
  static const INDEX_STATE A = INDEX_STATE._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'A');
  static const INDEX_STATE C = INDEX_STATE._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C');
  static const INDEX_STATE I = INDEX_STATE._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'I');
  static const INDEX_STATE K = INDEX_STATE._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'K');
  static const INDEX_STATE G = INDEX_STATE._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'G');
  static const INDEX_STATE J = INDEX_STATE._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'J');
  static const INDEX_STATE Z = INDEX_STATE._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Z');

  static const $core.List<INDEX_STATE> values = <INDEX_STATE> [
    S,
    P,
    O,
    A,
    C,
    I,
    K,
    G,
    J,
    Z,
  ];

  static final $core.Map<$core.int, INDEX_STATE> _byValue = $pb.ProtobufEnum.initByValue(values);
  static INDEX_STATE? valueOf($core.int value) => _byValue[value];

  const INDEX_STATE._($core.int v, $core.String n) : super(v, n);
}

class SystemState_StatusCode extends $pb.ProtobufEnum {
  static const SystemState_StatusCode NONE = SystemState_StatusCode._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONE');
  static const SystemState_StatusCode BOD = SystemState_StatusCode._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOD');
  static const SystemState_StatusCode AVAILABLE = SystemState_StatusCode._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AVAILABLE');
  static const SystemState_StatusCode EOD = SystemState_StatusCode._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EOD');
  static const SystemState_StatusCode ATO = SystemState_StatusCode._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ATO');
  static const SystemState_StatusCode OPEN = SystemState_StatusCode._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OPEN');
  static const SystemState_StatusCode ATC = SystemState_StatusCode._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ATC');
  static const SystemState_StatusCode CLOSE = SystemState_StatusCode._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLOSE');

  static const $core.List<SystemState_StatusCode> values = <SystemState_StatusCode> [
    NONE,
    BOD,
    AVAILABLE,
    EOD,
    ATO,
    OPEN,
    ATC,
    CLOSE,
  ];

  static final $core.Map<$core.int, SystemState_StatusCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SystemState_StatusCode? valueOf($core.int value) => _byValue[value];

  const SystemState_StatusCode._($core.int v, $core.String n) : super(v, n);
}

