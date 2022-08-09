import 'dart:math';

import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/domain/model/authencation/pin_data_model.dart';
import 'package:flutter_mobile/domain/model/money_transfer/account_tra_model.dart';
import 'package:flutter_mobile/domain/model/money_transfer/base_pair_value_model.dart';
import 'package:flutter_mobile/domain/model/money_transfer/parameter_bank_model.dart';
import 'package:flutter_mobile/domain/model/money_transfer/parameter_bank_param.dart';
import 'package:flutter_mobile/domain/model/money_transfer/submit_transfer_bank_param.dart';
import 'package:flutter_mobile/domain/model/money_transfer/submit_transfer_param.dart';
import 'package:flutter_mobile/domain/model/money_transfer/transfer_bank_model.dart';
import 'package:flutter_mobile/domain/model/money_transfer/transfer_contract.dart';
import 'package:flutter_mobile/domain/model/money_transfer/transfer_contract_bank.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/domain/usecase/account_use_case.dart';
import 'package:flutter_mobile/domain/usecase/money_transfer/money_transfer_use_case.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/transfers/transfers_controller.dart';
import 'package:flutter_mobile/utils/functs.dart';

class MoneyTransferController extends BaseController {
  MoneyTransferController(this.controllerPage);

  final TransferController controllerPage;

  final AccountUseCase _accountUseCase = AccountUseCase();

  final MoneyTransferUseCase _transferUseCase = MoneyTransferUseCase();

  final RxListNotify<Select<String>> listSubAccount =
      <Select<String>>[].objective;

  Select<String>? subAccount = Select<String>();

  List<Select<TypeMoneyTransfer>> listTypeMoneyTransfer =
      <Select<TypeMoneyTransfer>>[];

  final RxNotify<AccountTraModel> dataAccountTraModel =
      AccountTraModel().objective;

  final RxNotify<TransferBankModel> dataAccountTraBankModel =
      TransferBankModel().objective;

  final RxNotify<Select<TypeMoneyTransfer>> typeTransfer =
      Select<TypeMoneyTransfer>().objective;

  final RxListNotify<Select<String>> listReceiveAccount =
      <Select<String>>[].objective;

  List<BasePairValueModel> listBasePairValueModel = <BasePairValueModel>[];

  List<TransferContract> listTransferContract = <TransferContract>[];

  Select<String>? receiveAccount = Select<String>();

  final RxListNotify<String> transferContractLocal = <String>[].objective;

  final RxNotify<TransferContractBank> transferContractBank =
      TransferContractBank().objective;

  final TextEditingController moneyCtrl = TextEditingController();

  final FocusNode moneyFocusNode = FocusNode();

  final TextEditingController remarkCtrl =
      TextEditingController(text: LocaleKeys.transfers_transfers.tr);

  final FocusNode remarkFocusNode = FocusNode();

  ParameterBankData parameterBankData = ParameterBankData();

  final RxNotify<num> transferFeeRate = 0.objective;

  // true: phí trong
  final RxNotify<bool> feeType = true.objective;

  final RxNotify<bool> isFocus = false.objective;

  @override
  void onInit() {
    moneyFocusNode.addListener(() {
      if (!moneyFocusNode.hasFocus) {
        getFeeAmt();
      }
    });
    getListSubAccount();
    getTypeMoneyTransfer();
    super.onInit();
  }

  void setFeeType(bool value) {
    if (feeType.value != value) {
      feeType.value = value;
    }
  }

  // Lấy danh sách tiểu khoản
  void getListSubAccount() {
    _accountUseCase.getSubAccountList(
      onSuccess: (List<String> listSub) {
        final List<Select<String>> list = <Select<String>>[];
        for (final String value in listSub) {
          list.add(Select<String>(title: value, value: value));
        }
        listSubAccount.value = list;
        selectAccount(listSubAccount.value.tryGet(0));
      },
      onFailure: (dynamic error) {},
    );
  }

  // chọn TK chuyển
  void selectAccount(Select<String>? account) {
    if (account != subAccount) {
      subAccount = account;
      inquiryAccount();
      getSubAccToLocalList();
    }
  }

  // list type chuyển khoản
  void getTypeMoneyTransfer() {
    listTypeMoneyTransfer = TypeMoneyTransfer.values
        .map((TypeMoneyTransfer e) => Select<TypeMoneyTransfer>(
              title: e.title,
              value: e,
            ))
        .toList();
    selectTypeMoneyTransfer(listTypeMoneyTransfer[0]);
  }

  // chọn type chuyển khoản
  void selectTypeMoneyTransfer(Select<TypeMoneyTransfer> type) {
    if (type != typeTransfer.value) {
      typeTransfer.value = type;
      inquiryAccount();
      getSubAccToLocalList();
    }
  }

