import 'dart:async';

import 'package:flutter_mobile/config/config.dart';
import 'package:flutter_mobile/core_support/lifecycle_event_handler.dart';
import 'package:flutter_mobile/import.dart';

class RefeshManager {
  factory RefeshManager() {
    return _singleton;
  }

  RefeshManager._internal();

  static final RefeshManager _singleton = RefeshManager._internal();
  final Map<String, Timer> mapRefesh = <String, Timer>{};

  void subReresh(String key, Function() refesh) {
    mapRefesh[key]?.cancel();
    mapRefesh[key] = Timer.periodic(
        Duration(milliseconds: AppConfig.config.intervalRefeshMarket),
        (Timer timer) {
      if (LifecycleEventHandler().appLifecycleState ==
          AppLifecycleState.resumed) {
        refesh();
      }
    });
  }

  void unsubReresh(String key) {
    mapRefesh[key]?.cancel();
  }

  void unAllRefesh() {
    if (mapRefesh.entries.isNotEmpty) {
      mapRefesh.forEach((String key, Timer value) {
        value.cancel();
      });
    }
  }
}
