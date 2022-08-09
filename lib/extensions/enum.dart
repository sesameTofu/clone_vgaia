import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/global/app_theme.dart';
import 'package:flutter_mobile/import.dart';
import 'package:local_auth/local_auth.dart';

extension EntrustBusinessCodeExtension on EntrustBusinessCode {
  static num valueOf(final EntrustBusinessCode code) {
    switch (code) {
      case EntrustBusinessCode.all:
        return -2;
      case EntrustBusinessCode.owner:
        return -1;
      case EntrustBusinessCode.supper:
        return 0;
      case EntrustBusinessCode.order:
        return 1;
      case EntrustBusinessCode.cash:
        return 2;
      case EntrustBusinessCode.sec:
        return 3;
      case EntrustBusinessCode.payAdvance:
        return 4;
      case EntrustBusinessCode.mortgage:
        return 5;
      case EntrustBusinessCode.inquiry:
        return 6;
      case EntrustBusinessCode.rightExec:
        return 8;
      case EntrustBusinessCode.oddSell:
        return 9;
      case EntrustBusinessCode.advanceDividend:
        return 10;
      case EntrustBusinessCode.margin:
        return 12;
      case EntrustBusinessCode.shortSale:
        return 13;
      case EntrustBusinessCode.banking:
        return 14;
      case EntrustBusinessCode.service:
        return 15;
      case EntrustBusinessCode.oef:
        return 16;
      case EntrustBusinessCode.derivative:
        return 17;
      case EntrustBusinessCode.repo:
        return 18;
      case EntrustBusinessCode.portfolio:
        return 19;
      case EntrustBusinessCode.transferCash:
        return 20;
      case EntrustBusinessCode.transferSec:
        return 21;
      default:
        return 0;
    }
  }
}

extension TradeTypeExtension on TradeType? {
  int value() {
    if (this == TradeType.SELL) {
      return 1;
    } else {
      return 2;
    }
  }

  String title() {
    switch (this) {
      case TradeType.SELL:
        return LocaleKeys.sell.tr;
      case TradeType.BUY:
        return LocaleKeys.buy.tr;

      case TradeType.NONE:
      default:
        return LocaleKeys.place_order.tr;
    }
  }

  String get titleTendency {
    switch (this) {
      case TradeType.BUY:
        return 'Giá mua thấp nhất';
      case TradeType.SELL:
        return 'Giá bán cao nhất';
      default:
        return '';
    }
  }

  String get titleType {
    switch (this) {
      case TradeType.SELL:
        return LocaleKeys.sell.tr.toUpperCase();
      case TradeType.BUY:
        return LocaleKeys.buy.tr.toUpperCase();
      default:
        return '';
    }
  }

  Color color() {
    switch (this) {
      case TradeType.SELL:
        return baseColor.red50;
      case TradeType.BUY:
        return baseColor.green50;
      case TradeType.NONE:
      default:
        return baseColor.background3;
    }
  }

  String titleMaxQuantity() {
    switch (this) {
      case TradeType.SELL:
        return '${LocaleKeys.goline_BanToiDa.tr} : ';

      case TradeType.BUY:
        return '${LocaleKeys.goline_MuaToiDa.tr} : ';

      case TradeType.NONE:
      default:
        return '${LocaleKeys.goline_ToiDa.tr} : ';
    }
  }

  String titleMatch() {
    switch (this) {
      case TradeType.SELL:
        return 'B';
      case TradeType.BUY:
        return 'M';
      case TradeType.NONE:
      default:
        return '';
    }
  }
}

extension OrderConditionTypeExtension on OrderConditionType? {
  int value() {
    switch (this) {
      case OrderConditionType.PriceByValue:
        return 1;
      case OrderConditionType.PriceByPercent:
        return 2;
      case OrderConditionType.SpreadByValue:
        return 3;
      case OrderConditionType.SpreadByPercent:
        return 4;
      default:
        return 0;
    }
  }
}

