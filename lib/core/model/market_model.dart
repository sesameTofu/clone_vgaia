import 'package:flutter_mobile/core/model/match_data_index_model.dart';
import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/core_support/enum/core_enum_helper.dart';
import 'package:flutter_mobile/extensions/extension.dart';

class MarketModel {
  MarketModel({
    this.index,
    this.state,
    this.totalTrade,
    this.totalAmt,
    this.totalQty,
    this.totalTradePt,
    this.totalAmtPt,
    this.totalQtyPt,
    this.marketIndex,
    this.changeIndex,
    this.changeIndexPercent,
    this.openIndex,
    this.highestIndex,
    this.lowestIndex,
    this.advances,
    this.noChange,
    this.declenes,
    this.floor,
    this.ceiling,
    this.totalBuy,
    this.totalSell,
    this.totalBuyForeignQty,
    this.totalSellForeignQty,
    this.totalBuyForeignAmt,
    this.totalSellForeignAmt,
    this.colorCode,
    this.marketMatchData,
    this.dataWithApi,
  });
  factory MarketModel.fromFiled(Map<Field, dynamic> mapFiled) {
    try {
      return MarketModel(
          colorCode: mapFiled[Field.COLOR_CODE] is num?
              ? mapFiled[Field.COLOR_CODE] as num?
              : ((mapFiled[Field.COLOR_CODE] as String?) ?? '')
                  .formatNumber()
                  .hashCode,
          dataWithApi: true,
          index: mapFiled[Field.INDEX],
          state: mapFiled[Field.MARKET_STATE],
          // totalTrade: e.totalTrade,
          totalAmt: mapFiled[Field.MARKET_TOTAL_AMT],
          totalQty: mapFiled[Field.MARKET_TOTAL_QTTY],
          // totalTradePt: e.totalTradePt,
          // totalAmtPt: e.totalAmtPt,
          // totalQtyPt: e.totalQtyPt,
          marketIndex: mapFiled[Field.MARKET_MARKET_INDEX],
          changeIndex: mapFiled[Field.MARKET_CHANGE_INDEX],
          changeIndexPercent: mapFiled[Field.MARKET_CHANGE_INDEX_PERCENT],
          openIndex: mapFiled[Field.MARKET_OPEN_INDEX],
          highestIndex: mapFiled[Field.MARKET_HIGHEST_INDEX],
          lowestIndex: mapFiled[Field.MARKET_LOWEST_INDEX],
          advances: mapFiled[Field.MARKET_ADVANCES],
          noChange: mapFiled[Field.MARKET_NO_CHANGE],
          declenes: mapFiled[Field.MARKET_DECLENES],
          marketMatchData: mapFiled[Field.MARKET_MATH_DATA],
          // floor: e.floor,
          // ceiling: e.ceiling,
          // totalBuy: e.totalBuy,
          // totalSell: e.totalSell,
          // totalBuyForeignQty: e.totalBuyForeignQty,
          // totalSellForeignQty: e.totalSellForeignQty,
          totalBuyForeignAmt: mapFiled[Field.MARKET_TOTAL_BUY_FOREIGN_AMT],
          totalSellForeignAmt: mapFiled[Field.MARKET_TOTAL_BUY_FOREIGN_QTTY]);
    } catch (ee) {
      return MarketModel();
    }
  }

