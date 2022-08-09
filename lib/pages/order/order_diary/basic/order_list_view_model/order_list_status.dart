import 'package:flutter_mobile/domain/model/select.dart';

abstract class OrderListStatus {
  List<Select<dynamic>> listSatus = <Select<dynamic>>[];
  Select<dynamic> statusSelect = Select<dynamic>();
}
