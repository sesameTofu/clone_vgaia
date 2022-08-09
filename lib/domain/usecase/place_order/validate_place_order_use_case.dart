import 'package:flutter_mobile/core/model/stock_info_model.dart';
import 'package:flutter_mobile/core/model/stock_item_model.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/domain/model/place_order/buying_power_data.dart';
import 'package:flutter_mobile/domain/model/place_order/prepare_order_rq.dart';
import 'package:flutter_mobile/global/app_const.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';

class ValidatePlaceOrderUseCase {
  // check valied value place order
  EnumErrorPlaceOrder? checkValiedPlaceOrder(
      {required PrepareSubmitOrder prepareSubmitOrder,
      required StockInfoModel? stockInfoModel,
      required BuyingPowerData? buyingPower}) {
    if (isNullOrEmpty(prepareSubmitOrder.secCd)) {
      return EnumErrorPlaceOrder.errorStock;
    }

    if (stockInfoModel == null) {
      // 'Không tìm thấy thông tin mã chứng khoán';
      return EnumErrorPlaceOrder.errorInforStock;
    }

    if (isNullOrEmpty(prepareSubmitOrder.subAccoNo)) {
      return EnumErrorPlaceOrder.errorAccount;
    }

    if (prepareSubmitOrder.tradeType == null) {
      return EnumErrorPlaceOrder.errorTradeType;
    }

    // final num? orderPrice = prepareSubmitOrder.orderPrice;
    // final num? orderVolume = prepareSubmitOrder.orderQty;

    // if (prepareSubmitOrder.placeOrderType == PlaceOrderType.OrderNormal) {
    //   if (orderPrice == null || orderPrice == 0) {
    //     return EnumErrorPlaceOrder.errorPrice;
    //   }

    //   if (orderPrice < (stockInfoModel.floorPriceCore ?? 0)) {
    //     return EnumErrorPlaceOrder.errorPriceLessThanFloorPrice;
    //   } else if (orderPrice > (stockInfoModel.ceilingPriceCore ?? 0)) {
    //     return EnumErrorPlaceOrder.errorPriceGreaterThanCeilingPrice;
    //   }

    //   if (!isRoundPriceFromIndex(
    //       index: prepareSubmitOrder.index, price: orderPrice)) {
    //     return EnumErrorPlaceOrder.errorRoundPrice;
    //   }
    // }

    // if (orderVolume == null) {
    //   return EnumErrorPlaceOrder.errorVolume;
    // }
    // if (orderVolume == 0) {
    //   return EnumErrorPlaceOrder.errorVolumeZerro;
    // }

    // if (!isRoundVolumeFromIndex(
    //     index: prepareSubmitOrder.index, volume: orderVolume)) {
    //   return EnumErrorPlaceOrder.errorRoundVolume;
    // }

    if (prepareSubmitOrder.placeOrderType == PlaceOrderType.OrderNormal) {
      if (prepareSubmitOrder.orderPrice == null ||
          prepareSubmitOrder.orderPrice == 0) {
        return EnumErrorPlaceOrder.errorPrice;
      }
    }
    if (buyingPower == null) {
      return EnumErrorPlaceOrder.errorBuyingPow;
    }

    return null;
  }

  EnumErrorPlaceOrder? checkPrice({
    required PrepareSubmitOrder prepareSubmitOrder,
    required StockInfoModel? stockInfoModel,
    required StockItemModel? stockItemModel,
    bool isSubmit = false,
  }) {
    final num orderPrice = prepareSubmitOrder.orderPrice ?? 0;

    if (isNotNullOrEmpty(prepareSubmitOrder.secCd)) {
      if (prepareSubmitOrder.placeOrderType == PlaceOrderType.OrderNormal) {
        if (prepareSubmitOrder.orderPrice == null ||
            prepareSubmitOrder.orderPrice == 0) {
          return EnumErrorPlaceOrder.errorPrice;
        }

        if (orderPrice > 0) {
          if (orderPrice < (stockInfoModel?.floorPrice ?? 0)) {
            return EnumErrorPlaceOrder.errorPriceLessThanFloorPrice;
          } else if (orderPrice > (stockInfoModel?.ceilingPrice ?? 0)) {
            return EnumErrorPlaceOrder.errorPriceGreaterThanCeilingPrice;
          }

          if (!isRoundPriceFromIndex(
              index: prepareSubmitOrder.index,
              price: orderPrice,
              stockItemModel: stockItemModel)) {
            return EnumErrorPlaceOrder.errorRoundPrice;
          }
        }
      }
    }
    return null;
  }

