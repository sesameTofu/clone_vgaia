import 'package:flutter_mobile/import.dart';

import 'detail_stock_watch_list.dart';

class WatchListParams {
  num? id;
  late String nameVi;
  late String nameEn;
  num? priority;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id != null ? '$id' : '',
        'nameVi': nameVi,
        'nameEn': nameEn,
        'priority': priority != null ? '$priority' : '',
      };
}

class WatchList with BaseMixin {
  WatchList({
    this.id,
    this.userId,
    this.type,
    this.code,
    this.nameVi,
    this.nameEn,
    this.priority,
    this.status,
    this.listSecQuotesCode,
    this.viewOnly = false,
  });

  factory WatchList.fromJson(Map<String, dynamic> json) => WatchList(
        id: json['id'] as num?,
        userId: json['userId'] as String?,
        type: json['type'] as String?,
        code: json['code'] as String?,
        nameVi: json['type'] == 'OWNER'
            ? LocaleKeys.goline_OwnerPortfolioList.tr
            : json['nameVi'] as String?,
        nameEn: json['type'] == 'OWNER'
            ? LocaleKeys.goline_OwnerPortfolioList.tr
            : json['nameEn'] as String?,
        priority: json['priority'] as num?,
        status: json['status'] as String?,

        /// STATIC, CUSTOMER
        viewOnly: (json['type'] as String? ?? 'STATIC') == 'STATIC' ||
            (json['type'] as String? ?? 'STATIC') == 'DER' ||
            (json['type'] as String? ?? 'STATIC') == 'OWNER',
        listSecQuotesCode: ((json['details'] ?? <dynamic>[]) as List<dynamic>?)
            ?.map((dynamic e) =>
                DetailStockWatchList.fromJson(e as Map<String, dynamic>))
            .toList(),
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
        'details': listSecQuotesCode?.map((dynamic e) => e.toFiled()).toList(),
      };

  String? get getCategoryName => vn ? nameVi : nameEn;

  num? id;
  String? userId;
  String? type;
  String? code;
  String? nameVi;
  String? nameEn;
  num? priority;
  String? status;
  bool viewOnly;
  List<DetailStockWatchList>? listSecQuotesCode;

  List<DetailStockWatchList>? get afterListSecQuotesCode {
    // viewOnly = true, chỉ xem thì sắp xếp theo bảng ab
    listSecQuotesCode?.sort((DetailStockWatchList a, DetailStockWatchList b) {
      return viewOnly
          ? (b.secCd!.compareTo(a.secCd!) * -1)
          : a.priority!.compareTo(b.priority!);
    });

    return listSecQuotesCode;
  }
}
