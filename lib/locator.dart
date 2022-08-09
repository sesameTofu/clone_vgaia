import 'package:flutter_mobile/controller/global_data_manager.dart';
import 'package:flutter_mobile/controller/notification_controller.dart';
import 'package:flutter_mobile/data/source/dio/api/rest_client_base.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'global/app_theme.dart';
import 'widgets/loading_wrapper.dart';

Future<void> setupLocator() async {
  Get.put<AppThemeBase>(AppThemeBase());

  Get.put<LoadingController>(LoadingController());

  Get.put<GetStorage>(GetStorage());

  Get.put<RestClientBase>(RestClientBase());

  Get.put<GlobalDataManager>(GlobalDataManager());

  Get.put<NotifyController>(NotifyController());
}
