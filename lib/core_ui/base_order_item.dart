// import 'dart:async';

// import 'package:flutter_mobile/global/app_enum.dart';
// import 'package:flutter_mobile/import.dart';
// import 'package:rxdart/subjects.dart';

// class BaseOrderItem {
//   StreamSubscription<Map<Field, dynamic>>? streamSubscription;
//   final Map<OrderField, Timer?> _timers = <OrderField, Timer?>{};

//   void intBindData(
//       {required AccountsOrdersModel accountsOrdersModel,
//       required RxList<AccountsOrdersModel> listAccountsOrdersModel}) {
//     updateData(accountsOrdersModel: accountsOrdersModel);
//     SocketManager().orderSocketResult.addListener(() {
//       final AccountsOrdersModel orderSocketResult =
//           SocketManager().orderSocketResult.value;
//       // for (final AccountsOrdersModel element in listAccountsOrdersModel) {
//       //   if (element.orderid == orderSocketResult.orderid) {
//       //     element.iscancel = 'N';
//       //     listAccountsOrdersModel.refresh();
//       //     break;
//       //   }
//       // }
//       if (accountsOrdersModel.orderid == orderSocketResult.orderid &&
//           accountsOrdersModel.orgorderid == orderSocketResult.orgorderid) {
//         if (orderSocketResult.execqtty != null &&
//             orderSocketResult.execqtty != matchQuantity) {
//           _matchQuantitySubject.value = orderSocketResult.execqtty!;
//           _updateChangedProperty(OrderField.MATCH_QTTY);
//         }
//         if (orderSocketResult.avgprice != null &&
//             orderSocketResult.avgprice != mathPrice) {
//           _matchPriceSubject.value = orderSocketResult.avgprice!;
//           _updateChangedProperty(OrderField.MATCH_PRICE);
//         }
//         if (orderSocketResult.status != null &&
//             orderSocketResult.status != ordStatus) {
//           _ordStatusSubject.value = orderSocketResult.status!;
//           _updateChangedProperty(OrderField.STATUS);
//         }

//         if (orderSocketResult.lastmodified != null &&
//             orderSocketResult.lastmodified != ordUpdateTime) {
//           _ordUpdateTimeSubject.value = orderSocketResult.lastmodified!;
//           _updateChangedProperty(OrderField.UPDATE_TIME);
//         }
//       }
//     });
//   }

//   void updateData({required AccountsOrdersModel accountsOrdersModel}) {
//     _matchQuantitySubject.value = accountsOrdersModel.execqtty ?? 0;
//     _matchPriceSubject.value = accountsOrdersModel.avgprice ?? 0;
//     _ordStatusSubject.value =
//         accountsOrdersModel.status ?? TypeStatusOrderBook.all;
//     _ordUpdateTimeSubject.value =
//         accountsOrdersModel.lastmodified ?? DateTime.now();
//   }

//   void clearData() {
//     streamSubscription?.cancel();
//   }

//   final BehaviorSubject<TypeStatusOrderBook> _ordStatusSubject =
//       BehaviorSubject<TypeStatusOrderBook>.seeded(TypeStatusOrderBook.all);

//   Stream<TypeStatusOrderBook> get ordStatusStream => _ordStatusSubject.stream;

//   final BehaviorSubject<num> _matchQuantitySubject =
//       BehaviorSubject<num>.seeded(0);

//   Stream<num> get matchQuantityStream => _matchQuantitySubject.stream;

//   final BehaviorSubject<num> _orderQuantitySubject =
//       BehaviorSubject<num>.seeded(0);

//   Stream<num> get orderQuantityStream => _orderQuantitySubject.stream;

//   final BehaviorSubject<num> _matchPriceSubject =
//       BehaviorSubject<num>.seeded(0);

//   Stream<num> get matchPriceStream => _matchPriceSubject.stream;

//   final BehaviorSubject<String> _lastPriceSubject =
//       BehaviorSubject<String>.seeded('');

//   Stream<String> get lastPriceStream => _lastPriceSubject.stream;

//   final BehaviorSubject<DateTime> _ordUpdateTimeSubject =
//       BehaviorSubject<DateTime>.seeded(DateTime.now());
//   Stream<DateTime> get ordUpdateTimeStream => _ordUpdateTimeSubject.stream;

//   TypeStatusOrderBook get ordStatus => _ordStatusSubject.value;
//   num get matchQuantity => _matchQuantitySubject.value;
//   num get orderQuantity => _orderQuantitySubject.value;
//   num get mathPrice => _matchPriceSubject.value;
//   String get lastPrice => _lastPriceSubject.value;
//   DateTime get ordUpdateTime => _ordUpdateTimeSubject.value;

//   //final OrderHistoryAbstract orderData;
//   // final BehaviorSubject<bool> isDerCancelOrderSubject =
//   //     BehaviorSubject<bool>.seeded(false);
//   // final BehaviorSubject<bool> isDerModifySubject =
//   //     BehaviorSubject<bool>.seeded(false);
//   // final BehaviorSubject<bool> isLoadingEditOrd =
//   //     BehaviorSubject<bool>.seeded(false);
//   // final BehaviorSubject<bool> isLoadingCancelOrd =
//   //     BehaviorSubject<bool>.seeded(false);

//   Future<void> _updateChangedProperty(OrderField property) async {
//     if (mapSubjectChangeColor[property] != null &&
//         mapSubjectChangeColor.containsKey(property)) {
//       mapSubjectChangeColor[property]?.value = StatusFiled.UP;
//     }

//     _invalidateAndRestartTimer(property);
//   }

//   Future<void> _invalidateAndRestartTimer(OrderField property) async {
//     Timer? timer = _timers[property];

//     if (timer != null) {
//       timer.cancel();
//     }

//     timer = Timer(Duration(milliseconds: 500), () {
//       mapSubjectChangeColor[property]?.value = StatusFiled.NONE;
//     });

//     _timers[property] = timer;
//   }

//   final Map<OrderField, BehaviorSubject<StatusFiled>> mapSubjectChangeColor =
//       <OrderField, BehaviorSubject<StatusFiled>>{
//     OrderField.NONE: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
//     OrderField.MATCH_PRICE:
//         BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
//     OrderField.MATCH_QTTY:
//         BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
//     OrderField.UPDATE_TIME:
//         BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
//     OrderField.BASIC_PRICE:
//         BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
//     OrderField.STATUS: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE),
//     OrderField.ORDER_QTTY: BehaviorSubject<StatusFiled>.seeded(StatusFiled.NONE)
//   };
// }
