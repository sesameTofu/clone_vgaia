import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pin_code/pin_code/pin_code_controller.dart';
import 'package:flutter_mobile/pin_code/pin_code_mixin.dart';
import 'package:flutter_mobile/widgets/button/widget_button.dart';
import 'package:flutter_mobile/widgets/svg_icon.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class PinCodeView extends BaseScreen<PinCodeController> with PinCodeMixin {
  PinCodeView({required this.pinType, required this.businessCd, Key? key})
      : super(key: key);

  final PinType pinType;
  final BusinessCd businessCd;

  @override
  PinCodeController putController() => PinCodeController(pinType, businessCd);

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
              LocaleKeys.trading_page_verification.tr,
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
            child: SingleChildScrollView(child: _getInputBody),
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
                      Get.back();
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

  Widget get _getInputBody {
    switch (pinType) {
      case PinType.Token:
      case PinType.Otp:
        return _buildOTP;

      case PinType.Matrix:
        return _buildMatrix;

      case PinType.Password:
        return _buildPassword;

      case PinType.CA:
      // Not implement on Mobile

      case PinType.SmartOtp:
      // đang set ngầm, nên chưa vào đây

      case PinType.None:
      default:
        return SizedBox(height: 50);
    }
  }

  // otp
  Widget get _buildOTP => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(controller.getTitle, style: textStyle.regular()),
          const SizedBox(height: 10),
          buildPinOTP(controller.textPinCodeController)
        ],
      );

  // Matrix
  Widget get _buildMatrix => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(controller.getTitle, style: textStyle.regular()),
          const SizedBox(height: 10),
          buildInputPassword(controller.textPinCodeController,
              hintText: controller.getTitle)
        ],
      );

  // password
  Widget get _buildPassword => Column(
        children: <Widget>[
          buildInputPassword(controller.textPinCodeController,
              hintText: controller.getTitle),
          const SizedBox(height: 10),
          ValueListenableBuilder<bool>(
            valueListenable: controller.isSavePassword,
            builder: (_, bool isSaved, Widget? widget) => GestureDetector(
              onTap: () => controller.onSavePassword(),
              child: Row(
                children: <Widget>[
                  iconSvg(
                      path: isSaved ? AppPath.icRadioYes : AppPath.icRadioNo),
                  SizedBox(width: 10),
                  Text(
                    LocaleKeys.trading_page_save_password.tr,
                    style: textStyle.regular(),
                  )
                ],
              ),
            ),
          ),
        ],
      );
}
