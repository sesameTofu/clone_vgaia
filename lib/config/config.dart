import 'package:flutter_mobile/config/prod.config.dart';
import 'package:flutter_mobile/config/uat.config.dart';
import 'package:grpc/grpc_connection_interface.dart';

class AppConfig {
  static late BaseConfig config;

  static void setUat() {
    config = UATConfig();
  }

  static void setProd() {
    config = ProdConfig();
  }

  static void setEverionment({required BaseConfig valueConfig}) {
    config = valueConfig;
  }
}

abstract class BaseConfig {
  String get baseUrl;

  String get systemParam;

  String get systemSymbolConfig;

  int get userNameLength;

  // Cho phép lần đầu đăng nhập hỏi có sử dụng xác thực vân tay hoặc faceId cho lần đăng nhập tiếp theo  hay không
  bool get isFirstBiometric;

  /// Link quên mật khẩu
  String get urlForgotPassWord;

  /// Link hướng dẫn sử dụng
  String get urlManualApp;

  String get grpcUrl;

  int get grpcPort;

  String get authenCode;

  int get limitSizeMatchIntraDay => 100000;

  ChannelOptions get channelOptionsGrpc;

  String get webSockerUrl;

  int get intervalRefeshMarket => 60000;

  String get grpcUserId => 'ADMIN';

  String tradingViewUrl(String symbol);

  String get companyName;

  // Số tổng đài
  String get switchboardPhone;

  //Số đặt lệnh nhanh
  String get placeOrderPhone;

  String get registerAccountUrl;

  String get forgotPasswordUrl;

  String get userGuideUrl;

  String get contactUrl;
}