extension MatMethodExtension on MatMethod? {
  int value() {
    switch (this) {
      case MatMethod.OneTime:
        return 1;
      case MatMethod.MatchEnough:
        return 2;
      default:
        return 1;
    }
  }
}

extension PriceConditionExtension on PriceCondition? {
  String? value() {
    switch (this) {
      case PriceCondition.largerOrEqual:
        return '>=';
      case PriceCondition.lessThanOrEqual:
        return '<=';
      default:
        return null;
    }
  }
}

// extension OrderPriceConditionExtension on OrderPriceCondition? {
//   int value() {
//     switch (this) {
//       case OrderPriceCondition.notCondition:
//         return 1;
//       case OrderPriceCondition.referencePrice:
//         return 2;
//       default:
//         return 1;
//     }
//   }
// }

extension PlaceOrderTypeExtension on PlaceOrderType? {
  ConditionType? conditionType() {
    switch (this) {
      case PlaceOrderType.BeforeDay:
        return ConditionType.TCO;

      case PlaceOrderType.Tendency:
        return ConditionType.TS;

      case PlaceOrderType.TakeProfit:
        return ConditionType.SP;

      case PlaceOrderType.StopLoss:
        return ConditionType.CL;

      case PlaceOrderType.DisputePurchase:
        return ConditionType.PRO;
      case PlaceOrderType.OrderNormal:
      default:
        return null;
    }
  }
}

extension BiometricTypeEx on BiometricType {
  String get path {
    switch (this) {
      case BiometricType.face:
        return AppPath.icFaceId;
      case BiometricType.fingerprint:
        return AppPath.icFingerId;
      case BiometricType.iris:
        return AppPath.icFaceId;
      default:
        return AppPath.icFaceId;
    }
  }
}

extension TypeMoneyTransferEx on TypeMoneyTransfer {
  String get title {
    switch (this) {
      case TypeMoneyTransfer.bankTransfer:
        return LocaleKeys.goline_TransferBank_Title.tr;

      case TypeMoneyTransfer.internalTransfer:
        return LocaleKeys.goline_TransferLocal_Title.tr;
    }
  }
}

extension BusinessCdEx on BusinessCd {
  int get value {
    switch (this) {
      case BusinessCd.None:
        return 0;
      case BusinessCd.Login:
        return 1;
      case BusinessCd.Trading:
        return 2;
      case BusinessCd.Transfer:
        return 3;
      case BusinessCd.Advance:
        return 4;
      case BusinessCd.OddLot:
        return 5;
      case BusinessCd.RegisterToBuy:
        return 6;
      case BusinessCd.Margin:
        return 7;
      case BusinessCd.Deposit:
        return 8;
    }
  }
}

extension TypePinEx on PinType {
  int get value {
    switch (this) {
      case PinType.None:
        return 0;
      case PinType.Password:
        return 1;
      case PinType.Matrix:
        return 2;
      case PinType.Otp:
        return 3;
      case PinType.Token:
        return 4;
      case PinType.CA:
        return 5;
      case PinType.SmartOtp:
        return 6;
      default:
        return 4;
    }
  }
}

