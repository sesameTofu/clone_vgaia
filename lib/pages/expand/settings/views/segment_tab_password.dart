import 'package:flutter_mobile/import.dart';

class SegmentTabPassword extends StatefulWidget {
  const SegmentTabPassword(
      {Key? key,
      required this.titileTab1,
      required this.titileTab2,
      this.onClick,
      this.height = 40})
      : super(key: key);

  final String titileTab1;
  final String titileTab2;
  final Function(int)? onClick;
  final double height;

  @override
  State<SegmentTabPassword> createState() => _SegmentTabState();
}

class _SegmentTabState extends State<SegmentTabPassword> with BaseMixin {
  int initValue = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.secondary,
        borderRadius: BorderRadius.circular(30),
      ),
      constraints: BoxConstraints.tightFor(height: widget.height),
      child: StatefulBuilder(
        builder: (_, Function _setState) => Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: _buildButtonDetail(0, widget.titileTab1, _setState),
              ),
              Expanded(
                child: _buildButtonDetail(1, widget.titileTab2, _setState),
              )
            ]),
      ),
    );
  }

  ElevatedButton _buildButtonDetail(int id, String title, Function _setState) =>
      ElevatedButton(
        onPressed: () {
          initValue = id;
          _setState(() {});
          if (widget.onClick != null) {
            widget.onClick!(id);
          }
        },
        child: Text(
          title,
          maxLines: 1,
          style: textStyle.regular(),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: initValue == id ? color.primary : color.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      );
}
