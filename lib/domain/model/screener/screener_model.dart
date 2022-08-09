import 'package:flutter_mobile/base/base_mixin.dart';
import 'package:flutter_mobile/domain/model/screener/screener.dart';
import 'package:flutter_mobile/import.dart';

class ScreenerModel {
  ScreenerModel({
    this.idFilter,
    this.nameFilter,
    this.marketCds,
    this.industries,
    this.quotesIndicators,
    this.financialIndicators,
    this.technicalIndicators,
    this.orderFieldType = 2,
    this.orderType = 3,
  });

  factory ScreenerModel.fromScreenerAPI(Screeeners screeeners) {
    final List<ScreenerOption> _marketCds = <ScreenerOption>[];
    final List<ScreenerOption> _industries = <ScreenerOption>[];
    final List<ScreenerOption> _quotesIndicators = <ScreenerOption>[];
    final List<ScreenerOption> _financialIndicators = <ScreenerOption>[];
    final List<ScreenerOption> _technicalIndicators = <ScreenerOption>[];
    if (screeeners.screenerFilter != null &&
        screeeners.screenerFilter!.isNotEmpty) {
      for (final ScreenerFilter filter in screeeners.screenerFilter!) {
        switch (filter.groupCd) {
          case 1:
            // market
            {
              if (filter.key != null) {
                if (filter.key!.toLowerCase().contains('market')) {
                  if (filter.options != null && filter.options!.isNotEmpty) {
                    for (final OptionModel optionModel in filter.options!) {
                      _marketCds.add(ScreenerOption(
                          id: optionModel.value,
                          nameEN: optionModel.name,
                          nameVI: optionModel.name));
                    }
                  }
                } else if (filter.key!.toLowerCase().contains('indus')) {
                  if (filter.options != null && filter.options!.isNotEmpty) {
                    for (final OptionModel optionModel in filter.options!) {
                      _industries.add(ScreenerOption(
                          id: optionModel.value,
                          nameEN: optionModel.name,
                          nameVI: optionModel.name));
                    }
                  }
                }
              }
            }
            break;
          case 2:
            // quotesIndicators
            {
              if (filter.key != null) {
                _quotesIndicators.add(ScreenerOption(
                  nameEN: filter.name,
                  nameVI: filter.name,
                  id: filter.key,
                  fromPrice: filter.minValue,
                  toPrice: filter.maxValue,
                  unitEN: filter.unit,
                  unitVI: filter.unit,
                ));
              }
            }
            break;
          case 3:
            // financialIndicators
            {
              if (filter.key != null) {
                _financialIndicators.add(ScreenerOption(
                  nameEN: filter.name,
                  nameVI: filter.name,
                  id: filter.key,
                  fromPrice: filter.minValue,
                  toPrice: filter.maxValue,
                  unitEN: filter.unit,
                  unitVI: filter.unit,
                ));
              }
            }
            break;
          case 4:
            // technicalIndicators
            {
              if (filter.key != null) {
                _technicalIndicators.add(ScreenerOption(
                  nameEN: filter.name,
                  nameVI: filter.name,
                  id: filter.key,
                ));
              }
            }
            break;
          default:
            break;
        }
      }
    }

    return ScreenerModel(
      idFilter: screeeners.screenerId.toString(),
      nameFilter: screeeners.screener?.name,
      marketCds: _marketCds,
      industries: _industries,
      quotesIndicators: _quotesIndicators,
      financialIndicators: _financialIndicators,
      technicalIndicators: _technicalIndicators,
    );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'screener': <String, dynamic>{'name': nameFilter},
        'screenerFilter': <Map<String, dynamic>>[
          if (marketCds != null && marketCds!.isNotEmpty)
            ScreenerFilter(
                    groupCd: 1,
                    type: 2,
                    name: 'Sàn',
                    key: 'MarketCode',
                    options: marketCds!
                        .map((ScreenerOption e) =>
                            OptionModel(value: e.id!, name: e.nameVI!))
                        .toList())
                .toMapScreenerModel(),
          if (industries != null && industries!.isNotEmpty)
            ScreenerFilter(
                    groupCd: 1,
                    type: 2,
                    name: 'Ngành',
                    key: 'Industry',
                    options: marketCds!
                        .map((ScreenerOption e) =>
                            OptionModel(value: e.id!, name: e.nameVI!))
                        .toList())
                .toMapScreenerModel(),
          if (quotesIndicators != null && quotesIndicators!.isNotEmpty)
            ...quotesIndicators!.map((ScreenerOption e) => ScreenerFilter(
                    groupCd: 2,
                    type: 1,
                    name: e.nameVI,
                    key: e.id,
                    minValue: e.fromPrice,
                    maxValue: e.toPrice,
                    unit: e.unitVI)
                .toMapScreenerModel()),
          if (financialIndicators != null && financialIndicators!.isNotEmpty)
            ...financialIndicators!.map((ScreenerOption e) => ScreenerFilter(
                    groupCd: 3,
                    type: 1,
                    name: e.nameVI,
                    key: e.id,
                    minValue: e.fromPrice,
                    maxValue: e.toPrice,
                    unit: e.unitVI)
                .toMapScreenerModel()),
          if (technicalIndicators != null && technicalIndicators!.isNotEmpty)
            ...technicalIndicators!.map((ScreenerOption e) => ScreenerFilter(
                  groupCd: 4,
                  type: 3,
                  name: e.nameVI,
                  key: e.id,
                ).toMapScreenerModel()),
        ],
      };

