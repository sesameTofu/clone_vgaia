import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pin_code/check_active_smart_otp/check_active_smart_otp_controller.dart';
import 'package:flutter_mobile/pin_code/pin_code_mixin.dart';
import 'package:flutter_mobile/widgets/button/widget_button.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class CheckActiveSmartOTPView extends BaseScreen<CheckActiveSmartOTPController>
    with PinCodeMixin {
  CheckActiveSmartOTPView({required this.accRegister, Key? key})
      : super(key: key);

  final String accRegister;

  @override
  CheckActiveSmartOTPController putController() =>
      CheckActiveSmartOTPController(accRegister);

  @override
  Widget builder() {
    return KeyboardDismisser(gestures: const <GestureType>[
      GestureType.onTap,
      GestureType.onPanUpdateDownDirection
    ], child: _buildBody);
  }

  Widget get _buildBody => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // title
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              LocaleKeys.goline_SmartOtpEnterSmsOtp.tr,
              style: textStyle.bold(size: 16, color: color.green50),
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
            ),
          ),
          _buildDivider,
          // content
          Container(
            padding: const EdgeInsets.all(12),
            constraints: BoxConstraints(maxHeight: 0.6.getHeight),
            child: SingleChildScrollView(child: _builsPinOTP),
          ),
          // button
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: WidgetButton(
                    typeButton: TypeButton.secondary,
                    onClick: () {
                      Get.back(result: false);
                    },
                    title: LocaleKeys.close.tr,
                    height: 32,
                    borderRadius: 4,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: WidgetButton(
                    onClick: () => controller.onClickConfirm(),
                    title: LocaleKeys.confirm.tr,
                    height: 32,
                    borderRadius: 4,
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  Divider get _buildDivider => Divider(height: 1, color: color.grey40);

  Widget get _builsPinOTP => Column(
        children: <Widget>[
          ValueListenableBuilder<int>(
            valueListenable: controller.countdownOTP,
            builder: (_, int currentTime, Widget? widget) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: RichText(
                    textScaleFactor: 1,
                    text: TextSpan(
                      text: LocaleKeys.title_code_send_to_your_phone.tr,
                      style: textStyle.regular(),
                      children: <TextSpan>[
                        TextSpan(
                          text: currentTime.toString(),
                          style: textStyle.medium(
                              size: 16,
                              color: currentTime < 10
                                  ? color.red50
                                  : color.green50),
                        ),
                        TextSpan(
                          text: LocaleKeys.seconds.tr,
                        )
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // bắt ko cho nhấn liên tục
                    if (currentTime < 10) {
                      controller.onReSendOtp();
                    }
                  },
                  child: Text(
                    LocaleKeys.register_resent_sms_otp.tr,
                    style: textStyle.medium(
                        color: currentTime < 10 ? color.blue60 : color.grey40),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          //
          buildPinOTP(controller.textPinCodeController),
        ],
      );
}
