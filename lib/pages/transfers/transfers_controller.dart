import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/import.dart';

class TransferController extends BaseController {
  final RxNotify<int> indexPage = 0.objective;

  final PageController pageController = PageController(initialPage: 0.round());

  void onChangePage(int? value) {
    if (indexPage.value != value) {
      indexPage.value = value!;

      pageController.jumpToPage(indexPage.value);
    }
  }
}
