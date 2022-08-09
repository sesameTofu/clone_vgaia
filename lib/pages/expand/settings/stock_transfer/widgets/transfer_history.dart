import 'package:flutter_mobile/base/base_page.dart';
import 'package:flutter_mobile/domain/model/stock_transfer/stock_transfer_model.dart';
import 'package:flutter_mobile/extensions/extension.dart';
import 'package:flutter_mobile/generated/locales.g.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/pages/expand/settings/stock_transfer/pages/stock_transfer_request_page.dart';
import 'package:flutter_mobile/pages/expand/settings/stock_transfer/stock_transfer_controller.dart';
import 'package:flutter_mobile/widgets/smart_load_list.dart';

class TransferHistory extends BaseScreen<StockTransferController>
    with SmartLoadList {
  TransferHistory({Key? key}) : super(key: key);

  @override
  StockTransferController? putController() => StockTransferController();

  @override
  Widget builder() => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitle,
            _buildBody,
          ],
        ),
      );
  Widget get _buildTitle => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(LocaleKeys.stock_transfer_list_bank_trans.tr,
            style: textStyle.medium(color: color.grey20)),
      );
  Widget get _buildBody => Expanded(child: Obx(() {
        return Stack(alignment: Alignment.bottomCenter, children: <Widget>[
          buildSmartList(),
          _buildCreateRequest(),
        ]);
      }));
  Widget _buildItemData(StockTransferModel data) => Container(
        height: 120.0,
        decoration: BoxDecoration(
            color: color.background2,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildText(LocaleKeys.stock_transfer_transfer_from.tr + ':  ',
                    data.subAccoNoFrom ?? ''),
                _buildText(LocaleKeys.stock_transfer_transfer_to.tr + ':  ',
                    data.subAccoNoTo ?? ''),
                _buildText(LocaleKeys.stock_transfer_code.tr + ':  ',
                    data.secCd ?? ''),
                _buildText(data.timeStamp ?? '', ''),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(data.quantity?.formatPrice(decimalDigits: 0) ?? '',
                    style: textStyle.bold(size: 15.0, color: color.branding)),
                _buildStatus(controller.convertStatusToText(data)),
              ],
            )
          ],
        ),
      );

  Widget _buildText(String title, String content) => Text.rich(
        TextSpan(
            text: title,
            children: <TextSpan>[
              TextSpan(
                  text: content, style: textStyle.medium(color: color.grey0))
            ],
            style: textStyle.regular(color: color.grey20)),
      );

  Widget _buildStatus(StockTransferStatus status) => Container(
        padding: EdgeInsets.all(4.0),
        width: 80,
        decoration: BoxDecoration(
            color: status.colorBackground,
            borderRadius: BorderRadius.all(Radius.circular(4.0))),
        child: Center(
          child: Text(
            status.title,
            style: textStyle.semiBold(size: 10, color: status.colorText),
          ),
        ),
      );

  Widget _buildCreateRequest() => GestureDetector(
        onTap: () {
          Get.to(() => StockTransferRequestPage());
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            height: 40,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: color.branding,
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
            child: Text(
              LocaleKeys.bond_transfer_create_request.tr.toUpperCase(),
              style: textStyle.semiBold(size: 13, color: color.grey0),
            ),
          ),
        ),
      );

  @override
  Widget get listViewLoad => ListView.separated(
      itemBuilder: (BuildContext context, int index) =>
          _buildItemData(controller.listHistoryTransfer.value[index]),
      separatorBuilder: (BuildContext context, int index) => SizedBox(
            height: 12.0,
          ),
      itemCount: controller.listHistoryTransfer.value.length);
}
