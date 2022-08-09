// ignore_for_file: constant_identifier_names

enum TypeBottomBar { DASHBOARD, MARKET, ORDER, ORDER_LIST, EXPANDED }

enum StatusFiled { NONE, UP, DOWN }

enum PlaceOrderType {
  OrderNormal, // Lệnh thường
  BeforeDay, // Trước ngày
  Tendency, // Xu hướng
  TakeProfit, // Chốt lãi
  StopLoss, // Cắt lỗ
  DisputePurchase // Tranh mua/bán
}

enum TypeCalcalator { increment, decrement }

enum ConditionOrder {
  MaxRateWarning,
  BigShareHolder,
  InsiderShareHolder,
  TradingBond,
  Invalid,
  Success
}

enum TradeType { NONE, SELL, BUY }

enum SortType {
  ticker,
  changedPercent,
  none,
  //
  symbol,
  price,
  change,
  marketCap,
  pb,
  pe,
  netMag,
  roa,
  roe,
  eps
}

enum SortState { up, down, none }

enum EntrustBusinessCode {
  all,
  owner,
  supper,
  order,
  cash,
  sec,
  payAdvance,
  mortgage,
  inquiry,
  rightExec,
  oddSell,
  advanceDividend,
  timeDeposit,
  margin,
  shortSale,
  banking,
  service,
  oef,
  derivative,
  repo,
  portfolio,
  transferCash,
  transferSec
}

enum RestrictionCode {
//Phong toa mua
  orderBuy,
//phong toa ban
  orderSell,
  //Ung truoc
  payAdvance,
  //rut tien
  withDrawCash,
  //rut chung khoan
  withDrawSec,
  //chuyen tien
  transferCash,
  //tat toan
  finalSettlment,
  //cam co
  mortage
}

enum PinType { Password, Matrix, Otp, Token, CA, SmartOtp, None }

enum DataType {
  //Đặt lệnh trong giờ
  Order,
  //Đặt lệnh trước giờ
  PendingOrder
}
enum OrderStatus {
  wait_match,
  partial_match,
  match,
  cancel,
  reject,
  expired,
  wait_process,
  order_new,
  none
}

enum OrderConditionType {
  PriceByValue,
  PriceByPercent,
  SpreadByValue,
  SpreadByPercent
}

enum ConditionType {
  /// Lệnh trước ngày
  TCO,

  ///Lệnh xu hướng
  TS,

  /// Lệnh Chốt lãi
  SP,

  /// Cắt lỗ
  CL,

  /// Tranh mua/bán
  PRO,
}

enum MatMethod { OneTime, MatchEnough }

enum OrderPriceCondition { notCondition, referencePrice }

enum PriceCondition { largerOrEqual, lessThanOrEqual }

enum SpreadsType { value, percentage }

enum PriceDiffsType { value, percentage }

enum OrderConditionStatus {
  all,

  /// <summary>
  /// Đang có hiệu lực
  /// </summary>
  effect,

  /// <summary>
  /// Đã kết thúc
  /// </summary>
  end,

  /// <summary>
  /// Hết hiệu lực
  /// </summary>
  endEffect,

  /// <summary>
  /// Đã hủy
  /// </summary>
  cancelled,
}

enum FocusPlaceOrder {
  NONE,
  SEARCH_STOCK,
  PRICE,
  VOLUME,
}

enum TypeMoneyTransfer { bankTransfer, internalTransfer }

enum BusinessCd {
  None, // 0
  Login, // 1
  Trading, // 2
  Transfer, // 3
  Advance, // 4
  OddLot, // 5
  RegisterToBuy, // 6
  Margin, // 7
  Deposit, // 8
}

// enum EnumErrorPlaceOrder {
//   errorCancelPopup,
//   errorApi, // Lỗi từ Sever
//   errorStock, // Lỗi chưa nhập text search
//   errorInforStock, // Không lấy được thông tin mã
//   errorAccount, // Lỗi chưa chọn tài khoản
//   errorInforAccount, // Không lấy được thông tin tài khoản
//   errorTradeType, // Lỗi chưa chọn mua/bán
//   errorPrice, // Lỗi chưa nhập giá
//   errorPriceLessThanFloorPrice, // Lỗi giá bé hơn giá sàn
//   errorPriceGreaterThanCeilingPrice, // Lỗi lớn hơn giá trần
//   errorRoundPrice, // Lỗi giá không làm tròn theo bước giá
//   errorVolume, // Lỗi chưa nhập khối lượng
//   errorVolumeZerro, // Lỗi chưa nhập khối lượng
//   errorRoundVolume, // Lỗi chưa làm tròm khối lượng
//   errorMaxTotalQuantity, // Đặt quá khối lượng tối đa,
//   errorCannotPrePareOrder, // Lỗi từ api lấy trước khi đặt lênh
//   errorTradeTypeBuy, // Lệnh điều kiện không phù hợp cho lệnh mua
//   errorBasicPrice, //Giá tham chiếu không hợp lệ
//   errorSpreadValue, // Khoảng dừng không hợp lệ
//   errorActivePrice, // gia kich hoat phai lon hon 0
//   errorOrderPrice, // gia dat phai lon hon 0
// }

