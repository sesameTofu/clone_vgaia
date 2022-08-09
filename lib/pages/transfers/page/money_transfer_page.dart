import 'package:flutter_mobile/domain/model/money_transfer/account_tra_model.dart';
import 'package:flutter_mobile/domain/model/money_transfer/transfer_bank_model.dart';
import 'package:flutter_mobile/domain/model/money_transfer/transfer_contract_bank.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/transfers/controller/money_transfer_controller.dart';
import 'package:flutter_mobile/pages/transfers/transfers_controller.dart';
import 'package:flutter_mobile/pages/transfers/widget/filter_transfer_widget.dart';
import 'package:flutter_mobile/widgets/button/widget_button.dart';
import 'package:flutter_mobile/widgets/checkbox.dart';
import 'package:flutter_mobile/widgets/text_field/build_input_text.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class MoneyTransferPage extends BaseScreen<MoneyTransferController> {
  MoneyTransferPage({Key? key, required this.controllerPage}) : super(key: key);

  final TransferController controllerPage;

  @override
  Widget builder() =>
      Focus(onFocusChange: controller.changeStateKeyboard, child: _buildBody());

  @override
  MoneyTransferController? putController() =>
      MoneyTransferController(controllerPage);

  Widget _buildBody() => Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.0.width),
              children: <Widget>[
                FilterTransferWidget(),
                ValueListenableBuilder<Select<TypeMoneyTransfer>>(
                    valueListenable: controller.typeTransfer,
                    builder: (
                      BuildContext context,
                      Select<TypeMoneyTransfer> data,
                      Widget? child,
                    ) {
                      if (data.value == TypeMoneyTransfer.bankTransfer) {
                        return _buildInfoTransferBank();
                      }
                      return _buildInfoTransferLocal();
                    }),
                _buildInputMoney(),
                _buildFee(),
                _buildInputRemarkTransfer(),
              ],
            ),
          ),
          _buildButton(),
        ],
      );

  Widget _buildInfoTransferLocal() => Column(
        children: <Widget>[
          ValueListenableBuilder<List<String>>(
            valueListenable: controller.transferContractLocal,
            builder: (BuildContext context, List<String> data, Widget? child) =>
                _buildTextInfo(LocaleKeys.transfers_account_holder.tr,
                    data.tryGet(0) ?? '---'),
          ),
          ValueListenableBuilder<AccountTraModel>(
            valueListenable: controller.dataAccountTraModel,
            builder:
                (BuildContext context, AccountTraModel data, Widget? child) =>
                    _buildTextInfo(LocaleKeys.transfers_transferAvail.tr,
                        data.transferAvail?.formatVolume() ?? '---'),
          )
        ],
      );

  Widget _buildInfoTransferBank() => Column(
        children: <Widget>[
          ValueListenableBuilder<TransferContractBank>(
            valueListenable: controller.transferContractBank,
            builder: (BuildContext context, TransferContractBank data,
                    Widget? child) =>
                Column(
              children: <Widget>[
                _buildTextInfo(LocaleKeys.transfers_account_holder.tr,
                    data.bankAccountName ?? '---'),
                _buildTextInfo(LocaleKeys.goline_TransferBank_BankCd.tr,
                    data.bankCd ?? '---'),
                _buildTextInfo(LocaleKeys.goline_TransferBank_BankBranchCd.tr,
                    data.bankBranchNameDisp ?? '---'),
                _buildTextInfo(LocaleKeys.goline_TransferBank_BankProvince.tr,
                    data.province ?? '---')
              ],
            ),
          ),
          ValueListenableBuilder<TransferBankModel>(
            valueListenable: controller.dataAccountTraBankModel,
            builder:
                (BuildContext context, TransferBankModel data, Widget? child) =>
                    _buildTextInfo(LocaleKeys.transfers_transferAvail.tr,
                        data.transferAvail?.formatVolume() ?? '---'),
          )
        ],
      );

  Widget _buildTextInfo(String title, String value) => Padding(
        padding: EdgeInsets.symmetric(vertical: 14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title, style: textStyle.regular(size: 13, color: color.grey0)),
            Text(value, style: textStyle.medium(size: 13, color: color.grey0)),
          ],
        ),
      );

  Widget _buildInputMoney() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(LocaleKeys.goline_TransferLocal_Amount.tr,
              style: textStyle.regular(size: 13, color: color.grey0)),
          SizedBox(
            width: .55.getWidth,
            child: BuildInputText(
              hintText: LocaleKeys.goline_NhapSoTien.tr,
              controller: controller.moneyCtrl,
              fillColor: color.background1,
              currentNode: controller.moneyFocusNode,
              textInputType: TextInputType.number,
              inputFormatters: <ThousandsFormatter>[ThousandsFormatter()],
            ),
          ),
        ],
      );

  Widget _buildInputRemarkTransfer() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(LocaleKeys.goline_Content.tr,
                style: textStyle.regular(size: 13, color: color.grey0)),
          ),
          SizedBox(
            width: .55.getWidth,
            child: BuildInputText(
              hintText: LocaleKeys.transfers_Content_transfer.tr,
              controller: controller.remarkCtrl,
              fillColor: color.background1,
              currentNode: controller.remarkFocusNode,
              maxLines: 4,
              scrollPadding: EdgeInsets.only(bottom: 60.0),
            ),
          ),
        ],
      );

  Widget _buildButton() => ValueListenableBuilder<bool>(
      valueListenable: controller.isFocus,
      builder: (_, bool value, __) {
        if (value) {
          return SizedBox(height: 10.0);
        }

        return Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: WidgetButton(
                    title: LocaleKeys.goline_Delete.tr,
                    typeButton: TypeButton.secondary,
                    onClick: () {
                      controller.clean();
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: WidgetButton(
                    title: LocaleKeys.goline_Confirm.tr,
                    onClick: () {
                      controller.submit();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      });

  Widget _buildFee() => Column(
        children: <Widget>[
          ValueListenableBuilder<num>(
            valueListenable: controller.transferFeeRate,
            builder: (BuildContext context, num data, Widget? child) =>
                _buildTextInfo(
                    LocaleKeys.transfers_fee.tr, data.formatVolume()),
          ),
          ValueListenableBuilder<Select<TypeMoneyTransfer>>(
            valueListenable: controller.typeTransfer,
            builder: (BuildContext context, Select<TypeMoneyTransfer> data,
                    Widget? child) =>
                Visibility(
              visible: data.value == TypeMoneyTransfer.bankTransfer,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _buildTypeFee(true, LocaleKeys.transfers_fee_in.tr),
                    _buildTypeFee(false, LocaleKeys.transfers_external_fee.tr),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  Widget _buildTypeFee(bool value, String title) =>
      ValueListenableBuilder<bool>(
        valueListenable: controller.feeType,
        builder: (BuildContext context, bool data, Widget? child) => Row(
          children: <Widget>[
            CheckBox(
                value: data == value,
                onPress: (bool data) {
                  controller.setFeeType(value);
                }),
            Text(
              title,
              style: textStyle.regular(),
            )
          ],
        ),
      );
}