extension EnumErrorPlaceOrderEx on EnumErrorPlaceOrder {
  String title() {
    switch (this) {
      case EnumErrorPlaceOrder.errorStock:
        return LocaleKeys.symbol_is_empty_err.tr;
      case EnumErrorPlaceOrder.errorInforStock:
        return LocaleKeys.not_get_code_information.tr;
      case EnumErrorPlaceOrder.errorAccount:
        return LocaleKeys.not_selected_an_account.tr;
      case EnumErrorPlaceOrder.errorInforAccount:
        return LocaleKeys.not_get_code_account_infor.tr;
      case EnumErrorPlaceOrder.errorTradeType:
        return LocaleKeys.not_select_tradding.tr;
      case EnumErrorPlaceOrder.errorPrice:
        return LocaleKeys.input_price_is_empty_err.tr;
      case EnumErrorPlaceOrder.errorPriceLessThanFloorPrice:
        return LocaleKeys.price_less_than_floor_price_err.tr;
      case EnumErrorPlaceOrder.errorPriceGreaterThanCeilingPrice:
        return LocaleKeys.price_greater_than_celling_price_err.tr;
      case EnumErrorPlaceOrder.errorRoundPrice:
        return LocaleKeys.step_error.tr;
      case EnumErrorPlaceOrder.errorVolume:
        return LocaleKeys.input_volume_is_empty_err.tr;
      case EnumErrorPlaceOrder.errorVolumeZerro:
        return LocaleKeys.edit_qty_greater_than_zero.tr;
      case EnumErrorPlaceOrder.errorRoundVolume:
        return LocaleKeys.require_quantity_hastc_and_upcom.tr;
      case EnumErrorPlaceOrder.errorRoundVolumeRequestLO:
        return LocaleKeys.odd_lot_with_lo.tr;
      case EnumErrorPlaceOrder.errorRoundStepVolume:
        return LocaleKeys.require_step_quantity_hastc_and_upcom.tr;
      case EnumErrorPlaceOrder.errorMaxTotalQuantity:
        return LocaleKeys.mass_greater_than_max_fal_quanlity_err.tr;
      case EnumErrorPlaceOrder.errorTradeTypeBuy:
        return LocaleKeys.goline_KhongHoTroLenhMua.tr;
      case EnumErrorPlaceOrder.errorBasicPrice:
        return LocaleKeys.goline_ChuaNhapGiaThamChieu.tr;
      case EnumErrorPlaceOrder.errorSpreadValue:
        return LocaleKeys.goline_GiaTriKhoangDungKhongHopLe.tr;
      case EnumErrorPlaceOrder.errorActivePrice:
        return LocaleKeys.goline_ActivePriceInvalid.tr;
      case EnumErrorPlaceOrder.errorOrderPrice:
        return LocaleKeys.goline_PriceIsInvalid.tr;
      case EnumErrorPlaceOrder.errorCannotPrePareOrder:
        return LocaleKeys.error_prepare_order.tr;
      case EnumErrorPlaceOrder.errorApi:
        return LocaleKeys.msg_something_happened.tr;
      case EnumErrorPlaceOrder.errorBuyingPow:
        return LocaleKeys.errorBuyingPow.tr;
      case EnumErrorPlaceOrder.errorTimeOrder:
        return LocaleKeys.errorTimeOrder.tr;
      case EnumErrorPlaceOrder.errorSessionOrder:
        return LocaleKeys.errorSessionOrder.tr;
      case EnumErrorPlaceOrder.errorSessionClose:
        return LocaleKeys.errorSessionClose.tr;
      case EnumErrorPlaceOrder.errorTimeOrderPrice:
        return LocaleKeys.error_time_order_price.tr;
      case EnumErrorPlaceOrder.errorMaxVolumeHose:
        return LocaleKeys.order_volume_max_hose.tr;
      case EnumErrorPlaceOrder.errorMaxVolume:
        return LocaleKeys.order_volume_max.tr;

      default:
        return '';
    }
  }
}

extension OrderConditionExt on PlaceOrderType {
  String get title {
    switch (this) {
      case PlaceOrderType.OrderNormal:
        return LocaleKeys.order_normal.tr;
      case PlaceOrderType.BeforeDay:
        return LocaleKeys.goline_TradingBeforeDate.tr;
      case PlaceOrderType.Tendency:
        return LocaleKeys.goline_TradingTrendOrder.tr;
      case PlaceOrderType.TakeProfit:
        return LocaleKeys.goline_TradingProfitOrder.tr;
      case PlaceOrderType.StopLoss:
        return LocaleKeys.goline_TradingStopLossOrder.tr;
      case PlaceOrderType.DisputePurchase:
        return LocaleKeys.goline_TradingSaleOrder.tr;
    }
  }
}

extension ModeEX on Mode {
  Mode get togger => this == Mode.BASIC ? Mode.ADVANCE : Mode.BASIC;

  int get position => this == Mode.BASIC ? 1 : 0;
}

