import 'package:flutter_mobile/base/import_base.dart';
import 'package:flutter_mobile/extensions/extension.dart';

import '../../../domain/model/notification/notification.dart' as ntf;

class ItemNotification extends StatelessWidget with BaseMixin {
  const ItemNotification({Key? key, required this.notification})
      : super(key: key);

  final ntf.Notification notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12.width),
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12.width),
      decoration: BoxDecoration(
        color: notification.readState == 0 ? color.grey70 : color.grey80,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  notification.title ?? '',
                  style: textStyle.regular(
                    color: color.grey0,
                    size: 13,
                  ),
                ),
              ),
              // Spacer(),
              Text(
                notification.regDateTime!.formatDMMYYYYHHMMSS(),
                style: textStyle.regular(
                  color: color.grey20,
                  size: 13,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            notification.content ?? '',
            style: textStyle.regular(
              color: color.grey20,
              size: 13,
            ),
          ),
        ],
      ),
    );
  }
}
