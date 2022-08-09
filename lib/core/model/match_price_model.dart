import 'package:flutter_mobile/core/model/match_model.dart';

class MatchPriceModel {
  MatchPriceModel({
    required this.match,
    this.basicPrice,
    this.floorPrice,
    this.ceilingPrice,
  });

  late List<MatchModel> match;
  bool? dataWithApi = false;
  num min = 0;
  num max = 0;
  final num? basicPrice;
  final num? floorPrice;
  final num? ceilingPrice;
}
