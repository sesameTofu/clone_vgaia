import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/domain/model/service_notice.dart';
import 'package:flutter_mobile/domain/usecase/setting/setting_usecase.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_mobile/widgets/pop_up/show_popup.dart';

class SettingNotificationController extends BaseController with BaseMixin {
  final SettingUsecase _settingUsecase = SettingUsecase();

  // list notification
  RxListNotify<ServiceNotice> listNotify = <ServiceNotice>[].objective;

  @override
  void onReady() {
    super.onReady();
    getData();
  }

  // init data
  Future<void> getData() async {
    showLoading();
    await _settingUsecase.findListServiceNotice(
        custCd: '0',
        onSuccess: (List<ServiceNotice>? list) {
          if (list != null) {
            listNotify.value = list;
          }
        },
        onFailure: (dynamic error) {
          AppToast.showError(getError(error));
        });

    hideLoading();
  }

  //
  Future<void> updateStatusNotification(ServiceNotice notice, int index) async {
    final num _newStatus = notice.status != null && notice.status == 0 ? 1 : 0;
    // ignore: todo
    // TODO : check TH chọn Tiếng Anh
    final String _content =
        (vn ? notice.serviceGroupName : notice.serviceGroupName) ?? '';
    ShowPopup().popUpConfirm(
        content: _newStatus == 1
            ? LocaleKeys.ask_choose.tr + _content
            : LocaleKeys.ask_remove.tr + _content,
        onClickConfirm: () async {
          showLoading();
          await _settingUsecase.registerNotice(
              custCd: '${notice.custCd}',
              custNo: notice.regUserId,
              serviceGroupId: '${notice.serviceGroupId}',
              status: _newStatus.toString(),
              onSuccess: (bool success) {
                if (success) {
                  listNotify.value[index].status = _newStatus;
                  listNotify.refresh();
                }
              },
              onFailure: (dynamic error) {
                AppToast.showError(getError(error));
              });

          hideLoading();
        });
  }
}
