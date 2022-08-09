import 'dart:typed_data';

import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/core_support/enum/core_enum_helper.dart';
import 'package:flutter_mobile/domain/model/grpc/auto_trading.pb.dart';
import 'package:flutter_mobile/global/enum_helper.dart';
import 'package:flutter_mobile/import.dart';

class SocketDataModel {
  Map<Field, dynamic> converData(Uint8List rawInputStringData) {
    final AnyMessage any = AnyMessage.fromBuffer(rawInputStringData);
    if (any.typeUrl.contains('TopPrice')) {
      final TopPrice topPrice = TopPrice.fromBuffer(any.value);
      // AppLog.log.info(topPrice.toString());

      return mapFieldTopPrice(topPrice);
    }
    if (any.typeUrl.contains('LastSale')) {
      final LastSale lastSale = LastSale.fromBuffer(any.value);
      //  AppLog.log.info(lastSale.toString());

      return mapFieldLastPrice(lastSale);
    }

    if (any.typeUrl.contains('ProjectOpen')) {
      final ProjectOpen indexUpdate = ProjectOpen.fromBuffer(any.value);
      // AppLog.log.info(indexUpdate.toString());

      return mapFieldProjectOpen(indexUpdate);
    }

    if (any.typeUrl.contains('ForeignRoom')) {
      final ForeignRoom foreignRoom = ForeignRoom.fromBuffer(any.value);
      //  String.fromCharCodes(any.value);
      // AppLog.log.info(foreignRoom.toString());
      return mapFieldForeignRoom(foreignRoom);
    }
    if (any.typeUrl.contains('IndexUpdate')) {
      final IndexUpdate indexUpdate = IndexUpdate.fromBuffer(any.value);
      //    AppLog.log.info(indexUpdate.toString());

      return mapFieldIndexUpdate(indexUpdate);
    }
    if (any.typeUrl.contains('SystemState')) {
      final SystemState systemState = SystemState.fromBuffer(any.value);

      return <Field, dynamic>{Field.STATE_SEVER: systemState.status};

      //z AppLog.log.info(indexUpdate.toString());
    }

    return <Field, dynamic>{};
  }

  String? secCd;
  Index? indexCd;

  Map<Field, dynamic> mapFieldTopPrice(TopPrice topPrice) {
    final Map<Field, dynamic> map = <Field, dynamic>{};
    if (topPrice.secCd.isNotEmpty) {
      map[Field.SEC_CD] = topPrice.secCd;
    }
    if (topPrice.totalBidQty != 0) {
      map[Field.TOTAL_BID_QTTY] = topPrice.topPriceBid;
    }
    if (topPrice.totalBidQty != 0) {
      map[Field.TOTAL_OFFER_QTTY] = topPrice.topPriceOffer;
    }
    if (topPrice.topPriceBid.isNotEmpty) {
      for (final TopPrice_TopPriceDetail element in topPrice.topPriceBid) {
        if (element.top == 1) {
          if ((element.price).isString) {
            map[Field.BPRICE1STR] = element.price;
          } else {
            map[Field.BPRICE1] = (element.price).formatNumber();
          }

          map[Field.BQTTY1] = element.qty;
        }
        if (element.top == 2) {
          map[Field.BPRICE2] = (element.price).formatNumber();

          map[Field.BQTTY2] = element.qty;
        }
        if (element.top == 3) {
          map[Field.BPRICE3] = (element.price).formatNumber();

          map[Field.BQTTY3] = element.qty;
        }
      }
    }
    if (topPrice.topPriceOffer.isNotEmpty) {
      for (final TopPrice_TopPriceDetail element in topPrice.topPriceOffer) {
        if (element.top == 1) {
          if ((element.price).isString) {
            map[Field.SPRICE1STR] = element.price;
          } else {
            map[Field.SPRICE1] = (element.price).formatNumber();
          }

          map[Field.SQTTY1] = element.qty;
        }
        if (element.top == 2) {
          map[Field.SPRICE2] = (element.price).formatNumber();

          map[Field.SQTTY2] = element.qty;
        }
        if (element.top == 3) {
          map[Field.SPRICE3] = (element.price).formatNumber();

          map[Field.SQTTY3] = element.qty;
        }
      }
    }
    return map;
  }

  Map<Field, dynamic> mapFieldLastPrice(LastSale lastSale) {
    final Map<Field, dynamic> map = <Field, dynamic>{};

    if (lastSale.secCd.isNotEmpty) {
      map[Field.SEC_CD] = lastSale.secCd;
    }

    map[Field.IS_LAST_SALE] = true;

    map[Field.CHANGE_POINT] = lastSale.changePoint;

    map[Field.CHANGE_PERCENT] = lastSale.changePercent;

    map[Field.MATCH_PRICE] = lastSale.lastPrice;

    map[Field.MATCH_TIME] = lastSale.matTime;

    map[Field.MATCH_QTTY] = lastSale.lastQty;

    map[Field.MATCH_AMT] = lastSale.lastAmt;

    map[Field.HIGHEST_PRICE] = lastSale.hightPrice;

    map[Field.LOWEST_PRICE] = lastSale.lowPrice;

    map[Field.AVG_PRICE] = lastSale.avgPrice;

    map[Field.TOTAL_QTTY] = lastSale.totalQty;

    map[Field.TOTAl_AMT] = lastSale.totalAmt;

    map[Field.SIDE] =
        EnumHelper.getTradeType(lastSale.side.data.formatNumber().toInt());

    map[Field.COLOR_CODE] = lastSale.colorCode.value;

    return map;
  }

