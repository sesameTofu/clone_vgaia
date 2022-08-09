import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/widgets/dropdown_custom.dart';

class OrderListDropDown<T> extends BaseWidget<BaseController> {
  OrderListDropDown({
    Key? key,
    required this.listData,
    required this.valueSelect,
    required this.onChanged,
  }) : super(key: key);
  final List<Select<T>> listData;
  final Select<T> valueSelect;
  final Function(Select<T> valueChange) onChanged;
  @override
  Widget builder() {
    return DropdownCustom<T>(
      isDense: false,
      maxLength: 2,

      // hintStyle: textStyle.custom(color: color.neutral2, size: 12),
      isExpanded: true,
      hint: 'hint',
      // hintColor: color.neutral1,
      onChanged: (Select<T> value) {
        onChanged(value);
      },
      value: valueSelect,
      data: listData,
    );
  }
}
