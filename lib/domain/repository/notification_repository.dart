import 'package:flutter_mobile/domain/model/notification/notification.dart';
import 'package:flutter_mobile/domain/model/notification/notification_unread.dart';

abstract class NotificationRepository {
  Future<List<Notification>> getNotification({
    required String msAccount,
    required int type,
    bool? isPublic,
    required int offset,
    required int limit,
  });

  Future<List<Notification>> getNotificationById({
    required String msAccount,
    required int noticeId,
  });

  Future<dynamic> readAllNotification({
    required String msAccount,
    required int type,
  });

  Future<dynamic> readNotification({
    required String msAccount,
    required int date,
    required int noticeId,
  });

  Future<List<NotificationUnread>> totalUnreadNotification({
    required String msAccount,
    required int type,
  });

  Future<dynamic> deleteNotification({
    required String msAccount,
    required int date,
    required int noticeId,
  });
}
