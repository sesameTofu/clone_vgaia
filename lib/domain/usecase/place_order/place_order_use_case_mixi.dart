import 'package:flutter_mobile/domain/model/place_order/prepare_order_model.dart';
import 'package:flutter_mobile/domain/model/place_order/prepare_order_rq.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/place_order/widget/dialog_info_order_widget.dart';
import 'package:flutter_mobile/widgets/pop_up/show_popup.dart';

class PlaceOrderUsecaseMixi {
  final List<String> quickOrderList = <String>[
    'MOK',
    'MAK',
    'PLO',
    'MTL',
    'ATC'
  ];

  final List<String> quickOrderListHOSE = <String>[
    'ATO',
    'MP',
    'ATC',
  ];

  Future<bool?> dialogConfirnPlaceOrder(
      {required PrepareOrderData prepareOrderData,
      required PrepareSubmitOrder prepareOrder}) async {
    return await ShowPopup().popUpCustom<bool>(
        content: DialogInfoOrderWidget(
            prepareOrderData: prepareOrderData, prepareOrder: prepareOrder),
        title: LocaleKeys.trading_page_order_info.tr,
        barrier: false);
  }

  Future<bool?> dialogConfirnPlaceOrderPending() async {
    return await ShowPopup().popUpConfirm<bool>(
        content: LocaleKeys.goline_TraddingExpireTime.tr,
        title: LocaleKeys.goline_Notification.tr,
        barrier: false);
  }

  Future<bool?> dialogConfirnPlaceOrderCondition() async {
    return await ShowPopup().popUpConfirm<bool>(
        content: LocaleKeys.goline_AreYouSureOrder.tr,
        title: LocaleKeys.goline_Notification.tr,
        barrier: false);
  }

  Future<bool?> dialogConfirnPlaceCustomerInsider(
      {required String message}) async {
    return await ShowPopup().popUpConfirm<bool>(
        content: message,
        title: LocaleKeys.goline_Notification.tr,
        barrier: false);
  }
}
