import 'package:flutter_mobile/core_support/enum/core_enum.dart';

abstract class MarketUpdateDataInterface {
  void updateStockInfo(Map<Field, dynamic> value);
  void updateSocketData(Map<Field, dynamic> value);
}
