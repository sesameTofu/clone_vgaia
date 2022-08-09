import 'package:flutter_mobile/domain/model/grpc/auto_trading.pbgrpc.dart';

class Filter {
  Filter(
      {required this.id,
      required this.label,
      this.orderType,
      this.periodType,
      this.labelHeaderTable,
      this.orderFieldType});

  int id;
  int? periodType;
  int? orderFieldType;
  String label;
  String? labelHeaderTable;
  ORDER_TYPE? orderType;
}

class FilterType<T> extends Filter {
  FilterType({this.type, required int id, required String label})
      : super(id: id, label: label);

  final T? type;
}
