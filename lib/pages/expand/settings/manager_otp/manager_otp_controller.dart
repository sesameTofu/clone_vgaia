import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/domain/model/smart_otp/smart_otp_device_data.dart';
import 'package:flutter_mobile/domain/usecase/setting/setting_usecase.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_mobile/widgets/pop_up/show_popup.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ManagerOtpController extends BaseController {
  final SettingUsecase _settingUsecase = SettingUsecase();

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  RxListNotify<SmartOtpDeviceData> listDevice =
      <SmartOtpDeviceData>[].objective;

  @override
  void onReady() {
    super.onReady();
    getData();
  }

  Future<void> getData() async {
    // ẩn refresh loading
    refreshController.refreshCompleted();
    showLoading();
    // get data
    await _settingUsecase.findListSmartOtpDevice(
      status: '1',
      onSuccess: (List<SmartOtpDeviceData> list) {
        listDevice.value = list;
      },
      onFailure: (dynamic error) {
        AppToast.showError(getError(error));
      },
    );
    hideLoading();
  }

  Future<void> onCancelDevice(SmartOtpDeviceData deviceInfor, int index) async {
    ShowPopup().popUpConfirm(
        content: LocaleKeys.title_ask_remove_device_smart_otp.tr,
        textConfirm: LocaleKeys.goline_Remove.tr,
        bgColorConfirm: Colors.redAccent,
        onClickConfirm: () async {
          showLoading();
          await _settingUsecase.deactiveSmartOtpDevice(
            deviceId: deviceInfor.deviceId ?? '',
            onSuccess: (bool success) {
              listDevice.value.removeAt(index);
              listDevice.refresh();
            },
            onFailure: (dynamic error) {
              AppToast.showError(getError(error));
            },
          );
          hideLoading();
        });
  }
}
