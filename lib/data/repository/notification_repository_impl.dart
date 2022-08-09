import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_mobile/data/source/dio/api/rest_client_base.dart';
import 'package:flutter_mobile/domain/model/notification/notification_unread.dart';
import 'package:flutter_mobile/domain/repository/notification_repository.dart';
import 'package:flutter_mobile/global/app_url.dart';

import '../../domain/model/notification/notification.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  final RestClientBase _client = RestClientBase();

  @override
  Future<List<Notification>> getNotification(
      {required String msAccount,
      required int type,
      bool? isPublic,
      required int offset,
      required int limit}) async {
    final dynamic res = await _client.get(AppUrl.getNotification(msAccount),
        queryParameters: <String, dynamic>{
          'type': type,
          'offset': offset,
          'limit': limit,
        });
    jsonEncode(res);

    return (res['data'] as List<dynamic>)
        .map((dynamic e) => Notification.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<Notification>> getNotificationById(
      {required String msAccount, required int noticeId}) async {
    final dynamic res =
        await _client.get(AppUrl.getNotificationById(msAccount, noticeId));

    return (res as List<dynamic>)
        .map((dynamic e) => Notification.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<NotificationUnread>> totalUnreadNotification(
      {required String msAccount, required int type}) async {
    final dynamic res = await _client.get(AppUrl.totalUnreadNotifications,
        queryParameters: <String, dynamic>{
          'masterAccount': msAccount,
          'type': type,
        });
    // ignore: avoid_print
    print('res=========>,$res');
    return (res['data'] as List<dynamic>)
        .map((dynamic e) =>
            NotificationUnread.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<dynamic> readAllNotification(
      {required String msAccount, required int type}) async {
    return _client.put(
      AppUrl.readAllNotification(msAccount),
      data: <String, dynamic>{
        'userId': msAccount,
        'noticeType': type,
      },
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
  }

  @override
  Future<dynamic> readNotification(
      {required String msAccount,
      required int date,
      required int noticeId}) async {
    return _client.put(
      AppUrl.notification,
      data: <String, dynamic>{
        'masterAccount': msAccount,
        'date': date,
        'noticeId': noticeId,
      },
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
  }

  @override
  Future<dynamic> deleteNotification(
      {required String msAccount,
      required int date,
      required int noticeId}) async {
    return _client.delete(
      AppUrl.notification,
      queryParameters: <String, dynamic>{
        'masterAccount': msAccount,
        'date': date,
        'noticeId': noticeId,
      },
      options: Options(
        contentType: Headers.jsonContentType,
      ),
    );
  }
}