extension ForgeinTradeTypeExtension on ForgeinTradeType {
  int get value {
    switch (this) {
      case ForgeinTradeType.salePrice:
        return 1;

      case ForgeinTradeType.buyPrice:
        return 2;

      case ForgeinTradeType.buyQuantity:
        return 3;

      case ForgeinTradeType.saleQuantity:
        return 4;

      case ForgeinTradeType.valueBuy:
        return 5;

      case ForgeinTradeType.valueSale:
        return 6;
      case ForgeinTradeType.all:
      default:
        return 0;
    }
  }

  String get stringValue {
    switch (this) {
      case ForgeinTradeType.buyPrice:
        return LocaleKeys.top_foreign_net_buy_values.tr;

      case ForgeinTradeType.salePrice:
        return LocaleKeys.top_foreign_net_sell_values.tr;

      case ForgeinTradeType.buyQuantity:
        return LocaleKeys.top_foreign_buy.tr;

      case ForgeinTradeType.saleQuantity:
        return LocaleKeys.top_foreign_sell.tr;

      case ForgeinTradeType.valueBuy:
        return LocaleKeys.top_foreign_buy_values.tr;

      case ForgeinTradeType.valueSale:
        return LocaleKeys.top_foreign_sell_values.tr;
      case ForgeinTradeType.all:
      default:
        return LocaleKeys.total_mass.tr;
    }
  }
}

extension IndexExtension on Index {
  int marketCd() {
    switch (this) {
      case Index.HOSE:
        return 100;
      case Index.HNX:
        return 200;
      case Index.UPCOM:
        return 300;
      case Index.VN30:
        return 101;
      case Index.HNX30:
        return 100;
      case Index.DER:
        return 100;
      case Index.NONE:
        return 100;
    }
  }

  String marketStr() {
    switch (this) {
      case Index.HOSE:
        return 'HOSE';
      case Index.HNX:
        return 'HNX';
      case Index.UPCOM:
        return 'UPCOM';
      case Index.VN30:
        return 'VN30';
      case Index.HNX30:
        return 'HNX30';
      case Index.DER:
        return 'DER';
      case Index.NONE:
        return '';
    }
  }

  String indexStr() {
    switch (this) {
      case Index.HOSE:
        return 'VNIndex';
      case Index.HNX:
        return 'HNXIndex';
      case Index.UPCOM:
        return 'UPCOMIndex';
      case Index.VN30:
        return 'VN30Index';
      case Index.HNX30:
        return 'HNX30Index';
      case Index.DER:
        return 'DER';
      case Index.NONE:
        return '';
    }
  }
}

extension ExSortType on SortType {
  int get getOrderFieldTypeByEnum {
    switch (this) {
      case SortType.symbol:
        return 1;
      case SortType.price:
        return 2;
      case SortType.change:
        return 3;
      case SortType.marketCap:
        return 4;
      case SortType.pb:
        return 5;
      case SortType.pe:
        return 6;
      case SortType.netMag:
        return 7;
      case SortType.roe:
        return 8;
      case SortType.roa:
        return 9;
      case SortType.eps:
        return 10;
      default:
        return 3;
    }
  }
}

extension ExSortState on SortState {
  int get getOderTypeByEnum {
    switch (this) {
      case SortState.down:
        return 2;
      case SortState.up:
        return 1;
      case SortState.none:
      default:
        return 3;
    }
  }
}

extension MarketStatusTitle on MarketStatusSession {
  String get title {
    switch (this) {
      case MarketStatusSession.NONE:
        return LocaleKeys.no_session.tr;
      case MarketStatusSession.S:
        return LocaleKeys.before_transaction.tr;
      case MarketStatusSession.P:
        return LocaleKeys.match_open.tr;
      case MarketStatusSession.O:
        return LocaleKeys.match_continuous.tr;
      case MarketStatusSession.A:
        return LocaleKeys.match_close.tr;
      case MarketStatusSession.C:
        return LocaleKeys.deal.tr;
      case MarketStatusSession.I:
        return LocaleKeys.stop_session.tr;
      case MarketStatusSession.K:
      case MarketStatusSession.G:
      case MarketStatusSession.J:
      case MarketStatusSession.Z:
        return LocaleKeys.closed.tr;
    }
  }

