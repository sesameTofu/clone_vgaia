import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/extensions/extension.dart';

class StockInfoModel {
  StockInfoModel(
      {this.secID,
      this.floorPrice,
      this.ceilingPrice,
      this.basicPrice,
      this.matchPrice,
      this.changePercent,
      this.changePercentNotDay,
      this.changeHighLow,
      this.changePoint,
      this.totalQty,
      this.openPrice,
      this.closePrice,
      this.highestPrice,
      this.lowestPrice,
      this.sellForeignQty,
      this.buyForeignQty,
      this.netForeignQty,
      this.sellForeignAmt,
      this.buyForeignAmt,
      this.netForeignAmt,
      this.currentRoom,
      this.best1BidPriceStr,
      this.best1BidPrice,
      this.best1BidQty,
      this.best2BidPrice,
      this.best2BidQty,
      this.best3BidPrice,
      this.best3BidQty,
      this.best1OfferPriceStr,
      this.best1OfferPrice,
      this.best1OfferQty,
      this.best2OfferPrice,
      this.best2OfferQty,
      this.best3OfferPrice,
      this.best3OfferQty,
      this.dataWithApi,
      this.avgPrice,
      this.turnoverRate,
      this.range,
      this.bookValue,
      this.listedQty,
      this.esp,
      this.pe,
      this.pb,
      this.ps,
      this.marketCap,
      this.netSale,
      this.roa,
      this.roe,
      this.baseSecCdData,
      this.basePrice,
      this.issuerData,
      this.execPrice,
      this.lastTradeDate,
      this.execRatio,
      this.colorCode,
      this.w52Low,
      this.w52Hight,
      this.tradePercent,
      this.totalAmt,
      this.marketStatusSessionWithIndex});

