import 'package:flutter_mobile/import.dart';

abstract class BaseMainController<T> extends BaseController {
  BaseMainController(
      {required this.currentPage, required this.indexPageChange});

  late final Worker worker;
  final T currentPage;
  final Rx<T> indexPageChange;
  @override
  void onInit() {
    worker = ever(
      indexPageChange,
      (T pageChange) {
        if (pageChange == currentPage) {
          initPage();
        }
      },
    );
    if (indexPageChange.value == currentPage) {
      initPage(onInit: true);
    }

    super.onInit();
  }

  void initPage({bool onInit = false}) {
    worker.dispose();
  }

  bool get isCurrentPage => currentPage == indexPageChange.value;
}
