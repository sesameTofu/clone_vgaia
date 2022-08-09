import 'package:flutter/services.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pin_code/check_active_smart_otp/check_active_smart_otp_controller.dart';
import 'package:flutter_mobile/pin_code/check_active_smart_otp/check_active_smart_otp_view.dart';
import 'package:flutter_mobile/pin_code/pin_code/pin_code_controller.dart';
import 'package:flutter_mobile/pin_code/pin_code/pin_code_view.dart';
import 'package:flutter_mobile/widgets/pop_up/show_popup.dart';
import 'package:flutter_mobile/widgets/text_field/build_input_text.dart';
import 'package:flutter_mobile/widgets/text_field/input_otp.dart';

mixin PinCodeMixin implements BaseMixin {
  // Nhập OTP khi kích hoạt tk
  Future<bool?> dialogCheckOTPAcive(String accRegister) => ShowPopup()
      .popUpCustom2<bool>(
        content: CheckActiveSmartOTPView(
          accRegister: accRegister,
        ),
        barrier: false,
      )
      .whenComplete(() => Get.delete<CheckActiveSmartOTPController>());

// pincode: chú ý: mới chỉ dùng cho : Token, otp, matrix, password
  Future<String?> dialogInputCode(PinType pinType, BusinessCd businessCd) =>
      ShowPopup()
          .popUpCustom2<String?>(
            content: PinCodeView(pinType: pinType, businessCd: businessCd),
            barrier: false,
          )
          .whenComplete(() => Get.delete<PinCodeController>());

  //
  Widget buildPinOTP(
    TextEditingController textEditingController, {
    bool autoHideKeyboard = true,
  }) =>
      InputOtpWidget(
        appContext: Get.context!,
        textController: textEditingController,
        focusNode: FocusNode(),
        length: 6,
        hieght: 40,
        textStyle: textStyle.bold(size: 18),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (String value) {},
        autoDismissKeyboard: autoHideKeyboard,
      );

  //
  Widget buildInputPassword(TextEditingController textEditingController,
          {String? hintText}) =>
      BuildInputText(
        hintText: hintText ?? LocaleKeys.password.tr,
        controller: textEditingController,
      );
}