  factory StockInfoModel.fromFiled(Map<Field, dynamic> mapFiled) {
    try {
      return StockInfoModel(
          matchPrice: mapFiled[Field.MATCH_PRICE] as num?,
          changePercent: mapFiled[Field.CHANGE_PERCENT] as num?,
          changePercentNotDay: mapFiled[Field.CHANGE_PERCENT_NOT_DAY] as num?,
          changeHighLow: mapFiled[Field.CHANGE_HIGH_LOW] as num?,
          changePoint: mapFiled[Field.CHANGE_POINT] as num?,
          totalQty: mapFiled[Field.TOTAL_QTTY] as num?,
          ceilingPrice: mapFiled[Field.CEILING_PIRCE],
          basicPrice: mapFiled[Field.BASIC_PRICE],
          floorPrice: mapFiled[Field.FLOOR_PRICE],
          openPrice: mapFiled[Field.OPEN_PRICE] as num?,
          closePrice: mapFiled[Field.CLOSE_PRICE] as num?,
          highestPrice: mapFiled[Field.HIGHEST_PRICE] as num?,
          lowestPrice: mapFiled[Field.LOWEST_PRICE] as num?,
          sellForeignQty: mapFiled[Field.SELL_FOREIGN_QTTY] as num?,
          buyForeignQty: mapFiled[Field.BUY_FOREIGN_QTTY] as num?,
          netForeignQty: mapFiled[Field.NET_FOREIGN_QTY] as num?,
          sellForeignAmt: mapFiled[Field.SELL_FOREIGN_AMT] as num?,
          buyForeignAmt: mapFiled[Field.BUY_FOREIGN_AMT] as num?,
          netForeignAmt: mapFiled[Field.NET_FOREIGN_AMT] as num?,
          currentRoom: mapFiled[Field.CURRENT_ROOM] as num?,
          best1BidPriceStr: mapFiled[Field.BPRICE1STR] as String?,
          best1BidPrice: (mapFiled[Field.BPRICE1] is num?)
              ? mapFiled[Field.BPRICE1] as num?
              : 0,
          best1BidQty: mapFiled[Field.BQTTY1] as num?,
          best2BidPrice: mapFiled[Field.BPRICE2] as num?,
          best2BidQty: mapFiled[Field.BQTTY2] as num?,
          best3BidPrice: mapFiled[Field.BPRICE3] as num?,
          best3BidQty: mapFiled[Field.BQTTY3] as num?,
          best1OfferPriceStr: mapFiled[Field.SPRICE1STR] as String?,
          best1OfferPrice: (mapFiled[Field.SPRICE1] is num?)
              ? mapFiled[Field.SPRICE1] as num?
              : 0,
          best1OfferQty: mapFiled[Field.SQTTY1] as num?,
          best2OfferPrice: mapFiled[Field.SPRICE2] as num?,
          best2OfferQty: mapFiled[Field.SQTTY2] as num?,
          best3OfferPrice: mapFiled[Field.SPRICE3] as num?,
          best3OfferQty: mapFiled[Field.SQTTY3] as num?,
          avgPrice: mapFiled[Field.AVG_PRICE] as num?,
          bookValue: mapFiled[Field.BOOK_VALUE] as num?,
          listedQty: mapFiled[Field.LISTED_QTY] as num?,
          turnoverRate: mapFiled[Field.TURNOVER_RATE] as num?,
          range: mapFiled[Field.RANGE] as num?,
          esp: mapFiled[Field.EPS] as num?,
          pb: mapFiled[Field.PB] as num?,
          pe: mapFiled[Field.PE] as num?,
          ps: mapFiled[Field.PS] as num?,
          marketCap: mapFiled[Field.MARKET_CAP] as num?,
          netSale: mapFiled[Field.NET_SALE] as num?,
          roa: mapFiled[Field.ROA] as num?,
          roe: mapFiled[Field.ROE] as num?,
          lastTradeDate: mapFiled[Field.LAST_TRADE_DATE] as num?,
          execPrice: mapFiled[Field.EXEC_PRICE] as num?,
          issuerData: mapFiled[Field.ISSUER_DATA] as String?,
          basePrice: mapFiled[Field.BASE_PRICE] as num?,
          execRatio: mapFiled[Field.EXEC_RATIO] as String?,
          baseSecCdData: mapFiled[Field.BASE_SECCD_DATA] as String?,
          w52Low: mapFiled[Field.W52_LOW] as num?,
          w52Hight: mapFiled[Field.W52_HIGHT] as num?,
          tradePercent: mapFiled[Field.TRADE_PERCENT] as num?,
          totalAmt: mapFiled[Field.TOTAl_AMT] as num?,
          marketStatusSessionWithIndex: mapFiled[Field.MARKET_SESSION_INDEX]
              as MarketStatusSessionWithIndex?,
          colorCode: mapFiled[Field.COLOR_CODE] is num?
              ? mapFiled[Field.COLOR_CODE] as num?
              : ((mapFiled[Field.COLOR_CODE] as String?) ?? '').formatNumber());
    } catch (ee) {
      return StockInfoModel();
    }
  }

