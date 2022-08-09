import 'dart:convert';

class Screeeners {
  Screeeners({this.screenerId, this.screener, this.screenerFilter});

  factory Screeeners.fromMap(Map<String, dynamic> json) => Screeeners(
        screenerId: json['screenerId'],
        screener: Screener.fromMap(json['screener']),
        screenerFilter: json['screenerFilter'] == null
            ? null
            : List<ScreenerFilter>.from(
                (json['screenerFilter'] as List<dynamic>).map((dynamic x) =>
                    ScreenerFilter.fromMap(x as Map<String, dynamic>))),
      );

  num? screenerId;
  Screener? screener;
  List<ScreenerFilter>? screenerFilter;
}

class Screener {
  Screener({
    this.id,
    this.userId,
    this.name,
    this.status,
    this.regDateTime,
    this.updDateTime,
  });

  factory Screener.fromMap(Map<String, dynamic> json) => Screener(
        id: json['id'],
        userId: json['userId'],
        name: json['name'],
        status: json['status'],
        regDateTime: json['regDateTime'],
        updDateTime: json['updDateTime'],
      );

  num? id;
  String? userId;
  String? name;
  num? status;
  String? regDateTime;
  String? updDateTime;
}

class ScreenerFilter {
  ScreenerFilter({
    this.id,
    this.screenerId,
    this.groupCd,
    this.type,
    this.name,
    this.key,
    this.minValue,
    this.maxValue,
    this.unit,
    this.status,
    this.regDateTime,
    this.updDateTime,
    this.options,
  });

  factory ScreenerFilter.fromMap(Map<String, dynamic> map) => ScreenerFilter(
      id: map['id'],
      screenerId: map['screenerId'],
      groupCd: map['groupCd'],
      type: map['type'],
      name: map['name'],
      key: map['key'],
      minValue: map['minValue'],
      maxValue: map['maxValue'],
      unit: map['unit'],
      status: map['status'],
      regDateTime: map['regDateTime'],
      updDateTime: map['updDateTime'],
      options: map['options'] == null
          ? null
          : List<OptionModel>.from(json
              .decode('${map['options']}')
              .map((dynamic e) => OptionModel.fromMap(e)))
      // (json['options'] as String).replaceAll(r'\', '') as Map),
      );

  Map<String, dynamic> toMapScreenerModel() => <String, dynamic>{
        'groupCd': groupCd,
        'type': type,
        'name': name,
        'key': key,
        'options': options == null
            ? null
            : '${options!.map((OptionModel x) => x.toMapEncode()).toList()}',
        'minValue': minValue,
        'maxValue': maxValue,
        'unit': unit,
      };

  num? id;
  num? screenerId;

  /// [groupCd] `1`.MARKET, `2`.QUOTES_INDICATOR, `3`.FINANCIAL_INDICATOR, `4`.TECHNICAL_INDICATOR
  num? groupCd;

  /// [type] `1`: RANGE, `2`: OPTION, `3`:RADIO
  num? type;
  String? name;

  /// [key] marketCd, industries, CHANGE_PERCENT, ...
  String? key;
  num? minValue;
  num? maxValue;
  String? unit;
  num? status;
  String? regDateTime;
  String? updDateTime;
  List<OptionModel>? options;
}

class OptionModel {
  OptionModel({
    required this.value,
    required this.name,
  });

  factory OptionModel.fromMap(Map<String, dynamic> json) => OptionModel(
        value: json['value'],
        name: json['name'],
      );

  Map<String, dynamic> toMapEncode() => <String, dynamic>{
        json.encode('value'): json.encode(value),
        json.encode('name'): json.encode(name)
      };

  String value;
  String name;
}
