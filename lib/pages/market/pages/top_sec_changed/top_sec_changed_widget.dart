import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/pages/top_sec_changed/widget.dart';
import 'package:flutter_mobile/pages/market/widget/widgets.dart';

import 'top_sec_changed_all_page.dart';
import 'top_sec_changed_controller.dart';

class TopSecChangedWidget extends BaseScreen<TopSecChangedController>
    with TopChangecMixin {
  TopSecChangedWidget(this.topSecChangedController, {Key? key})
      : super(key: key, tag: 'TopSecChanged');

  final TopSecChangedController topSecChangedController;

  @override
  TopSecChangedController putController() {
    return topSecChangedController;
  }

  @override
  Widget builder() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTite,
          buildHeader,
          _buildList,
          Foodter(onPress: () => Get.to(() => TopSecChangedAllPage()))
        ]);
  }

  TitleItemMarket get _buildTite => TitleItemMarket(
        title: LocaleKeys.topSecChanged_title.tr,
        actionWidget: popupMenu,
      );

  Obx get _buildList => Obx(() => buildList(isAll: false));
}
