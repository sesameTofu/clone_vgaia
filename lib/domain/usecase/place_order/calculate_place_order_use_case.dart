import 'package:flutter_mobile/core/model/stock_info_model.dart';
import 'package:flutter_mobile/core/model/stock_item_model.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/global/app_enum.dart';

class CalculatePlaceOrderUseCase {
  num caluateIncrementAndDecrementPrice(
      {required Index? index,
      required num? price,
      required StockInfoModel? ticketInfor,
      required StockItemModel? stockItemModel,
      required TypeCalcalator type}) {
    final num value = roundPriceFromMarket(index, price ?? 0, type,
        stockItemModel: stockItemModel);
    if (ticketInfor == null) {
      return value;
    }
    final num floorPrice = ticketInfor.floorPrice ?? 0;
    final num ceilingPrice = ticketInfor.ceilingPrice ?? 0;
    final num currentPrice = price ?? 0;

    if (value > ceilingPrice) {
      if (currentPrice > 0) {}
      return ceilingPrice;
    }
    if (value < floorPrice) {
      if (currentPrice > 0) {}

      return floorPrice;
    }
    return value;
  }

  num caluateIncrementAndDecrementPriceCondition(
      {required num price, required TypeCalcalator type}) {
    if (type == TypeCalcalator.decrement) {
      return price - 0.1;
    } else {
      return price + 0.1;
    }
  }

  double roundPriceFromMarket(Index? index, num price, TypeCalcalator type,
      {required StockItemModel? stockItemModel}) {
    if (stockItemModel?.secType == SecType.E) {
      return roundStep((price * 1000).round(), 10, type).toDouble();
    } else {
      switch (index) {
        // HSX_LISTED => HOSE
        case Index.HOSE:
          // Bước giá theo khoảng
          if (price < 10) {
            return roundStep((price * 1000).round(), 10, type).toDouble();
          } else if (price >= 10.0 && price < 50.0) {
            return roundStep((price * 1000).round(), 50, type).toDouble();
          }
          return roundStep((price * 1000).round(), 100, type).toDouble();
        // Sàn HNX, Upcom: Bước giá là 0.1
        default:
          return roundStep((price * 1000).round(), 100, type).toDouble();
      }
    }
  }

  num roundStep(num price, num step, TypeCalcalator type) {
    final num value1 = price ~/ step;
    final num value2 = price / step;
    if (value1 == value2) {
      if (type == TypeCalcalator.decrement) {
        return ((value1 - 1) * step) / 1000;
      } else {
        return ((value1 + 1) * step) / 1000;
      }
    } else {
      if (type == TypeCalcalator.decrement) {
        return (value1 * step) / 1000;
      } else {
        return ((value1 + 1) * step) / 1000;
      }
    }
  }

  num caluateIncrementAndDecrementVolume(TypeCalcalator type, String volume,
      {double stepVolume = 100}) {
    if (type == TypeCalcalator.increment) {
      return updateVolume(stepVolume, volume, type);
    } else {
      return updateVolume(-stepVolume, volume, type);
    }
  }

  num updateVolume(double stepVolume, String calText, TypeCalcalator type) {
    final num _valueOrigin = calText.formatNumber();

    num _value = calText.formatNumber();
    _value += stepVolume;

    if (_value <= 0) {
      return 0;
    }
    if (_value % stepVolume != 0) {
      if (type == TypeCalcalator.increment) {
        _value = _value - _value % stepVolume;
      } else {
        _value = _valueOrigin - _value % stepVolume;
      }
    }
    return _value;
  }

  num? orderPrice(
      {required List<String> quickOrder,
      required String priceString,
      required TradeType tradeType,
      StockInfoModel? secQuotesSelect}) {
    // lenh thuong
    if (quickOrder
        .firstWhere((String element) => element == priceString,
            orElse: () => '')
        .isNotEmpty) {
      return tradeType == TradeType.BUY
          ? secQuotesSelect?.ceilingPrice
          : secQuotesSelect?.floorPrice;
    } else {
      return priceString.formatNumber();
    }
  }
}
