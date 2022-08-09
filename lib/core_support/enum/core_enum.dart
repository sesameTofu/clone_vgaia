// ignore_for_file: constant_identifier_names

enum Field {
  SEC_CD,
  STOCK_WITH_API_DETAIL,
  STOCK_WITH_API_NOT_DETAIL,
  FLOOR_PRICE,
  CEILING_PIRCE,
  BASIC_PRICE,
  MATCH_PRICE,
  TRADE_PERCENT,
  MATCH_QTTY,
  MATCH_AMT,
  MATCH_TIME,
  CHANGE_PERCENT,
  CHANGE_PERCENT_NOT_DAY,
  CHANGE_HIGH_LOW,
  CHANGE_POINT,
  OPEN_PRICE,
  CLOSE_PRICE,
  AVG_PRICE,
  HIGHEST_PRICE,
  LOWEST_PRICE,
  BUY_FOREIGN_QTTY,
  NET_FOREIGN_QTY,
  SELL_FOREIGN_QTTY,
  NET_FOREIGN_AMT,
  BUY_FOREIGN_AMT,
  SELL_FOREIGN_AMT,
  CURRENT_ROOM,
  TOTAL_ROOM,
  TOTAL_QTTY,
  TOTAl_AMT,
  SIDE,
  TOTAL_BID_QTTY,
  TOTAL_OFFER_QTTY,
  BPRICE1,
  BPRICE1STR,
  BQTTY1,
  BPRICE2,
  BQTTY2,
  BPRICE3,
  BQTTY3,
  SPRICE1,
  SPRICE1STR,
  SQTTY1,
  SPRICE2,
  SQTTY2,
  SPRICE3,
  SQTTY3,
  MATH_DATA,
  MATH_DATA_NEW,
  TIME_SALE,
  MATH_DATA_PRICE,
  MARKET_SESSION,
  BOOK_VALUE,
  TURNOVER_RATE,
  RANGE,
  LISTED_QTY,
  EPS,
  PE,
  PB,
  PS,
  W52_LOW,
  W52_HIGHT,
  COLOR_CODE,
  IS_LAST_SALE,
  MARKET_FLOOR,
  MARKET_CEILING,
  MARKET_STATE,
  MARKET_TOTAL_TRADE,
  MARKET_TOTAL_AMT,
  MARKET_TOTAL_QTTY,
  MARKET_TOTAL_TRADE_PT,
  MARKET_TOTAL_AMT_PT,
  MARKET_TOTAL_QTTY_PT,
  MARKET_MARKET_INDEX,
  MARKET_CHANGE_INDEX,
  MARKET_CHANGE_INDEX_PERCENT,
  MARKET_OPEN_INDEX,
  MARKET_HIGHEST_INDEX,
  MARKET_LOWEST_INDEX,
  MARKET_ADVANCES,
  MARKET_NO_CHANGE,
  MARKET_DECLENES,
  MARKET_TOTAL_BUY,
  MARKET_TOTAL_SELL,
  MARKET_TOTAL_BUY_FOREIGN_QTTY,
  MARKET_TOTAL_SELL_FOREIGN_QTTY,
  MARKET_TOTAL_BUY_FOREIGN_AMT,
  MARKET_UPDATE_TIME,
  INDEX,
  MARKET_TOTAL_SELL_FOREIGN_AMT,
  MARKET_SESSION_INDEX,
  MARKET_CAP,
  NET_SALE,
  ROA,
  ROE,
  BASE_SECCD_DATA,
  BASE_PRICE,
  ISSUER_DATA,
  EXEC_PRICE,
  EXEC_RATIO,
  LAST_TRADE_DATE,
  STATE_SEVER,
  MARKET_MATH_DATA,
}

enum API_STOCK_VIEW_MODEL {
  STOCK_INFOR,
  MATCH_DATA,
  MATCH_PRICE_DATA,
  TIME_SALE
}

enum SecType {
  S, // Cổ phiếu
  U, // Chứng chỉ quỹ
  D, // Trái phiếu
  E, // Chứng chỉ quỹ ETF
  W, //Chứng quyền
  F, // Future
  O, // Option
  NONE
}

enum MarketStatusSessionWithIndex {
  NONE, // 1. Chưa vào phiên

  /// HOSE
  BEFORE_HSX, // Trước giờ

  ATO_HSX, // Định kỳ mở cửa ATO
  OPEN_HSX, // Khớp liên tục

  BREAK_HSX, // Tạm dừng giữa phiên

  ATC_HSX, // ATC

  RUNOFF_HSX, // Thoả thuận 45 - 15h
  CLOSED_HSX, // Kết thúc giao dịch

  // HNX
  BEFORE_HNX, // (90) Trước giờ
  OPEN_HNX, // 2. Liên tục 9h - 11h30, 13h - 15h

  BREAK_HNX, // Tạm dừng giữa phiên

  ATC_HNX, // ATC
  RUNOFF_HNX, // Phiên sau giờ/thỏa thuận
  CLOSED_HNX, // (97 dong cua)

  // UP_COM
  OPEN_UPCOM, // Liên tục 9h - 11h30, 13h - 14h30
  BREAK_UPCOM, //  Tạm dừng giữa phiên

  CLOSED_UPCOM, // Tạm dừng giữa phiên
}

enum MarketStatusSession {
//   S: Trước giờ
// P: ATO
// O: Liên tục
// A: ATC
// C: Thỏa thuận
// I: Nghỉ trưa
// K: Đóng cửa
// G: EOD => Đóng cửa
// J: Sau EOD => Đóng cửa
// Z: Đóng cửa
  NONE, // 1. Chưa vào phiên

  S, // Trước giờ giao dịch

  P, // ATO

  O, // Liên tục

  A, // ATC

  C, //  Thỏa thuận

  I, // Nghỉ

  K, //  Đóng cửa

  G, // EOD

  J, // Sau EOD

  Z, // Đóng cửa

}

enum Index {
  HOSE,
  HNX,
  UPCOM,
  VN30,
  HNX30,
  DER,
  NONE,
}
