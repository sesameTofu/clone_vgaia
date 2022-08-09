import 'package:flutter_mobile/import.dart';

class HeaderLabel extends StatelessWidget with BaseMixin {
  const HeaderLabel(
      {Key? key, this.isTopBorder = false, required this.labelList})
      : super(key: key);

  final List<String> labelList;
  final bool? isTopBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.width),
      height: 28.height,
      decoration: BoxDecoration(
        border: Border(
          top: isTopBorder == true
              ? BorderSide(width: 1, color: color.grey70)
              : BorderSide.none,
          bottom: BorderSide(width: 1, color: color.grey70),
        ),
        color: color.background2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: labelList
            .mapIndexed((String e, int index) => Expanded(
                  child: Container(
                    alignment: index == 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Text(
                      e,
                      style: textStyle.semiBold(size: 10, color: color.grey20),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class Foodter extends StatelessWidget with BaseMixin {
  const Foodter({Key? key, this.onPress}) : super(key: key);

  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return _buildFooter;
  }

  Widget get _buildFooter => Container(
        height: 32.height,
        width: double.infinity,
        color: color.background2,
        padding: EdgeInsets.only(left: 12.width),
        child: GestureDetector(
          onTap: onPress,
          child: Row(
            children: <Widget>[
              Text(
                LocaleKeys.see_all.tr,
                style: textStyle.regular(
                  color: color.grey30,
                  size: 12,
                ),
              ),
              Icon(
                Icons.arrow_right,
                color: color.grey30,
              ),
            ],
          ),
        ),
      );
}

typedef RenderChildPopup = Widget Function(Function);

class PopupMenu extends StatefulWidget {
  const PopupMenu({
    Key? key,
    required this.childPopup,
    required this.child,
    this.height,
    this.width,
    this.right = 0,
    this.useWidthParent = false,
    this.padingTop = 1.2,
  }) : super(key: key);

  final RenderChildPopup childPopup;
  final Widget child;
  final double? height;
  final double? width;
  final double right;
  final bool useWidthParent;
  final double padingTop;

  @override
  _PopupMenuState createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  late GlobalKey actionKey;
  late double heightBox;
  late double widthBox;
  late double xPosition;
  late double yPosition;

  late OverlayEntry floatingDropdown;

  bool isDropdownOpened = false;

  @override
  void initState() {
    actionKey = LabeledGlobalKey('PopupMenu');
    super.initState();
  }

  void _findDropdownData() {
    final RenderBox renderBox =
        actionKey.currentContext!.findRenderObject()! as RenderBox;

    heightBox = renderBox.size.height;
    widthBox = renderBox.size.width;

    final Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;

    floatingDropdown = _createFloatingDropdown();
    Overlay.of(context)!.insert(floatingDropdown);
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(
      builder: (_) {
        return LayoutBuilder(
          builder: (_, __) {
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: _onGesture,
              child: Material(
                color: Colors.transparent,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      right: widget.right,
                      width: widget.useWidthParent ? widthBox : widget.width,
                      top: yPosition + heightBox * widget.padingTop,
                      height: widget.height,
                      child: InkWell(
                        onTap: () {},
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: widget.childPopup(_onGesture),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _onGesture() {
    setState(() {
      if (isDropdownOpened) {
        floatingDropdown.remove();
      } else {
        _findDropdownData();
      }

      isDropdownOpened = !isDropdownOpened;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: _onGesture,
      child: widget.child,
    );
  }
}

class TitleItemMarket extends StatelessWidget with BaseMixin {
  const TitleItemMarket(
      {Key? key, required this.title, this.actionWidget, this.onClick})
      : super(key: key);

  final String title;
  final Widget? actionWidget;
  final Function? onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClick != null) {
          onClick!();
        }
      },
      child: Container(
          height: 40.height,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: color.grey70)),
            color: color.grey90,
          ),
          margin: EdgeInsets.only(top: 16),
          child: IntrinsicHeight(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textStyle.bold(
                        size: 15,
                        color: color.grey0,
                      ),
                    ).paddingSymmetric(
                      horizontal: 16,
                    ),
                  ),
                  if (actionWidget == null)
                    SizedBox()
                  else
                    actionWidget!.paddingSymmetric(
                      horizontal: 16,
                    )
                ]),
          )),
    );
  }
}
