import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/pages/top_sec_changed/widget.dart';
import 'package:flutter_mobile/widgets/appbar_custom.dart';
import 'package:flutter_mobile/widgets/refesh/smart_load_list_widget.dart';

import 'top_sec_changed_controller.dart';

class TopSecChangedAllPage extends BaseScreen<TopSecChangedController>
    with TopChangecMixin, SmartLoadListWidget {
  TopSecChangedAllPage({Key? key})
      : super(key: key, tag: 'TopSecChangedDetail');

  @override
  Widget builder() {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: AppBarCustom(
              titleAppBar: LocaleKeys.topSecChanged_title.tr,
              actions: <Widget>[popupMenu],
            )),
        body: Column(children: <Widget>[
          buildHeader,
          buildSmartListExpanded(controller,
              enablePullUp: true,
              child: Obx(() =>
                  buildList(physics: BouncingScrollPhysics(), isAll: true)))
        ]));
  }

  @override
  TopSecChangedController? putController() {
    return TopSecChangedController(isDetail: true);
  }
}
