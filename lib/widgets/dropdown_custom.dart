import 'package:flutter_mobile/base/base_mixin.dart';
import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_svg/svg.dart';

class DropdownCustom<T> extends StatefulWidget {
  const DropdownCustom({
    Key? key,
    this.hint,
    required this.onChanged,
    this.value,
    required this.data,
    this.isExpanded = true,
    this.iconColor,
    this.textColor,
    this.hintColor,
    this.hintStyle,
    this.icon,
    this.isDense = false,
    this.maxLength = 1,
  }) : super(key: key);

  final String? hint;
  final Function(Select<T>) onChanged;
  final Select<T>? value;
  final List<Select<T>> data;
  final bool isExpanded;
  final Color? iconColor;
  final Color? textColor;
  final Color? hintColor;
  final TextStyle? hintStyle;
  final Icon? icon;
  final bool isDense;
  final int maxLength;

  @override
  _DropdownCustomState<T> createState() => _DropdownCustomState<T>();
}

class _DropdownCustomState<T> extends State<DropdownCustom<T>> with BaseMixin {
  Select<T>? selectedValue;
  late List<Select<T>> data;

  @override
  void initState() {
    super.initState();

    selectedValue = widget.value;
    data = widget.data;
  }

  @override
  void didUpdateWidget(DropdownCustom<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      selectedValue = widget.value;
      // this.setState(() {});
    }
    if (oldWidget.data != widget.data) {
      data = widget.data;
      // this.setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Select<T>>(
      hint: Text(
        widget.hint ?? '',
        maxLines: widget.maxLength,
        style: widget.hintStyle ??
            textStyle.regular(
              color: widget.hintColor ?? color.grey40,
            ),
      ),
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      isDense: widget.isDense,
      underline: SizedBox(),
      isExpanded: widget.isExpanded,
      icon: widget.icon ??
          SvgPicture.asset(
            AppPath.icArrowDown,
            color: widget.iconColor ?? color.grey0,
          ),
      value: selectedValue,
      style: widget.hintStyle ??
          textStyle.regular(
            color: widget.textColor ?? color.grey0,
          ),
      dropdownColor: color.grey70,
      onChanged: (Select<T>? value) {
        widget.onChanged(value!);

        setState(() => selectedValue = value);
      },
      items: data.map((Select<T> i) {
        return DropdownMenuItem<Select<T>>(
          value: i,
          child: Text(
            i.title ?? '',
            maxLines: widget.maxLength,
            style: widget.hintStyle ??
                textStyle.regular(
                  color: widget.textColor ?? color.grey0,
                ),
          ),
        );
      }).toList(),
    );
  }
}
