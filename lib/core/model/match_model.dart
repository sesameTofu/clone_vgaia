import 'package:flutter_mobile/global/app_enum.dart';

class MatchModel {
  MatchModel(
      {required this.matTime,
      required this.matPrice,
      required this.matQtty,
      required this.tradeType});

  MatchModel copyWith(num value) {
    return MatchModel(
        matTime: matTime,
        matPrice: matPrice,
        matQtty: value,
        tradeType: tradeType);
  }

  final String matTime;

  final num matPrice;

  final num matQtty;

  final TradeType tradeType;
  late num volPercent;
}
