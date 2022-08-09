import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';

Widget buildStatisticsTripleItemsRow(
    {required Widget left, required Widget middle, Widget? right}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Expanded(flex: 6, child: left),
      Expanded(flex: 5, child: middle),
      Expanded(flex: 4, child: right ?? Container())
    ],
  );
}

class StatisticLabelValue extends StatelessWidget with BaseMixin {
  const StatisticLabelValue({
    Key? key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.label = '',
    this.value1 = '',
    this.icon,
    this.value2,
    this.separator = '',
    this.labelColor,
    this.valueColor1,
    this.valueColor2,
    this.flickerValue1 = StatusFiled.NONE,
    this.flickerValue2 = StatusFiled.NONE,
  }) : super(key: key);

  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final String label;
  final String value1;
  final Widget? icon;
  final String? value2;
  final String separator;
  final Color? labelColor;
  final Color? valueColor1;
  final Color? valueColor2;
  final StatusFiled? flickerValue1;
  final StatusFiled? flickerValue2;

  @override
  Widget build(BuildContext context) {
    return _buildStatisticLabelValue();
  }

  Widget _buildStatisticLabelValue() {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: mainAxisAlignment,
          children: <Widget>[
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle.semiBold(
                  color: labelColor ?? color.grey40,
                  size: 10,
                ),
              ),
            ),
            if (icon != null) icon!.paddingOnly(right: sized.padding6)
          ],
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: mainAxisAlignment,
          children: <Widget>[
            Flexible(
              child: Text(
                value1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle.semiBold(
                    color: valueColor1 ?? color.grey0,
                    size: sized.fontSmallest,
                    backgroundColor: flickerValue1.bgChangedColorGrey()),
              ),
            ),
            Text(
              separator,
              style: textStyle.semiBold(
                color: valueColor1 ?? color.grey0,
                size: sized.fontSmallest,
              ),
            ),
            if (value2 != null)
              Flexible(
                child: Text(
                  value2 ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle.semiBold(
                      color: valueColor2 ?? color.grey0,
                      size: sized.fontSmallest,
                      backgroundColor: flickerValue2.bgChangedColorGrey()),
                ),
              )
          ],
        )
      ],
    );
  }
}
