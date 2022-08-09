import 'package:dio/dio.dart';
import 'package:flutter_mobile/controller/session_manager.dart';
import 'package:flutter_mobile/data/source/dio/api/rest_client_base.dart';
import 'package:flutter_mobile/data/source/dio/api_response.dart';
import 'package:flutter_mobile/domain/model/watch_list/detail_stock_watch_list.dart';
import 'package:flutter_mobile/domain/model/watch_list/watch_list.dart';
import 'package:flutter_mobile/domain/model/watch_list/watch_list_detail.dart';
import 'package:flutter_mobile/domain/repository/category_repository.dart';
import 'package:flutter_mobile/global/app_url.dart';

class CategoryRepositoryImp implements CategoryRepository {
  final RestClientBase _clientMarket = RestClientBase();

  @override
  Future<List<WatchList>> getAllWatchList(String userId) async {
    final dynamic response = await _clientMarket.get(AppUrl.watchList(userId));

    return (response['data'] as List<dynamic>)
        .map((dynamic e) => WatchList.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<DetailStockWatchList> addTickerToWatchList(
      String userId, WatchListDetailParams params) async {
    final dynamic res = await _clientMarket.post(
      AppUrl.detailWatchList(userId, '${params.watchlistId}'),
      data: params.toJson(),
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );

    return DetailStockWatchList.fromJson2(res['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<DetailStockWatchList>> addListTickerToWatchList(
      List<String> listSecCd, String idWatchList) async {
    final dynamic _response = await _clientMarket.put(
      AppUrl.multiDetailWatchList(SessionManager().username, idWatchList),
      data: <String, dynamic>{'items': listSecCd.join(',')},
      options: Options(
        contentType: 'application/json',
      ),
    );

    final ApiResponse _formatRes = ApiResponse.fromJson(_response);
    // // TODO: DUY TIEN
    if (_formatRes.message != null &&
        _formatRes.message!.toUpperCase().contains('SUCCESS') &&
        _formatRes.data != null &&
        _formatRes.data is List) {
      return List<DetailStockWatchList>.from(
          _formatRes.data.map((dynamic e) => DetailStockWatchList.fromJson(e)));
    }
    return <DetailStockWatchList>[];
  }

  @override
  Future<WatchList> getWatchListDetail(
      String userId, String watchListId) async {
    final dynamic res =
        await _clientMarket.get(AppUrl.actionWatchList(userId, watchListId));

    return WatchList.fromJson(res['data'] as Map<String, dynamic>);
  }

  @override
  Future<WatchList> watchListOwner(String userId) async {
    final dynamic res = await _clientMarket.get(AppUrl.watchListOwner(userId));

    return WatchList.fromJson(res['data'] as Map<String, dynamic>);
  }

  @override
  Future<WatchList> createWatchList(
      String userId, WatchListParams params) async {
    final dynamic res = await _clientMarket.post(
      AppUrl.watchList(userId),
      data: params.toJson(),
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );

    return WatchList.fromJson(res['data'] as Map<String, dynamic>);
  }

  @override
  Future<void> updateWatchList(String userId, WatchListParams params) async {
    await _clientMarket.put(
      AppUrl.actionWatchList(userId, '${params.id}'),
      data: params.toJson(),
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
  }

  @override
  Future<void> deleteWatchList(String userId, String watchListId) async {
    await _clientMarket.delete(
      AppUrl.actionWatchList(userId, watchListId),
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
  }

  @override
  Future<void> priorityWatchList(
      String userId, List<String> watchListIds) async {
    await _clientMarket.put(
      AppUrl.priorityWatchList(userId),
      data: <String, dynamic>{'items': watchListIds},
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
  }

  @override
  Future<void> deleteTickerFromWatchList(
      String userId, WatchListDetailParams params) async {
    await _clientMarket.delete(
      AppUrl.actionDetailWatchList(
        userId,
        '${params.watchlistId}',
        '${params.id}',
      ),
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
  }

  @override
  Future<DetailStockWatchList> updateTickerFromWatchList(
      String userId, WatchListDetailParams params) async {
    final dynamic res = await _clientMarket.put(
      AppUrl.actionDetailWatchList(
          userId, '${params.watchlistId}', '${params.id}'),
      data: params.toJson(),
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );

    return DetailStockWatchList.fromJson(res['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<DetailStockWatchList>> copyTickerToWatchList(String userId,
      String watchlistId, List<WatchListDetailParams> params) async {
    final dynamic res = await _clientMarket.put(
      AppUrl.multiDetailWatchList(userId, watchlistId),
      data: <String, dynamic>{
        'items':
            params.map((WatchListDetailParams e) => e.secCd).toList().join(',')
      },
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );

    return (res['data'] as List<dynamic>)
        .map((dynamic e) =>
            DetailStockWatchList.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
