import 'dart:convert';

import 'package:flutter_mobile/domain/model/account_infor/cus_insider_data.dart';
import 'package:flutter_mobile/domain/model/account_infor/request_order.dart';
import 'package:flutter_mobile/domain/model/account_infor/request_pending.dart';
import 'package:flutter_mobile/domain/model/place_order/extention_place_order.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/enum_helper.dart';

class PrepareOrderData extends ExtentionPlaceOrder {
  PrepareOrderData(
      this.custNo,
      this.custName,
      this.secName,
      this.oderType,
      this.secCd,
      this.ordQty,
      this.ordPrice,
      this.ordAmt,
      this.ordFeeAmt,
      this.marginRate,
      this.totalAmt,
      this.tradeDate,
      this.dataType,
      this.restrictionLevel,
      this.pinType,
      this.caSerial,
      this.customerInsiderData,
      this.dataList,
      this.orderList,
      this.pendingOrderList,
      this.status,
      this.tradeType,
      this.notes);

  factory PrepareOrderData.fromJson(Map<String?, dynamic> json) =>
      PrepareOrderData(
        json['custNo'] as String?,
        json['custName'] as String?,
        json['secName'] as String?,
        json['oderType'] as String?,
        json['secCd'] as String?,
        json['ordQty'] as num?,
        json['ordPrice'] as num?,
        json['ordAmt'] as num?,
        json['ordFeeAmt'] as num?,
        json['marginRate'] as num?,
        json['totalAmt'] as num?,
        json['tradeDate'] as num?,
        EnumHelper.getDataType(json['dataType'] as num?),
        json['restrictionLevel'] as num?,
        json['pinType'] as num?,
        json['caSerial'] as String?,
        json['customerInsiderData'] == null
            ? null
            : CustomerInsiderData.fromJson(
                json['customerInsiderData'] as Map<String, dynamic>),
        json['dataList'] as String?,

        (json['orderList'] as List<dynamic>?)
            ?.map(
                (dynamic e) => RequestOrder.fromJson(e as Map<String, dynamic>))
            .toList(),
        // (json['pendingOrderList'] as List<RequestOrderPending>)
        //     .map((RequestOrderPending e) =>
        //         RequestOrderPending.fromJson(e as Map<String, dynamic>))
        //     .toList(),
        (json['pendingOrderList'] as List<dynamic>?)
            ?.map((dynamic e) =>
                RequestOrderPending.fromJson(e as Map<String, dynamic>))
            .toList(),
        json['status'] as num?,
        EnumHelper.getTradeType(json['tradeType'] as num?),
        json['notes'] as String?,
      );

  /// <summary>
  /// Customer num?ber
  /// </summary>
  String? custNo;

  /// <summary>
  /// Customer name
  /// </summary>
  String? custName;

  /// <summary>
  /// Securities name
  /// </summary>
  String? secName;

  /// <summary>
  /// Order type
  /// </summary>
  String? oderType;

  /// <summary>
  /// Securities code
  /// </summary>
  String? secCd;

  /// <summary>
  /// Order quantity
  /// </summary>
  num? ordQty;

  /// <summary>
  /// Order price
  /// </summary>
  num? ordPrice;

  /// <summary>
  /// Order amount
  /// </summary>
  num? ordAmt;

  /// <summary>
  /// Order fee amount
  /// </summary>
  num? ordFeeAmt;

  /// <summary>
  /// Margin rate
  /// </summary>
  num? marginRate;

  /// <summary>
  /// Total amount
  /// </summary>
  num? totalAmt;

  /// <summary>
  /// Trade date
  /// </summary>
  num? tradeDate;

  /// <summary>
  /// data type
  /// </summary>
  DataType dataType;

  /// Restriction level
  num? restrictionLevel;

  /// <summary>
  /// Pin type
  /// </summary>
  num? pinType;

  String? caSerial;

  /// Customer insider data
  CustomerInsiderData? customerInsiderData;

  /// <summary>
  /// Data list
  /// </summary>
  String? dataList;

  List<RequestOrder>? orderList;

  /// <summary>
  /// Request pending order list
  /// </summary>
  List<RequestOrderPending>? pendingOrderList;

  num? status;

  TradeType tradeType;

  String? notes;

  @override
  List<RequestOrder> get requestOrder =>
      (json.decode(dataList ?? '') as List<dynamic>)
          .map((dynamic e) => RequestOrder.fromJson(e))
          .toList();

  @override
  List<RequestOrderPending> get requestOrderPending =>
      (json.decode(dataList ?? '') as List<dynamic>)
          .map((dynamic e) => RequestOrderPending.fromJson(e))
          .toList();
}
