import 'package:flutter_mobile/domain/model/select.dart';
import 'package:flutter_mobile/domain/model/statement/statement_model.dart';
import 'package:flutter_mobile/domain/model/statement/statement_money_model.dart';
import 'package:flutter_mobile/domain/model/statement/statement_stock_model.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/expand/statement/cell_item_statement_report.dart';
import 'package:flutter_mobile/pages/expand/statement/cell_item_statement_report_sub01.dart';
import 'package:flutter_mobile/pages/expand/statement/statement_controller.dart';
import 'package:flutter_mobile/widgets/app_loading.dart';
import 'package:flutter_mobile/widgets/dropdow_box_select.dart';
import 'package:flutter_mobile/widgets/select_datetime/select_date.dart';

class StatementPage extends BaseScreen<StatmentController> {
  StatementPage({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color.background1,
          title: Text(LocaleKeys.goline_AccountStateMentTitle.tr),
        ),
        body: ValueListenableBuilder<bool>(
            valueListenable: controller.loadingPage,
            builder: (_, bool value, __) => Stack(children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 12),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: _buildBody),
                          Padding(
                              padding: const EdgeInsets.all(12),
                              child: SelectDateTime(
                                  fromDate: controller.fromDate,
                                  toDate: controller.toDate,
                                  changeDate:
                                      (DateTime fromDate, DateTime toDate) =>
                                          controller.changeDate(
                                              valueFromDate: fromDate,
                                              valueToDate: toDate))),
                          _buildList(value)
                        ]),
                  ),
                  Visibility(visible: value, child: appLoading),
                ])));
  }

  Widget get _buildBody => ValueListenableBuilder<List<Select<String>>>(
        valueListenable: controller.listSubAccount,
        builder: (BuildContext context, List<Select<String>> listSubAccount,
                Widget? child) =>
            ValueListenableBuilder<Select<String>>(
          valueListenable: controller.subAccount,
          builder: (_, Select<String> subAccount, __) =>
              DropdownBoxSelect<String>(
            title: LocaleKeys.account.tr,
            datas: listSubAccount,
            hint: '',
            initialValue: subAccount,
            width: .55.getWidth,
            selectedValue: controller.selectAccount,
            hintStyle: textStyle.custom(
                fontWeight: FontWeight.w300, color: color.grey0),
          ),
        ),
      );

  Widget _buildList(bool isLoading) {
    return ValueListenableBuilder<StatementModel>(
        valueListenable: controller.statement,
        builder: (_, StatementModel value, __) => Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildSD(LocaleKeys.goline_DuDauKy.tr, value.beginAmt ?? 0),
                _buildSD(LocaleKeys.goline_DuCuoiKy.tr, value.lastAmt ?? 0),
                _buildTitle(LocaleKeys.goline_ThongTinTien.tr),
                _buildTitleList(data: <String>[
                  LocaleKeys.goline_NgayTao.tr,
                  LocaleKeys.goline_PhatSinh.tr,
                  LocaleKeys.goline_SoDu.tr
                ]),
                _buildListStatementMoney(
                    value.listSatementMoney ?? <StatementMoneyModel>[],
                    isLoading),
                _buildTitle(LocaleKeys.goline_ThongTinChungKhoan.tr),
                _buildTitleList(data: <String>[
                  LocaleKeys.goline_MaCK.tr,
                  LocaleKeys.goline_DuDauKy.tr,
                  LocaleKeys.goline_DuCuoiKy.tr
                ]),
                _buildListStatementStock(
                    value.listSatementStocks ?? <StatementStockModel>[],
                    isLoading),
              ],
            ));
  }

  Widget _buildTitleList({required List<String> data}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      color: color.background2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          for (String item in data) ...<Widget>[
            Flexible(
              child: _child(item, data),
              // fit: FlexFit.tight,
            ),
          ]
        ],
      ),
    );
  }

  Widget _child(String item, List<String> data) {
    if (data.indexOf(item) == 0) {
      return Align(
        child: Text(item, style: textStyle.regular()),
        alignment: Alignment.centerLeft,
      );
    } else if (data.indexOf(item) == 1) {
      return Align(
        child: Text(item, style: textStyle.regular()),
        alignment: Alignment.center,
      );
    } else if (data.indexOf(item) == data.length) {
      return Align(
        child: Text(item, style: textStyle.regular()),
        alignment: Alignment.centerRight,
      );
    } else {
      return Align(
        child: Text(item, style: textStyle.regular()),
        alignment: Alignment.centerRight,
      );
    }
  }

  Widget _buildListStatementMoney(
      List<StatementMoneyModel> data, bool isLoading) {
    return (data.isEmpty && !isLoading)
        ? _buildNoData()
        : ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return CellItemStatementReport(data[index]);
            },
            itemCount: data.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          );
  }

  Widget _buildListStatementStock(
      List<StatementStockModel> data, bool isLoading) {
    return (data.isEmpty && !isLoading)
        ? _buildNoData()
        : ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return CellItemStatementReportSub01(data[index]);
            },
            itemCount: data.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          );
  }

  Widget _buildSD(String title, num value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Text(title, style: textStyle.regular()),
          const SizedBox(
            width: 8.0,
          ),
          const Spacer(),
          Text(
            value.formatPrice(decimalDigits: 0),
            style: textStyle.regular(),
          )
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: textStyle.bold(),
        ),
      ),
    );
  }

  Widget _buildNoData() {
    return SizedBox(
        height: 100,
        child: Center(
            child: Text(
          LocaleKeys.goline_NoDataFound.tr,
          style: textStyle.bold(),
        )));
  }

  @override
  StatmentController? putController() {
    return StatmentController();
  }
}
