import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/domain/model/smart_otp/matrix_model.dart';
import 'package:flutter_mobile/domain/usecase/smart_otp_usecase.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';

class PinCodeController extends BaseController {
  PinCodeController(this.pinType, this.businessCd);

  final PinType pinType;
  final BusinessCd businessCd;

  final SmartOTPUseCase _smartOTPuseCase = SmartOTPUseCase();

  final TextEditingController textPinCodeController = TextEditingController();

  RxNotify<bool> isSavePassword = false.objective;

  @override
  void onInit() {
    super.onInit();

    // TH: MAtrix, smsotp
    if (pinType == PinType.Matrix || pinType == PinType.Otp) {
      _smartOTPuseCase.getOtpAuthenCode(
          businessCd: businessCd.value,
          pinType: pinType.value,
          onSuccess: (MatrixModel matrix) {
            // Matrix
            if (pinType == PinType.Matrix) {
              if (matrix.matric != null) {
                textPinCodeController.text = matrix.matric!
                  ..replaceAll(',', '')
                  ..replaceAll(' ', '');
              } else {
                AppToast.showError(LocaleKeys.error_infor_matrix_null.tr);
              }
            }
            // otp => đc gửi về tin nhắn
          },
          onFailure: (dynamic error) {
            Get.back();
            AppToast.showError(getError(error));
          });
    }
  }

  // Lưu Mật khẩu
  void onSavePassword() {
    isSavePassword.value = !isSavePassword.value;
  }

  //  button : Xác nhận
  void onClickConfirm() {
    if (textPinCodeController.text.isNotEmpty) {
      _funcDetail();
      Get.back(result: textPinCodeController.text.trim());
    } else {
      AppToast.showError(_getErrorInputEmpty);
    }
  }

  void _funcDetail() {
    switch (pinType) {
      case PinType.Password:
        break;
      default:
    }
  }

  String get getTitle {
    switch (pinType) {
      case PinType.Matrix:
        return LocaleKeys.trading_page_matrix.tr;
      case PinType.Otp:
        return LocaleKeys.goline_SmartOtpEnterSmsOtp.tr;
      case PinType.Password:
        return LocaleKeys.trading_page_password.tr;

      default:
        return LocaleKeys.enter_password.tr;
    }
  }

  String get _getErrorInputEmpty {
    switch (pinType) {
      case PinType.Otp:
        return LocaleKeys.goline_NotEnterOtpCode.tr;
      case PinType.Password:
        return LocaleKeys.goline_PassCannotBlank.tr;
      default:
        return LocaleKeys.goline_NotEnterPinCode.tr;
    }
  }

  @override
  void dispose() {
    textPinCodeController.dispose();
    super.dispose();
  }
}
