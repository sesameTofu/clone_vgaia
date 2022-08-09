import 'package:flutter_mobile/utils/device.dart';

class DeviceManager {
  factory DeviceManager() {
    return _singleton;
  }

  DeviceManager._internal() {
    init();
  }

  static final DeviceManager _singleton = DeviceManager._internal();

  late DeviceInfo deviceInfo;

  Future<void> init() async {
    deviceInfo = await getDeviceInfo();
  }
}
