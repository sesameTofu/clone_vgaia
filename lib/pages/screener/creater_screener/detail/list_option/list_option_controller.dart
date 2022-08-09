import 'package:flutter_mobile/domain/model/screener/screener_model.dart';
import 'package:flutter_mobile/import.dart';

class ListOptionController extends BaseController {
  ListOptionController(this.initListSelected);
  final List<ScreenerOption> initListSelected;

  //
  late RxSet<ScreenerOption> currentSelect;

  @override
  void onInit() {
    super.onInit();
    currentSelect = initListSelected.toSet().obs;
  }

  void onSelectItem(ScreenerOption option) {
    if (currentSelect
        .any((ScreenerOption element) => element.id == option.id)) {
      currentSelect
          .removeWhere((ScreenerOption value) => value.id == option.id);
    } else {
      currentSelect.add(option);
    }
  }

  void addAll(List<ScreenerOption> currentListFilter) {
    if (currentSelect.length == currentListFilter.length) {
      currentSelect.clear();
    } else {
      currentSelect.addAll(currentListFilter);
    }
  }
}
