import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobile/global/app_log.dart';

class LifecycleEventHandler extends WidgetsBindingObserver {
  factory LifecycleEventHandler() {
    return _singleton;
  }

  LifecycleEventHandler._internal() {
    WidgetsBinding.instance?.addObserver(this);
  }
  static final LifecycleEventHandler _singleton =
      LifecycleEventHandler._internal();

  final StreamController<AppLifecycleState> _notifyLifecycle =
      StreamController<AppLifecycleState>.broadcast();

  Stream<AppLifecycleState> get streamNotifyLifecycle =>
      _notifyLifecycle.stream;

  bool inactiveWithBimotric = false;

  AppLifecycleState appLifecycleState = AppLifecycleState.resumed;

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    appLifecycleState = state;
    _notifyLifecycle.add(state);
    AppLog.log.info('[AppLifecycleState]: => ${state.name}');
    switch (state) {
      case AppLifecycleState.resumed:
        if (inactiveWithBimotric) {
          Future<void>.delayed(Duration(milliseconds: 3000), () {
            inactiveWithBimotric = false;
          });
        }

        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
        break;
    }
  }
}
