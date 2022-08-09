// ignore: avoid_web_libraries_in_flutter

import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/widgets/app_loading.dart';
import 'package:flutter_mobile/widgets/refesh/smart_load_list_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SmartLoadListWidget {
  Widget buildSmartListExpanded(SmartLoadListController controller,
          {Widget? child, bool? enablePullDown, bool? enablePullUp}) =>
      Obx(() => Expanded(
            child: controller.isLoadingPage.value
                ? appLoading
                : SmartRefresher(
                    controller: controller.refreshController,
                    enablePullDown: enablePullDown ?? true,
                    enablePullUp: enablePullUp ?? false,
                    onLoading: controller.onLoadMore,
                    onRefresh: controller.onRefresh,
                    child: child,
                  ),
          ));

  SmartRefresher buildSmartList(SmartLoadListController controller,
          {Widget? child, bool? enablePullDown, bool? enablePullUp}) =>
      SmartRefresher(
        controller: controller.refreshController,
        enablePullDown: enablePullDown ?? true,
        enablePullUp: enablePullUp ?? false,
        onLoading: controller.onLoadMore,
        onRefresh: controller.onRefresh,
        child: child,
      );
}
