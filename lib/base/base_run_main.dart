import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile/app.dart';
import 'package:flutter_mobile/config/config.dart';
import 'package:flutter_mobile/locator.dart';
import 'package:flutter_mobile/utils/http_override.dart';
import 'package:get_storage/get_storage.dart';

class BaseRunMain {
  static Future<void> runMainApp({required BaseConfig config}) async {
    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations(
          <DeviceOrientation>[DeviceOrientation.portraitUp]);

      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light));

      await GetStorage.init();
      AppConfig.setEverionment(valueConfig: config);

      await Firebase.initializeApp();

      await setupLocator();
      HttpOverrides.global = MyHttpOverrides();
      runApp(App());
    }, (Object error, StackTrace stackTrace) {});
  }
}
