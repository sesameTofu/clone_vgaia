import 'package:flutter_mobile/controller/session_manager.dart';
import 'package:flutter_mobile/global/app_router.dart';
import 'package:flutter_mobile/import.dart';

class ExpandController extends BaseController {
  final SessionManager _sessionManager = SessionManager();
  void onClickSettings() => Get.toNamed(AppRouter.routerSettings);
  void onClickStatement() => Get.toNamed(AppRouter.routerSatement);
  void onClickStockTransfer() => Get.toNamed(AppRouter.routerStockTransfer);

  void onLogOut() => _sessionManager.logout();
}
