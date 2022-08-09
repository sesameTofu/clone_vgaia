import 'package:flutter_mobile/pages/expand/settings/change_password/change_password_page.dart';
import 'package:flutter_mobile/pages/expand/settings/manager_otp/manager_otp_page.dart';
import 'package:flutter_mobile/pages/expand/settings/setting_notification/setting_notification_page.dart';
import 'package:flutter_mobile/pages/expand/settings/setting_page.dart';
import 'package:flutter_mobile/pages/expand/settings/stock_transfer/stock_transfer_page.dart';
import 'package:flutter_mobile/pages/expand/settings/two_factor_authen/two_factor_authen_page.dart';
import 'package:flutter_mobile/pages/expand/statement/statement_page.dart';
import 'package:flutter_mobile/pages/login/login_page_gmc.dart';
import 'package:flutter_mobile/pages/main/main.dart';
import 'package:flutter_mobile/pages/market/pages/foreign_trade/foreign_trade_detail.dart';
import 'package:flutter_mobile/pages/notification/notification.dart';
import 'package:flutter_mobile/pages/pages.dart';
import 'package:flutter_mobile/pages/recommend/recommend_page.dart';
import 'package:flutter_mobile/pages/screener/creater_screener/create_screener_page.dart';
import 'package:flutter_mobile/pages/screener/result_screener/result_screener_page.dart';
import 'package:flutter_mobile/pages/smart_otp/smart_otp_page.dart';
import 'package:flutter_mobile/pages/transfers/transfers_screen.dart';
import 'package:flutter_mobile/widgets/webview/webview.dart';
import 'package:get/get.dart';

class AppRouter {
  static const String routerSplash = '/';
  static const String routerMain = '/routerMain';
  static const String routerLogin = '/routerLogin';
  static const String routerSearchStock = '/routerSearchStock';
  static const String routerWebView = '/routerWebView';
  static const String routerSettings = '/routerSettings';
  static const String routerMoneyTransfer = '/routerMoneyTransfer';
  static const String routerSatement = '/routerSatement';
  static const String routerTwoFactorAuthen = '/routerTwoFactorAuthen';
  static const String routerSettingNotification = '/routerSettingNotification';
  static const String routerManagerOtpPage = '/routerManagerOtpPage';
  static const String routerSmartOTPPage = '/routerSmartOTPPage';
  static const String routerChangePassword = '/routerChangePassword';
  static const String routerRecommend = '/routerRecommend';
  static const String routerForeignTradeDetail = '/routerForeignTradeDetail';
  static const String routerScreenerPage = '/routerScreenerPage';
  static const String routerCreateScreenerPage = '/routerCreateScreenerPage';
  static const String routerResultScreenerPage = '/routerResultScreenerPage';
  static const String routerNotification = '/routerNotification';
  static const String routerStockTransfer = '/routerStockTransfer';
  static List<GetPage<dynamic>> getPages = <GetPage<dynamic>>[
    GetPage<SplashPage>(
      name: routerSplash,
      page: () => SplashPage(),
    ),
    GetPage<MainPage>(
      name: routerMain,
      page: () => MainPage(),
    ),
    GetPage<LoginPage>(
      name: routerLogin,
      page: () => LoginPage(),
    ),
    GetPage<WebViewInApp>(
      name: routerWebView,
      page: () => WebViewInApp(),
    ),
    GetPage<SettingsPage>(
      name: routerSettings,
      page: () => SettingsPage(),
    ),
    GetPage<TransferScreen>(
      name: routerMoneyTransfer,
      page: () => TransferScreen(),
    ),
    GetPage<StatementPage>(
      name: routerSatement,
      page: () => StatementPage(),
    ),
    GetPage<TwoFactorAuthenPage>(
      name: routerTwoFactorAuthen,
      page: () => TwoFactorAuthenPage(),
    ),
    GetPage<SettingNotificationPage>(
      name: routerSettingNotification,
      page: () => SettingNotificationPage(),
    ),
    GetPage<ManagerOtpPage>(
      name: routerManagerOtpPage,
      page: () => ManagerOtpPage(),
    ),
    GetPage<SmartOTPPage>(
      name: routerSmartOTPPage,
      page: () => SmartOTPPage(),
    ),
    GetPage<ChangePasswordPage>(
      name: routerChangePassword,
      page: () => ChangePasswordPage(),
    ),
    GetPage<RecommendPage>(
      name: routerRecommend,
      page: () => RecommendPage(),
    ),
    GetPage<ForeignTradeDetail>(
      name: routerForeignTradeDetail,
      page: () => ForeignTradeDetail(),
    ),
    GetPage<CreateScreenerPage>(
      name: routerCreateScreenerPage,
      page: () => CreateScreenerPage(),
    ),
    GetPage<ResultScreenerPage>(
      name: routerResultScreenerPage,
      page: () => ResultScreenerPage(),
    ),
    GetPage<Notification>(
      name: routerNotification,
      page: () => Notification(),
    ),
    GetPage<StockTransferPage>(
      name: routerStockTransfer,
      page: () => StockTransferPage(),
    ),
  ];
}
