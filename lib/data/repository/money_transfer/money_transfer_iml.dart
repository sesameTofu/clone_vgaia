import 'package:flutter_mobile/data/source/dio/api_error.dart';
import 'package:flutter_mobile/data/source/dio/api_response.dart';
import 'package:flutter_mobile/data/source/dio/rest_client.dart';
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
import 'package:flutter_mobile/domain/repository/money_transfer/money_transfer_reponsitory.dart';

class MoneyTransferRepositoryIml extends MoneyTransferRepository {
  MoneyTransferRepositoryIml(this._client);

  final RestClient _client;

  @override
  Future<List<TransferLocalModel>> findTransferLocal(
      {required FindTransferLocalParam param}) async {
    final ApiResponse response =
        await _client.post('findTransferLocal', data: param.toMap());

    if (response.statusCode == 0) {
      if (response.data == null) {
        return <TransferLocalModel>[];
      }
      return <TransferLocalModel>[
        ...response.data
            .map((dynamic e) =>
                TransferLocalModel.fromMap(e as Map<String, dynamic>))
            .toList()
      ];
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<List<TransferBank>> findTransferBankHistory(
      {required FindTransferBankParam param}) async {
    final ApiResponse response = await _client.post(
      'findTransferBankHistory',
      data: param.toMap(),
    );
    if (response.statusCode == 0) {
      if (response.data == null) {
        return <TransferBank>[];
      }

      return <TransferBank>[
        ...(response.data as List<dynamic>)
            .map((dynamic e) => TransferBank.fromMap(e as Map<String, dynamic>))
            .toList()
      ];
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<void> submitTransfer({required SubmitTransferParam param}) async {
    final ApiResponse response =
        await _client.post('submitTransfer', data: param.toMap());
    if (response.statusCode == 0) {
      return;
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<void> submitTransferBank(
      {required SubmitTransferBankParam param}) async {
    final ApiResponse response = await _client.post(
      'submitTransferBank',
      data: param.toMap(),
    );
    if (response.statusCode == 0) {
      return;
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<TransferBankModel> inquiryAccountTransBank(
      {required String subAccoNo}) async {
    final ApiResponse response = await _client.post(
      'inquiryAccountTransBank',
      data: <String, dynamic>{
        'subAccoNo': subAccoNo,
      },
    );

    if (response.statusCode == 0) {
      if (response.data == null) {
        return TransferBankModel();
      }
      return TransferBankModel.fromMap(response.data as Map<String, dynamic>);
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<AccountTraModel> inquiryAccountTra({required String subAccoNo}) async {
    final ApiResponse response = await _client.post(
      'inquiryAccountTra',
      data: <String, dynamic>{
        'subAccoNo': subAccoNo,
      },
    );
    if (response.statusCode == 0) {
      return AccountTraModel.fromMap(response.data as Map<String, dynamic>);
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<List<BasePairValueModel>> getSubAccToLocalList(
      {required String subAccoNo}) async {
    final ApiResponse response = await _client.post(
      'getSubAccToLocalList',
      data: <String, dynamic>{'subAccNo': subAccoNo},
    );
    if (response.statusCode == 0) {
      if (response.data == null) {
        return <BasePairValueModel>[];
      }

      return <BasePairValueModel>[
        ...response.data
            .map((dynamic e) =>
                BasePairValueModel.fromMap(e as Map<String, dynamic>))
            .toList()
      ];
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<List<String>> findTransferContractLocal({
    required String subAccCd,
    required String toSubAccountNo,
    num? checkContract,
  }) async {
    final ApiResponse response = await _client.post(
      'findTransferContractLocal',
      data: <String, dynamic>{
        'subAccCd': subAccCd,
        'toSubAccountNo': toSubAccountNo,
        'checkContract': checkContract
      },
    );
    if (response.statusCode == 0) {
      final List<String> data =
          (response.data as List<dynamic>).cast<String>().toList();
      return data;
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<ParameterBankData> findParameterBankDetail({
    required ParameterBankParam param,
  }) async {
    final ApiResponse response = await _client.post(
      'findParameterBankDetail',
      data: param.toMap(),
    );
    if (response.statusCode == 0) {
      if (response.data == null) {
        return ParameterBankData();
      }

      return ParameterBankData.fromMap(response.data as Map<String, dynamic>);
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<List<TransferContract>> getSubAccToList(
      {required String subAccoNo}) async {
    final ApiResponse response = await _client.post(
      'getSubAccToList',
      data: <String, dynamic>{
        'subAccoNo': subAccoNo,
      },
    );
    if (response.statusCode == 0) {
      if (response.data == null) {
        return <TransferContract>[];
      }
      return (response.data as List<dynamic>)
          .map((dynamic e) =>
              TransferContract.fromMap(e as Map<String, dynamic>))
          .toList();
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<TransferContractBank> findTransferContractBank({
    required String subAccoNo,
    required String toSubAccountNo,
    num? checkBankList,
  }) async {
    final ApiResponse response = await _client.post(
      'findTransferContractBank',
      data: <String, dynamic>{
        'subAccCd': subAccoNo,
        'toSubAccountNo': toSubAccountNo,
        'checkBankList': checkBankList,
      },
    );
    if (response.statusCode == 0) {
      return TransferContractBank.fromMap(
          response.data as Map<String, dynamic>);
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<num> getCustomerRestrictionSecTransfer({
    required num subAccoCd,
    required String subAccoNo,
    required num restrictionCd,
  }) async {
    final ApiResponse response = await _client.post(
      'getCustomerRestriction',
      data: <String, dynamic>{
        'subAccoCd': subAccoCd,
        'subAccoNo': subAccoNo,
        'restrictionCd': restrictionCd
      },
    );
    if (response.statusCode == 0) {
      return response.data as num;
    }
    throw ApiError.fromResponse(response);
  }

  @override
  Future<bool> deleteTransferBank(
      {required num? alloDate,
      required num? refNo,
      required String? timeStamp}) async {
    final ApiResponse response = await _client.post(
      'deleteTransferBank',
      data: <String, dynamic>{
        'aloDate': alloDate,
        'refNo': refNo,
        'timeStamp': timeStamp
      },
    );
    if (response.statusCode == 0) {
      return true;
    }
    throw ApiError.fromResponse(response);
  }
}
