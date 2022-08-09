import 'package:flutter_mobile/import.dart';

class MainController extends BaseController {
  final PageController pageController = PageController();
  final RxInt index = RxInt(0);

  @override
  void onClose() {
    index.close();
    pageController.dispose();
    super.onClose();
  }
}
