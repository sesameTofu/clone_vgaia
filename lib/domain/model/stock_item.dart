class StockItem {
  StockItem(
      this.secCd, this.secType, this.marketCd, this.secName, this.unitSize);

  factory StockItem.fromString(String text) {
    final List<String?> values = text.split('\u{001}');
    return StockItem(values[0], values[1], values[2], values[3], values[4]);
  }

  StockItem.fromJson(Map<String?, dynamic> json) {
    secCd = json['secCd'] as String?;
    secName = json['secName'] as String?;
    secType = json['secType'] as String?;
    marketCd = json['marketCd'] as String?;
    unitSize = json['unitSize'] as String?;
    base = json['base'] as double;
    price = json['price'] as double;
    state = json['state'] as int;
    vol = json['vol'] as int;
  }

  Map<String?, dynamic> toJson() => <String?, dynamic>{
        'secCd': secCd,
        'secName': secName,
        'secType': secType,
        'marketCd': marketCd,
        'unitSize': unitSize,
        'base': base,
        'price': price,
        'state': state,
        'vol': vol,
      };

  String? secCd;
  String? secType;
  String? marketCd;
  String? secName;
  String? unitSize;
  double base = 0;
  double price = 0;
  int state = 0;
  int vol = 0;
  bool? isSelected;

  // void initListSmMatchData(List<SmMatchData> data) {
  //   listSmMatchData = data;
  // }

  /// Handler Socket
  // void handlerSocketData(List<String?> data) {
  //   if (secQuotesItem != null) {
  //     var subList = data.sublist(3);
  //     final SmMatchData newPrice = secQuotesItem!.handlerDataSocket(subList);
  //     if (newPrice != null) {
  //       listSmMatchData!.add(newPrice);
  //     }
  //   }
  // }

  String get getCode {
    return secCd ?? '';
  }

  String get getName {
    return secName ?? '';
  }
}
