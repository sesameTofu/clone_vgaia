import 'package:flutter_mobile/core_support/base_value_notify.dart';
import 'package:flutter_mobile/domain/model/front_initial_model_mobile.dart';
import 'package:package_info_plus/package_info_plus.dart';

class GlobalDataManager {
  factory GlobalDataManager() {
    return _singleton;
  }

  GlobalDataManager._internal() {
    // app version
    _getVersionApp();
  }

  static final GlobalDataManager _singleton = GlobalDataManager._internal();

  final RxNotify<FrontInitialModelMobile> _frontInitialModelMobile =
      FrontInitialModelMobile().objective;

  FrontInitialModelMobile get frontInitialModelMobile =>
      _frontInitialModelMobile.value;

  set setFrontInitialModelMobile(FrontInitialModelMobile frontInitialMode) =>
      _frontInitialModelMobile.value = frontInitialMode;

  String? get tradeDate => frontInitialModelMobile.tradeDate;

  String? version;

  // lấy version app
  Future<void> _getVersionApp() async {
    final PackageInfo _packageInfo = await PackageInfo.fromPlatform();

    version = '${_packageInfo.version}.${_packageInfo.buildNumber}';
  }
}
