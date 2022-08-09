import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/widgets/account/account_mixi_controller.dart';
import 'package:flutter_mobile/widgets/dropdow_box_select.dart';

mixin AccountMixiWidget on BaseMixin {
  Widget buildAccountTitle(AccountMixi controller, {double? width}) =>
      Obx(() => DropdownBoxSelect<String>(
          title: LocaleKeys.account.tr,
          datas: controller.listSubAccount,
          hint: '',
          initialValue: controller.subAccount.value,
          width: width ?? .6.getWidth,
          selectedValue: controller.selectAccount));

  Widget buildAccount(AccountMixi controller, {double? width}) =>
      Obx(() => DropdownBoxSelect<String>(
          datas: controller.listSubAccount,
          textColor: color.branding,
          initialValue: controller.subAccount.value,
          width: .4.getWidth,
          backgroundImage: color.pathColorAssert,
          selectedValue: controller.selectAccount));
}
