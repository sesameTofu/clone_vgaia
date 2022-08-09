import 'package:flutter_mobile/domain/model/portfolio/customer_portfolio_model.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/asset/profit/item_profit_widget.dart';
import 'package:flutter_mobile/pages/asset/profit/profit_controller.dart';
import 'package:flutter_mobile/widgets/dropdow_box_select.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProfitPage extends BaseScreen<ProfitController> {
  ProfitPage({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return Container(
        color: color.background1,
        child: Column(children: <Widget>[
          SizedBox(height: 4),
          Container(
            color: color.background2,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: _buildAccount,
          ),
          ValueListenableBuilder<List<CustomerPortfolio>>(
              valueListenable: controller.listCustomer,
              builder: (_, List<CustomerPortfolio> value, __) => Expanded(
                      child: Column(children: <Widget>[
                    SizedBox(height: 4),
                    _header(value),
                    _headerList(),
                    _content(value)
                  ])))
        ]));
  }

  Widget _header(List<CustomerPortfolio> items) {
    final List<num> cal = controller.getInvestTotal(items);
    return Container(
        padding: EdgeInsets.all(8),
        color: color.background2,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: _footerItem(LocaleKeys.goline_TotalInvestValue.tr,
                      cal[0].formatPrice(decimalDigits: 0),
                      background: color.background2, color1: color.grey30)),
              const SizedBox(width: 8.0),
              Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: _footerItem(LocaleKeys.goline_TotalCurrentValue.tr,
                      cal[1].formatPrice(decimalDigits: 0),
                      background: color.background2, color1: color.grey30)),
              const SizedBox(width: 8.0),
              Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: _footerItem(LocaleKeys.goline_TotalProfitValue.tr,
                      cal[2].formatPrice(decimalDigits: 0),
                      background: _getTotalColor(cal[2]), color1: color.grey0))
            ]));
  }

  Widget _headerList() {
    return Container(
        color: color.background3,
        child: Padding(
            padding:
                const EdgeInsets.only(top: 8, bottom: 8, right: 12, left: 12),
            child: Row(children: <Widget>[
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Text(LocaleKeys.goline_SecCd.tr,
                    style: textStyle.medium(color: color.grey40),
                    textAlign: TextAlign.left),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Text(LocaleKeys.goline_KLTon.tr,
                    textAlign: TextAlign.center,
                    style: textStyle.medium(color: color.grey40)),
              ),
              Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Text(LocaleKeys.goline_GiaVon.tr,
                      textAlign: TextAlign.center,
                      style: textStyle.medium(color: color.grey40))),
              Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Text(LocaleKeys.goline_ProfitAndLost.tr,
                      style: textStyle.medium(color: color.grey40),
                      textAlign: TextAlign.right))
            ])));
  }

  Widget _content(List<CustomerPortfolio> items) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SmartRefresher(
                enablePullDown: true,
                controller: controller.refreshController,
                onRefresh: () => controller.getPortfolio(),
                child: ListView.separated(
                    physics: ClampingScrollPhysics(),
                    separatorBuilder: (_, __) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0.0),
                          child: Divider(color: color.grey70, height: 1));
                    },
                    itemBuilder: (_, int index) {
                      return ItemProfitWidget(index,
                          listValue: controller.listCustomer);
                    },
                    itemCount: controller.listCustomer.value.length))));
  }

  Color _getTotalColor(num total) {
    return total > 0
        ? color.green60
        : (total < 0 ? color.red50 : color.yellow50);
  }

  Widget _footerItem(
    String text,
    String value, {
    Color background = Colors.transparent,
    required Color color1,
  }) {
    return Container(
        decoration: BoxDecoration(
          color: background,
          border: Border.all(width: 1.0, color: color.grey70),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
              Text(text, style: textStyle.custom(color: color1, size: 12)),
              const SizedBox(height: 6.0),
              Text(value, style: textStyle.bold(size: 12))
            ])));
  }

  Widget get _buildAccount => Obx(() => DropdownBoxSelect<String>(
      title: LocaleKeys.account.tr,
      datas: controller.listSubAccount,
      hint: '',
      initialValue: controller.subAccount.value,
      width: .55.getWidth,
      selectedValue: controller.selectAccount,
      hintStyle: textStyle.custom()));

  @override
  ProfitController? putController() {
    return ProfitController();
  }
}