  EnumErrorPlaceOrder? checkOrderVolume(
      {required PrepareSubmitOrder prepareSubmitOrder,
      required BuyingPowerData? buyingPower,
      required num? maxQtty,
      bool isSubmit = false,
      bool placeOrder = true}) {
    if (isSubmit) {
      if (prepareSubmitOrder.orderQty == null) {
        return EnumErrorPlaceOrder.errorVolume;
      }

      if (prepareSubmitOrder.orderQty == 0) {
        return EnumErrorPlaceOrder.errorVolumeZerro;
      }
    }
    final num orderVolume = prepareSubmitOrder.orderQty ?? 0;
    EnumErrorPlaceOrder? errorPlaceOrder;

    if (orderVolume > 0) {
      errorPlaceOrder = isRoundVolumeFromIndex(
          index: prepareSubmitOrder.index,
          volume: orderVolume,
          orderType: prepareSubmitOrder.orderType);
      if (errorPlaceOrder != null) {
        return errorPlaceOrder;
      }
    }

    if (placeOrder) {
      if (buyingPower != null && maxQtty != null) {
        if ((prepareSubmitOrder.orderQty ?? 0) <= maxQtty) {
          return null;
        }

        return EnumErrorPlaceOrder.errorMaxTotalQuantity;
      } else if (isNotNullOrEmpty(prepareSubmitOrder.secCd)) {
        return EnumErrorPlaceOrder.errorBuyingPow;
      }
    } else {
      if (prepareSubmitOrder.index == Index.HOSE) {
        if (orderVolume > AppConst.hsxMaxQtty) {
          return EnumErrorPlaceOrder.errorMaxVolumeHose;
        }
      } else {
        if (orderVolume > AppConst.hnxAndUpComeMaxQtty) {
          return EnumErrorPlaceOrder.errorMaxVolume;
        }
      }
    }

    return null;
  }

  bool isRoundPriceFromIndex(
      {Index? index,
      required num price,
      required StockItemModel? stockItemModel}) {
    bool isRound = false;
    if (stockItemModel?.secType == SecType.E) {
      isRound = isRoundStepSlide((price * 1000).round(), 10);
    } else {
      switch (index) {
        // HSX_LISTED => HOSE
        case Index.HOSE:
          // Bước giá theo khoảng
          if (price < 10) {
            isRound = isRoundStepSlide((price * 1000).round(), 10);
          } else if (price >= 10.0 && price < 50.0) {
            isRound = isRoundStepSlide((price * 1000).round(), 50);
          } else {
            isRound = isRoundStepSlide((price * 1000).round(), 100);
          }
          break;
        // Sàn HNX, Upcom: Bước giá là 0.1
        default:
          isRound = isRoundStepSlide((price * 1000).round(), 100);
      }
    }

    if (!isRound) {
      AppToast.showWarning(LocaleKeys.error_step_error.tr);
    }
    return isRound;
  }

  bool isRoundStepSlide(num price, num step) {
    final num value1 = price ~/ step;
    final num value2 = price / step;
    return value1 == value2;
  }

  EnumErrorPlaceOrder? isRoundVolumeFromIndex(
      {Index? index, required String? orderType, required num volume}) {
    switch (index) {
      case Index.HOSE:
      // // Lô 100
      // if (volume % 100 != 0) {
      //   AppToast.showWarning(LocaleKeys.error_volume_not_round.tr);
      //   return EnumErrorPlaceOrder.errorRoundVolume;
      // }
      // return null;
      case Index.HNX:
      case Index.UPCOM:
        // Lô chẵn 100, Lô lẻ 1-99
        if (volume > 100 && volume % 100 != 0) {
          return EnumErrorPlaceOrder.errorRoundVolume;
        }

        if (orderType != 'LO' && volume % 100 != 0) {
          return EnumErrorPlaceOrder.errorRoundVolumeRequestLO;
        }

        return null;
      default:
        return null;
    }
  }

  EnumErrorPlaceOrder? checkMarketSession({
    required PrepareSubmitOrder prepareOrder,
    required MarketStatusSession? marketStatusSessionWithIndex,
  }) {
    if (marketStatusSessionWithIndex == null ||
        marketStatusSessionWithIndex == MarketStatusSessionWithIndex.NONE) {
      return EnumErrorPlaceOrder.errorSessionOrder;
    }
    if (marketStatusSessionWithIndex ==
            MarketStatusSessionWithIndex.CLOSED_UPCOM ||
        marketStatusSessionWithIndex ==
            MarketStatusSessionWithIndex.CLOSED_HNX) {
      return EnumErrorPlaceOrder.errorSessionClose;
    }

    final List<String>? quickOrderList =
        marketStatusSessionWithIndex.quickOrderList(index: prepareOrder.index!);

    if (isNullOrEmpty(quickOrderList)) {
      return EnumErrorPlaceOrder.errorTimeOrder;
    }

    if (!(quickOrderList ?? <String>[]).contains(prepareOrder.orderType)) {
      return EnumErrorPlaceOrder.errorTimeOrderPrice;
    }
    return null;
  }

