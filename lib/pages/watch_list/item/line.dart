import 'package:flutter_mobile/import.dart';

class Liner extends StatelessWidget with BaseMixin {
  const Liner({
    Key? key,
    this.advancers = 1,
    this.tiers = 1,
    this.decliners = 1,
    this.declinerColor,
    this.tierColor,
    this.advancerColor,
    this.width = 100,
  }) : super(key: key);

  final double decliners;
  final double tiers;
  final double advancers;
  final Color? declinerColor;
  final Color? tierColor;
  final Color? advancerColor;
  final double width;

  @override
  Widget build(BuildContext context) {
    final double total = decliners + tiers + advancers;

    final double ap =
        ((total != 0 && advancers != 0) ? (advancers / total * width) : 0)
            .round()
            .toDouble();

    final double dp =
        ((total != 0 && decliners != 0) ? (decliners / total * width) : 0)
            .round()
            .toDouble();

    final double tp = width - dp - ap;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: 4.0,
      child: Row(
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: ap,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2.0),
                bottomLeft: Radius.circular(2.0),
              ),
              color: advancerColor ?? color.green50,
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: tp < 0 ? 0 : tp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: tierColor ?? color.yellow50,
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: dp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(2.0),
                bottomRight: Radius.circular(2.0),
              ),
              color: declinerColor ?? color.red50,
            ),
          ),
        ],
      ),
    );
  }
}
