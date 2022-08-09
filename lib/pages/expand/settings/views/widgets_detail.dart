import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/widgets/svg_icon.dart';

class WidgetsDetail with BaseMixin {
  Widget itemSetting(
          {String? pathIconLeading,
          required String title,
          int maxlineTitle = 1,
          required Function onClick,
          String? hintDescript,
          Widget? iconAction,
          Widget? widgetBottom}) =>
      GestureDetector(
        onTap: () => onClick(),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    //
                    if (pathIconLeading != null)
                      iconSvg(
                              path: pathIconLeading,
                              height: 24,
                              width: 24,
                              color: color.grey0)
                          .paddingOnly(right: 10)
                    else
                      SizedBox(),
                    //
                    Expanded(
                        child: Text(
                      title,
                      maxLines: maxlineTitle,
                      overflow: TextOverflow.ellipsis,
                      style: textStyle.regular(),
                    )),
                    //
                    if (hintDescript != null)
                      Text(
                        hintDescript,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textStyle.regular(color: color.grey50),
                      )
                    else
                      SizedBox(),
                    //
                    iconAction ?? SizedBox()
                  ],
                ),
                //
                widgetBottom ?? SizedBox()
              ]),
        ),
      );
}