  // check valied value place order
  EnumErrorPlaceOrder? checkValiedPlaceOrdeCondition(
      {required PrepareSubmitOrder prepareSubmitOrder,
      required StockInfoModel? stockInfoModel}) {
    final PlaceOrderType placeOrderType = prepareSubmitOrder.placeOrderType;
    // Lệnh điều kiện cắt lỗ và chốt lời chỉ cho phép đặt lệnh bán
    if (placeOrderType == PlaceOrderType.StopLoss ||
        placeOrderType == PlaceOrderType.TakeProfit) {
      if (prepareSubmitOrder.tradeType == TradeType.BUY) {
        return EnumErrorPlaceOrder.errorTradeTypeBuy;
      }
      if ((prepareSubmitOrder.activePrice ?? 0) <= 0) {
        return EnumErrorPlaceOrder.errorActivePrice;
      }
      if ((prepareSubmitOrder.orderPriceConditionNumber ?? 0) <= 0) {
        return EnumErrorPlaceOrder.errorOrderPrice;
      }
    }
    // check giá tham chiếu: ( nếu chọn giá điều kiện với lệnh trước ngày)
    if (placeOrderType == PlaceOrderType.BeforeDay &&
        prepareSubmitOrder.orderPriceCondition ==
            OrderPriceCondition.referencePrice) {
      if ((prepareSubmitOrder.referencePrice ?? 0) <= 0) {
        return EnumErrorPlaceOrder.errorBasicPrice;
      }
    }

    // Lệnh xu hướng : check giá trị khoảng dừng
    if (placeOrderType == PlaceOrderType.Tendency &&
        (prepareSubmitOrder.spreadValue ?? 0) <= 0) {
      return EnumErrorPlaceOrder.errorSpreadValue;
    }

    return null;
  }
}


// import 'package:flutter_mobile/core/model/stock_info_model.dart';
// import 'package:flutter_mobile/core_support/enum/core_enum.dart';
// import 'package:flutter_mobile/domain/model/account_infor/account_infor.dart';
// import 'package:flutter_mobile/domain/model/place_order/prepare_order_rq.dart';
// import 'package:flutter_mobile/global/app_enum.dart';
// import 'package:flutter_mobile/global/app_toast.dart';
// import 'package:flutter_mobile/import.dart';
// import 'package:flutter_mobile/utils/functs.dart';

// class ValidatePlaceOrderUseCase {
//   // check valied value place order
//   EnumErrorPlaceOrder? checkValiedPlaceOrder(
//       {required PrepareSubmitOrder prepareSubmitOrder,
//       required StockInfoModel? stockInfoModel,
//       required AccountInfor? accountInfo}) {
//     if (isNullOrEmpty(prepareSubmitOrder.secCd)) {
//       return EnumErrorPlaceOrder.errorStock;
//     }

//     if (stockInfoModel == null) {
//       // 'Không tìm thấy thông tin mã chứng khoán';
//       return EnumErrorPlaceOrder.errorInforStock;
//     }

//     if (isNullOrEmpty(prepareSubmitOrder.subAccoNo)) {
//       return EnumErrorPlaceOrder.errorAccount;
//     }
//     if (accountInfo == null) {
//       return EnumErrorPlaceOrder.errorInforAccount;
//     }

//     if (prepareSubmitOrder.tradeType == null) {
//       return EnumErrorPlaceOrder.errorTradeType;
//     }

//     final num? orderPrice = prepareSubmitOrder.orderPrice;
//     final num? orderVolume = prepareSubmitOrder.orderQty;

//     if (prepareSubmitOrder.placeOrderType == PlaceOrderType.OrderNormal) {
//       if (orderPrice == null || orderPrice == 0) {
//         return EnumErrorPlaceOrder.errorPrice;
//       }

//       if (prepareSubmitOrder.placeOrderType != PlaceOrderType.BeforeDay) {
//         if (orderPrice < (stockInfoModel.floorPrice ?? 0)) {
//           return EnumErrorPlaceOrder.errorPriceLessThanFloorPrice;
//         } else if (orderPrice > (stockInfoModel.ceilingPrice ?? 0)) {
//           return EnumErrorPlaceOrder.errorPriceGreaterThanCeilingPrice;
//         }
//       }

