class AppUrl {
  static const String urlLogin = 'login';
  static const String urlInitTradingMobile = 'initTradingMobile';
  static const String getPortfolioInvestment = 'getPortfolioInvestment';
  static const String findPortfolio = 'findPortfolio';
  static const String inquiryAccountCashSec = 'inquiryAccountCashSec';
  static const String registerSmartOtpDevice = 'registerSmartOtpDevice';
  static const String activeSmartOtpDevice = 'activeSmartOtpDevice';
  static const String checkPinType = 'checkPinType';
  static const String inqueryAccount = 'inqueryAccount';
  static const String prepareSubmitOrder = 'prepareSubmitOrder';
  static const String getPortfolioAsset = 'getPortfolioAsset';
  static const String findTransferSecHistory = 'findTransferSecHistory';
  static const String inquiryAccountTransferSec = 'inquiryAccountTransferSec';

  static String watchList(String userId) => 'watchlists/$userId';

  static String watchListOwner(String userId) =>
      'watchlists/$userId/findOwnerStock';

  static String detailWatchList(String userId, String watchListId) =>
      'watchlists/$userId/$watchListId/details';

  static String multiDetailWatchList(String userId, String watchListId) =>
      'watchlists/$userId/$watchListId/multi-details';

  static String actionWatchList(String userId, String watchListId) =>
      'watchlists/$userId/$watchListId';

  static String priorityWatchList(String userId) =>
      'watchlists/$userId/priority';

  static String actionDetailWatchList(
          String userId, String watchListId, String id) =>
      'watchlists/$userId/$watchListId/details/$id';

  // so lenh co so
  static const String findOrder = 'findOrder';
  static const String cancelOrder = 'cancelOrders';
  static const String findRequestPending = 'findRequestPending';
  static const String cancelRequestPending = 'cancelRequestPending2';
  static const String findRequestCond = 'findRequestCond';
  static const String cancelRequestCond = 'cancelRequestCond';
  //So lenh phai sinh
  static const String findDerOrder = 'findDertOrderByFilter';
  static const String finderOrderCond = 'findDertRequestCond';
  static const String dertCancelOrder = 'dertCancelOrder';
  static const String cancelDertRequestCond = 'cancelDertRequestCond';
  static const String dertCancelMultiOrder = 'dertCancelMultiOrder';

  // Dat lenh
  static const String getCustomerRestriction = 'getCustomerRestriction';
  static const String validateCustomerInsider = 'validateCustomerInsider';
  static const String inquiryBuyingPower = 'inquiryBuyingPower';
  static const String getQuotesForOrder = 'getQuotesForOrder';

  // Bank
  static const String findTransferBankHistory = 'findTransferBankHistory';

  /// screener
  static String get screenerSave => 'screeners/create';
  static String get screenerFindAll => 'screeners/findAll';
  static String get screenerGetById => 'screeners/findById';
  static String get screenerDeleteById => 'screeners/deleteScreener';

  static String get initNotification => 'trans/initNotification';

  //notification
  // Find Notice Log
  static String getNotification(String masterAccount) =>
      'trans/notification/$masterAccount';

  // Get notification information by id
  static String getNotificationById(String masterAccount, int noticeId) =>
      '​trans​/notification​/$masterAccount​/$noticeId';

  // Find number of unread notifications by type
  static String get totalUnreadNotifications =>
      'trans/totalUnreadNotifications';

  // Read all notification
  static String readAllNotification(String masterAccount) =>
      'trans/notification/readAllNotification/$masterAccount';

  // Read Notification
  // Delete Notification
  static String get notification => 'trans/notification';
}
