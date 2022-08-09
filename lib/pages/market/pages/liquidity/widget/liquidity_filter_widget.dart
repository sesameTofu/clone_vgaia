import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/market/pages/liquidity/liquidity_controller.dart';
import 'package:flutter_mobile/widgets/dropdow_box_select.dart';

class LiquidityFilterWidget extends BaseWidget<LiquidityController> {
  LiquidityFilterWidget({Key? key}) : super(key: key);

  @override
  Widget builder() => Column(
        children: <Widget>[
          _buildSelectCode(),
          SizedBox(height: 5.0),
        ],
      );

  Widget _buildSelectCode() => Obx(() => DropdownBoxSelect<String>(
        title: LocaleKeys.fl.tr,
        datas: controller.listCode,
        initialValue: controller.codeSelect.value,
        selectedValue: controller.selectCode,
      ));
}
