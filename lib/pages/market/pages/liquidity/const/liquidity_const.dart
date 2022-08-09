import 'dart:math';

import 'package:flutter_mobile/domain/model/grpc/auto_trading.pb.dart';

const List<String> listCodeConst = <String>['HSX', 'HNX', 'UpCOM', 'VN30'];

int numberCode(String code) {
  switch (code) {
    case 'HSX':
      return 100;
    case 'HNX':
      return 200;
    case 'UpCOM':
      return 101;
    case 'VN30':
      return 103;
    default:
      return 100;
  }
}

List<MarketLiquidityItem> fakeData() {
  final List<MarketLiquidityItem> dataFake = <MarketLiquidityItem>[];

  double valueT0 = 0;
  double valueT1 = 0;
  double valueT5 = 0;
  double valueT10 = 0;
  double valueT30 = 0;

  for (int i = 0; i < 53; i++) {
    if (i != 0) {
      valueT0 = valueT0 + (Random().nextInt(5) * 100000);
      valueT1 = valueT1 + (Random().nextInt(5) * 100000);
      valueT5 = valueT5 + (Random().nextInt(5) * 100000);
      valueT10 = valueT10 + (Random().nextInt(5) * 100000);
      valueT30 = valueT30 + (Random().nextInt(5) * 100000);
    }

    dataFake.add(MarketLiquidityItem(
      indexCd: 100,
      time: _time(i),
      tradeDate: 20220422,
      valueT0: valueT0,
      valueT1: valueT1,
      valueT5: valueT5,
      valueT10: valueT10,
      valueT30: valueT30,
    ));
  }

  return dataFake;
}

String _time(int i) {
  final int time = i % 12 * 5;
  final int H = (i ~/ 12) + 9;

  final String hText = H < 10 ? '0$H' : '$H';
  if (time < 10) {
    return '$hText:0$time';
  }
  return '$hText:$time';
}