  // Lấy thông tin TK chuyển
  void inquiryAccount() {
    switch (typeTransfer.value.value) {
      case TypeMoneyTransfer.bankTransfer:
        _transferUseCase.inquiryAccountTransBank(
          subAccoNo: subAccount?.value ?? '',
          onSuccess: (TransferBankModel data) {
            dataAccountTraBankModel.value = data;
          },
          onFailure: (dynamic error) {},
        );
        break;
      case TypeMoneyTransfer.internalTransfer:
        _transferUseCase.inquiryAccountTra(
          subAccoNo: subAccount?.value ?? '',
          onSuccess: (AccountTraModel data) {
            dataAccountTraModel.value = data;
          },
          onFailure: (dynamic error) {},
        );
        break;
      default:
        break;
    }
  }

  // list TK nhận
  void getSubAccToLocalList() {
    switch (typeTransfer.value.value) {
      case TypeMoneyTransfer.bankTransfer:
        _transferUseCase.getSubAccToList(
          subAccoNo: subAccount?.value ?? '',
          onSuccess: (List<TransferContract> data) {
            listTransferContract = data;
            final List<Select<String>> list = <Select<String>>[];
            for (final TransferContract value in data) {
              list.add(Select<String>(
                title: value.bankAccNumber,
                value: value.bankAccNumber,
              ));
            }
            listReceiveAccount.value = list;
            selectReceiveAccount(list.tryGet(0));
          },
          onFailure: () {},
        );

        break;
      case TypeMoneyTransfer.internalTransfer:
        _transferUseCase.getSubAccToLocalList(
          subAccoNo: subAccount?.value ?? '',
          onSuccess: (List<BasePairValueModel> data) {
            listBasePairValueModel = data;
            final List<Select<String>> list = <Select<String>>[];
            for (final BasePairValueModel value in data) {
              list.add(Select<String>(
                title: value.value,
                value: value.value,
              ));
            }
            listReceiveAccount.value = list;
            selectReceiveAccount(list.tryGet(0));
          },
          onFailure: () {},
        );
        break;
      default:
        break;
    }
  }

  // chọn TK chuyển
  void selectReceiveAccount(Select<String>? data) {
    if (data != receiveAccount) {
      receiveAccount = data;
      findTransferContractLocal();
    }
  }

  // Thông tin tk chuyển
  Future<void> findTransferContractLocal() async {
    switch (typeTransfer.value.value) {
      case TypeMoneyTransfer.bankTransfer:
        await _transferUseCase.findTransferContractBank(
          subAccoNo: dataAccountTraBankModel.value.subAccoCd ?? '',
          toSubAccountNo: receiveAccount?.value ?? '',
          checkBankList: dataAccountTraBankModel.value.checkBankList,
          onSuccess: (TransferContractBank data) {
            transferContractBank.value = data;
          },
          onFailure: (dynamic error) {},
        );
        break;
      case TypeMoneyTransfer.internalTransfer:
        await _transferUseCase.findTransferContractLocal(
          subAccCd: '${dataAccountTraModel.value.subAccoCd ?? ''}',
          toSubAccountNo: receiveAccount?.value ?? '',
          checkContract: dataAccountTraModel.value.checkLocalList,
          onSuccess: (List<String> data) {
            transferContractLocal.value = data;
          },
          onFailure: (dynamic error) {},
        );
        break;
      default:
        break;
    }
    findParameterBankDetail();
  }

  // lấy Dl tính phí
  void findParameterBankDetail() {
    switch (typeTransfer.value.value) {
      case TypeMoneyTransfer.bankTransfer:
        _transferUseCase.findParameterBankDetail(
          param: ParameterBankParam(
            branchCd: dataAccountTraBankModel.value.branchCd,
            transactionCd: dataAccountTraBankModel.value.transactionCd,
            groupCd: dataAccountTraBankModel.value.groupCd,
            paramGroup: 'TR00',
            paramName: null,
            bankCd: transferContractBank.value.bankCd,
            bankBranchCd: null,
          ),
          onSuccess: (ParameterBankData data) {
            parameterBankData = data;
            getFeeAmt();
          },
          onFailure: (dynamic error) {},
        );
        break;
      case TypeMoneyTransfer.internalTransfer:
        _transferUseCase.findParameterBankDetail(
          param: ParameterBankParam(
            branchCd: dataAccountTraModel.value.branchCd,
            transactionCd: dataAccountTraModel.value.transactionCd,
            groupCd: dataAccountTraModel.value.groupCd,
            paramGroup: '3',
            paramName: null,
            bankCd: 'LOCAL',
            bankBranchCd: null,
          ),
          onSuccess: (ParameterBankData data) {
            parameterBankData = data;
            getFeeAmt();
          },
          onFailure: (dynamic error) {},
        );
        break;
      default:
        break;
    }
  }

  String? validateSubmit() {
    if (moneyCtrl.text.isEmpty) {
      return LocaleKeys.transfers_amount_not_entered.tr;
    }

    if (remarkCtrl.text.isEmpty) {
      return LocaleKeys.transfers_content_not_entered.tr;
    }

    return null;
  }