  List<String> quickOrderList({required Index? index}) {
    switch (this) {
      // HNX
      case MarketStatusSession.S:
        if (index == Index.HOSE) {
          return <String>['LO', 'ATO', 'ATC'];
        }
        if (index == Index.HNX) {
          return <String>['LO', 'ATC', 'PLO'];
        }
        return <String>['LO'];

      case MarketStatusSession.P:
        if (index == Index.HOSE) {
          return <String>['ATO', 'LO', 'ATC', 'MP'];
        }
        return <String>[];

      case MarketStatusSession.O:
        if (index == Index.HOSE) {
          return <String>['ATC', 'MP', 'LO'];
        }
        if (index == Index.HNX) {
          return <String>['MTL', 'MAK', 'MOK', 'ATC', 'PLO', 'LO'];
        }
        return <String>['LO'];
      case MarketStatusSession.A:
      case MarketStatusSession.C:
        if (index == Index.HOSE) {
          return <String>['LO', 'ATC'];
        }
        if (index == Index.HNX) {
          return <String>['ATC', 'LO', 'PLO'];
        }
        return <String>[];
      case MarketStatusSession.I:
        if (index == Index.HOSE) {
          return <String>['LO', 'ATC'];
        }
        if (index == Index.HNX) {
          return <String>['MTL', 'MAK', 'MOK', 'ATC', 'PLO', 'LO'];
        }
        return <String>['LO'];

      case MarketStatusSession.K:
      case MarketStatusSession.G:
      case MarketStatusSession.J:
      case MarketStatusSession.Z:
      case MarketStatusSession.NONE:
        return <String>[];
    }
  }
}

extension ExTypeNotification on TypeNotification {
  int get toIndex {
    switch (this) {
      case TypeNotification.ORDER:
        return 1;

      case TypeNotification.SUPPORT:
        return 2;

      case TypeNotification.SUGGESTION:
        return 3;

      case TypeNotification.NOTIFY:
        return 99;

      default:
        return 0;
    }
  }
}

extension TypePageAssetExt on TypePageAsset {
  String get title {
    switch (this) {
      case TypePageAsset.portfolio:
        return 'Tài sản';
      case TypePageAsset.profit:
        return 'Lãi lỗ';
    }
  }
}

extension OrderConditionalStatusValue on OrderConditionStatus {
  String get title {
    switch (this) {
      case OrderConditionStatus.effect:
        return LocaleKeys.order_book_effect.tr;
      case OrderConditionStatus.end:
        return LocaleKeys.goline_DaKetThuc.tr;
      case OrderConditionStatus.endEffect:
        return LocaleKeys.goline_HetHieuLuc.tr;
      case OrderConditionStatus.cancelled:
        return LocaleKeys.goline_Cancel.tr;
      case OrderConditionStatus.all:
      default:
        return LocaleKeys.goline_Status.tr;
    }
  }

  int get value {
    switch (this) {
      case OrderConditionStatus.effect:
        return 1;
      case OrderConditionStatus.end:
        return 2;
      case OrderConditionStatus.endEffect:
        return 3;
      case OrderConditionStatus.cancelled:
        return 9;
      case OrderConditionStatus.all:
      default:
        return 0;
    }
  }
}

