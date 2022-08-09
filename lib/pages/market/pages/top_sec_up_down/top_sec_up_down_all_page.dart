import 'package:flutter_mobile/domain/usecase/market_use_case.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/pages/top_sec_up_down/widget.dart';
import 'package:flutter_mobile/widgets/appbar_custom.dart';
import 'package:flutter_mobile/widgets/refesh/smart_load_list_widget.dart';

import 'top_sec_up_down_controller.dart';

class TopSecUpDownAllPage extends BaseScreen<TopSecUpDownController>
    with TopSecUpDownMixin, SmartLoadListWidget {
  TopSecUpDownAllPage(
      {this.isTopUp = true, Key? key, required this.tagController})
      : super(key: key, tag: tagController);
  final bool isTopUp;
  final String tagController;
  @override
  TopSecUpDownController putController() {
    return TopSecUpDownController(MarketUseCase(), isDetail: true)
      ..isTopSecUp = isTopUp;
  }

  @override
  Widget builder() {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBarCustom(
            titleAppBar: controller.topSelect.value.label,
            actions: <Widget>[popupMenu],
          )),
      body: Obx(
        () => Column(children: <Widget>[
          buildHeader,
          buildSmartListExpanded(controller,
              child: buildList(
                  physics: BouncingScrollPhysics(),
                  isAll: true,
                  tag: tagController),
              enablePullUp: controller.canLoadMore.value),
        ]),
      ),
    );
  }
}