//       if (!isRoundPriceFromIndex(
//           index: prepareSubmitOrder.index, price: orderPrice)) {
//         return EnumErrorPlaceOrder.errorRoundPrice;
//       }
//     } else if (prepareSubmitOrder.placeOrderType == PlaceOrderType.TakeProfit ||
//         prepareSubmitOrder.placeOrderType == PlaceOrderType.StopLoss ||
//         prepareSubmitOrder.placeOrderType == PlaceOrderType.BeforeDay) {
//       if (orderPrice == null || orderPrice == 0) {
//         return EnumErrorPlaceOrder.errorOrderPrice;
//       }
//       if (!isRoundPriceFromIndex(
//           index: prepareSubmitOrder.index, price: orderPrice)) {
//         return EnumErrorPlaceOrder.errorRoundPrice;
//       }
//     }

//     if (orderVolume == null) {
//       return EnumErrorPlaceOrder.errorVolume;
//     }
//     if (orderVolume == 0) {
//       return EnumErrorPlaceOrder.errorVolumeZerro;
//     }

//     if (!isRoundVolumeFromIndex(
//         index: prepareSubmitOrder.index, volume: orderVolume)) {
//       return EnumErrorPlaceOrder.errorRoundVolume;
//     }

//     return null;
//   }

//   // check valied value place order
//   EnumErrorPlaceOrder? checkValiedPlaceOrdeCondition(
//       {required PrepareSubmitOrder prepareSubmitOrder,
//       required StockInfoModel? stockInfoModel,
//       required AccountInfor? accountInfo}) {
//     final PlaceOrderType placeOrderType = prepareSubmitOrder.placeOrderType;
//     // Lệnh điều kiện cắt lỗ và chốt lời chỉ cho phép đặt lệnh bán
//     if (placeOrderType == PlaceOrderType.StopLoss ||
//         placeOrderType == PlaceOrderType.TakeProfit) {
//       if (prepareSubmitOrder.tradeType == TradeType.BUY) {
//         return EnumErrorPlaceOrder.errorTradeTypeBuy;
//       }
//       if ((prepareSubmitOrder.activePrice ?? 0) <= 0) {
//         return EnumErrorPlaceOrder.errorActivePrice;
//       }
//       if ((prepareSubmitOrder.orderPriceConditionNumber ?? 0) <= 0) {
//         return EnumErrorPlaceOrder.errorOrderPrice;
//       }
//     }
//     // check giá tham chiếu: ( nếu chọn giá điều kiện với lệnh trước ngày)
//     if (placeOrderType == PlaceOrderType.BeforeDay &&
//         prepareSubmitOrder.orderPriceCondition ==
//             OrderPriceCondition.referencePrice) {
//       if ((prepareSubmitOrder.referencePrice ?? 0) <= 0) {
//         return EnumErrorPlaceOrder.errorBasicPrice;
//       }
//     }

//     // Lệnh xu hướng : check giá trị khoảng dừng
//     if (placeOrderType == PlaceOrderType.Tendency &&
//         (prepareSubmitOrder.spreadValue ?? 0) <= 0) {
//       return EnumErrorPlaceOrder.errorSpreadValue;
//     }

//     return null;
//   }

//   bool isRoundPriceFromIndex({Index? index, required num price}) {
//     bool isRound = false;
//     switch (index) {
//       // HSX_LISTED => HOSE
//       case Index.HOSE:
//         // Bước giá theo khoảng
//         if (price < 10) {
//           isRound = isRoundStepSlide((price * 1000).round(), 10);
//         } else if (price >= 10.0 && price < 50.0) {
//           isRound = isRoundStepSlide((price * 1000).round(), 50);
//         } else {
//           isRound = isRoundStepSlide((price * 1000).round(), 100);
//         }
//         break;
//       // Sàn HNX, Upcom: Bước giá là 0.1
//       default:
//         isRound = isRoundStepSlide((price * 1000).round(), 100);
//     }
//     if (!isRound) {
//       AppToast.showWarning(LocaleKeys.error_step_error.tr);
//     }
//     return isRound;
//   }

//   bool isRoundStepSlide(num price, num step) {
//     final num value1 = price ~/ step;
//     final num value2 = price / step;
//     return value1 == value2;
//   }

//   bool isRoundVolumeFromIndex(
//       {Index? index, required num volume, bool isShowErrorNoExchange = true}) {
//     switch (index) {
//       case Index.HOSE:
//         // Lô 100
//         if (volume % 100 != 0) {
//           AppToast.showWarning(LocaleKeys.error_volume_not_round.tr);
//           return false;
//         }
//         return true;
//       case Index.HNX:
//       case Index.UPCOM:
//         // Lô chẵn 100, Lô lẻ 1-99
//         if (volume > 100 && volume % 100 != 0) {
//           AppToast.showWarning(LocaleKeys.error_volume_not_round.tr);
//           return false;
//         }
//         return true;
//       default:
//         if (isShowErrorNoExchange) {
//           AppToast.showWarning(LocaleKeys.error_exchange_illegal.tr);
//         }
//         return false;
//     }
//   }
// }