enum EnumErrorPlaceOrder {
  errorCancelPopup,
  errorApi, // Lỗi từ Sever
  errorStock, // Lỗi chưa nhập text search
  errorInforStock, // Không lấy được thông tin mã
  errorAccount, // Lỗi chưa chọn tài khoản
  errorBuyingPow, // Lỗi chưa lay duoc suc mua
  errorInforAccount, // Không lấy được thông tin tài khoản
  errorTradeType, // Lỗi chưa chọn mua/bán
  errorPrice, // Lỗi chưa nhập giá
  errorPriceLessThanFloorPrice, // Lỗi giá bé hơn giá sàn
  errorPriceGreaterThanCeilingPrice, // Lỗi lớn hơn giá trần
  errorRoundPrice, // Lỗi giá không làm tròn theo bước giá
  errorVolume, // Lỗi chưa nhập khối lượng
  errorMaxVolumeHose, // Lỗi chưa nhập khối lượng 500.000
  errorMaxVolume, // Lỗi chưa nhập khối lượng 1.000.000
  errorVolumeZerro, // Lỗi chưa nhập khối lượng
  errorRoundVolume, // Lỗi chưa làm tròm khối lượng
  errorRoundVolumeRequestLO, // Lỗi Lô lẻ chỉ đặt với loại lệnh LO
  errorRoundStepVolume, // Lỗi buoc khoi luong chưa  làm tròm khối lượng
  errorMaxTotalQuantity, // Đặt quá khối lượng tối đa,
  errorCannotPrePareOrder, // Lỗi từ api lấy trước khi đặt lênh
  errorTradeTypeBuy, // Lệnh điều kiện không phù hợp cho lệnh mua
  errorBasicPrice, //Giá tham chiếu không hợp lệ
  errorSpreadValue, // Khoảng dừng không hợp lệ
  errorActivePrice, // gia kich hoat phai lon hon 0
  errorOrderPrice, // gia dat phai lon hon 0
  errorTimeOrder, // Phiên giao dịch không hợp lệ đặt lệnh báo giá
  errorSessionOrder, // Phiên giao dịch không hợp lệ.",
  errorSessionClose, // Thị trường đóng cửa
  errorTimeOrderPrice, //  "Loại lệnh không hợp lệ đặt tại phiên giao dịch này",

}

enum StatusWebSocket {
  CONNECTED,
  DISCONNECTED,
  INIT,
  ERROR,
  PING_PONG,
  EVENT,
  EMIT_TOKEN_SUCCESS,
  RE_CONNECT,
}

enum BussinesType {
  None,
  Login, //1
  Order, //2
  TransferBank, //3
  TranferInside, //4
  TranferCIA, //5
  BuyMore, //6
  RegisService, //7
  Corporate, //8
  Bond, //9
  Margin, //10
  RegSmartOtp, //100
  ResetPW, //101
  ChangeInfo, //102
  DelSmartOtp, //103
  GetSmartOtp, // -1
}

enum Mode { BASIC, ADVANCE }

enum TypeFilter { top, period, secCd, totalQty }

enum TypeBottom { ADD_TICKER, EDIT_CATEGORY, COPY_WATCHLIST }

// type: 1: Ngày, 2: Tuần, 3: Tháng, 4: 3tháng, 5: 6tháng, 6: 1năm
// side: 0: All 1: Ban, 2:Mua, 3: KL mua, 4: KL bán, 5: Giá trị mua, 6: Giá trị bán
enum ForgeinTradeType {
  all,
  salePrice,
  buyPrice,
  buyQuantity,
  saleQuantity,
  valueBuy,
  valueSale
}

enum TypeBottomAdd { ADD, EDIT }

enum TypeNotification { ORDER, SUPPORT, SUGGESTION, NOTIFY, NONE }

enum TypePageAsset { portfolio, profit }

enum DerOrderNorStatus {
  wait,
  match,
  cancel,
  all,
  orderNew,
  deleted,
  intoTheSys,
  waitMatch,
  parMatch,
  parCancel,
  rejectStock,
  cancelAll,
}

enum EnumOrderPreStatus {
  all,

  /// <summary>
  /// Chưa duyệt
  /// </summary>
  pending,

  /// <summary>
  /// Đã duyệt
  /// </summary>
  approved,

  /// <summary>
  /// Đã hủy
  /// </summary>
  cancelled
}

enum OrderListType { diary, preMarket, conditional }

enum DertRequestCondType {
  non,

  /// <summary>
  /// SO: Lệnh dừng
  /// </summary>
  so,

  /// <summary>
  /// CL: Lệnh cắt lỗ
  /// </summary>
  cl,

  /// <summary>
  /// SP: Lệnh chốt lãi
  /// </summary>
  sp,

  /// <summary>
  /// OC: Lệnh OCO
  /// </summary>
  qc,

  /// <summary>
  /// BB: Lệnh bull & bear
  /// </summary>
  bb,

  /// <summary>
  /// TS: Lệnh xu hướng
  /// </summary>
  ts,

  /// <summary>
  /// UO: Lệnh UP
  /// </summary>
  uo,

  /// <summary>
  /// DO: Lệnh DOWN
  /// </summary>
  down
}

enum DertRequestCondStatus { orderNon, orderNew, orderDeleted }

enum TypePageOrder { PlaceOrder, OrderDiary }

// trạng thái chuyển khoản CK
enum StockTransferStatus { pending, approved, cancelled }
