import 'package:flutter_mobile/domain/model/order_diary/order_list_model.dart';
import 'package:flutter_mobile/import.dart';

import 'index_table_horizontal.dart';

class LeftItemTableHorizontal extends BaseWidget<BaseController> {
  LeftItemTableHorizontal({
    Key? key,
    required this.orderListModelAbstract,
    required this.isShow,
    this.onPress,
  }) : super(key: key) {
    isSelect.value = orderListModelAbstract.selectCancelOrder;
  }

  final OrderListModelAbstract orderListModelAbstract;
  final bool isShow;
  final Rx<bool> isSelect = false.obs;
  final Function(OrderListModelAbstract)? onPress;
  @override
  Widget builder() {
    return Row(
      children: <Widget>[
        Visibility(
          visible: isShow && orderListModelAbstract.isEditOrder,
          child: Padding(
            padding: EdgeInsets.only(left: 4.width, right: 4.width),
            child: SizedBox(
              height: 30.height,
              width: 30.width,
              child: Obx(() => Checkbox(
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    checkColor: color.primary,
                    value: isSelect.value,
                    onChanged: (bool? value) {
                      isSelect.value = value ?? false;
                      orderListModelAbstract.selectCancelOrder = isSelect.value;
                      if (onPress != null) {
                        onPress!(orderListModelAbstract);
                      }
                    },
                  )),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: IndexTableHorizontal(
            rowWidth: 100,
            titleUp: orderListModelAbstract.secCdOrder,
            titleDown: orderListModelAbstract.custNoOrder,
            isLeft: true,
            textStyleUp: textStyle.semiBold(color: color.grey50),
            textStyleDown: textStyle.custom(size: 12, color: color.grey50),
            padding: (isShow && orderListModelAbstract.isEditOrder)
                ? EdgeInsets.zero
                : null,
          ),
        ),
      ],
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return color.grey50;
    }
    return color.grey50;
  }
}