  MarketModel copyWith(MarketModel? value) {
    return MarketModel(
        dataWithApi: value?.dataWithApi ?? dataWithApi,
        colorCode: value?.colorCode ?? colorCode,
        index: value?.index ?? index,
        state: value?.state != null
            ? CoreEnumHelper.getMarketSession(value?.state?.name)
            : CoreEnumHelper.getMarketSession(state?.name),
        // totalTrade: e.totalTrade,
        totalAmt: value?.totalAmt ?? totalAmt,
        totalQty: value?.totalQty ?? totalQty,
        // totalTradePt: e.totalTradePt,
        // totalAmtPt: e.totalAmtPt,
        // totalQtyPt: e.totalQtyPt,
        marketIndex: value?.marketIndex ?? marketIndex,
        changeIndex: value?.changeIndex ?? changeIndex,
        changeIndexPercent: value?.changeIndexPercent ?? changeIndexPercent,
        openIndex: value?.openIndex ?? openIndex,
        highestIndex: value?.highestIndex,
        lowestIndex: value?.lowestIndex,
        advances: value?.advances,
        noChange: value?.noChange,
        declenes: value?.declenes ?? declenes,
        marketMatchData: value?.marketMatchData ?? marketMatchData,
        // floor: e.floor,
        // ceiling: e.ceiling,
        // totalBuy: e.totalBuy,
        // totalSell: e.totalSell,
        // totalBuyForeignQty: e.totalBuyForeignQty,
        // totalSellForeignQty: e.totalSellForeignQty,
        totalBuyForeignAmt: value?.totalBuyForeignAmt,
        totalSellForeignAmt: value?.totalSellForeignAmt);
  }

  Map<Field, dynamic> toFiledMarket() => <Field, dynamic>{
        Field.INDEX: index,
        Field.MARKET_STATE: state,
        Field.MARKET_TOTAL_TRADE: totalTrade,
        Field.MARKET_TOTAL_AMT: totalAmt,
        Field.MARKET_TOTAL_QTTY: totalQty,
        Field.MARKET_MARKET_INDEX: marketIndex,
        Field.MARKET_TOTAL_TRADE_PT: totalTradePt,
        Field.MARKET_TOTAL_AMT_PT: totalAmtPt,
        Field.MARKET_TOTAL_QTTY_PT: totalQtyPt,
        Field.MARKET_CHANGE_INDEX: changeIndex,
        Field.MARKET_CHANGE_INDEX_PERCENT: changeIndexPercent,
        Field.MARKET_OPEN_INDEX: openIndex,
        Field.MARKET_HIGHEST_INDEX: highestIndex,
        Field.MARKET_LOWEST_INDEX: lowestIndex,
        Field.MARKET_ADVANCES: advances,
        Field.MARKET_NO_CHANGE: noChange,
        Field.MARKET_DECLENES: declenes,
        Field.MARKET_FLOOR: floor,
        Field.MARKET_CEILING: ceiling,
        Field.MARKET_TOTAL_BUY: totalBuy,
        Field.MARKET_TOTAL_SELL: totalSell,
        Field.MARKET_TOTAL_BUY_FOREIGN_QTTY: totalBuyForeignQty,
        Field.MARKET_TOTAL_SELL_FOREIGN_QTTY: totalSellForeignQty,
        Field.MARKET_TOTAL_BUY_FOREIGN_AMT: totalBuyForeignAmt,
        Field.MARKET_TOTAL_SELL_FOREIGN_AMT: totalSellForeignAmt,
        Field.COLOR_CODE: colorCode,
        Field.MARKET_MATH_DATA: marketMatchData,
        Field.STOCK_WITH_API_DETAIL: true,
      };

  Index? index;
  MarketStatusSession? state;
  num? totalTrade;
  num? totalAmt;
  num? totalQty;
  num? totalTradePt;
  num? totalAmtPt;
  num? totalQtyPt;
  num? marketIndex;
  num? changeIndex;
  num? changeIndexPercent;
  num? openIndex;
  num? highestIndex;
  num? lowestIndex;
  num? advances;
  num? noChange;
  num? declenes;
  num? floor;
  num? ceiling;
  num? totalBuy;
  num? totalSell;
  num? totalBuyForeignQty;
  num? totalSellForeignQty;
  num? totalBuyForeignAmt;
  num? totalSellForeignAmt;
  num? colorCode;
  List<MatchDataIndexModel>? marketMatchData;
  bool? dataWithApi;
}
