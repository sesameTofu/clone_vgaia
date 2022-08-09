import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/place_order/place_order_controller_mixi.dart';
import 'package:flutter_mobile/utils/functs.dart';

class PlaceOrderController extends PlaceOrderControllerMixi {
  final Rx<bool> loadingPlaceOrder = false.obs;
  @override
  void placeOrder() {
    if (loadingPlaceOrder.value) {
      return;
    }
    loadingPlaceOrder.value = true;
    placeOrderUseCase.placeOrder(
      prepareOrder: prepareSubitOrder,
      stockInfoModel: stockInfoModel,
      stockItemModel: stockItemModel,
      marketStatusSession: marketStatusSession,
      onSuccess: () {
        loadingPlaceOrder.value = false;
        AppToast.showSuccess(LocaleKeys.msg_create_order_success.tr);
        clearData(clearWithPlaceOrder: true);
        inquiryBuyingPower();
      },
      onFailure: (dynamic sateError) {
        loadingPlaceOrder.value = false;
        errorPlaceOrder(sateError);
      },
      buyingPower: buyingPowerData.value,
      maxQtty: maxBuyQuantity.value,
    );
  }

  void errorPlaceOrder(dynamic sateError) {
    if (sateError is EnumErrorPlaceOrder) {
      if (sateError != EnumErrorPlaceOrder.errorCancelPopup) {
        AppToast.showError(sateError.title());
      }
    } else {
      AppToast.showError(getError(sateError));
    }
  }
}
