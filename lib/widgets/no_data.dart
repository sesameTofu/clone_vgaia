import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/widgets/svg_icon.dart';

class Nodata extends BaseWidget<BaseController> {
  Nodata({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  Widget builder() {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            iconSvg(path: AppPath.icNoData),
            SizedBox(height: 8),
            Text(
              title ?? LocaleKeys.no_add.tr,
              style: textStyle.custom(color: color.grey0, size: 13),
            ),
          ],
        ),
      ),
    );
  }
}