  Map<Field, dynamic> toFiled() => <Field, dynamic>{
        Field.BASIC_PRICE: basicPrice,
        Field.FLOOR_PRICE: floorPrice,
        Field.CEILING_PIRCE: ceilingPrice,
        Field.MATCH_PRICE: matchPrice,
        Field.CHANGE_PERCENT: changePercent,
        Field.CHANGE_PERCENT_NOT_DAY: changePercentNotDay,
        Field.CHANGE_HIGH_LOW: changeHighLow,
        Field.CHANGE_POINT: changePoint,
        Field.TOTAL_QTTY: totalQty,
        Field.OPEN_PRICE: openPrice,
        Field.CLOSE_PRICE: closePrice,
        Field.HIGHEST_PRICE: highestPrice,
        Field.LOWEST_PRICE: lowestPrice,
        Field.SELL_FOREIGN_QTTY: sellForeignQty,
        Field.BUY_FOREIGN_QTTY: buyForeignQty,
        Field.NET_FOREIGN_QTY: netForeignQty,
        Field.SELL_FOREIGN_AMT: sellForeignAmt,
        Field.BUY_FOREIGN_AMT: buyForeignAmt,
        Field.NET_FOREIGN_AMT: netForeignAmt,
        Field.CURRENT_ROOM: currentRoom,
        Field.BPRICE1STR: best1BidPriceStr,
        Field.BPRICE1: best1BidPrice,
        Field.BPRICE2: best2BidPrice,
        Field.BPRICE3: best3BidPrice,
        Field.BQTTY1: best1BidQty,
        Field.BQTTY2: best2BidQty,
        Field.BQTTY3: best3BidQty,
        Field.SPRICE1STR: best1OfferPriceStr,
        Field.SPRICE1: best1OfferPrice,
        Field.SPRICE2: best2OfferPrice,
        Field.SPRICE3: best3OfferPrice,
        Field.SQTTY1: best1OfferQty,
        Field.SQTTY2: best2OfferQty,
        Field.SQTTY3: best3OfferQty,
        Field.AVG_PRICE: avgPrice,
        Field.BOOK_VALUE: bookValue,
        Field.TURNOVER_RATE: turnoverRate,
        Field.LISTED_QTY: listedQty,
        Field.RANGE: range,
        Field.EPS: esp,
        Field.PB: pb,
        Field.PS: ps,
        Field.PE: pe,
        Field.W52_LOW: w52Low,
        Field.W52_HIGHT: w52Hight,
        Field.COLOR_CODE: colorCode,
        Field.MARKET_SESSION_INDEX: marketStatusSessionWithIndex,
        Field.MARKET_CAP: marketCap,
        Field.NET_SALE: netSale,
        Field.ROA: roa,
        Field.ROE: roe,
        Field.TRADE_PERCENT: tradePercent,
        Field.TOTAl_AMT: totalAmt,
        Field.LAST_TRADE_DATE: lastTradeDate,
        Field.EXEC_PRICE: execPrice,
        Field.ISSUER_DATA: issuerData,
        Field.BASE_SECCD_DATA: baseSecCdData,
        Field.BASE_PRICE: basePrice,
        Field.EXEC_RATIO: execRatio,
      };