  // check phong toả == 0 > khg bị phong toả
  Future<bool> getCustomerRestriction() async {
    bool restriction = true;
    await _transferUseCase.getCustomerRestrictionSecTransfer(
      subAccoCd: 0,
      subAccoNo: subAccount?.value ?? '',
      restrictionCd:
          typeTransfer.value.value == TypeMoneyTransfer.bankTransfer ? 5 : 6,
      onSuccess: (num data) {
        if (data == 0) {
          restriction = false;
        } else {
          AppToast.showError(LocaleKeys.transfers_account_Restriction.tr);
        }
      },
      onFailure: (dynamic error) {
        AppToast.showError(getError(error));
      },
    );
    return restriction;
  }

  // submit chuyển tiền
  Future<void> submit() async {
    if (validateSubmit() != null) {
      AppToast.showError(validateSubmit());
      return;
    }

    if (await getCustomerRestriction()) {
      return;
    }
    await _transferUseCase.checkPinType(
      onSuccess: (PinDataModel? pinDataModel) {
        if (pinDataModel == null || pinDataModel.pinType == null) {
          return;
        }

        String? otp;

        switch (pinDataModel.pinType!) {
          case PinType.SmartOtp:
            // otp = get Smart OTP
            break;
          case PinType.None:
            otp = null;
            break;
          case PinType.Password:
          case PinType.Matrix:
          case PinType.Otp:
          case PinType.Token:
          case PinType.CA:
            //otp = _getOtp
            break;
        }

        // otp = null vẫn submit khi pinType = PinType.None
        if (otp == null && pinDataModel.pinType! != PinType.None) {
          return;
        }

        submitTransfer(otp: otp);
      },
      onFailure: (dynamic error) {
        AppToast.showError(getError(error));
      },
    );
  }

  Future<void> submitTransfer({String? otp}) async {
    switch (typeTransfer.value.value) {
      case TypeMoneyTransfer.bankTransfer:
        _transferUseCase.submitTransferBank(
          param: SubmitTransferBankParam(
              subAccoNo: subAccount?.value,
              subAccCd: dataAccountTraBankModel.value.subAccoCd,
              bankAccoNumber: receiveAccount?.value,
              bankAccoName: transferContractBank.value.bankAccountName,
              bankCd: transferContractBank.value.bankCd,
              bankBranchName: transferContractBank.value.bankBranchName,
              bankBranchLocationCd:
                  transferContractBank.value.bankBranchLocationCd,
              amount: moneyCtrl.text.replaceSemicolon().formatNumber(),
              feeType: feeType.value ? 1 : 0,
              remarks: remarkCtrl.text,
              sourceChannel: 5,
              otpCode: otp),
          onSuccess: () {
            AppToast.showSuccess(LocaleKeys.transfers_transfer_Success.tr);
            controllerPage.onChangePage(1);
          },
          onFailure: (dynamic error) {
            AppToast.showError(getError(error));
          },
        );
        break;
      case TypeMoneyTransfer.internalTransfer:
        _transferUseCase.submitTransfer(
          param: SubmitTransferParam(
              alloDate: DateTime.now().formatTimeServer().formatNumber(),
              refNo: 0,
              subAccoNo: subAccount?.value,
              subAccoTo: receiveAccount?.value,
              subAccCd: dataAccountTraModel.value.subAccoCd,
              toSubAccCd:
                  transferContractLocal.value.tryGet(1)?.formatNumber() ?? 0,
              amount: moneyCtrl.text.replaceSemicolon().formatNumber(),
              remarks: remarkCtrl.text,
              sourceChannel: 5,
              password: null,
              timeStamp: null,
              mode: 1,
              otpCode: otp),
          onSuccess: () {
            AppToast.showSuccess(LocaleKeys.transfers_transfer_Success.tr);
            controllerPage.onChangePage(1);
          },
          onFailure: (dynamic error) {
            AppToast.showError(getError(error));
          },
        );
        break;
      default:
        break;
    }
  }

  void clean() {
    feeType.value = true;
    moneyCtrl.text = '';
    remarkCtrl.text = LocaleKeys.transfers_transfers.tr;
  }

  // set tính phí
  void getFeeAmt() {
    if (moneyCtrl.text.isEmpty) {
      transferFeeRate.value = 0;
      return;
    }

    final num _amount = moneyCtrl.text.replaceSemicolon().formatNumber();
    if (_amount > 0) {
      transferFeeRate.value = max(
        _amount * (parameterBankData.transferFeeRate ?? 0),
        parameterBankData.transferFeeMin ?? 0,
      );
      return;
    } else {
      transferFeeRate.value = parameterBankData.transferFee ?? 0;
      return;
    }
  }

  void changeStateKeyboard(bool value) {
    isFocus.value = value;
  }
}
