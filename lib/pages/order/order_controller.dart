import 'package:flutter_mobile/base/base_main_controller.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/main/main_controller.dart';

class OrderController extends BaseMainController<int> {
  OrderController()
      : super(
            currentPage: 1, indexPageChange: Get.find<MainController>().index);
  final PageController pageController = PageController(initialPage: 0);

  final Rx<TypePageOrder> typePage = TypePageOrder.PlaceOrder.obs;

  final Rx<bool> showCheckBox = Rx<bool>(false);

  final Rx<bool> syntheticTransaction = Rx<bool>(false);

  void switchPage({required TypePageOrder type}) {
    if (type != typePage.value) {
      typePage.value = type;
      pageController.jumpToPage(type.index);
      WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
    }
  }

  void changeCheckBox() {
    showCheckBox.value = !showCheckBox.value;
  }

  void changesyntheticTransaction() {
    syntheticTransaction.value = !syntheticTransaction.value;
  }
}
