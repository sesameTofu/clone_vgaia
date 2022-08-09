import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';

class NoDaWidget extends BaseWidget<BaseController> {
  NoDaWidget({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      SizedBox(height: 16),
      SizedBox(
        height: 16,
        width: 16,
        child: Image.asset(
          AppPath.overview,
          color: color.grey0,
        ),
      ),
      SizedBox(height: 4),
      Text(
        LocaleKeys.no_data_market.tr,
        style: textStyle.custom(color: color.grey0, size: 10),
      ),
      SizedBox(height: 16),
    ]));
  }
}
