import 'package:flutter_mobile/core_support/enum/core_enum.dart';
import 'package:flutter_mobile/global/app_enum.dart';
import 'package:flutter_mobile/import.dart';

class EnumHelper {
  static Index getIndex(String? value) {
    switch (value) {
      case '100':
        return Index.HOSE;
      case '200':
        return Index.HNX;
      case '101':
        return Index.VN30;
      case '300':
        return Index.UPCOM;
      default:
        return Index.NONE;
    }
  }

  static num getRestrictionCode(RestrictionCode value) {
    switch (value) {
      case RestrictionCode.orderBuy:
        return 1;
      case RestrictionCode.orderSell:
        return 2;
      case RestrictionCode.payAdvance:
        return 3;
      case RestrictionCode.withDrawCash:
        return 4;
      case RestrictionCode.withDrawSec:
        return 5;
      case RestrictionCode.transferCash:
        return 6;
      case RestrictionCode.finalSettlment:
        return 7;
      case RestrictionCode.mortage:
        return 8;
      default:
        return 0;
    }
  }

  static DataType getDataType(num? type) {
    if (type == 1) {
      return DataType.Order;
    }
    return DataType.PendingOrder;
  }

  static PinType getPinType(num? value) {
    switch (value as int) {
      case 0:
        return PinType.None;
      case 1:
        return PinType.Password;
      case 2:
        return PinType.Matrix;
      case 3:
        return PinType.Otp;
      case 4:
        return PinType.Token;
      case 5:
        return PinType.CA;
      case 6:
        return PinType.SmartOtp;
      default:
        return PinType.CA;
    }
  }

  static TradeType getTradeType(num? value) {
    switch (value) {
      case 1:
        return TradeType.SELL;
      case 2:
      default:
        return TradeType.BUY;
    }
  }

  static OrderConditionStatus? getOrderConditionStatus(num value) {
    switch (value as int) {
      case 1:
        return OrderConditionStatus.effect;
      case 2:
        return OrderConditionStatus.end;
      case 3:
        return OrderConditionStatus.endEffect;
      case 9:
        return OrderConditionStatus.cancelled;
      default:
        return null;
    }
  }

  static num setTradeType(TradeType? tradeType) {
    if (tradeType == TradeType.SELL) {
      return 1;
    } else {
      return 2;
    }
  }

  static String getChanel(num value) {
    switch (value as int) {
      case 1:
        return 'BACK';
      case 2:
        return 'ONLINE';
      case 3:
        return 'Front';
      case 4:
        return 'WAP';
      case 5:
        return 'MOBILE';
      case 6:
        return 'PRO';
      case 7:
        return 'FLOOR';
      case 8:
        return 'SMS';
      case 9:
        return 'TEL';
      default:
        return '---';
    }
  }

  static String getDerNorStatus(num value) {
    switch (value as int) {
      case 1:
        return LocaleKeys.reject.tr;
      case 2:
        return LocaleKeys.into_the_sys.tr;
      case 3:
        return LocaleKeys.goline_ChoKhop.tr;
      case 4:
        return LocaleKeys.goline_KhopMotPhan.tr;
      case 5:
        return LocaleKeys.match_all.tr;
      case 6:
        return LocaleKeys.goline_HuyMotPhan.tr;
      case 7:
        return LocaleKeys.cancel_all.tr;
      case 8:
        return LocaleKeys.reject_by_stock.tr;
      default:
        return '---';
    }
  }

  static DertRequestCondType setDertRequestCondType(String value) {
    switch (value) {
      case 'SO':
        return DertRequestCondType.so;
      case 'CL':
        return DertRequestCondType.cl;
      case 'SP':
        return DertRequestCondType.sp;
      case 'OC':
        return DertRequestCondType.qc;
      case 'BB':
        return DertRequestCondType.bb;
      case 'TS':
        return DertRequestCondType.ts;
      case 'UO':
        return DertRequestCondType.uo;
      case 'DO':
        return DertRequestCondType.down;
      default:
        return DertRequestCondType.non;
    }
  }

  static DertRequestCondStatus setDertRequestCondStatus(num value) {
    switch (value) {
      case 1:
        return DertRequestCondStatus.orderNew;
      case 9:
        return DertRequestCondStatus.orderDeleted;
      default:
        return DertRequestCondStatus.orderNon;
    }
  }

  static String getDertRequestCondType(DertRequestCondType type) {
    switch (type) {
      case DertRequestCondType.so:
        return LocaleKeys.order_stop.tr;
      case DertRequestCondType.cl:
        return LocaleKeys.trading_page_stop_loss.tr;
      case DertRequestCondType.sp:
        return LocaleKeys.trading_page_take_profit.tr;
      case DertRequestCondType.qc:
        return LocaleKeys.trading_page_oco.tr;
      case DertRequestCondType.bb:
        return LocaleKeys.trading_page_bull_bear.tr;
      case DertRequestCondType.ts:
        return LocaleKeys.trading_page_trailing_stop.tr;
      case DertRequestCondType.uo:
        return LocaleKeys.goline_DerCondOrderUpShort.tr;
      case DertRequestCondType.down:
        return LocaleKeys.goline_DerCondOrderDownShort.tr;
      default:
        return '---';
    }
  }
}
