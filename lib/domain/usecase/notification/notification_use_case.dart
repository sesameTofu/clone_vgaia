import 'package:flutter_mobile/data/repository/notification_repository_impl.dart';
import 'package:flutter_mobile/domain/model/notification/notification.dart'
    as notify;
import 'package:flutter_mobile/domain/model/notification/notification_unread.dart';
import 'package:flutter_mobile/domain/repository/notification_repository.dart';

class NotificationUseCase {
  static final NotificationUseCase share = NotificationUseCase();
  final NotificationRepository _res = NotificationRepositoryImpl();

  Future<List<notify.Notification>> getNotification(
      {required String msAccount,
      required int type,
      bool? isPublic,
      required int offset,
      required int limit}) async {
    try {
      return _res.getNotification(
        msAccount: msAccount,
        type: type,
        offset: offset,
        limit: limit,
      );
    } catch (exception) {
      return <notify.Notification>[];
    }
  }

  Future<Future<List<notify.Notification>>> getNotificationById(
      {required String msAccount, required int noticeId}) async {
    try {
      return _res.getNotificationById(msAccount: msAccount, noticeId: noticeId);
    } catch (exception) {
      rethrow;
    }
  }

  Future<List<NotificationUnread>> totalUnreadNotification(
      {required String msAccount, required int type}) async {
    try {
      return _res.totalUnreadNotification(msAccount: msAccount, type: type);
    } catch (exception) {
      return <NotificationUnread>[];
    }
  }

  Future<void> readAllNotification({
    required String msAccount,
    required int type,
    required Function(Object) onFailure,
    required Function onSuccess,
  }) async {
    try {
      _res.readAllNotification(msAccount: msAccount, type: type);
      onSuccess();
    } catch (exception) {
      onFailure(exception);
    }
  }

  Future<void> readNotification({
    required String msAccount,
    required int date,
    required int noticeId,
    required Function(Object) onFailure,
    required Function onSuccess,
  }) async {
    try {
      _res.readNotification(
          msAccount: msAccount, date: date, noticeId: noticeId);
      onSuccess();
    } catch (exception) {
      onFailure(exception);
    }
  }

  Future<void> deleteNotification({
    required String msAccount,
    required int date,
    required int noticeId,
    required Function(Object) onFailure,
    required Function onSuccess,
  }) async {
    try {
      _res.deleteNotification(
          msAccount: msAccount, date: date, noticeId: noticeId);
      onSuccess();
    } catch (exception) {
      onFailure(exception);
    }
  }
}
