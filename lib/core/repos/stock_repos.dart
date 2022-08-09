import 'package:flutter_mobile/core/market_item_view_model.dart';
import 'package:flutter_mobile/core/stock_item_view_model.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/core_support/enum/core_enum_helper.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pb.dart';
import 'package:flutter_mobile/extensions/extension.dart';

class StockRepos {
  factory StockRepos() {
    return _singleton;
  }

  StockRepos._internal();

  static final StockRepos _singleton = StockRepos._internal();

  final Map<String?, StockItemViewModel> _mapStocks =
      <String?, StockItemViewModel>{};
  final Map<Index, List<String>> _mapStocksWithIndex = <Index, List<String>>{};

  Map<Index, List<String>> get mapStocksWithIndex => _mapStocksWithIndex;

  Map<String?, StockItemViewModel> get mapStocks => _mapStocks;

  MarketInitDataItem? _marketInitDataItem;

  MarketInitDataItem? get marketInitDataItem => _marketInitDataItem;

  set setMarketInitDataItem(MarketInitDataItem? value) {
    if (value != null) {
      for (final MrktBasketInfoItem element
          in value.basketInfoList.itemBasketInfo) {
        if (element.indexCd == 101) {
          mapStocksWithIndex[CoreEnumHelper.getIndex(element.indexCd)] =
              element.secCdList.split(';').map((String e) => e.trim()).toList();
        }
        if (element.indexCd == 201) {
          mapStocksWithIndex[CoreEnumHelper.getIndex(element.indexCd)] =
              element.secCdList.split(';').map((String e) => e.trim()).toList();
        }
      }
    }

    _marketInitDataItem = value;
  }

  final Map<Index, MarketItemViewModel> _mapMarketSession =
      <Index, MarketItemViewModel>{};

  List<StockItemViewModel> get listStocks => _mapStocks.values.toList();

  List<StockItemViewModel> searchItems(String textChange) {
    final List<StockItemViewModel> dummySearchList = <StockItemViewModel>[];
    dummySearchList.addAll(listStocks);
    if (textChange.isNotEmpty) {
      final List<StockItemViewModel> dummyListData = <StockItemViewModel>[];
      for (final StockItemViewModel item in dummySearchList) {
        if (item.searchMatching(key: textChange)) {
          dummyListData.add(item);
        }
      }
      dummyListData.sort((StockItemViewModel a, StockItemViewModel b) =>
          a.stockItem.secID!.compareTo(b.stockItem.secID!));
      dummyListData.sort((StockItemViewModel a, StockItemViewModel b) =>
          a.stockItem.secType.type.compareTo(b.stockItem.secType.type));
      return dummyListData.toList();
    } else {
      return <StockItemViewModel>[];
    }
  }

  void addStockItem(StockItemViewModel item) {
    _mapStocks[item.stockItem.secID] = item;
  }

  void removeStockItem(StockItemViewModel item) {
    _mapStocks.remove(item.stockItem.secID);
  }

  StockItemViewModel? getStockItem(String key) {
    return _mapStocks[key];
  }

  List<StockItemViewModel> getListStockItem(List<String> keys) {
    final List<StockItemViewModel> value = <StockItemViewModel>[];
    if (keys.isNotEmpty) {
      for (int i = 0; i < keys.length; i++) {
        final String key = keys[i].toString().toUpperCase();
        if (_mapStocks.containsKey(key) && _mapStocks[key] != null) {
          value.add(_mapStocks[key]!);
        }
      }
    }
    return value;
  }

  List<StockItemViewModel> getListStockSecType({SecType? type}) {
    if (type == null) {
      return _mapStocks.values.toList();
    }

    final List<StockItemViewModel> data = _mapStocks.values
        .where(
            (StockItemViewModel element) => element.stockItem.secType == type)
        .toList();

    return data;
  }

  void addMarketSessionItem(MarketItemViewModel item) {
    _mapMarketSession[item.marketIndex] = item;
  }

  void removeMarketSessionItem(MarketItemViewModel item) {
    _mapMarketSession.remove(item.marketIndex);
  }

  MarketItemViewModel? getMarketSessionItem(Index? index) {
    return _mapMarketSession[index];
  }

  List<MarketItemViewModel> getListMarketSession() {
    return _mapMarketSession.values.toList();
  }
}
