import 'dart:core';

import 'package:flutter_mobile/controller/session_manager.dart';
import 'package:flutter_mobile/global/app_theme.dart';
import 'package:flutter_mobile/import.dart';
import 'package:grpc/grpc.dart';

import 'config.dart';

class UATConfig extends BaseConfig {
  @override
  String get baseUrl => 'http://dev.mobile.nextline.vn/rest/front/api/';

  @override
  String get webSockerUrl =>
      'ws://uat-wss-streaming.kafisc.vn:8443/Push/socket.io/';
  @override
  String get grpcUrl => 'uat-market-grpc.kafisc.vn';

  @override
  int grpcPort = 8088;

  @override
  String get authenCode => 'vgaia-front-market-api';

  // Cho phép lần đầu đăng nhập hỏi có sử dụng xác thực vân tay hoặc faceId cho lần đăng nhập tiếp theo  hay không
  @override
  bool isFirstBiometric = true;

  @override
  String get systemParam => '045';

  @override
  String get systemSymbolConfig => 'C';

  @override
  int userNameLength = 10;

  /// Link quên mật khẩu
  @override
  String get urlForgotPassWord => 'https://trading.bos.vn/m/forgot-password';

  /// Link hướng dẫn sử dụng
  @override
  String get urlManualApp =>
      'https://bos.vn/Download/HDSD/BOS_HDSD_BOSMobi.pdf';

  @override
  String tradingViewUrl(String symbol) {
    final String _theme =
        Get.find<AppThemeBase>().appTheme == AppThemeType.black
            ? 'dark'
            : 'light';
    final String _token = SessionManager().accessToken;

    return 'http://gmc-tradingview.nextline.vn/?sym=$symbol&theme=$_theme&channel=mobile&token=$_token';
  }

  @override
  String get companyName =>
      'Công ty cổ phần chứng khoán Ngân hàng Công thương Việt Nam';

  @override
  String get switchboardPhone => '1900 58 88 66';

  @override
  String get placeOrderPhone => '1900 58 58 66';
  @override
  String get contactUrl => 'http://www.cts.vn';

  @override
  String get forgotPasswordUrl => 'https://unitrade.cts.vn/forgot-password';

  @override
  String get registerAccountUrl =>
      'https://unitrade.cts.vn/customer-online-register';

  @override
  String get userGuideUrl => 'http://www.cts.vn/';

  @override
  ChannelOptions get channelOptionsGrpc => ChannelOptions(
        credentials: ChannelCredentials.insecure(),
        connectionTimeout: Duration(seconds: 30),
      );
}
