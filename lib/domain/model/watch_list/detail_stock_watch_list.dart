class DetailStockWatchList {
  DetailStockWatchList({
    this.id,
    this.secCd,
    this.priority,
    this.status,
    this.watchlistId,
  });

  factory DetailStockWatchList.fromJson(Map<String, dynamic> json) =>
      DetailStockWatchList(
        id: json['id'] as num?,
        secCd: json['secCd'] as String?,
        priority: json['priority'] as num?,
        status: json['status'] as String?,
        watchlistId: json['watchlistId'] as num?,
      );
  factory DetailStockWatchList.fromJson2(Map<String, dynamic> json) =>
      DetailStockWatchList(
        id: json['id'] as num?,
        secCd: json['secCd'] as String?,
        priority: json['priority'] as num?,
        status: json['status'] as String?,
        watchlistId: json['watchlist']['id'] as num?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'secCd': secCd,
        'priority': priority,
        'status': status,
        'watchlistId': watchlistId,
      };

  DetailStockWatchList copyWith({
    num? id,
    String? secCd,
    num? priority,
    String? status,
    num? watchlistId,
  }) {
    return DetailStockWatchList(
      id: id ?? this.id,
      secCd: secCd ?? this.secCd,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      watchlistId: watchlistId ?? this.watchlistId,
    );
  }

  num? id;
  String? secCd;
  num? priority;
  String? status;
  num? watchlistId;
}
