import 'package:flutter_mobile/import.dart';

class BuildRowData extends BaseWidget<BaseController> {
  BuildRowData(this.title, this.data, {Key? key}) : super(key: key);

  final String title;
  final String data;

  @override
  Widget builder() => Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title, style: textStyle.regular(color: color.grey40)),
            Text(data, style: textStyle.regular(color: color.grey0))
            // Container(
          ],
        ),
      );
}
