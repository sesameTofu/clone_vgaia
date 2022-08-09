import 'package:flutter_mobile/controller/session_manager.dart';
import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/domain/model/account_infor/account_infor.dart';
import 'package:flutter_mobile/domain/model/authencation/srv_4511_result_data3.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/domain/usecase/setting/setting_usecase.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_mobile/widgets/pop_up/show_popup.dart';

class TwoFactorAuthenController extends BaseController {
  final SettingUsecase _settingUsecase = SettingUsecase();

  // List<Select<AccountInfor>> listSubAccount = <Select<AccountInfor>>[];
  late Select<AccountInfor>? currentAccSelected;

  // thông tin 2factor
  final RxNotify<Srv4511ResultData3> inforRegister =
      Srv4511ResultData3().objective;
  @override
  void onInit() {
    super.onInit();
    currentAccSelected = Select<AccountInfor>(title: SessionManager().username);
  }

  @override
  void onReady() {
    super.onReady();
    getDataRegister();
  }

  Future<void> getDataRegister() async {
    showLoading();
    await _settingUsecase.getServiceOfCustomer(SessionManager().username,
        // ignore: always_specify_types
        onSuccess: (Srv4511ResultData3 response) {
      inforRegister.value = response;
    }, onFailure: (dynamic error) {
      AppToast.showError(getError(error));
    });
    hideLoading();
  }

  // init khởi tạo list
  // void setListSubAccount() {
  //   final List<String> _listAcc =
  //       _globalDataManager.getSubAccoList(EntrustBusinessCode.all);

  //   if (_listAcc.isNotEmpty) {
  //     listSubAccount = _listAcc
  //         .map((String e) => Select<AccountInfor>(title: e, value: e))
  //         .toList();
  //   }
  // }

  // chọn Tiểu khoản
  void onSelectAccount(Select<AccountInfor> account) {}

  // cập nhật : Xác thực theo phiên
  void onRegisterSession(bool status) {
    ShowPopup().popUpConfirm(
        content: status
            ? LocaleKeys.goline_AuthenOneTimeUseConfirmMsg.tr
            : LocaleKeys.goline_AuthenOneTimeRemoveConfirmMsg.tr,
        onClickConfirm: () async {
          showLoading();
          await _settingUsecase.updateOneTimeAuthen(
              flag: status ? 0 : 1,
              onSuccess: (bool respo) {
                if (respo) {
                  inforRegister.value.oneTimeAuth = status.toString();
                  inforRegister.refresh();
                  AppToast.showSuccess(LocaleKeys.msg_submit_success.tr);
                }
              },
              onFailure: (dynamic error) {
                AppToast.showError(getError(error));
              });
          hideLoading();
        });
  }
}

mixin OtpPinTypeDisplay {
  String getOtpPinTypeDisplay(String? type) {
    type ??= '0';
    return '$type: ${_table[type]}';
  }

  static final Map<String, String> _table = <String, String>{
    '0': LocaleKeys.status_register_no_authen.tr,
    '1': LocaleKeys.status_register_password_2.tr,
    '2': LocaleKeys.status_register_matrix.tr,
    '3': LocaleKeys.status_register_sms_otp.tr,
    '4': LocaleKeys.status_register_token.tr,
    '5': LocaleKeys.status_register_bkav_ca.tr,
    '6': LocaleKeys.status_register_smart_otp.tr,
  };
}
