import 'package:flutter_mobile/domain/model/watch_list/watch_list.dart';

import 'detail_stock_watch_list.dart';

class WatchListDetailParams {
  num? id;
  late String secCd;
  num? priority;
  num? watchlistId;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id != null ? '$id' : '',
        'secCd': secCd,
        'watchlistId': watchlistId != null ? '$watchlistId' : '',
        'priority': '${priority ?? 0}',
      };
}

class WatchListDetail {
  WatchListDetail({
    this.id,
    this.userId,
    this.type,
    this.code,
    this.nameVi,
    this.nameEn,
    this.priority,
    this.status,
    this.details,
  });

  factory WatchListDetail.fromJson(Map<String, dynamic> json) =>
      WatchListDetail(
        id: json['id'] as num?,
        userId: json['userId'] as String?,
        type: json['type'] as String?,
        code: json['code'] as String?,
        nameVi: json['nameVi'] as String?,
        nameEn: json['nameEn'] as String?,
        priority: json['priority'] as num?,
        status: json['status'] as String?,
        details: (json['details'] as List<dynamic>?)
            ?.map((dynamic e) =>
                DetailStockWatchList.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  factory WatchListDetail.fromWatchList(WatchList watchList) => WatchListDetail(
        id: watchList.id,
        userId: watchList.userId,
        type: watchList.type,
        code: watchList.code,
        nameVi: watchList.nameVi,
        nameEn: watchList.nameEn,
        priority: watchList.priority,
        status: watchList.status,
        details: watchList.listSecQuotesCode,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'userId': userId,
        'type': type,
        'code': code,
        'nameVi': nameVi,
        'nameEn': nameEn,
        'priority': priority,
        'status': status,
        'details': details?.map((dynamic e) => e.toFiled()).toList(),
      };

  WatchListDetail copyWith({
    num? id,
    String? userId,
    String? type,
    String? code,
    String? nameVi,
    String? nameEn,
    num? priority,
    String? status,
    List<DetailStockWatchList>? details,
  }) {
    return WatchListDetail(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      code: code ?? this.code,
      nameVi: nameVi ?? this.nameVi,
      nameEn: nameEn ?? this.nameEn,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      details: details ?? this.details,
    );
  }

  num? id;
  String? userId;
  String? type;
  String? code;
  String? nameVi;
  String? nameEn;
  num? priority;
  String? status;
  List<DetailStockWatchList>? details;
}
