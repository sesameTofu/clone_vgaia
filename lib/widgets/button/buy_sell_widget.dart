import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_theme.dart';
import 'package:flutter_mobile/import.dart';

class BuySellWidget extends BaseWidget<BaseController> {
  BuySellWidget(
      {Key? key,
      required this.initValue,
      required this.onclick,
      this.height = 36})
      : super(key: key);

  final TradeType initValue;

  final Function(TradeType) onclick;

  final double height;

  @override
  Widget builder() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Get.find<AppThemeBase>().theme.grey70,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(height: height),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: _buildButtonDetail(TradeType.BUY, color.green50)),
            Expanded(child: _buildButtonDetail(TradeType.SELL, color.red50)),
          ],
        ),
      ),
    );
  }

  ElevatedButton _buildButtonDetail(TradeType type, Color bgColor) =>
      ElevatedButton(
        onPressed: () {
          onclick(type);
        },
        child: Text(
          type == TradeType.SELL
              ? LocaleKeys.sell.tr.toUpperCase()
              : LocaleKeys.buy.tr.toUpperCase(),
          maxLines: 1,
          style: textStyle.regular(color: color.grey0),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: initValue == type ? bgColor : color.grey70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      );
}
