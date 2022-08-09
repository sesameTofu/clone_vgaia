import 'dart:async';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/domain/model/stock_transfer/sec_balance_list_model.dart';
import 'package:flutter_mobile/domain/usecase/stock_transfer/sec_balance_list_use_case.dart';
import 'package:flutter_mobile/domain/usecase/stock_transfer/submit_transfer_sec_use_case.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/utils/functs.dart';
import 'package:flutter_mobile/widgets/account/account_mixi_controller.dart';

class StockTransferRequestController extends BaseController with AccountMixi {
  final Rx<bool> isFocus = false.obs;
  final SecBalanceListUseCase _secBalanceListUseCase = SecBalanceListUseCase();
  final SubmitTransferSecUseCase _submitTransferSecUseCase =
      SubmitTransferSecUseCase();
  final Rx<List<SecBalanceListModel>> listSecBalance =
      Rx<List<SecBalanceListModel>>(<SecBalanceListModel>[]);
  final RxList<Select<String>> listAccount = <Select<String>>[].obs;
  final Rx<Select<String>> subReceiveAccount = Select<String>().obs;
  final RxList<Select<String>> listReceiveAccount = <Select<String>>[].obs;

  // list mã đc chọn
  final Rx<Set<int>> listAccSelect = Rx<Set<int>>(<int>{});

  final TextEditingController nodeCtrl = TextEditingController();
  final RxBool isLoadingPage = false.obs;
  //disable button confirm
  Rx<bool> isconfirm = false.obs;

  @override
  void onInit() {
    initAccount();
    getSecBalanceList();
    getContentTransfer();
    super.onInit();
  }

  Future<void> getSecBalanceList() async {
    Timer(Duration.zero, () => showLoading());
    await _secBalanceListUseCase.getSecBalanceList(
      subAccoNoFrom: '045C909259.01',
      subAccoNoTo: '045C909259.01',
      onSuccess: (List<SecBalanceListModel> data) {
        listSecBalance.value = data;
      },
      onFailure: (dynamic error) {
        AppToast.showError(getError(error));
      },
    );
    hideLoading();
  }

  bool isSelectAll(Set<int> value) {
    if (value.isEmpty) {
      return false;
    }
    return value.length == listSecBalance.value.length;
  }

  // chọn-bỏ chọn all
  void setSelectAll(bool value) {
    final Set<int> datas = <int>{...listAccSelect.value};

    if (!value) {
      datas.clear();
    } else {
      for (int i = 0; i < listSecBalance.value.length; i++) {
        datas.add(i);
      }
    }

    listAccSelect.value = datas;
  }

  // check chọn
  bool isSelect(int index, Set<int> value) {
    return value.contains(index);
  }

  // check focus
  void changeStateKeyboard(bool value) {
    isFocus.value = value;
  }

  String? validateSubmit() {
    if (isNullOrEmpty(listSecBalance)) {
      return LocaleKeys.goline_NoDataFound.tr;
    }

    //validate ít nhất 1 trường
    if (isNullOrEmpty(listAccSelect.value)) {
      return LocaleKeys.stock_transfer_select_at_least_one.tr;
    }

    for (int i = 0; i < listSecBalance.value.length; i++) {
      final String textValue =
          listSecBalance.value[i].textEditingController!.text;
      //sl chuyển = 0
      if (listAccSelect.value.any((int e) => e == i) &&
          (textValue.isEmpty || textValue == '0')) {
        return LocaleKeys.stock_transfer_alertAmount1.tr;
      }
      //sl chuyển > số dư
      if (listAccSelect.value.any((int e) => e == i) &&
          textValue.formatNumber() >
              listSecBalance.value[i].secTransferAvail!.formatNumber()) {
        return LocaleKeys.stock_transfer_alertAmount2.tr;
      }
    }

    //nội dung k đc để trống
    if (isNullOrEmpty(nodeCtrl.text)) {
      return LocaleKeys.transfers_content_not_entered.tr;
    }

    //k có tk nhận
    if (isNullOrEmpty(listSubAccount)) {
      return LocaleKeys.stock_transfer_account_can_not_empty.tr;
    }

    return null;
  }

  // check chọn
  void setSelect(int index) {
    final Set<int> datas = <int>{...listAccSelect.value};
    if (listAccSelect.value.contains(index)) {
      listAccSelect.value = datas..remove(index);
    } else {
      listAccSelect.value = datas..add(index);
    }
  }

  void selectReceiveAccount(Select<String> value) {
    if (subReceiveAccount.value == value) {
      return;
    }
    subReceiveAccount.value = value;
    getContentTransfer();
  }

  void getReceiveAccount() {
    listReceiveAccount.value = listSubAccount
        .where((Select<String> value) => value.value != subAccount.value.value)
        .toList();
    if (subReceiveAccount.value.value == null ||
        subAccount.value.value == subReceiveAccount.value.value) {
      selectReceiveAccount(listReceiveAccount.first);
    }
  }

  void submitTransferSec() {
    _submitTransferSecUseCase.submitTransferSec(
      subAcccoNoFrom: subAccount.value.value ?? '',
      subAcccoNoTo: subReceiveAccount.value.value,
      subAccCdFrom: '1175',
      subAccCdTo: '44218',
      secCd: 'TNG',
      quantity: '100',
      price: '0',
      remarks: nodeCtrl.text,
    );
  }

  void getContentTransfer() {
    nodeCtrl.text =
        '${subAccount.value.value} chuyển khoản chứng khoán sang ${subReceiveAccount.value.value}';
  }

  @override
  void accountChange(Select<String> subAccount, {bool isFrist = false}) {
    getReceiveAccount();
    getContentTransfer();
  }
}
