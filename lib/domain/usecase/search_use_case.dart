import 'package:flutter_mobile/core/repos/stock_repos.dart';
import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/extensions/extension.dart';

class SearchUseCase {
  final StockRepos _stockRepos = StockRepos();

  Future<List<StockItemViewModel>> searchListItem(List<String> listSecId,
      {String? text}) async {
    List<StockItemViewModel> listStockItemViewModel = <StockItemViewModel>[];
    if (text != null && text.isNotEmpty) {
      final List<StockItemViewModel> _result = <StockItemViewModel>[];

      // Chuẩn hóa trước khi search
      final String pattern = text.toUpperCase();

      for (final StockItemViewModel item in _stockRepos.mapStocks.values) {
        if (item.searchMatching(key: pattern)) {
          _result.add(item);
        }
      }

      _result.sort((StockItemViewModel a, StockItemViewModel b) =>
          a.stockItem.secID!.compareTo(b.stockItem.secID!));
      _result.sort((StockItemViewModel a, StockItemViewModel b) =>
          a.stockItem.secType.type.compareTo(b.stockItem.secType.type));

      listStockItemViewModel = _result;
    } else {
      listStockItemViewModel = _stockRepos.mapStocks.values
          .map((StockItemViewModel value) => value
            ..stockItem.isFavourite = listSecId.contains(value.stockItem.secID))
          .toList();
    }
    return listStockItemViewModel;
  }
}
