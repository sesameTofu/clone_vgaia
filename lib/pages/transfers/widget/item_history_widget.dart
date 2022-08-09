import 'package:flutter_mobile/domain/model/money_transfer/transfer_bank.dart';
import 'package:flutter_mobile/domain/model/money_transfer/transfer_local_model.dart';
import 'package:flutter_mobile/import.dart';

class ItemDataHistoryWidget extends StatelessWidget with BaseMixin {
  const ItemDataHistoryWidget({Key? key, this.local, this.bank})
      : super(key: key);

  final TransferLocalModel? local;
  final TransferBank? bank;

  @override
  Widget build(BuildContext context) => _buildBody();

  Widget _buildBody() => Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color.background2,
            borderRadius: BorderRadius.circular(10.0)),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _buildData(),
          ),
        ),
      );

  List<Widget> _buildData() {
    if (local != null) {
      return _getListLocalWidget();
    }

    if (bank != null) {
      return _getListBankWidget();
    }
    return <Widget>[Container()];
  }

  List<Widget> _getListLocalWidget() => <Widget>[
        Text(
          local?.alloDate?.formatTimeStampDMMYYYY() ?? '',
          style: textStyle.regular(),
        ),
        buildRowInfo(
          LocaleKeys.goline_TKChuyen.tr,
          local?.fromSubAccoNo ?? '',
        ),
        buildRowInfo(
          LocaleKeys.goline_TKNhan.tr,
          local?.toSubAccoNo ?? '',
        ),
        buildRowInfo(
          LocaleKeys.goline_SoTien.tr,
          local?.amount?.formatPrice(decimalDigits: 0) ?? '',
        ),
        buildRowInfo(
          LocaleKeys.goline_Content.tr,
          local?.remarks ?? '',
        ),
        buildRowInfo(
          LocaleKeys.goline_TrangThai.tr,
          _getStatus(local?.status),
        ),
      ];

  List<Widget> _getListBankWidget() => <Widget>[
        Text(
          bank?.alloDate?.formatDMMYYYY() ?? '',
          style: textStyle.regular(),
        ),
        buildRowInfo(
          LocaleKeys.goline_TKChuyen.tr,
          bank?.bankAccntnumber ?? '',
        ),
        buildRowInfo(
          LocaleKeys.goline_TKNhan.tr,
          bank?.toSubAccoNo ?? '',
        ),
        buildRowInfo(
          LocaleKeys.transfers_account_holder.tr,
          bank?.bankBranchName ?? '',
        ),
        buildRowInfo(
          LocaleKeys.goline_NganHang.tr,
          bank?.bankCd ?? '',
        ),
        buildRowInfo(
          LocaleKeys.goline_TransferBank_BankBranchCd.tr,
          bank?.bankBranchNameDisp ?? '',
        ),
        buildRowInfo(
          LocaleKeys.goline_SoTien.tr,
          bank?.amount?.formatPrice(decimalDigits: 0) ?? '',
        ),
        buildRowInfo(
          LocaleKeys.goline_Content.tr,
          bank?.remarks ?? '',
        ),
        buildRowInfo(
          LocaleKeys.goline_TrangThai.tr,
          _getStatus(bank?.status),
        ),
      ];

  Widget buildRowInfo(String title, String content) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: textStyle.regular(),
            ),
          ),
          Flexible(
            flex: 2,
            child: Text(
              content,
              style: textStyle.regular(),
            ),
          )
        ],
      ),
    );
  }

  String _getStatus(num? status) {
    switch (status) {
      case 0:
        return LocaleKeys.goline_ChuaDuyet.tr;
      case 1:
        return LocaleKeys.goline_DaDuyet.tr;
      case 2:
        return LocaleKeys.goline_NgayKeTiep.tr;
      case 3:
        return LocaleKeys.goline_DaKetThuc.tr;
      case 9:
        return LocaleKeys.goline_DaHuy.tr;
      default:
        return '--';
    }
  }
}
