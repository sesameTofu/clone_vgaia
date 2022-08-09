import 'package:flutter_mobile/domain/model/adf_param.dart';
import 'package:flutter_mobile/domain/model/base_user.dart';
import 'package:flutter_mobile/domain/model/customer.dart';
import 'package:flutter_mobile/domain/model/entrust_data.dart';
import 'package:flutter_mobile/domain/model/entrust_type_detail_base.dart';
import 'package:flutter_mobile/domain/model/favourite_category_base.dart';
import 'package:flutter_mobile/domain/model/front_user_auth.dart';
import 'package:flutter_mobile/domain/model/mstt_code_base.dart';
import 'package:flutter_mobile/domain/model/parameter_addition_base.dart';
import 'package:flutter_mobile/domain/model/parameter_base.dart';
import 'package:flutter_mobile/extensions/interable.dart';

class FrontInitialModelMobile {
  FrontInitialModelMobile();

  FrontInitialModelMobile.fromJson(Map<String, dynamic> json) {
    tradeDate = json['tradeDate'] as String?;
    marketDate = json['marketDate'] as String?;
    serverDate = json['serverDate'] as String?;
    serverTime = json['serverTime'] as String?;
    resetMarketTime = json['resetMarketTime'] as String?;
    defaultSubAccoNo = json['defaultSubAccoNo'] as String?;
    changePassFlag = json['changePassFlag'] as num?;
    changePinFlag = json['changePinFlag'] as num?;
    currentUser =
        BaseUser.fromJson(json['currentUser'] as Map<String, dynamic>);
    if (json['authenType'] != null) {
      authenType =
          FrontUserAuth.fromJson(json['authenType'] as Map<String, dynamic>);
    }
    srvtTradingOnline = json['srvtTradingOnline'];
    personalSettingList = json['personalSettingList'];
    if (json['ordTypeList'] != null) {
      ordTypeList = ((json['ordTypeList'] as List<dynamic>?) ?? <String>[])
          .cast<String>();
    }
    if (json['subAccoList'] != null) {
      subAccoList = ((json['subAccoList'] as List<dynamic>?) ?? <String>[])
          .cast<String>();
    }
    if (json['entrustList'] != null) {
      entrustList = (json['entrustList'] as List<dynamic>)
          .map<EntrustData>(
              (dynamic e) => EntrustData.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    if (json['secListEn'] != null) {
      secListEn =
          ((json['secListEn'] as List<dynamic>?) ?? <String>[]).cast<String>();
    }
    if (json['categoryList'] != null) {
      categoryList = (json['categoryList'] as List<dynamic>)
          .map<FavouriteCategoryBase>((dynamic e) =>
              FavouriteCategoryBase.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    if (json['adfParamList'] != null) {
      adfParamList = (json['adfParamList'] as List<dynamic>)
          .map<AdfParam>(
              (dynamic e) => AdfParam.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    if (json['parameterList'] != null) {
      parameterList = (json['parameterList'] as List<dynamic>)
          .map<ParameterBase>(
              (dynamic e) => ParameterBase.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    if (json['parameterAdditionList'] != null) {
      parameterAdditionList = (json['parameterAdditionList'] as List<dynamic>)
          .map<ParameterAdditionBase>((dynamic e) =>
              ParameterAdditionBase.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    if (json['locationList'] != null) {
      locationList = (json['locationList'] as List<dynamic>)
          .map<MsttCodeBase>(
              (dynamic e) => MsttCodeBase.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    if (json['dertSecPriceListEn'] != null) {
      dertSecPriceListEn =
          ((json['dertSecPriceListEn'] as List<dynamic>?) ?? <String>[])
              .cast<String>();
    }
    if (json['entrustTypeList'] != null) {
      entrustTypeList = (json['entrustTypeList'] as List<dynamic>)
          .map<MsttCodeBase>(
              (dynamic e) => MsttCodeBase.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    if (json['entrustTypeDetailList'] != null) {
      entrustTypeDetailList = (json['entrustTypeDetailList'] as List<dynamic>)
          .map<EntrustTypeDetailBase>((dynamic e) =>
              EntrustTypeDetailBase.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    if (json['secTypeGroupList'] != null) {
      secTypeGroupList =
          ((json['secTypeGroupList'] as List<dynamic>?) ?? <String>[])
              .cast<String>();
    }
    if (json['subAccoListExt'] != null) {
      subAccoListExt =
          ((json['subAccoListExt'] as List<dynamic>?) ?? <String>[])
              .cast<String>();
    }
    if (json['currentCustomer'] != null) {
      currentCustomer =
          Customer.fromJson(json['currentCustomer'] as Map<String, dynamic>);
    }
  }

  String? tradeDate;
  String? marketDate;
  String? serverDate;
  String? serverTime;
  String? resetMarketTime;
  String? defaultSubAccoNo;
  num? changePassFlag;
  num? changePinFlag;
  late BaseUser currentUser;
  FrontUserAuth? authenType;
  dynamic srvtTradingOnline;
  dynamic personalSettingList;
  List<String>? ordTypeList;
  List<String>? subAccoList;
  List<EntrustData>? entrustList;
  List<String>? secListEn;
  List<FavouriteCategoryBase>? categoryList;
  List<AdfParam>? adfParamList;
  List<ParameterBase>? parameterList;
  List<ParameterAdditionBase>? parameterAdditionList;
  List<MsttCodeBase>? locationList;
  List<String>? dertSecPriceListEn;
  List<MsttCodeBase>? entrustTypeList;
  List<EntrustTypeDetailBase>? entrustTypeDetailList;
  List<String>? secTypeGroupList;
  List<String>? subAccoListExt;
  Customer? currentCustomer;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'tradeDate': tradeDate,
        'marketDate': marketDate,
        'serverDate': serverDate,
        'serverTime': serverTime,
        'resetMarketTime': resetMarketTime,
        'defaultSubAccoNo': defaultSubAccoNo,
        'changePassFlag': changePassFlag,
        'changePinFlag': changePinFlag,
        'currentUser': currentUser.toJson(),
        'authenType': authenType,
        'srvtTradingOnline': srvtTradingOnline,
        'personalSettingList': personalSettingList,
        'ordTypeList': ordTypeList,
        'subAccoList': subAccoList,
        'entrustList': entrustList,
        'secListEn': secListEn,
        'categoryList': categoryList,
        'adfParamList': adfParamList,
        'parameterList': parameterList,
        'parameterAdditionList': parameterAdditionList,
        'locationList': locationList,
        'dertSecPriceListEn': dertSecPriceListEn,
        'entrustTypeList': entrustTypeList,
        'entrustTypeDetailList': entrustTypeDetailList,
        'secTypeGroupList': secTypeGroupList,
        'subAccoListExt': subAccoListExt,
        'currentCustomer': currentCustomer,
      };

  dynamic getParameter(String paramName, dynamic defaultIfNull) {
    String stringValue = '';

    final ParameterAdditionBase? pAddition = _getParameterAddition(paramName);
    if (pAddition != null) {
      stringValue = pAddition.value!;
    } else {
      if (parameterList != null && parameterList!.isNotEmpty) {
        final ParameterBase? param = parameterList!.firstWhereCanNull(
            (ParameterBase item) => item.paramName == paramName);
        if (param?.value != null) {
          stringValue = param!.value!;
        }
      }
    }

    if (stringValue.isEmpty) {
      return defaultIfNull;
    }

    return stringValue;
  }

  ParameterAdditionBase? _getParameterAddition(String paramName) {
    // ignore: todo
    // TODO check logic
    final String scop1 = currentUser.branchCd ?? '';
    final String scop2 = '$scop1.${currentUser.transactionCd ?? ''}';
    final String scop3 = '$scop2.${currentUser.userId ?? ''}';
    ParameterAdditionBase? _param;
    if (parameterAdditionList != null && parameterAdditionList!.isNotEmpty) {
      _param = parameterAdditionList!.firstWhereCanNull(
          (ParameterAdditionBase item) =>
              item.paramName == paramName &&
              (item.scope == scop3 ||
                  item.scope == scop2 ||
                  item.scope == scop1));
    }

    return _param ?? ParameterAdditionBase();
  }
}
