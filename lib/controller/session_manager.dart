import 'package:flutter_mobile/controller/refresh_manager.dart';
import 'package:flutter_mobile/domain/model/account_infor/authentication.dart';
import 'package:flutter_mobile/generated/locales.g.dart';
import 'package:flutter_mobile/global/app_log.dart';
import 'package:flutter_mobile/global/app_router.dart';
import 'package:flutter_mobile/widgets/loading_wrapper.dart';
import 'package:flutter_mobile/widgets/network_connect.dart';
import 'package:flutter_mobile/widgets/pop_up/show_popup.dart';
import 'package:get/get.dart';

enum SessionState { init, loggedIn, loggedOut, expired }

class SessionManager {
  factory SessionManager() {
    return _singleton;
  }

  SessionManager._internal() {
    onInit();
  }

  static final SessionManager _singleton = SessionManager._internal();

  String get accountId => _username;

  void onInit() {
    _state.listen((SessionState state) {
      switch (state) {
        case SessionState.init:
          break;
        case SessionState.loggedIn:
          break;
        case SessionState.expired:
          RefeshManager().unAllRefesh();
          ShowPopup()
              .popUpConfirm(
                  content: LocaleKeys.ERROR_401.tr,
                  textConfirm: LocaleKeys.login_login.tr)
              .whenComplete(() => _logout(toLogin: true));
          break;
        case SessionState.loggedOut:
          RefeshManager().unAllRefesh();
          _logout(toLogin: true);
          break;
      }
    });
  }

  //
  final Rx<SessionState> _state = SessionState.init.obs;
  Rx<SessionState> get state => _state;
  set setState(SessionState value) => _state.value = value;

  bool get hasSession => _state.value == SessionState.loggedIn;

  String _username = '';

  String get username => _username;

  void setSessionUser({
    required String username,
  }) {
    _state.value = SessionState.loggedIn;
    _username = username;
  }

  void setAuthentication(Authentication value) {
    expiresTimeRefreshToken = DateTime.now()
        .add(Duration(seconds: (value.refreshExpiresIn ?? 1800).toInt()));

    _authentication = value;
    _state.value = SessionState.loggedIn;
  }

  DateTime? expiresTimeRefreshToken;

  Authentication? _authentication;
  Authentication? get authentication => _authentication;

  String get refreshToken => authentication?.refreshToken ?? '';
  String get accessToken => authentication?.accessToken ?? '';

  void init() {
    _state.value = SessionState.init;
  }

  void logined() {
    if (_state.value != SessionState.loggedIn) {
      _state.value = SessionState.loggedIn;
    }
  }

  void requestExpired() {
    if (_state.value != SessionState.expired) {
      _state.value = SessionState.expired;
    }
  }

  void _logout({bool toLogin = false}) {
    try {
      if (toLogin && Get.currentRoute != AppRouter.routerLogin) {
        Get.offAllNamed(AppRouter.routerLogin);
      }

      // Không có mạng bỏ qqua all
      if (Get.isRegistered<NetWorkController>() &&
          !Get.find<NetWorkController>().isConnected) {
        return;
      }

      // Close all loading if show
      if (Get.isRegistered<LoadingController>()) {
        Get.find<LoadingController>().hideAll();
      }

      // accountUserCase.saveLastCurrent();
      _authentication = null;

      // SmartOtpManager().clear();
      // WatchListManager().clear();
      // SocketManager().disconnect();
    } catch (exception) {
      AppLog.log.debugPrint(exception);
    }
  }

  void logout() {
    if (_state.value != SessionState.loggedOut) {
      _state.value = SessionState.loggedOut;
    }
  }
}
