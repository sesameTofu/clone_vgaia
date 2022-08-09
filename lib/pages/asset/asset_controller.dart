import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';

class AssetController extends BaseController {
  PageController pageController = PageController(initialPage: 0);

  final RxNotify<TypePageAsset> typePage = TypePageAsset.portfolio.objective;

  void switchPage({required TypePageAsset type}) {
    if (typePage.value != type) {
      typePage.value = type;
      if (typePage.value == TypePageAsset.portfolio) {
        pageController.jumpToPage(0);
      } else {
        pageController.jumpToPage(1);
      }
    }
  }
}
