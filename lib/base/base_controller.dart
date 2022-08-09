import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/global/app_log.dart';
import 'package:flutter_mobile/widgets/loading_wrapper.dart';
import 'package:get/get.dart';

export 'package:flutter/material.dart';
export 'package:get/get.dart';

abstract class BaseController extends GetxController {
  LoadingController get loading => Get.find<LoadingController>();

  RxNotify<bool> loadingPage = false.objective;

  @override
  void onInit() {
    log.debugPrint('BaseController');
    super.onInit();
  }

  void onResumed() {}

  void showLoading() {
    loading.show();
  }

  void hideLoading() {
    loading.hide();
  }

  void showLoadingPage() {
    loadingPage.value = true;
  }

  void hideLoadingPage() {
    loadingPage.value = false;
  }

  @override
  void dispose() {
    loadingPage.value = false;
    loading.hideAll();
    super.dispose();
  }

  AppLog get log => AppLog.log;
}
