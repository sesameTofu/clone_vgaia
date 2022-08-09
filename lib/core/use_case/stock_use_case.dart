import 'package:flutter/material.dart';
import 'package:flutter_mobile/core/model/match_model.dart';
import 'package:flutter_mobile/core/model/match_price_model.dart';
import 'package:flutter_mobile/core/model/match_volume.dart';
import 'package:flutter_mobile/core/model/stock_info_model.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/global/app_enum.dart';

class StockUseCase {
  Map<Field, dynamic>? convertMatchSockData(Map<Field, dynamic> value,
      {required StockInfoModel? stockInfo,
      required List<MatchModel> listMatchQuantity,
      required List<MatchVolume> timeSale,
      required MatchPriceModel matchPriceModel}) {
    try {
      // Nếu data không phải từ lase sale không update chart
      if (value[Field.IS_LAST_SALE] == null ||
          value[Field.IS_LAST_SALE] == false) {
        return null;
      }
      //debugPrint(value.toString());
      final num? price = value[Field.MATCH_PRICE] as num?;
      final num? volume = value[Field.MATCH_QTTY] as num?;
      final num? matchTime = value[Field.MATCH_TIME] as num?;
      if (price != null) {
        matchPriceModel.match.add(MatchModel(
            matPrice: price,
            matQtty: 0,
            matTime: (matchTime ?? 0).getTimeDisp(),
            tradeType: TradeType.BUY));

        if (volume != null && volume > 0) {
          listMatchQuantity = <MatchModel>[
            (MatchModel(
                matPrice: price,
                matQtty: volume,
                matTime: (matchTime ?? 0).getTimeDisp(),
                tradeType: value[Field.SIDE] ?? TradeType.BUY)),
            ...listMatchQuantity,
          ];
        }

        if (matchPriceModel.min != 0 && matchPriceModel.max != 0) {
          if (price < matchPriceModel.min) {
            matchPriceModel.min = price;
          } else if (price > matchPriceModel.max) {
            matchPriceModel.max = price;
          }
        } else {
          matchPriceModel.min = matchPriceModel.match
              .reduce((MatchModel a, MatchModel b) =>
                  a.matPrice < b.matPrice ? a : b)
              .matPrice;
          matchPriceModel.max = matchPriceModel.match
              .reduce((MatchModel a, MatchModel b) =>
                  a.matPrice > b.matPrice ? a : b)
              .matPrice;
        }
        return <Field, dynamic>{Field.MATH_DATA: listMatchQuantity};
      } else if (volume != null && volume > 0) {
        listMatchQuantity = <MatchModel>[
          (MatchModel(
              matPrice: stockInfo?.matchPrice ?? 0,
              matQtty: volume,
              matTime: (matchTime ?? 0).getTimeDisp(),
              tradeType: value[Field.SIDE] ?? TradeType.BUY)),
          ...listMatchQuantity,
        ];

        return <Field, dynamic>{
          Field.MATH_DATA: listMatchQuantity,
          Field.MATH_DATA_PRICE: matchPriceModel
        };
      }
    } catch (errr) {
      debugPrint(errr.toString());
    }
    return null;
  }
}
