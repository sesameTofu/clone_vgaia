import 'package:flutter_mobile/base/base_mixin.dart';
import 'package:flutter_mobile/domain/model/stock_transfer/sec_balance_list_model.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/generated/locales.g.dart';
import 'package:flutter_mobile/global/app_toast.dart';
import 'package:flutter_mobile/widgets/checkbox.dart';
import 'package:flutter_mobile/widgets/text_field/build_input_text.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class CellItem extends StatefulWidget {
  const CellItem({
    Key? key,
    required this.buyAb,
    required this.isTick,
    required this.onPressTick,
    required this.index,
    this.isEdit = true,
  }) : super(key: key);

  final bool isEdit;
  final bool isTick;
  final int index;
  final dynamic Function([bool]) onPressTick;
  final SecBalanceListModel buyAb;

  @override
  State<CellItem> createState() => _CellItemState();
}

class _CellItemState extends State<CellItem> with BaseMixin {
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    final String presentText = widget.buyAb.textEditingController!.text;
    if (!_focus.hasFocus && widget.isTick) {
      if (presentText.isEmpty || presentText == '0') {
        AppToast.showError(LocaleKeys.stock_transfer_alertAmount1.tr);
      }
      if (presentText.formatNumber() >
          double.parse(widget.buyAb.secTransferAvail!)) {
        AppToast.showError(LocaleKeys.stock_transfer_alertAmount2.tr);
      }
    }
    if (_focus.hasFocus && !widget.isTick) {
      widget.onPressTick(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: color.grey70,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CheckBox(
            value: widget.isTick,
            onPress: (bool value) => widget.onPressTick(),
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.center,
                  child:
                      Text(widget.buyAb.secCd ?? '', style: textStyle.bold()))),
          Expanded(
              child: Align(
                  alignment: Alignment.center,
                  child: Text(widget.buyAb.secTransferAvail ?? '',
                      style: textStyle.medium()))),
          Expanded(
            child: BuildInputText(
              fillColor: color.background0,
              hintText: '',
              controller: widget.buyAb.textEditingController!,
              textAlign: TextAlign.center,
              scrollPadding: EdgeInsets.zero,
              fontSize: 13.0,
              styleText: widget.isTick
                  ? textStyle.medium()
                  : textStyle.regular(color: color.grey50),
              currentNode: _focus,
              suffixIcon: SizedBox(),
              textInputType: TextInputType.number,
              inputFormatters: <ThousandsFormatter>[ThousandsFormatter()],
            ),
          )
        ],
      ),
    );
  }
}
