import 'package:flutter_mobile/domain/model/watch_list/detail_stock_watch_list.dart';
import 'package:flutter_mobile/domain/model/watch_list/watch_list.dart';
import 'package:flutter_mobile/domain/model/watch_list/watch_list_detail.dart';

abstract class CategoryRepository {
  Future<List<WatchList>> getAllWatchList(String userId);

  Future<WatchList> getWatchListDetail(String userId, String watchListId);

  Future<WatchList> watchListOwner(String userId);

  Future<WatchList> createWatchList(String userId, WatchListParams params);

  Future<void> updateWatchList(String userId, WatchListParams params);

  Future<void> deleteWatchList(String userId, String watchListId);

  Future<void> priorityWatchList(String userId, List<String> watchListIds);

  Future<DetailStockWatchList> addTickerToWatchList(
      String userId, WatchListDetailParams params);

  Future<List<DetailStockWatchList>> addListTickerToWatchList(
      List<String> listSecCd, String idWatchList);

  Future<DetailStockWatchList> updateTickerFromWatchList(
      String userId, WatchListDetailParams params);

  Future<void> deleteTickerFromWatchList(
      String userId, WatchListDetailParams params);

  Future<List<DetailStockWatchList>> copyTickerToWatchList(
      String userId, String watchlistId, List<WatchListDetailParams> params);
}
