import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/pages/top_sec_up_down/widget.dart';
import 'package:flutter_mobile/pages/market/widget/widgets.dart';

import 'top_sec_up_down_all_page.dart';
import 'top_sec_up_down_controller.dart';

class TopSecUpDown extends BaseScreen<TopSecUpDownController>
    with TopSecUpDownMixin {
  TopSecUpDown(this.topSecUpDownController,
      {Key? key, required this.tagController, this.widgetTitle = 'Top Giá'})
      : super(key: key, tag: tagController);

  final TopSecUpDownController topSecUpDownController;
  final String widgetTitle;
  final String tagController;

  @override
  TopSecUpDownController putController() {
    return topSecUpDownController;
  }

  @override
  Widget builder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTitle,
        buildHeader,
        _buildList,
        Foodter(
          onPress: () => Get.to(() => TopSecUpDownAllPage(
                tagController: 'All$tagController',
                isTopUp: controller.isTopSecUp,
              )),
        ),
      ],
    );
  }

  TitleItemMarket get _buildTitle => TitleItemMarket(
        title: widgetTitle,
        // actionWidget: popupMenu,
      );

  Obx get _buildList => Obx(() => buildList(isAll: false, tag: tagController));
}
