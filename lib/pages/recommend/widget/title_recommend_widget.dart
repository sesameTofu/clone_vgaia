import 'package:flutter_mobile/import.dart';

class TitleRecommendWidget extends BaseWidget<BaseController> {
  TitleRecommendWidget({Key? key}) : super(key: key);

  @override
  Widget builder() => Container(
        padding: const EdgeInsets.all(10.0),
        color: color.background1,
        child: Row(
          children: <Widget>[
            _buildItemTitle(
              LocaleKeys.goline_NgayKN.tr,
              flex: 2,
              alignment: Alignment.centerLeft,
            ),
            _buildItemTitle(LocaleKeys.goline_MaCK.tr),
            _buildItemTitle(LocaleKeys.goline_GiaKN.tr),
            _buildItemTitle(LocaleKeys.goline_PhanTramLaiLo.tr)
          ],
        ),
      );

  Widget _buildItemTitle(String title, {int flex = 1, Alignment? alignment}) =>
      Expanded(
        flex: flex,
        child: Align(
          alignment: alignment ?? Alignment.center,
          child: Text(
            title,
            style: textStyle.regular(),
          ),
        ),
      );
}
