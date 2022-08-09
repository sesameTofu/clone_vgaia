import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/smart_otp/model/smart_otp_model.dart';
import 'package:flutter_mobile/pages/smart_otp/widget/counter.dart';
import 'package:flutter_mobile/pages/smart_otp/widget/item_account_smart_otp_controller.dart';
import 'package:flutter_mobile/widgets/button/widget_button.dart';

class ItemAccountSmartOTP extends BaseScreen<ItemAccountSmartOTPController> {
  ItemAccountSmartOTP(this.smartOtp, this.removeOTP, {Key? key})
      : super(key: key, tag: smartOtp.account);
  final SmartOtp smartOtp;
  final Function(SmartOtp) removeOTP;

  @override
  ItemAccountSmartOTPController putController() =>
      ItemAccountSmartOTPController(smartOtp);

  @override
  Widget builder() {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            controller.smartOtp.account ?? '',
            style: textStyle.regular(size: sized.fontMedium.fontSized),
          ),
          ValueListenableBuilder<String>(
            valueListenable: controller.codeOTP,
            builder: (_, String otp, Widget? widget) => Text(
              otp,
              style: textStyle.regular(size: sized.fontMedium.fontSized),
            ),
          ),
          Counter(
            builder: (BuildContext context, int seconds) => Text(
              '$seconds',
              style: textStyle.regular(size: sized.fontMedium.fontSized),
            ),
            onTimeout: () {
              controller.getCodeOTP();
            },
          ),
          WidgetButton(
              title: LocaleKeys.delete.tr,
              bgColor: color.red50,
              onClick: () => removeOTP(smartOtp))
        ],
      ),
    );
  }
}
