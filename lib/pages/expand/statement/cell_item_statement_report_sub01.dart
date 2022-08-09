import 'package:flutter_mobile/domain/model/statement/statement_stock_model.dart';
import 'package:flutter_mobile/import.dart';

class CellItemStatementReportSub01 extends BaseWidget<BaseController> {
  CellItemStatementReportSub01(this._data, {Key? key}) : super(key: key);
  final StatementStockModel _data;
  @override
  Widget builder() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        padding: const EdgeInsets.all(8),
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
                  _data.secCd ?? '',
                  style: textStyle.regular(),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  (_data.beginQty ?? 0).formatPrice(decimalDigits: 0),
                  style: textStyle.regular(),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  (_data.lastAmt ?? 0).formatPrice(decimalDigits: 0),
                  style: textStyle.regular(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
