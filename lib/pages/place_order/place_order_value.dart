import 'package:flutter_mobile/global/app_enum.dart';

class PlaceOrderValue {
  List<TradeType> get statusTradeType =>
      <TradeType>[TradeType.NONE, TradeType.BUY, TradeType.SELL];

  final List<String> quickOrderList = <String>[
    'MOK',
    'MAK',
    'PLO',
    'MTL',
    'ATC'
  ];

  final List<String> quickOrderListMarketCD100 = <String>['ATO', 'MP', 'ATC'];

  final List<double> selectMassList = <double>[
    100,
    200,
    500,
    1000,
    5000,
    10000,
    50000,
    100000
  ];
}
