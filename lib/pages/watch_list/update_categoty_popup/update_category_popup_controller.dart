import 'package:flutter_mobile/controller/watch_list_manager.dart';
import 'package:flutter_mobile/domain/model/watch_list/watch_list.dart';
import 'package:flutter_mobile/import.dart';

class UpdateCategoryPopupController extends BaseController {
  UpdateCategoryPopupController(this.category) {
    if (category != null) {
      editingController.text = category?.getCategoryName ?? '';
    }
  }

  final TextEditingController editingController = TextEditingController();
  final RxBool preventMultiTap = RxBool(false);
  final RxInt streamLengthCount = RxInt(0);
  final WatchListManager categoryManager = WatchListManager();
  final WatchList? category;

  @override
  void onInit() {
    editingController.addListener(() {
      streamLengthCount.value = editingController.text.length;
    });
    super.onInit();
  }

  /// Create new [category] or update select [category]
  Future<void> saveWatchList() async {
    final bool? isSuccess = await categoryManager.createWatchList(
        watchList: WatchList(
            nameVi: editingController.text, nameEn: editingController.text));
    if (isSuccess ?? false) {
      Get.back();
    }
  }

  Future<void> updateWatchList() async {
    final bool? isSuccess = await categoryManager.updateWatchList(
        watchList: WatchList(
            id: category?.id,
            priority: category?.priority,
            nameVi: editingController.text,
            nameEn: editingController.text));
    if (isSuccess ?? false) {
      Get.back();
    }
  }
}
