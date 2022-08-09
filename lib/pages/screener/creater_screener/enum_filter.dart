import 'package:flutter_mobile/domain/model/screener/screener_model.dart';

enum TypeScreenerView { market, industries, quotes, financia, technical }

extension ExtenxionTypeScreener on TypeScreenerView {
  //
  String get titleBottomSheet {
    switch (this) {
      case TypeScreenerView.market:
        return 'Sàn';
      case TypeScreenerView.industries:
        return 'Ngành';
      case TypeScreenerView.quotes:
        return 'Quotes';
      case TypeScreenerView.financia:
        return 'Financia';
      case TypeScreenerView.technical:
        return 'Technical';
      default:
        return '';
    }
  }

  //
  List<ScreenerOption> get listData {
    switch (this) {
      case TypeScreenerView.market:
        return _EnumScreener.listMarket;
      case TypeScreenerView.quotes:
        return _EnumScreener.listQuotes;
      case TypeScreenerView.financia:
        return _EnumScreener.listFinancial;
      case TypeScreenerView.technical:
        return _EnumScreener.listTechnicalIndicators;
      case TypeScreenerView.industries: // lấy từ API
      default:
        return <ScreenerOption>[];
    }
  }
}

class _EnumScreener {
// list MARKET
  static List<ScreenerOption> listMarket = <ScreenerOption>[
    ScreenerOption(id: '100', nameVI: 'HOSE', nameEN: 'HOSE'),
    ScreenerOption(id: '200', nameVI: 'HNX', nameEN: 'HNX'),
    ScreenerOption(id: '300', nameVI: 'UPCOM', nameEN: 'UPCOM'),
  ];

// list QUOTES INDICATIOR
  static List<ScreenerOption> listQuotes = <ScreenerOption>[
    ScreenerOption(
        id: 'CHANGE_PERCENT',
        minValue: -30,
        maxValue: 30,
        unitEN: '%',
        unitVI: '%',
        nameEN: 'Change percent',
        nameVI: '% Thay đổi'),
    ScreenerOption(
        id: 'PRICE',
        minValue: 0,
        maxValue: 500000,
        unitEN: 'VND',
        unitVI: 'VND',
        nameEN: 'Price',
        nameVI: 'Giá'),
    ScreenerOption(
        id: 'VOLUME',
        minValue: 0,
        maxValue: 100000000,
        // unitEN: 'VND',
        // unitVI: 'VND',
        nameEN: 'Volume',
        nameVI: 'Khối Lượng'),
    // ScreenerOption(
    //     id: 'MARKET_CAP',
    //     minValue: 0,
    //     maxValue: 999999999,
    //     // unitEN: 'VND',
    //     // unitVI: 'VND',
    //     nameEN: 'ScreenerOption Cap',
    //     nameVI: 'ScreenerOption Cap'),
    // ScreenerOption(
    //     id: 'TURN_OVER_RATE',
    //     minValue: 0,
    //     maxValue: 999999999,
    //     // unitEN: 'VND',
    //     // unitVI: 'VND',
    //     nameEN: 'Turn over rate',
    //     nameVI: 'Turn over rate'),
  ];

// list financialIndicators
  static List<ScreenerOption> listFinancial = <ScreenerOption>[
    ScreenerOption(
        id: 'PE',
        minValue: 0,
        maxValue: 100,
        // unitEN: '%',
        // unitVI: '%',
        nameEN: 'P/E',
        nameVI: 'P/E'),
    ScreenerOption(
        id: 'PB',
        minValue: 0,
        maxValue: 100,
        // unitEN: '%',
        // unitVI: '%',
        nameEN: 'P/B',
        nameVI: 'P/B'),
    ScreenerOption(
        id: 'EPS',
        minValue: 0,
        maxValue: 100,
        // unitEN: '%',
        // unitVI: '%',
        nameEN: 'EPS',
        nameVI: 'EPS'),
    ScreenerOption(
        id: 'DIVIDENDS',
        minValue: 0,
        maxValue: 100,
        unitEN: '%',
        unitVI: '%',
        nameEN: 'DIVIDENDS',
        nameVI: 'TL cổ tức'),
    ScreenerOption(
        id: 'ROE',
        minValue: 0,
        maxValue: 100,
        unitEN: '%',
        unitVI: '%',
        nameEN: 'ROE',
        nameVI: 'ROE'),
    ScreenerOption(
        id: 'ROA',
        minValue: 0,
        maxValue: 100,
        unitEN: '%',
        unitVI: '%',
        nameEN: 'ROA',
        nameVI: 'ROA'),
    // ScreenerOption(
    //     id: 'DIVIDEND_YIELD',
    //     minValue: 0,
    //     maxValue: 100,
    //     // unitEN: '%',
    //     // unitVI: '%',
    //     nameEN: 'PDIVIDEND_YIELDE',
    //     nameVI: 'DIVIDEND_YIELD'),
    // ScreenerOption(
    //     id: 'PE_TTM',
    //     minValue: 0,
    //     maxValue: 100,
    //     // unitEN: '%',
    //     // unitVI: '%',
    //     nameEN: 'PE_TTM',
    //     nameVI: 'PE_TTM'),
    // ScreenerOption(
    //     id: 'NET_MARGIN',
    //     minValue: 0,
    //     maxValue: 100,
    //     // unitEN: '%',
    //     // unitVI: '%',
    //     nameEN: 'NET_MARGIN',
    //     nameVI: 'NET_MARGIN'),
    // ScreenerOption(
    //     id: 'DEBT_ASSET',
    //     minValue: 0,
    //     maxValue: 100,
    //     // unitEN: '%',
    //     // unitVI: '%',
    //     nameEN: 'DEBT_ASSET',
    //     nameVI: 'DEBT_ASSET'),
  ];

// list technicalIndicators
  static List<ScreenerOption> listTechnicalIndicators = <ScreenerOption>[
    ScreenerOption(id: '1', nameEN: 'MACD Cross', nameVI: 'MACD Cross'),
    ScreenerOption(id: '2', nameEN: 'KDJ', nameVI: 'KDJ'),
    ScreenerOption(id: '3', nameEN: 'RSI6', nameVI: 'RSI6 quá bán'),
    ScreenerOption(id: '4', nameEN: 'RSI24', nameVI: 'RSI24 quá bán'),
    ScreenerOption(
        id: '5', nameEN: 'Three White Solider', nameVI: 'Ba chàng lính trắng'),
    ScreenerOption(id: '6', nameEN: 'MA5CrossMA10', nameVI: 'MA5 cắt MA10'),
  ];
}
