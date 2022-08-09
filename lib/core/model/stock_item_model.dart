import 'package:flutter_mobile/core_support/enum/core_enum.dart';

class StockItemModel {
  StockItemModel(
      {this.secID,
      this.index,
      this.sName,
      this.eName,
      this.vName,
      this.floorPrice,
      this.ceilingPrice,
      this.basicPrice,
      this.secType});

  // factory StockItemModel.fromFiled(Map<Field, dynamic> json) => StockItemModel(
  //     // sName: json['secName'] as String?,
  //     // eName: json['secName'] as String?,
  //     // vName: json['secName'] as String?,
  //     floorPrice: json[Field.FLOOR_PRICE] as num?,
  //     ceilingPrice: json[Field.CEILING_PIRCE] as num?,
  //     basicPrice: json[Field.BASIC_PRICE] as num?);

  StockItemModel copyWith(StockItemModel? value) {
    return StockItemModel(
      secID: secID,
      index: index,
      sName: sName,
      eName: eName,
      vName: vName,
      floorPrice: floorPrice,
      ceilingPrice: ceilingPrice,
      basicPrice: basicPrice,
      secType: secType,
    );
  }

  String? secID;
  Index? index;
  String? sName;
  final String? eName;
  final String? vName;
  bool isFavourite = false;

  final num? floorPrice;
  final num? ceilingPrice;
  final num? basicPrice;
  final SecType? secType;
}
