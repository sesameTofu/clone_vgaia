import 'package:flutter_mobile/core_support/enum/core_enum.dart';

class CoreEnumHelper {
  static MarketStatusSessionWithIndex getMarketSessionWithIndex(
      String? status, String? tradeplace) {
    switch (status?.toUpperCase()) {
      // HOSE
      case 'P':
        return MarketStatusSessionWithIndex.ATO_HSX;
      case 'O':
        return MarketStatusSessionWithIndex.OPEN_HSX;
      case 'A':
        return MarketStatusSessionWithIndex.ATC_HSX;
      case 'C':
        return MarketStatusSessionWithIndex.RUNOFF_HSX;
      case 'I':
        return MarketStatusSessionWithIndex.BREAK_HSX;
      case 'J':
        return MarketStatusSessionWithIndex.BEFORE_HSX;
      case 'K':
        return MarketStatusSessionWithIndex.BEFORE_HSX;
      // HNX
      case '90':
        return MarketStatusSessionWithIndex.BEFORE_HNX;
      case '1_CONT':
        return MarketStatusSessionWithIndex.OPEN_HNX;
      case '2_CONT':
        return MarketStatusSessionWithIndex.BREAK_HNX;
      case '1_CLOSE':
        return MarketStatusSessionWithIndex.ATC_HNX;
      case '1_PCLOSE':
        return MarketStatusSessionWithIndex.RUNOFF_HNX;
      case '97':
        if (tradeplace == '005') {
          return MarketStatusSessionWithIndex.CLOSED_UPCOM;
        } else {
          return MarketStatusSessionWithIndex.CLOSED_HNX;
        }
      // UpCom
      case '1_CONTUP':
        return MarketStatusSessionWithIndex.OPEN_UPCOM;
      case '2_CONTUP':
        return MarketStatusSessionWithIndex.BREAK_UPCOM;
      default:
        return MarketStatusSessionWithIndex.NONE;
    }
  }

  static MarketStatusSession getMarketSession(String? status) {
    switch (status?.toUpperCase()) {
      case 'S':
        return MarketStatusSession.S;
      case 'P':
        return MarketStatusSession.P;
      case 'O':
        return MarketStatusSession.O;
      case 'A':
        return MarketStatusSession.A;
      case 'C':
        return MarketStatusSession.C;
      case 'I':
        return MarketStatusSession.I;
      case 'K':
        return MarketStatusSession.K;
      case 'G':
        return MarketStatusSession.G;
      case 'J':
        return MarketStatusSession.J;
      case 'Z':
        return MarketStatusSession.Z;
      default:
        return MarketStatusSession.NONE;
    }
  }

  static Index getIndex(num? value) {
    switch (value) {
      case 100:
        return Index.HOSE;
      case 200:
        return Index.HNX;
      case 101:
        return Index.VN30;
      case 300:
        return Index.UPCOM;
      case 201:
        return Index.HNX30;
      default:
        return Index.NONE;
    }
  }

  static SecType getSecType(num? type) {
    switch (type) {
      case 1:
        return SecType.S;
      case 2:
        return SecType.U;
      case 3:
        return SecType.D;
      case 4:
        return SecType.E;
      case 5:
        return SecType.W;
      case 6:
        return SecType.F;
      case 7:
        return SecType.O;
      default:
        return SecType.NONE;
    }
  }
}
