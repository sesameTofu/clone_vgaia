import 'package:flutter_mobile/data/repository/stock_transfer/sec_balance_list_repository_impl.dart';
import 'package:flutter_mobile/domain/model/stock_transfer/sec_balance_list_model.dart';
import 'package:flutter_mobile/domain/repository/stock_transfer/sec_balance_list_repository.dart';

class SecBalanceListUseCase {
  final SecBalanceListRepository _secBalanceListRepo =
      SecBalanceListRepositoryImpl();

  Future<void> getSecBalanceList({
    String? subAccoNoFrom,
    String? subAccoNoTo,
    required Function(List<SecBalanceListModel> listData) onSuccess,
    required Function onFailure,
  }) async {
    try {
      final List<SecBalanceListModel> data =
          await _secBalanceListRepo.getSecBalanceList(
        subAccoNoFrom: subAccoNoFrom,
        subAccoNoTo: subAccoNoTo,
      );
      onSuccess(data);
    } catch (error) {
      onFailure(error);
    }
  }
}
