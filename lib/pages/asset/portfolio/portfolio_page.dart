import 'package:flutter_mobile/domain/model/place_order/buying_power_data.dart';
import 'package:flutter_mobile/domain/model/portfolio/inquiry_model.dart';
import 'package:flutter_mobile/domain/model/portfolio/sec_balance_display2.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/asset/portfolio/portfolio_controller.dart';
import 'package:flutter_mobile/widgets/account/account_mixi_widget.dart';
import 'package:flutter_mobile/widgets/expansion/expansion_item.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PortfolioPage extends BaseScreen<PortfolioController>
    with AccountMixiWidget {
  PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return Container(
        color: color.background1,
        child: Column(children: <Widget>[
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ValueListenableBuilder<InquiryModel>(
                valueListenable: controller.inquiryModel,
                builder: (_, InquiryModel inquiryModel, __) =>
                    ValueListenableBuilder<BuyingPowerData>(
                      valueListenable: controller.buyingPowerData,
                      builder: (_, BuyingPowerData value, __) {
                        return _buildCardInvesment(inquiryModel, value);
                      },
                    )),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildCategory(),
          ),
          Expanded(child: _buildCategoryList())
        ]));
  }

  Widget _buildCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          decoration: BoxDecoration(
            color: color.background2,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)),
          ),
          child: Text(LocaleKeys.watch_list.tr,
              style: textStyle.custom(
                  fontWeight: FontWeight.bold, size: 20.0, color: color.white)),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          color: color.background3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                child: Center(
                  child: Text(LocaleKeys.goline_SecCd.tr,
                      style: textStyle.custom(size: 14.0, color: color.white)),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Center(
                  child: Text(LocaleKeys.trading.tr,
                      style: textStyle.custom(size: 14.0, color: color.white)),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Center(
                  child: Text(LocaleKeys.goline_WaitLabel.tr,
                      style: textStyle.custom(size: 14.0, color: color.white)),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Center(
                  child: Text(LocaleKeys.goline_CanSale.tr,
                      style: textStyle.custom(size: 14.0, color: color.white)),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryList() {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ValueListenableBuilder<List<SecBalanceDisplay2>>(
            valueListenable: controller.listSecBalanceDisplay2,
            builder: (_, List<SecBalanceDisplay2>? list, Widget? widget) =>
                list == null || list.isEmpty
                    ? Center(
                        child: Text(
                          LocaleKeys.goline_NoSearchDataFound.tr,
                          style: textStyle.regular(color: color.grey10),
                        ),
                      )
                    : ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (_, int index) => _itemSec(list[index]),
                        separatorBuilder: (_, __) =>
                            Divider(color: color.grey50, height: 1),
                        itemCount: list.length,
                      ),
          ),
        ],
      ),
    );
  }

  Widget _itemSec(SecBalanceDisplay2 item) {
    return Slidable(
      key: key,
      controller: controller.slidableController,
      actionExtentRatio: 0.2,
      enabled: true,
      movementDuration: Duration(milliseconds: 500),
      actionPane: SlidableDrawerActionPane(),
      direction: Axis.horizontal,
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: LocaleKeys.sell.tr,
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => {},
        ),
      ],
      child: ExpansionItem(
        children: <Widget>[_buildExpandItem(item)],
        title: Container(
          color: color.background1,
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Center(
                  child: Text(item.secCode.toString(),
                      style: textStyle.custom(size: 14.0, color: color.white)),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Center(
                  child: Text(item.total.toString(),
                      style: textStyle.custom(size: 14.0, color: color.white)),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Center(
                  child: Text(item.getWaitBack.toString(),
                      style: textStyle.custom(size: 14.0, color: color.white)),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Center(
                  child: Text(item.availSale.toString(),
                      style: textStyle.custom(size: 14.0, color: color.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandItem(SecBalanceDisplay2 item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Divider(color: color.grey50, height: 1),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          color: color.background1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(LocaleKeys.goline_ChoVeT0.tr,
                      style: textStyle.custom(size: 14.0, color: color.white)),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(item.receiveT0.toString(),
                      style: textStyle.custom(size: 14.0, color: color.white)),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(LocaleKeys.goline_HanCheCN.tr,
                      style: textStyle.custom(size: 14.0, color: color.white)),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(item.limitQty.toString(),
                      style: textStyle.custom(size: 14.0, color: color.white)),
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          color: color.background1,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(LocaleKeys.goline_ChoVeT1.tr,
                      style: textStyle.custom(size: 14.0, color: color.white)),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(item.receiveT1.toString(),
                      style: textStyle.custom(size: 14.0, color: color.white)),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(LocaleKeys.blockade.tr,
                      style: textStyle.custom(size: 14.0, color: color.white)),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(item.getBlockable.toString(),
                      style: textStyle.custom(size: 14.0, color: color.white)),
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          color: color.background1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(LocaleKeys.goline_ChoVeT2.tr,
                      style: textStyle.custom(size: 14.0, color: color.white)),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(item.receiveT2.toString(),
                      style: textStyle.custom(size: 14.0, color: color.white)),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(LocaleKeys.pledge.tr,
                      style: textStyle.custom(size: 14.0, color: color.white)),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(item.mortage.toString(),
                      style: textStyle.custom(size: 14.0, color: color.white)),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCardInvesment(
      InquiryModel inquiryModel, BuyingPowerData buyingPowerData) {
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              border: Border.all(
                color: color.grey70,
                width: 1.0,
              ),
              image: DecorationImage(
                  image: AssetImage(color.pathColorAssert), fit: BoxFit.fill),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          border: Border.all(
                            color: color.branding,
                            width: 1.0,
                          ),
                          image: DecorationImage(
                              image: AssetImage(color.pathColorAssert),
                              fit: BoxFit.fill)),
                      child: buildAccount(controller),
                    ),
                    Expanded(
                        child: _buildColumItem(
                            LocaleKeys.goline_TotalAsset.tr,
                            (buyingPowerData.totalAsset ?? 0)
                                .formatPrice(decimalDigits: 0),
                            color: color.grey40,
                            crossAxisAlignment: CrossAxisAlignment.end))
                  ]),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Obx(() => _buildColumItem(
                            LocaleKeys.goline_BuyPower.tr,
                            (buyingPowerData.buyingPower ?? 0)
                                .formatPrice(decimalDigits: 0),
                            color: color.grey40,
                          )),
                      _buildColumItem(
                          LocaleKeys.goline_AvailablePaymentAmount.tr,
                          (inquiryModel.paymentAvail ?? 0).formatPrice(),
                          color: color.grey40,
                          // colorValue: portfolioRes
                          //     .getColorValue(portfolioRes.totalRealizePl),
                          crossAxisAlignment: CrossAxisAlignment.end),
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Obx(() => _buildColumItem(
                            LocaleKeys.goline_AvailableWithdraw.tr,
                            (buyingPowerData.buyingPower ?? 0)
                                .formatPrice(decimalDigits: 0),
                            color: color.grey40,
                          )),
                      _buildColumItem(LocaleKeys.goline_total_must_pay.tr,
                          (inquiryModel.paymentAvail ?? 0).formatPrice(),
                          color: color.grey40,
                          crossAxisAlignment: CrossAxisAlignment.end),
                    ],
                  ),
                ])),
        SizedBox(
          height: 12.0,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              border: Border.all(
                color: color.grey70,
                width: 1.0,
              ),
              color: color.background2),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Obx(() => Expanded(
                        child: _buildColumItem(
                          LocaleKeys.goline_buy_of_the_day.tr,
                          (buyingPowerData.todayBuyValue ?? 0).formatPrice(),
                          color: color.grey40,
                        ),
                      )),
                  SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: _buildColumItem(LocaleKeys.goline_AmountWaitT0.tr,
                        (inquiryModel.t0Amount ?? 0).formatPrice(),
                        color: color.grey40,
                        crossAxisAlignment: CrossAxisAlignment.start),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      height: 20,
                      color: color.grey40,
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: Divider(
                      height: 20,
                      color: color.grey40,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Obx(() => Expanded(
                        child: _buildColumItem(
                          LocaleKeys.goline_AmountWaitT1.tr,
                          (inquiryModel.t1Amount ?? 0).formatPrice(),
                          color: color.grey40,
                        ),
                      )),
                  SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: _buildColumItem(LocaleKeys.goline_AmountWaitT2.tr,
                        (inquiryModel.t2Amount ?? 0).formatPrice(),
                        color: color.grey40,
                        crossAxisAlignment: CrossAxisAlignment.start),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildColumItem(String title, String value,
      {Color? color,
      Color? colorValue,
      CrossAxisAlignment? crossAxisAlignment = CrossAxisAlignment.start,
      double? fontSize = 13.0}) {
    return Column(
      crossAxisAlignment: crossAxisAlignment!,
      children: <Widget>[
        Text(
          title,
          style: textStyle.custom(
              fontWeight: FontWeight.w600, size: 10.0, color: color),
        ),
        Text(
          value,
          style: textStyle.custom(
              fontWeight: FontWeight.w700, size: fontSize, color: colorValue),
        ),
      ],
    );
  }

  @override
  PortfolioController? putController() {
    return PortfolioController();
  }
}
