import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/smart_otp/model/smart_otp_model.dart';
import 'package:flutter_mobile/pages/smart_otp/smart_otp_controller.dart';
import 'package:flutter_mobile/pages/smart_otp/widget/clock.dart';
import 'package:flutter_mobile/pages/smart_otp/widget/item_account_smart_otp.dart';
import 'package:flutter_mobile/widgets/button/widget_button.dart';
import 'package:flutter_mobile/widgets/text_field/build_input_text.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SmartOTPPage extends BaseScreen<SmartOTPController> {
  SmartOTPPage({Key? key}) : super(key: key);

  @override
  SmartOTPController putController() => SmartOTPController();

  @override
  Widget builder() {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: _appBar,
        body: _buildBody,
      ),
    );
  }

  AppBar get _appBar =>
      AppBar(title: Text(LocaleKeys.goline_SmartOtp.tr), centerTitle: true);

  Widget get _buildBody => Column(
        children: <Widget>[
          _buildTabTitle(LocaleKeys.goline_SmartOtpActiveNew.tr),
          _buildInputSmartOTP,
          _buildTabTitle(LocaleKeys.title_acc_active.tr),
          _listData,
          _buildTimeWidget
        ],
      );

  //
  Widget _buildTabTitle(String title) => Container(
        color: color.background1,
        padding: EdgeInsets.symmetric(vertical: 10.height),
        child: Center(
          child: Text(
            title,
            style: textStyle.regular(size: sized.fontMedium.fontSized),
          ),
        ),
      );

  // input ACC
  Widget get _buildInputSmartOTP => _buildInputButton(
        LocaleKeys.goline_SoTaiKhoan.tr,
        LocaleKeys.goline_SmartOtpActive.tr,
        onPressed: () => controller.onClickActiveOTP(),
        textController: controller.controllerRegister,
        focusNode: controller.focusAccRegister,
      );

// danh sách đăng kí
  Expanded get _listData => Expanded(
        child: SmartRefresher(
          controller: controller.refreshController,
          onRefresh: () => controller.getListSmartOTP(),
          child: ValueListenableBuilder<List<SmartOtp>>(
            valueListenable: controller.listSmartOtp,
            builder: (_, List<SmartOtp>? list, Widget? widget) =>
                list == null || list.isEmpty
                    ? Center(
                        child: Text(
                          LocaleKeys.goline_NoSearchDataFound.tr,
                          style: textStyle.regular(color: color.grey10),
                        ),
                      )
                    : ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (_, int index) =>
                            _itemSmartOTP(list[index]),
                        separatorBuilder: (_, __) => _buildDivider,
                        itemCount: list.length,
                      ),
          ),
        ),
      );

  // Thời gian bottom
  Widget get _buildTimeWidget => Padding(
        padding: EdgeInsets.symmetric(vertical: sized.paddingSmall.height),
        child: Clock(
          builder: (BuildContext context, String content) => Text(
            content,
            style: textStyle.regular(size: sized.fontMedium.fontSized),
          ),
        ),
      );

  //
  Widget _buildInputButton(
    String title,
    String titleButton, {
    required VoidCallback onPressed,
    required TextEditingController textController,
    FocusNode? focusNode,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Text(
                title,
                style: textStyle.regular(size: sized.fontMedium.fontSized),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              flex: 3,
              child: BuildInputText(
                currentNode: focusNode,
                controller: textController,
                textInputType: TextInputType.visiblePassword,
                hintText: '',
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: WidgetButton(
                onClick: onPressed,
                title: titleButton,
              ),
            )
          ],
        ),
      );

  Divider get _buildDivider => Divider(height: 1, color: color.grey80);

  // Item của List
  Widget _itemSmartOTP(SmartOtp smartOtp) {
    return ItemAccountSmartOTP(
      smartOtp,
      (SmartOtp smartOtp) {
        controller.removeSmartOTP(smartOtp);
      },
    );
  }
}