  StockInfoModel copyWith(StockInfoModel? value) {
    return StockInfoModel(
      dataWithApi: value?.dataWithApi ?? dataWithApi,
      ceilingPrice: value?.ceilingPrice ?? ceilingPrice,
      basicPrice: value?.basicPrice ?? basicPrice,
      floorPrice: value?.floorPrice ?? floorPrice,
      matchPrice: value?.matchPrice ?? matchPrice,
      changePercent: value?.changePercent ?? changePercent,
      changePercentNotDay: value?.changePercentNotDay ?? changePercentNotDay,
      changeHighLow: value?.changeHighLow ?? changeHighLow,
      changePoint: value?.changePoint ?? changePoint,
      totalQty: value?.totalQty ?? totalQty,
      openPrice: value?.openPrice ?? openPrice,
      closePrice: value?.closePrice ?? closePrice,
      highestPrice: value?.highestPrice ?? highestPrice,
      lowestPrice: value?.lowestPrice ?? lowestPrice,
      sellForeignQty: value?.sellForeignQty ?? sellForeignQty,
      buyForeignQty: value?.buyForeignQty ?? buyForeignQty,
      netForeignQty: value?.netForeignQty ?? netForeignQty,
      sellForeignAmt: value?.sellForeignAmt ?? sellForeignAmt,
      buyForeignAmt: value?.buyForeignAmt ?? buyForeignAmt,
      netForeignAmt: value?.netForeignAmt ?? netForeignAmt,
      currentRoom: value?.currentRoom ?? currentRoom,
      best1BidPriceStr: value?.best1BidPriceStr ?? best1BidPriceStr,
      best1BidPrice: value?.best1BidPrice ?? best1BidPrice,
      best1BidQty: value?.best1BidQty ?? best1BidQty,
      best2BidPrice: value?.best2BidPrice ?? best2BidPrice,
      best2BidQty: value?.best2BidQty ?? best2BidQty,
      best3BidPrice: value?.best3BidPrice ?? best3BidPrice,
      best3BidQty: value?.best3BidQty ?? best3BidQty,
      best1OfferPriceStr: value?.best1OfferPriceStr ?? best1OfferPriceStr,
      best1OfferPrice: value?.best1OfferPrice ?? best1OfferPrice,
      best1OfferQty: value?.best1OfferQty ?? best1OfferQty,
      best2OfferPrice: value?.best2OfferPrice ?? best2OfferPrice,
      best2OfferQty: value?.best2OfferQty ?? best2OfferQty,
      best3OfferPrice: value?.best3OfferPrice ?? best3OfferPrice,
      best3OfferQty: value?.best3OfferQty ?? best3OfferQty,
      avgPrice: value?.avgPrice ?? avgPrice,
      bookValue: value?.bookValue ?? bookValue,
      range: value?.range ?? range,
      listedQty: value?.listedQty ?? listedQty,
      esp: value?.esp ?? esp,
      pb: value?.pb ?? pb,
      pe: value?.pe ?? pe,
      ps: value?.ps ?? ps,
      marketCap: value?.marketCap ?? marketCap,
      netSale: value?.netSale ?? netSale,
      roa: value?.roa ?? roa,
      roe: value?.roe ?? roe,
      lastTradeDate: value?.lastTradeDate ?? lastTradeDate,
      execPrice: value?.execPrice ?? execPrice,
      issuerData: value?.issuerData ?? issuerData,
      baseSecCdData: value?.baseSecCdData ?? baseSecCdData,
      basePrice: value?.basePrice ?? basePrice,
      w52Hight: value?.w52Hight ?? w52Hight,
      w52Low: value?.w52Low ?? w52Low,
      tradePercent: value?.tradePercent ?? tradePercent,
      totalAmt: value?.totalAmt ?? totalAmt,
      colorCode: value?.colorCode ?? colorCode,
      marketStatusSessionWithIndex:
          value?.marketStatusSessionWithIndex ?? marketStatusSessionWithIndex,
    );
  }

  final num? floorPrice;

  final num? ceilingPrice;

  final num? basicPrice;

  final num? matchPrice;

  final num? changePercent;

  final num? changePercentNotDay;

  final num? changeHighLow;

  final num? changePoint;

  final num? totalQty;

  final num? openPrice;

  final num? closePrice;

  final num? avgPrice;

  final num? highestPrice;

  final num? lowestPrice;

  final num? sellForeignQty;

  final num? buyForeignQty;

  final num? netForeignQty;

  final num? sellForeignAmt;

  final num? buyForeignAmt;

  final num? netForeignAmt;

  final num? currentRoom;

  String? best1BidPriceStr;

  num? best1BidPrice;

  num? best1BidQty;

  num? best2BidPrice;

  num? best2BidQty;

  num? best3BidPrice;

  num? best3BidQty;

  String? best1OfferPriceStr;

  num? best1OfferPrice;

  num? best1OfferQty;

  num? best2OfferPrice;

  num? best2OfferQty;

  num? best3OfferPrice;

  num? best3OfferQty;

  num? turnoverRate;

  num? range;

  num? bookValue;

  num? listedQty;

  num? esp;

  num? pe;

  num? pb;

  num? ps;

  num? w52Low;

  num? w52Hight;

  num? marketCap;

  num? netSale;

  num? roa;

  num? roe;

  num? tradePercent;

  num? totalAmt;

/*
    call API StockInfor first success == true;
*/
  bool? dataWithApi;

  String? secID;

  num? colorCode;

  MarketStatusSessionWithIndex? marketStatusSessionWithIndex;

  // MÃ CKCS
  String? baseSecCdData;

  // Giá CKCS
  num? basePrice;

  // TCPH
  String? issuerData;

  // GIÁ THỰC HIỆN
  num? execPrice;

  // TL THỰC HIỆN
  String? execRatio;

  // Ngày GD CC : 20221229
  num? lastTradeDate;
}
