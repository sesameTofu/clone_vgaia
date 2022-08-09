import 'package:flutter_mobile/domain/model/statement/statement_money_model.dart';
import 'package:flutter_mobile/import.dart';

class CellItemStatementReport extends BaseWidget<BaseController> {
  CellItemStatementReport(this._data, {Key? key}) : super(key: key);
  final StatementMoneyModel _data;

  @override
  Widget builder() {
    if (_data.currentAmt == 0) {
      return Container();
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _data.businessDate ?? '',
                  style: textStyle.regular(),
                ),
              ),
            ),
            Expanded(
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    _getCaculateData(),
                    style: textStyle.regular(),
                  )),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                // child: GolineTexts.normal(
                //     _data.currentAmt.formatPrice(decimalDigits: 0)),
                child: Text(
                  (_data.currentAmt ?? 0).formatPrice(decimalDigits: 0),
                  style: textStyle.regular(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String _getCaculateData() {
    final num result = (_data.creditAmt ?? 0) - (_data.debitAmt ?? 0);
    if (result == 0) {
      return '0';
    } else if (result > 0) {
      return '+${result.formatPrice(decimalDigits: 0)}';
    } else {
      return result.formatPrice(decimalDigits: 0);
    }
  }
}
