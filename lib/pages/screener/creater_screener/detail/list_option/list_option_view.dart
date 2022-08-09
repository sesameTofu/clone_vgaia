import 'package:flutter_mobile/domain/model/screener/screener_model.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/screener/creater_screener/detail/list_option/list_option_controller.dart';
import 'package:flutter_mobile/pages/screener/creater_screener/widget_view.dart';
import 'package:flutter_mobile/widgets/button/widget_button.dart';

class ListOptionView extends GetView<ListOptionController> with BaseMixin {
  const ListOptionView(
      this.scroll, this.currentListSelected, this.currentListFilter,
      {Key? key})
      : super(key: key);
  final ScrollController scroll;
  final List<ScreenerOption> currentListSelected;
  final List<ScreenerOption> currentListFilter;

  @override
  ListOptionController get controller =>
      Get.put(ListOptionController(currentListSelected));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (currentListFilter.isNotEmpty)
          InkWell(
            onTap: () {
              controller.addAll(currentListFilter);
            },
            child: Obx(
              () => WidgetView().buildItemCheckBox(
                  controller.currentSelect.length == currentListFilter.length,
                  LocaleKeys.goline_All.tr),
            ),
          ),
        Divider(color: color.grey50, height: 1),
        Expanded(
          child: ListView.separated(
            controller: scroll,
            itemCount: currentListFilter.length,
            itemBuilder: (_, int index) => InkWell(
              onTap: () => controller.onSelectItem(currentListFilter[index]),
              child: Obx(
                () => WidgetView().buildItemCheckBox(
                    controller.currentSelect.any((ScreenerOption element) =>
                        element.id == currentListFilter[index].id),
                    currentListFilter[index].nameOptionMultiLang),
              ),
            ),
            separatorBuilder: (_, __) =>
                Divider(color: color.grey50, height: 1),
          ),
        ),
        WidgetButton(
          onClick: () => Get.back(result: controller.currentSelect),
          title: LocaleKeys.goline_Apply.tr,
          textColor: color.grey0,
          bgColor: color.primary,
        ).paddingSymmetric(horizontal: 12),
        SizedBox(height: 20)
      ],
    );
  }
}
