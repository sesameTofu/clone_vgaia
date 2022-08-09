import 'dart:math';

import 'package:flutter_mobile/controller/global_data_manager.dart';
import 'package:flutter_mobile/data/repository/local/local_user_repository_iml.dart';
import 'package:flutter_mobile/domain/model/account_infor/account_infor.dart';
import 'package:flutter_mobile/domain/model/account_infor/authen_model.dart';
import 'package:flutter_mobile/domain/model/entrust_data.dart';
import 'package:flutter_mobile/domain/model/entrust_type_detail_base.dart';
import 'package:flutter_mobile/domain/model/front_initial_model_mobile.dart';
import 'package:flutter_mobile/domain/model/local/user_local_model.dart';
import 'package:flutter_mobile/domain/model/mstt_code_base.dart';
import 'package:flutter_mobile/domain/repository/local/local_user_repository.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';

class AccountManager {
  factory AccountManager() {
    return _singleton;
  }

  AccountManager._internal();

  static final AccountManager _singleton = AccountManager._internal();
  LocalUserRepository localUserRepository = LocalUserRepositoryIml();
  AccountInfor? accountInfor;
  FrontInitialModelMobile get frontInitialModelMobile =>
      GlobalDataManager().frontInitialModelMobile;

  late UserLocalModel userLocalModel;

  final Rxn<String> accountDefaultRx = Rxn<String>(null);
  final Rx<bool> isShowInfor = false.obs;

  List<AuthenModel> get userAuthenList => <AuthenModel>[];

  void clear() {
    accountInfor = null;
  }

  String? getSubAccoutDefault() {
    return accountDefaultRx.value ?? frontInitialModelMobile.defaultSubAccoNo;
  }

  set accountDefault(String? value) {
    accountDefaultRx.value = value;
  }

  List<String> getSubAccoList(EntrustBusinessCode code) {
    try {
      List<String> resultList = <String>[];

      resultList.addAll(getOwnerList());
      resultList.addAll(getEntrustList(code));

      switch (code) {
        case EntrustBusinessCode.transferCash:
          resultList.removeWhere((String e) => e.endsWith('.51'));
          break;
        case EntrustBusinessCode.transferSec:
          resultList.removeWhere((String e) => e.endsWith('.51'));
          break;
        case EntrustBusinessCode.banking:
          resultList =
              resultList.where((String e) => e.contains('.2')).toList();
          break;
        case EntrustBusinessCode.margin:
          resultList =
              resultList.where((String e) => e.contains('.1')).toList();
          break;
        case EntrustBusinessCode.derivative:
          final List<String> tmpList = resultList;
          tmpList.removeWhere((String e) => !e.endsWith('.50'));
          final List<String> custNoList = <String>[];
          for (final String item in tmpList) {
            final String accountNo =
                item.substring(min(item.length, item.indexOf('|') + 1));
            final List<String> splits = accountNo.split('.');
            if (splits.length > 1) {
              custNoList.add(splits[0]);
            }
          }
          resultList = custNoList;
          break;
        default:
          resultList.removeWhere(
              (String e) => e.endsWith('.50') || e.endsWith('.51'));
          break;
      }
      return resultList;
    } catch (error) {
      return <String>[];
    }
  }

  // list tiểu khoản chính chủ
  List<String> getOwnerList() {
    final List<String> resultList = <String>[];

    final Map<String, String> ownerMap = <String, String>{};

    final List<String> ownerList =
        frontInitialModelMobile.subAccoList ?? <String>[];

    for (final String item in ownerList) {
      final String accoNo =
          item.substring(min(item.length, item.indexOf('|') + 1));
      ownerMap[accoNo] = accoNo;
    }
    resultList.addAll(ownerMap.keys);
    return resultList;
  }

  // list tiểu khoản ủy quyền
  List<String> getEntrustList(EntrustBusinessCode code) {
    final List<String> resultList = <String>[];
    final Map<String, String> entrustMap = <String, String>{};
    final List<EntrustData> entrustList =
        frontInitialModelMobile.entrustList ?? <EntrustData>[];

    if (entrustList.isNotEmpty) {
      return resultList;
    }

    switch (code) {
      case EntrustBusinessCode.owner:
        break;
      case EntrustBusinessCode.all:
        for (final EntrustData item in entrustList) {
          final String accoNo = item.subAccoNo!.substring(min(
              item.subAccoNo?.length ?? 0, item.subAccoNo!.indexOf('|') + 1));
          if (!entrustMap.containsKey(accoNo)) {
            entrustMap[accoNo] = accoNo;
          }
        }
        break;
      default:
        final List<MsttCodeBase> entrustConfigList =
            frontInitialModelMobile.entrustTypeList ?? <MsttCodeBase>[];
        final List<EntrustTypeDetailBase> entrustDetailConfigList =
            frontInitialModelMobile.entrustTypeDetailList ??
                <EntrustTypeDetailBase>[];

        final Iterable<EntrustTypeDetailBase> filterList =
            entrustDetailConfigList.where((EntrustTypeDetailBase e) =>
                e.detailCode == EntrustBusinessCodeExtension.valueOf(code));

        if (filterList.isNotEmpty) {
          // Detail Entrust theo truyền vào
          final EntrustTypeDetailBase entrustDetail = filterList.first;
          // Master Entrust dùng để check
          final MsttCodeBase entrustMaster = entrustConfigList.firstWhere(
              (MsttCodeBase e) => e.code == entrustDetail.entrustCode);

          // Lấy Ủy quyền toàn bộ + được ủy quyền theo Master Entrust Code
          final List<EntrustData> subEntrustList = entrustList
              .where((EntrustData e) =>
                  e.businessCd == entrustMaster.code ||
                  e.businessCd ==
                      EntrustBusinessCodeExtension.valueOf(
                          EntrustBusinessCode.supper))
              .toList();
          for (final EntrustData item in subEntrustList) {
            final String accoNo = item.subAccoNo!.substring(
                min(item.subAccoNo!.length, item.subAccoNo!.indexOf('|') + 1));
            if (!entrustMap.containsKey(accoNo)) {
              entrustMap[accoNo] = accoNo;
            }
          }
        }
        break;
    }
    resultList.addAll(entrustMap.keys);
    return resultList;
  }

  void saveAccount(UserLocalModel userModel) =>
      localUserRepository.saveAccount(userModel);
}
