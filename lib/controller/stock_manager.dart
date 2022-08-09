import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/pages/main/main_controller.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:get/get.dart';

class StockManager {
  factory StockManager() {
    return _singleton;
  }

  StockManager._internal();

  static final StockManager _singleton = StockManager._internal();

  final RxNotify<StockMove> stockMove =
      StockMove(secCd: '', tradeType: TradeType.BUY).objective;

  void moveStock(
      {required String? secCd,
      required TradeType tradeType,
      String? price,
      num? volume}) {
    if (isNotNullOrEmpty(secCd)) {
      stockMove.value = StockMove(
          secCd: secCd!, tradeType: tradeType, price: price, volume: volume);
      Get.find<MainController>().index.value = 2;
      Get.find<MainController>().pageController.jumpToPage(2);
      // if (Get.find<OrderController>().typePage.value ==
      //     TypePageOrder.OrderDiary) {
      //   Get.find<OrderController>().switchPage(type: TypePageOrder.PlaceOrder);
      // }
    }
  }
}

class StockMove {
  StockMove(
      {required this.secCd, required this.tradeType, this.price, this.volume});

  final String secCd;
  final TradeType tradeType;
  final num? volume;
  final String? price;
}
