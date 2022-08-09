import 'package:flutter_mobile/domain/model/stock_transfer/sec_balance_list_model.dart';

abstract class SecBalanceListRepository {
  Future<List<SecBalanceListModel>> getSecBalanceList(
      {String? subAccoNoFrom, String? subAccoNoTo});
}
