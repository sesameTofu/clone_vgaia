import 'package:flutter/cupertino.dart';
import 'package:flutter_mobile/domain/model/account_infor/account_infor.dart';
import 'package:flutter_mobile/domain/model/authencation/srv_4511_result_data3.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/expand/settings/two_factor_authen/two_factor_authen_controller.dart';
import 'package:flutter_mobile/pages/expand/settings/views/widgets_detail.dart';
import 'package:flutter_mobile/widgets/dropdow_box_select.dart';

class TwoFactorAuthenPage extends BaseScreen<TwoFactorAuthenController>
    with OtpPinTypeDisplay {
  TwoFactorAuthenPage({Key? key}) : super(key: key);

  @override
  TwoFactorAuthenController putController() => TwoFactorAuthenController();

  @override
  Widget builder() {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  AppBar get _buildAppBar =>
      AppBar(title: Text(LocaleKeys.setting_two_authen.tr));

  Widget get _buildBody => ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[_buildSelectAccount, _buildListItem],
      );

  // acc
  Widget get _buildSelectAccount => Padding(
        padding: const EdgeInsets.all(18),
        child: DropdownBoxSelect<AccountInfor>(
          title: LocaleKeys.account.tr,
          datas: const <Select<AccountInfor>>[], // controller.listSubAccount,
          hint: controller.currentAccSelected?.title ?? '',
          // initialValue: controller.currentAccSelected,
          width: .55.getWidth,
          selectedValue: controller.onSelectAccount,

          hintStyle:
              textStyle.custom(fontWeight: FontWeight.w300, color: color.grey0),
        ),
      );

  // infor
  Widget get _buildListItem => ValueListenableBuilder<Srv4511ResultData3>(
      valueListenable: controller.inforRegister,
      builder:
          (BuildContext context, Srv4511ResultData3? data, Widget? widget) =>
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Đăng nhập
                  _buildItem(
                    LocaleKeys.goline_AuthenDangNhap.tr,
                    content: getOtpPinTypeDisplay(data?.loginType),
                  ),
                  _buildDivider,
                  // Đặt lệnh
                  _buildItem(
                    LocaleKeys.goline_AuthenDatLenh.tr,
                    content: getOtpPinTypeDisplay(data?.orderType),
                  ),
                  _buildDivider,
                  // Ứng trước
                  _buildItem(
                    LocaleKeys.goline_AuthenUngTruoc.tr,
                    content: getOtpPinTypeDisplay(data?.payAdvanceType),
                  ),
                  _buildDivider,
                  // Chuyển khoản
                  _buildItem(
                    LocaleKeys.goline_AuthenChuyenKhoan.tr,
                    content: getOtpPinTypeDisplay(data?.tranferType),
                  ),
                  _buildDivider,
                  // Đăng ký mua PHT
                  _buildItem(
                    LocaleKeys.goline_AuthenDangKyMuaPHT.tr,
                    content: getOtpPinTypeDisplay(data?.capitalIncreaseAppType),
                  ),
                  _buildDivider,
                  // Bán lô lẻ
                  _buildItem(
                    LocaleKeys.goline_AuthenBanLoLe.tr,
                    content: getOtpPinTypeDisplay(data?.oddLotType),
                  ),
                  _buildDivider,
                  // Margin
                  _buildItem(
                    LocaleKeys.goline_AuthenMargin.tr,
                    content: getOtpPinTypeDisplay(data?.marginType),
                  ),
                  _buildDivider,
                  _buildItemConfirmSession(data?.oneTimeAuth != null &&
                      data!.oneTimeAuth!.toLowerCase() == 'true')
                ],
              ));

  Divider get _buildDivider => Divider(height: 1, color: color.grey80);

  Widget _buildItem(String title, {String? content}) => Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle.regular(color: color.grey30),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                content ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle.regular(color: color.grey0),
              ),
            ),
          ],
        ),
      );

  // Xác thực theo phiên
  Widget _buildItemConfirmSession(bool isActive) => WidgetsDetail().itemSetting(
        title: LocaleKeys.goline_AuthenXacThucTheoPhien.tr,
        hintDescript:
            isActive ? LocaleKeys.goline_On.tr : LocaleKeys.goline_Off.tr,
        onClick: () {},
        iconAction: CupertinoSwitch(
          activeColor: color.green50,
          value: isActive,
          onChanged: (bool sattus) {
            controller.onRegisterSession(sattus);
          },
        ).paddingOnly(left: 10),
      );
}