  Map<Field, dynamic> mapFieldProjectOpen(ProjectOpen lastSale) {
    final Map<Field, dynamic> map = <Field, dynamic>{};

    if (lastSale.secCd.isNotEmpty) {
      map[Field.SEC_CD] = lastSale.secCd;
    }

    map[Field.CHANGE_POINT] = lastSale.changePoint;

    map[Field.CHANGE_PERCENT] = lastSale.changePercent;

    map[Field.MATCH_PRICE] = lastSale.price;

    map[Field.MATCH_QTTY] = lastSale.qty;

    map[Field.COLOR_CODE] = lastSale.colorCode.value;

    return map;
  }

  Map<Field, dynamic> mapFieldForeignRoom(ForeignRoom foreignRoom) {
    final Map<Field, dynamic> map = <Field, dynamic>{};
    if (foreignRoom.secCd.isNotEmpty) {
      map[Field.SEC_CD] = foreignRoom.secCd;
    }
    map[Field.TOTAL_ROOM] = foreignRoom.totalRoom;

    map[Field.CURRENT_ROOM] = foreignRoom.currentRoom;

    map[Field.BUY_FOREIGN_QTTY] = foreignRoom.buyForeignQty;

    map[Field.BUY_FOREIGN_AMT] = foreignRoom.buyForeignAmt;

    map[Field.SELL_FOREIGN_QTTY] = foreignRoom.sellForeignQty;

    map[Field.SELL_FOREIGN_AMT] = foreignRoom.sellForeignAmt;

    return map;
  }

  Map<Field, dynamic> mapFieldIndexUpdate(IndexUpdate indexUpdate) {
    final Map<Field, dynamic> map = <Field, dynamic>{};
    map[Field.INDEX] = CoreEnumHelper.getIndex(indexUpdate.indexCd);
    map[Field.MARKET_UPDATE_TIME] =
        DateTime.fromMillisecondsSinceEpoch(indexUpdate.updTime.toInt());
    map[Field.MARKET_STATE] =
        CoreEnumHelper.getMarketSession(indexUpdate.state.name);
    map[Field.MARKET_TOTAL_TRADE] = indexUpdate.totalTrade;
    map[Field.MARKET_TOTAL_AMT] = indexUpdate.totalAmt;
    map[Field.MARKET_TOTAL_QTTY] = indexUpdate.totalQty;
    //  map[Field.MARKET_TOTAL_TRADE_PT] = indexUpdate.totalQty;
    // map[Field.MARKET_TOTAL_QTTY_PT] = indexUpdate.totalQty;
    map[Field.MARKET_CHANGE_INDEX] = indexUpdate.changeIndex;
    map[Field.MARKET_CHANGE_INDEX_PERCENT] = indexUpdate.changePercent;
    map[Field.MARKET_TOTAL_TRADE] = indexUpdate.totalTrade;
    map[Field.MARKET_OPEN_INDEX] = indexUpdate.openIndex;
    map[Field.MARKET_HIGHEST_INDEX] = indexUpdate.highIndex;
    map[Field.MARKET_LOWEST_INDEX] = indexUpdate.lowIndex;
    map[Field.MARKET_MARKET_INDEX] = indexUpdate.index;
    map[Field.COLOR_CODE] = indexUpdate.colorCode.value;
    //map[Field.MARKET_ADVANCES] = indexUpdate.changeIndex;
    map[Field.MARKET_NO_CHANGE] = indexUpdate.noChange;
    map[Field.MARKET_DECLENES] = indexUpdate.declenes;
    map[Field.MARKET_FLOOR] = indexUpdate.floor;
    map[Field.MARKET_CEILING] = indexUpdate.ceiling;

    // map[Field.MARKET_TOTAL_BUY] = indexUpdate.changeIndex;
    // map[Field.MARKET_TOTAL_SELL] = indexUpdate.changeIndex;
    // map[Field.MARKET_TOTAL_BUY_FOREIGN_QTTY] = indexUpdate.changeIndex;
    // map[Field.MARKET_TOTAL_SELL_FOREIGN_QTTY] = indexUpdate.changeIndex;
    //map[Field.MARKET_TOTAL_BUY_FOREIGN_AMT] = indexUpdate.changeIndex;
    //map[Field.MARKET_TOTAL_SELL_FOREIGN_AMT] = indexUpdate.changeIndex;
    return map;
  }
}
