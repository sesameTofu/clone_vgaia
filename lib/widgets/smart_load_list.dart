import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

mixin SmartLoadList {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onLoading() {}

  void onRefresh() {}

  Widget get listViewLoad;

  Expanded buildSmartListExpanded({bool? enablePullDown, bool? enablePullUp}) =>
      Expanded(
        child: SmartRefresher(
          controller: refreshController,
          enablePullDown: enablePullDown ?? true,
          enablePullUp: enablePullUp ?? false,
          onLoading: onLoading,
          onRefresh: onRefresh,
          child: listViewLoad,
        ),
      );

  SmartRefresher buildSmartList({bool? enablePullDown, bool? enablePullUp}) =>
      SmartRefresher(
        controller: refreshController,
        enablePullDown: enablePullDown ?? true,
        enablePullUp: enablePullUp ?? false,
        onLoading: onLoading,
        onRefresh: onRefresh,
        child: listViewLoad,
      );
}

Widget buildHeaderSmartRefresh() {
  return Center(
    child: Lottie.asset(
      AppPath.loading,
      width: 32,
      height: 32,
      fit: BoxFit.fill,
      // options: LottieOptions(enableMergePaths: true),
    ),
  );
}

Widget buildFooterSmartRefresh() {
  return ClassicFooter(
    idleText: LocaleKeys.scroll_to_loadmore.tr,
    loadingText: LocaleKeys.loading.tr,
    noDataText: LocaleKeys.no_data_more.tr,
    failedText: LocaleKeys.load_more_fail.tr,
    canLoadingText: LocaleKeys.release_to_load_more.tr,
  );
}
