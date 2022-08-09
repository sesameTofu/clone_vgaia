// import 'package:vgaia/domain/models/place_order/cus_insider_data.dart';
// import 'package:vgaia/domain/models/place_order/request_order.dart';
// import 'package:vgaia/domain/models/place_order/request_pending.dart';

// class PrepareOrderData {
//   PrepareOrderData(
//       this.custNo,
//       this.custName,
//       this.secName,
//       this.oderType,
//       this.secCd,
//       this.ordQty,
//       this.ordPrice,
//       this.ordAmt,
//       this.ordFeeAmt,
//       this.marginRate,
//       this.totalAmt,
//       this.tradeDate,
//       this.dataType,
//       this.restrictionLevel,
//       this.pinType,
//       this.caSerial,
//       this.customerInsiderData,
//       this.dataList,
//       this.orderList,
//       this.pendingOrderList,
//       this.status,
//       this.tradeType,
//       this.notes);

//   factory PrepareOrderData.fromJson(Map<String?, dynamic> json) =>
//       PrepareOrderData(
//         json['custNo'] as String,
//         json['custName'] as String,
//         json['secName'] as String,
//         json['oderType'] as String,
//         json['secCd'] as String,
//         json['ordQty'] as num,
//         json['ordPrice'] as num,
//         json['ordAmt'] as num,
//         json['ordFeeAmt'] as num,
//         json['marginRate'] as num,
//         json['totalAmt'] as num,
//         json['tradeDate'] as num,
//         json['dataType'] as num,
//         json['restrictionLevel'] as num,
//         json['pinType'] as num,
//         json['caSerial'] as String,
//         json['customerInsiderData'] == null
//             ? null
//             : CustomerInsiderData.fromJson(
//                 json['customerInsiderData'] as Map<String, dynamic>),
//         json['dataList'] as String,
//         (json['orderList'] as List<RequestOrder>)
//             .map((RequestOrder e) =>
//                 RequestOrder.fromJson(e as Map<String, dynamic>))
//             .toList(),
//         (json['pendingOrderList'] as List<RequestOrderPending>)
//             .map((RequestOrderPending e) =>
//                 RequestOrderPending.fromJson(e as Map<String, dynamic>))
//             .toList(),
//         json['status'] as num,
//         json['tradeType'] as num,
//         json['notes'] as String,
//       );

//   /// <summary>
//   /// Customer number
//   /// </summary>
//   String? custNo;

//   /// <summary>
//   /// Customer name
//   /// </summary>
//   String? custName;

//   /// <summary>
//   /// Securities name
//   /// </summary>
//   String? secName;

//   /// <summary>
//   /// Order type
//   /// </summary>
//   String? oderType;

//   /// <summary>
//   /// Securities code
//   /// </summary>
//   String? secCd;

//   /// <summary>
//   /// Order quantity
//   /// </summary>
//   num ordQty;

//   /// <summary>
//   /// Order price
//   /// </summary>
//   num ordPrice;

//   /// <summary>
//   /// Order amount
//   /// </summary>
//   num ordAmt;

//   /// <summary>
//   /// Order fee amount
//   /// </summary>
//   num ordFeeAmt;

//   /// <summary>
//   /// Margin rate
//   /// </summary>
//   num marginRate;

//   /// <summary>
//   /// Total amount
//   /// </summary>
//   num totalAmt;

//   /// <summary>
//   /// Trade date
//   /// </summary>
//   num tradeDate;

//   /// <summary>
//   /// data type
//   /// </summary>
//   num dataType;

//   /// Restriction level
//   num restrictionLevel;

//   /// <summary>
//   /// Pin type
//   /// </summary>
//   num pinType;

//   String? caSerial;

//   /// Customer insider data
//   CustomerInsiderData? customerInsiderData;

//   /// <summary>
//   /// Data list
//   /// </summary>
//   String? dataList;

//   List<RequestOrder?> orderList;

//   /// <summary>
//   /// Request pending order list
//   /// </summary>
//   List<RequestOrderPending?> pendingOrderList;

//   num status;

//   num tradeType;

//   String? notes;

//   Map<String?, dynamic> toJson() => <String, dynamic>{
//         'custNo': custNo,
//         'custName': custName,
//         'secName': secName,
//         'oderType': oderType,
//         'secCd': secCd,
//         'ordQty': ordQty,
//         'ordPrice': ordPrice,
//         'ordAmt': ordAmt,
//         'ordFeeAmt': ordFeeAmt,
//         'marginRate': marginRate,
//         'totalAmt': totalAmt,
//         'tradeDate': tradeDate,
//         'dataType': dataType,
//         'restrictionLevel': restrictionLevel,
//         'pinType': pinType,
//         'caSerial': caSerial,
//         'customerInsiderData': customerInsiderData?.toJson(),
//         'dataList': dataList,
//         'orderList': orderList.map((RequestOrder? e) => e?.toJson()).toList(),
//         'pendingOrderList': pendingOrderList
//             .map((RequestOrderPending? e) => e?.toJson())
//             .toList(),
//         'status': status,
//         'tradeType': tradeType,
//         'notes': notes,
//       };
// }
