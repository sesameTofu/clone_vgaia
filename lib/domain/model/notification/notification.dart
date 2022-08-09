import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Notification {
  Notification({
    this.title,
    this.content,
    this.contentFull,
    this.type,
    this.date,
    this.noticeId,
    this.regDateTime,
    this.status,
    this.key,
    this.readState,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        title: json['title'] as String?,
        content: json['content'] as String?,
        contentFull: json['contentFull'] as String?,
        type: json['type'] as int?,
        date: json['date'] as int?,
        noticeId: json['noticeId'] as int?,
        regDateTime: json['regDateTime'] as int?,
        status: json['status'] as int?,
        readState: json['readState'] as int?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'content': content,
        'contentFull': contentFull,
        'type': type,
        'date': date,
        'noticeId': noticeId,
        'regDateTime': regDateTime,
        'status': status,
        'readState': readState,
      };

  String? title;
  String? content;
  String? contentFull;
  int? type;
  int? date;
  int? noticeId;
  int? regDateTime;
  int? status;
  int? readState;
  GlobalKey<SlidableState>? key;
}
