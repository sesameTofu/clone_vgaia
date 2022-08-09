import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/place_order/information/stock_information_controller.dart';

class StockMoreWidget extends BaseWidget<StockInformationController> {
  StockMoreWidget({Key? key, String? tag}) : super(key: key, tag: tag);

  @override
  Widget builder() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(flex: 3, child: _buildLeft()),
          Expanded(flex: 2, child: _buildRight()),
          Expanded(flex: 2, child: _buildCenter())
        ],
      );

  Widget _buildItem(
    String title,
    String content1, {
    String? content2,
    String seperate = '/',
    CrossAxisAlignment crossAxis = CrossAxisAlignment.start,
  }) {
    final String content =
        '$content1${content2 == null ? '' : '$seperate$content2'}';
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: crossAxis,
        children: <Widget>[
          Text(
            title,
            style: textStyle.regular(color: color.grey40, size: 12),
          ),
          SizedBox(height: 4.0),
          Text(
            content,
            style: textStyle.regular(color: color.grey0, size: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildLeft() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StreamBuilder<num>(
              stream: controller.openPriceStream,
              builder: (_, AsyncSnapshot<num> snapshot) {
                return StreamBuilder<num>(
                    stream: controller.avgPriceStream,
                    builder: (_, AsyncSnapshot<num> snapshot) {
                      return _buildItem(LocaleKeys.openAvg.tr,
                          controller.openPrice.formatPrice(),
                          content2: controller.avgPrice.formatPrice());
                    });
              }),
          StreamBuilder<num>(
              stream: controller.buyForeignStream,
              builder: (_, AsyncSnapshot<num> snapshot) {
                return _buildItem(LocaleKeys.kLNNBuy.tr,
                    controller.buyForeign.formatVolume());
              }),
          _buildItem(LocaleKeys.marketCap.tr, '...'),
          _buildItem(LocaleKeys.shareOutstanding.tr, '...'),
          _buildItem(LocaleKeys.pe.tr, '...'),
          _buildItem(LocaleKeys.bvPs.tr, '...'),
        ],
      );

  Widget _buildRight() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StreamBuilder<num>(
              stream: controller.lowestPriceStream,
              builder: (_, AsyncSnapshot<num> snapshot) {
                return StreamBuilder<num>(
                    stream: controller.highestPriceStream,
                    builder: (_, AsyncSnapshot<num> snapshot) {
                      return _buildItem(
                        LocaleKeys.dayRange.tr,
                        controller.lowestPrice.formatPrice(),
                        content2: controller.highestPrice.formatPrice(),
                        seperate: ' - ',
                      );
                    });
              }),
          StreamBuilder<num>(
              stream: controller.buyForeignStream,
              builder: (_, AsyncSnapshot<num> snapshot) {
                return _buildItem(LocaleKeys.kLNNSell.tr,
                    controller.sellForeign.formatVolume());
              }),
          _buildItem(LocaleKeys.trading_week.tr, '...'),
          _buildItem(LocaleKeys.percentTurnover.tr, '...'),
          _buildItem(LocaleKeys.pb.tr, '...'),
          _buildItem(LocaleKeys.dividend.tr, '...'),
        ],
      );

  Widget _buildCenter() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          StreamBuilder<num>(
              stream: controller.totalTradeQttyStream,
              builder: (_, AsyncSnapshot<num> snapshot) {
                return _buildItem(
                  LocaleKeys.turnover.tr,
                  controller.totalTradeQtty.formatVolume(),
                  crossAxis: CrossAxisAlignment.end,
                );
              }),
          StreamBuilder<num>(
              stream: controller.currentRoomStream,
              builder: (_, AsyncSnapshot<num> snapshot) {
                return _buildItem(
                  LocaleKeys.roomNN.tr,
                  controller.currentRoom.formatVolume(),
                  crossAxis: CrossAxisAlignment.end,
                );
              }),
          _buildItem(LocaleKeys.percentRange.tr, '...',
              crossAxis: CrossAxisAlignment.end),
          _buildItem(LocaleKeys.eps.tr, '...',
              crossAxis: CrossAxisAlignment.end),
          _buildItem(LocaleKeys.ps.tr, '...',
              crossAxis: CrossAxisAlignment.end),
          _buildItem(LocaleKeys.divYield.tr, '...',
              crossAxis: CrossAxisAlignment.end),
        ],
      );
}
