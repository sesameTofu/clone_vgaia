import 'package:flutter_mobile/data/repository/authencation_reponsitory_impl.dart';
import 'package:flutter_mobile/data/repository/money_transfer/money_transfer_iml.dart';
import 'package:flutter_mobile/data/source/dio/api/rest_client_base.dart';
import 'package:flutter_mobile/domain/model/authencation/pin_data_model.dart';
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
import 'package:flutter_mobile/domain/repository/authentication_reponsitory.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/global/app_enum.dart';

class MoneyTransferUseCase {
  final MoneyTransferRepositoryIml _userRepository =
      MoneyTransferRepositoryIml(RestClientBase());
  final AuthencationReponsitory _auThenCationRepository =
      AuthencationReponsitoryImpl();

  // get pinType
  Future<void> checkPinType({
    required Function(PinDataModel? pinDataModel) onSuccess,
    required Function onFailure,
  }) async {
    try {
      final PinDataModel? pinDataModel = await _auThenCationRepository
          .checkPinType(businessCd: BusinessCd.Transfer.value);
      onSuccess(pinDataModel);
    } catch (error) {
      onFailure(error);
    }
  }

  // thông tin TK chuyển
  Future<void> inquiryAccountTra({
    required String subAccoNo,
    required Function(AccountTraModel data) onSuccess,
    required Function onFailure,
  }) async {
    try {
      final AccountTraModel data =
          await _userRepository.inquiryAccountTra(subAccoNo: subAccoNo);
      onSuccess(data);
    } catch (error) {
      onFailure(error);
    }
  }

  Future<void> inquiryAccountTransBank({
    required String subAccoNo,
    required Function(TransferBankModel data) onSuccess,
    required Function onFailure,
  }) async {
    try {
      final TransferBankModel data =
          await _userRepository.inquiryAccountTransBank(subAccoNo: subAccoNo);
      onSuccess(data);
    } catch (error) {
      onFailure(error);
    }
  }

  // list TK nhận
  Future<void> getSubAccToLocalList({
    required String subAccoNo,
    required Function(List<BasePairValueModel> date) onSuccess,
    required Function onFailure,
  }) async {
    try {
      final List<BasePairValueModel> data =
          await _userRepository.getSubAccToLocalList(subAccoNo: subAccoNo);
      onSuccess(data);
    } catch (error) {
      onFailure(error);
    }
  }

  // list TK nhận
  Future<void> getSubAccToList({
    required String subAccoNo,
    required Function(List<TransferContract> date) onSuccess,
    required Function onFailure,
  }) async {
    try {
      final List<TransferContract> data =
          await _userRepository.getSubAccToList(subAccoNo: subAccoNo);
      onSuccess(data);
    } catch (error) {
      onFailure(error);
    }
  }

  Future<void> findTransferContractLocal({
    required String subAccCd,
    required String toSubAccountNo,
    num? checkContract,
    required Function(List<String> date) onSuccess,
    required Function onFailure,
  }) async {
    try {
      final List<String> data = await _userRepository.findTransferContractLocal(
        checkContract: checkContract,
        subAccCd: subAccCd,
        toSubAccountNo: toSubAccountNo,
      );
      onSuccess(data);
    } catch (error) {
      onFailure(error);
    }
  }

  Future<void> findTransferContractBank({
    required String subAccoNo,
    required String toSubAccountNo,
    num? checkBankList,
    required Function(TransferContractBank date) onSuccess,
    required Function onFailure,
  }) async {
    try {
      final TransferContractBank data =
          await _userRepository.findTransferContractBank(
        subAccoNo: subAccoNo,
        toSubAccountNo: toSubAccountNo,
        checkBankList: checkBankList,
      );
      onSuccess(data);
    } catch (error) {
      onFailure(error);
    }
  }

  Future<void> submitTransfer({
    required SubmitTransferParam param,
    required Function onSuccess,
    required Function onFailure,
  }) async {
    try {
      await _userRepository.submitTransfer(param: param);
      onSuccess();
    } catch (error) {
      onFailure(error);
    }
  }

  Future<void> submitTransferBank({
    required SubmitTransferBankParam param,
    required Function onSuccess,
    required Function onFailure,
  }) async {
    try {
      await _userRepository.submitTransferBank(param: param);
      onSuccess();
    } catch (error) {
      onFailure(error);
    }
  }

  Future<void> findTransferLocal({
    required FindTransferLocalParam param,
    required Function(List<TransferLocalModel> data) onSuccess,
    required Function onFailure,
  }) async {
    try {
      final List<TransferLocalModel> data =
          await _userRepository.findTransferLocal(param: param);
      onSuccess(data);
    } catch (error) {
      onFailure(error);
    }
  }

  Future<void> findTransferBankHistory({
    required FindTransferBankParam param,
    required Function(List<TransferBank> data) onSuccess,
    required Function onFailure,
  }) async {
    try {
      final List<TransferBank> data =
          await _userRepository.findTransferBankHistory(param: param);
      onSuccess(data);
    } catch (error) {
      onFailure(error);
    }
  }

  Future<void> findParameterBankDetail({
    required ParameterBankParam param,
    required Function(ParameterBankData data) onSuccess,
    required Function onFailure,
  }) async {
    try {
      final ParameterBankData data =
          await _userRepository.findParameterBankDetail(param: param);
      onSuccess(data);
    } catch (error) {
      onFailure(error);
    }
  }

  Future<void> getCustomerRestrictionSecTransfer({
    required num subAccoCd,
    required String subAccoNo,
    required num restrictionCd,
    required Function(num data) onSuccess,
    required Function onFailure,
  }) async {
    try {
      final num data = await _userRepository.getCustomerRestrictionSecTransfer(
        subAccoNo: subAccoNo,
        subAccoCd: subAccoCd,
        restrictionCd: restrictionCd,
      );
      onSuccess(data);
    } catch (error) {
      onFailure(error);
    }
  }
}