extension OrderDiaryStatusDetail on DerOrderNorStatus {
  String get title {
    switch (this) {
      case DerOrderNorStatus.intoTheSys:
        return LocaleKeys.into_the_sys.tr;
      case DerOrderNorStatus.waitMatch:
        return LocaleKeys.goline_ChoKhop.tr;
      case DerOrderNorStatus.parMatch:
        return LocaleKeys.goline_KhopMotPhan.tr;
      case DerOrderNorStatus.match:
        return LocaleKeys.match_all.tr;
      case DerOrderNorStatus.cancel:
        return LocaleKeys.reject.tr;
      case DerOrderNorStatus.parCancel:
        return LocaleKeys.goline_HuyMotPhan.tr;
      case DerOrderNorStatus.cancelAll:
        return LocaleKeys.cancel_all.tr;
      case DerOrderNorStatus.rejectStock:
        return LocaleKeys.reject_by_stock.tr;
      case DerOrderNorStatus.all:
      default:
        return LocaleKeys.goline_Status.tr;
    }
  }

  int get value {
    switch (this) {
      case DerOrderNorStatus.cancel:
        return 1;
      case DerOrderNorStatus.intoTheSys:
        return 2;
      case DerOrderNorStatus.waitMatch:
        return 3;
      case DerOrderNorStatus.parMatch:
        return 4;
      case DerOrderNorStatus.match:
        return 5;
      case DerOrderNorStatus.parCancel:
        return 6;
      case DerOrderNorStatus.cancelAll:
        return 7;
      case DerOrderNorStatus.rejectStock:
        return 8;
      case DerOrderNorStatus.all:
      default:
        return 0;
    }
  }
}

extension OrderPreStatusValue on EnumOrderPreStatus {
  String get title {
    switch (this) {
      case EnumOrderPreStatus.pending:
        return LocaleKeys.goline_ChuaDuyet.tr;
      case EnumOrderPreStatus.approved:
        return LocaleKeys.goline_DaDuyet.tr;
      case EnumOrderPreStatus.cancelled:
        return LocaleKeys.bond_cancelled.tr;
      case EnumOrderPreStatus.all:
      default:
        return LocaleKeys.goline_Status.tr;
    }
  }

  String get value {
    switch (this) {
      case EnumOrderPreStatus.pending:
        return 'P';
      case EnumOrderPreStatus.approved:
        return 'A';
      case EnumOrderPreStatus.cancelled:
        return 'X';
      case EnumOrderPreStatus.all:
      default:
        return '';
    }
  }
}

extension TitleType on OrderListType {
  String get title {
    switch (this) {
      case OrderListType.diary:
        return LocaleKeys.order_diary.tr;
      case OrderListType.preMarket:
        return LocaleKeys.trading_page_pre_market.tr;
      case OrderListType.conditional:
        return LocaleKeys.trading_page_conditional.tr;
      default:
        return LocaleKeys.order_diary.tr;
    }
  }
}

extension TypePageOrderEx on TypePageOrder {
  String get title {
    switch (this) {
      case TypePageOrder.PlaceOrder:
        return LocaleKeys.trading.tr;
      case TypePageOrder.OrderDiary:
        return LocaleKeys.order_diary.tr;
    }
  }
}

extension SecTypeEx on SecType? {
  int get type {
    switch (this) {
      case SecType.S:
        return 1;
      case SecType.U:
        return 2;
      case SecType.D:
        return 3;
      case SecType.E:
        return 4;
      case SecType.W:
        return 5;
      case SecType.F:
        return 6;
      case SecType.O:
        return 7;
      default:
        return -1;
    }
  }
}

extension HistoryStatus on StockTransferStatus {
  Color get colorBackground {
    switch (this) {
      case StockTransferStatus.approved:
        return baseColor.green60;
      case StockTransferStatus.cancelled:
        return baseColor.red60;
      case StockTransferStatus.pending:
        return baseColor.yellow60;
    }
  }

  Color get colorText {
    switch (this) {
      case StockTransferStatus.approved:
        return baseColor.green20;
      case StockTransferStatus.cancelled:
        return baseColor.red20;
      case StockTransferStatus.pending:
        return baseColor.yellow20;
    }
  }

  String get title {
    switch (this) {
      case StockTransferStatus.approved:
        return 'ĐÃ XỬ LÝ';
      case StockTransferStatus.cancelled:
        return 'ĐÃ HUỶ';
      case StockTransferStatus.pending:
        return 'CHỜ XỬ LÝ';
    }
  }
}
