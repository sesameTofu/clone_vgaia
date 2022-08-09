import 'package:flutter_mobile/domain/usecase/system_use_case.dart';
import 'package:flutter_mobile/global/app_router.dart';
import 'package:get/get.dart';

class SpalshController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    toLogin();
  }

  Future<void> toLogin() async {
    await SystemUseCase().initStockInfo();

    Get.offAndToNamed(AppRouter.routerLogin);
  }
}