  /// ==============================================================

  String? idFilter;
  String? nameFilter;
  List<ScreenerOption>? marketCds;
  List<ScreenerOption>? industries;
  List<ScreenerOption>? quotesIndicators;
  List<ScreenerOption>? financialIndicators;
  List<ScreenerOption>? technicalIndicators;

  /// [orderFieldType] `1`:Mã CK, `2`:Giá, `3`:Phần trăm thay đổi, `4`:Vốn hóa, `5`:P/B, `6`:P/E, `7`:Net Sales, `8`:ROE,` 9`:ROA, `10`: EPS
  int orderFieldType;

  /// [orderType] `1`: Tăng dần, `2`: Giảm dần, `3`: None (default)
  int orderType;

  /// --------------------------------------------------------------

  // Sàn
  // id : Danh sách mã chỉ số, cách nhau bởi dấu phẩy (,) VD 100,200
  String? get listIdMarket => marketCds == null || marketCds!.isEmpty
      ? null
      : marketCds!.map((ScreenerOption e) => e.id).toList().join(',');
  // list name
  String? get marketIDstr => marketCds == null || marketCds!.isEmpty
      ? null
      : marketCds!.map((ScreenerOption e) => e.nameVI).toList().join(', ');

  // Nganh
  // id : Danh sách ngành nghề, phân cách bởi dấu phẩy (,) VD 100,101,103
  String? get listIdIndustries => industries == null || industries!.isEmpty
      ? null
      : industries!.map((ScreenerOption e) => e.id).toList().join(',');
  // list name
  String? get industriesStr => industries == null || industries!.isEmpty
      ? null
      : industries!
          .map((ScreenerOption e) => e.nameOptionMultiLang)
          .toList()
          .join(', ');

  //quotes
  // id : format: CHANGE_PERCENT(0,2);PRICE(12,25) các chỉ số ngăn cách bởi dấu chấm phẩy (;).
  // Danh sách bao gồm PRICE,CHANGE_PERCENT,VOLUME,MARKET_CAP,TURN_OVER_RATE
  String? get listIdQuotes =>
      quotesIndicators == null || quotesIndicators!.isEmpty
          ? null
          : quotesIndicators!
              .map((ScreenerOption e) => '${e.id}(${e.fromPrice},${e.toPrice})')
              .toList()
              .join(';');
  // list name
  String? get quotesStr => quotesIndicators == null || quotesIndicators!.isEmpty
      ? null
      : quotesIndicators!
          .map((ScreenerOption e) =>
              '${e.nameOptionMultiLang}(${e.fromPrice} ~ ${e.toPrice})')
          .toList()
          .join(', ');

  // financial
  // format: PE(1,2);EPS(12,25) các chỉ số ngăn cách bởi dấu chấm phẩy (;).
  // Danh sách bao gồm: PE,EPS,DIVIDENDS,ROE,ROA,DIVIDEND_YIELD,PE_TTM,NET_MARGIN,DEBT_ASSET
  String? get listIdFinancial =>
      financialIndicators == null || financialIndicators!.isEmpty
          ? null
          : financialIndicators!
              .map((ScreenerOption e) => '${e.id}(${e.fromPrice},${e.toPrice})')
              .toList()
              .join(';');
  // list name
  String? get financialStr =>
      financialIndicators == null || financialIndicators!.isEmpty
          ? null
          : financialIndicators!
              .map((ScreenerOption e) =>
                  '${e.nameOptionMultiLang}(${e.fromPrice} ~ ${e.toPrice})')
              .toList()
              .join(', ');

  // technical
  // format 1,2,3... trong đó 1: MACD, 2: KDJ, 3: RSI6, 4: RSI24, 5: ThreeWhiteSolider, 6: MA5CrossMA10
  String? get listIdTechnical => technicalIndicators == null ||
          technicalIndicators!.isEmpty
      ? null
      : technicalIndicators!.map((ScreenerOption e) => e.id).toList().join(',');
  // list name
  String? get technicalStr =>
      technicalIndicators == null || technicalIndicators!.isEmpty
          ? null
          : technicalIndicators!
              .map((ScreenerOption e) => e.nameOptionMultiLang)
              .toList()
              .join(', ');
}

class ScreenerOption with BaseMixin {
  ScreenerOption({
    this.id,
    this.nameVI,
    this.nameEN,
    this.fromPrice,
    this.toPrice,
    this.minValue,
    this.maxValue,
    this.unitVI,
    this.unitEN,
  });

  String? id;
  String? nameEN;
  String? nameVI;
  num? fromPrice;
  num? toPrice;
  num? minValue;
  num? maxValue;
  String? unitVI;
  String? unitEN;

  // truong hợp Tiếng anh null =>lấy Tiếng việt
  String get nameOptionMultiLang => (vn ? nameVI : nameEN ?? nameVI) ?? '';

  //
  String get unitMultiLang => (vn ? unitVI : unitEN ?? unitVI) ?? '';
}
