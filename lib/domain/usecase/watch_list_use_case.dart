import 'package:flutter_mobile/data/repository/category_repository_impl.dart';
import 'package:flutter_mobile/domain/model/watch_list/detail_stock_watch_list.dart';
import 'package:flutter_mobile/domain/model/watch_list/watch_list.dart';
import 'package:flutter_mobile/domain/model/watch_list/watch_list_detail.dart';
import 'package:flutter_mobile/domain/repository/category_repository.dart';

class WatchListUseCase {
  final CategoryRepository _res = CategoryRepositoryImp();
  Future<List<WatchList>> getAllWatchList(String userId) async {
    try {
      final List<WatchList> _reponse = await _res.getAllWatchList(userId);
      return _reponse;
    } catch (exception) {
      return <WatchList>[];
    }
  }

  Future<WatchList?> getWatchListDetail(
      String userId, String watchListId) async {
    try {
      return await _res.getWatchListDetail(userId, watchListId);
    } catch (exception) {
      return null;
    }
  }

  Future<WatchList?> watchListOwner(String userId) async {
    try {
      return await _res.watchListOwner(userId);
    } catch (exception) {
      return null;
    }
  }

  Future<WatchList?> createWatchList(
      {required String accountID, required WatchListParams watchList}) async {
    try {
      return await _res.createWatchList(accountID, watchList);
    } catch (exception) {
      return null;
    }
  }

  Future<void> updateWatchList(String userId, WatchListParams params) async {
    return _res.updateWatchList(userId, params);
  }

  Future<void> deleteWatchList(String userId, String watchListId) async {
    return _res.deleteWatchList(userId, watchListId);
  }

  Future<void> priorityWatchList(String userId, List<String> watchListIds) {
    return _res.priorityWatchList(userId, watchListIds);
  }

  Future<void> deleteTickerFromWatchList(
      String userId, WatchListDetailParams params) async {
    return _res.deleteTickerFromWatchList(userId, params);
  }

  Future<DetailStockWatchList> addTickerToWatchList(
      String userId, WatchListDetailParams params) async {
    return _res.addTickerToWatchList(userId, params);
  }

  Future<void> addListTickerToWatchList(
      List<String> listSecCd, String idWatchList,
      {required Function(List<DetailStockWatchList>) onSuccess,
      required Function(dynamic) onFailure}) async {
    try {
      final List<DetailStockWatchList> _response =
          await _res.addListTickerToWatchList(listSecCd, idWatchList);
      onSuccess(_response);
    } catch (e) {
      onFailure(e);
    }
  }

  Future<List<DetailStockWatchList>> copyTickerToWatchList(String userId,
      String watchlistId, List<WatchListDetailParams> params) async {
    return _res.copyTickerToWatchList(userId, watchlistId, params);
  }
}
