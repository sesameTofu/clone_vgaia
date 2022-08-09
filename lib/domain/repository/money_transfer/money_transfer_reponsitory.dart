import 'package:flutter_mobile/domain/model/money_transfer/account_tra_model.dart';
import 'package:flutter_mobile/domain/model/money_transfer/base_pair_value_model.dart';
import 'package:flutter_mobile/domain/model/money_transfer/find_tranfer_bank_history_param.dart';
import 'package:flutter_mobile/domain/model/money_transfer/find_transfer_local_param.dart';
import 'package:flutter_mobile/domain/model/money_transfer/parameter_bank_model.dart';
import 'package:flutter_mobile/domain/model/money_transfer/parameter_bank_param.dart';
import 'package:flutter_mobile/domain/model/money_transfer/submit_transfer_bank_param.dart';
import 'package:flutter_mobile/domain/model/money_transfer/submit_transfer_param.dart';
import 'package:flutter_mobile/domain/model/money_transfer/transfer_bank.dart';
import 'package:flutter_mobile/domain/model/money_transfer/transfer_bank_model.dart';
import 'package:flutter_mobile/domain/model/money_transfer/transfer_contract.dart';
import 'package:flutter_mobile/domain/model/money_transfer/transfer_contract_bank.dart';
import 'package:flutter_mobile/domain/model/money_transfer/transfer_local_model.dart';

abstract class MoneyTransferRepository {
  Future<List<TransferLocalModel>> findTransferLocal(
      {required FindTransferLocalParam param});

  Future<List<TransferBank>> findTransferBankHistory(
      {required FindTransferBankParam param});

  Future<void> submitTransfer({required SubmitTransferParam param});

  Future<void> submitTransferBank({required SubmitTransferBankParam param});

  Future<TransferBankModel> inquiryAccountTransBank({
    required String subAccoNo,
  });

  Future<AccountTraModel> inquiryAccountTra({required String subAccoNo});

  Future<List<BasePairValueModel>> getSubAccToLocalList(
      {required String subAccoNo});

  Future<List<TransferContract>> getSubAccToList({required String subAccoNo});

  Future<List<String>> findTransferContractLocal({
    required String subAccCd,
    required String toSubAccountNo,
    num? checkContract,
  });

  Future<TransferContractBank> findTransferContractBank({
    required String subAccoNo,
    required String toSubAccountNo,
    num checkBankList,
  });

  Future<ParameterBankData> findParameterBankDetail({
    required ParameterBankParam param,
  });

  Future<num> getCustomerRestrictionSecTransfer({
    required num subAccoCd,
    required String subAccoNo,
    required num restrictionCd,
  });

  Future<bool> deleteTransferBank(
      {required num? alloDate,
      required num? refNo,
      required String? timeStamp});
}
