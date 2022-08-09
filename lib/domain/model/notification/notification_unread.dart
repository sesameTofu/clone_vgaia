class NotificationUnread {
  NotificationUnread({
    this.userId,
    this.noticeType,
    this.countUnread,
    this.noticeId,
    this.title,
    this.content,
    this.contentFull,
  });

  factory NotificationUnread.fromJson(Map<String, dynamic> json) =>
      NotificationUnread(
        userId: json['userId'] as String?,
        noticeType: json['noticeType'] as int?,
        countUnread: json['countUnread'] as int?,
        noticeId: json['noticeId'] as int?,
        title: json['title'] as String?,
        content: json['content'] as String?,
        contentFull: json['contentFull'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userId': userId,
        'noticeType': noticeType,
        'countUnread': countUnread,
        'noticeId': noticeId,
        'title': title,
        'content': content,
        'contentFull': contentFull,
      };

  String? userId;
  int? noticeType;
  int? countUnread;
  int? noticeId;
  String? title;
  String? content;
  String? contentFull;
}
