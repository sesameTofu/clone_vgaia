import 'package:flutter_mobile/base/base_mixin.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/widgets/svg_icon.dart';

class SortWidget<T> extends StatefulWidget {
  const SortWidget(
      {Key? key,
      required this.title,
      required this.state,
      required this.onSortChanged,
      required this.value,
      required this.group,
      this.style,
      this.mainAxisAlignment})
      : super(key: key);

  final String title;
  final SortState state;
  final Function(SortState, T value) onSortChanged;
  final T value;
  final T group;
  final TextStyle? style;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  _SortWidgetState<T> createState() => _SortWidgetState<T>();
}

class _SortWidgetState<T> extends State<SortWidget<T>> with BaseMixin {
  late SortState _state;

  @override
  void initState() {
    _state = widget.state;
    super.initState();
  }

  @override
  void didUpdateWidget(SortWidget<T> oldWidget) {
    setState(() {
      _state = widget.state;
    });
    super.didUpdateWidget(oldWidget);
  }

  void _stateChanged() {
    if (_state == SortState.up) {
      _state = SortState.none;
    } else if (_state == SortState.down) {
      _state = SortState.up;
    } else {
      _state = SortState.down;
    }

    widget.onSortChanged(_state, widget.value);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.value != widget.group) {
      _state = SortState.none;
    }

    return GestureDetector(
      onTap: () {
        _stateChanged();
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Text(widget.title,
                style: textStyle.regular(
                    size: 10,
                    color: _state == SortState.none
                        ? color.grey40
                        : color.blue60)),
          ),
          SizedBox(width: 6),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              iconSvg(
                path: AppPath.icSortUp,
                color: _state == SortState.up ? color.blue60 : color.grey40,
              ),
              SizedBox(height: 2),
              iconSvg(
                path: AppPath.icSortDown,
                color: _state == SortState.down ? color.blue60 : color.grey40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
