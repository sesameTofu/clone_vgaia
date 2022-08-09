import 'package:flutter_mobile/import.dart';

class BottomSheetCustom extends StatelessWidget with BaseMixin {
  const BottomSheetCustom(
      {Key? key, required this.content, this.height = 200, this.padding})
      : super(key: key);

  final Widget content;
  final double height;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.95.getHeight,
      width: 1.getWidth,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          InkWell(
            onTap: () => Get.back(),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              width: 64.width,
              height: 6,
              decoration: BoxDecoration(
                color: color.grey60,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Container(
            height: height,
            padding: padding ??
                EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8.width,
                ),
            width: 1.getWidth,
            decoration: BoxDecoration(
              color: color.grey90,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            child: content,
            // child:
          ),
        ],
      ),
    );
  }
}
