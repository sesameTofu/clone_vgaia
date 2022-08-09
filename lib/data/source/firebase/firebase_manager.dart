import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_mobile/controller/notification_controller.dart';
import 'package:flutter_mobile/global/app_log.dart';
import 'package:get/get.dart';

/// Define a top-level named handler which background/terminated messages will
/// call.
///
/// To verify things are working, check out the native platform logs.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();
  AppLog.log.printInfo('Handling a background message ${message.messageId}');
  // Wait for Firebase to initialize and set `_initialized` state to true

  /// Only show android
  if (Platform.isAndroid) {
    await Firebase.initializeApp();
    FirebaseManager.share.showNotification(message);
  }
}

class FirebaseManager {
  static final FirebaseManager share = FirebaseManager();

  late FirebaseMessaging _firebaseMessaging;

  late RemoteConfig _remoteConfig;

  /// Create a [AndroidNotificationChannel] for heads up notifications
  late AndroidNotificationChannel channel;

  late String token;

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Future<FirebaseApp> init() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      final FirebaseApp result = await Firebase.initializeApp();

      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);

      _firebaseMessaging = FirebaseMessaging.instance;

      await setupRemoteConfig();

      await _initializeCrashlytics();

      token = await getToken ?? '';
      _settingsMessaging();

      _handleMessaging();

      return result;
    } catch (e) {
      AppLog.log.printError(e);
      rethrow;
    }
  }

  Future<String?> get getToken async => _firebaseMessaging.getToken();

  Future<void> _settingsMessaging() async {
    final NotificationSettings settings =
        await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    AppLog.log
        .printInfo('User granted permission: ${settings.authorizationStatus}');

    channel = AndroidNotificationChannel(
      'GOLINE-NOTIFICATION_CHANNEL',
      'GOLINE_GOLINE',
      'GOLINE_GOLINE_DEV',
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
        iOS: IOSInitializationSettings(),
        android: AndroidInitializationSettings('ic_launcher'),
      ),
      onSelectNotification: _onSelectNotification,
    );

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  void _handleMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      AppLog.log.printInfo('Got a message whilst in the foreground!');
      AppLog.log.printInfo('Message data: ${message.data}');

      // Set new notify
      Get.find<NotifyController>().setNewNotify();

      if (message.notification != null) {
        AppLog.log.printInfo(
            'Message also contained a notification: ${message.notification}');

        final RemoteNotification? notification = message.notification;
        final AndroidNotification? android = message.notification?.android;

        // If `onMessage` is triggered with a notification, construct our own
        // local notification to show to users using the created channel.
        if (notification != null && android != null) {
          showNotification(message);
        }
      }
    });

    /// Trigger onClick badget [notify firebase]
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      AppLog.log.printInfo('A new onMessageOpenedApp event was published!');

      _goToPageNotify();
      // final FirebaseNotice item =
      //     FirebaseNotice.fromJson(Map<String, dynamic>.from(message.data));
    });

    _subscribeToTopic();
  }

  /// Trigger from click badget from show [Notification local push]
  Future<void> _onSelectNotification(String? payload) async {
    AppLog.log.printInfo('notification payload: $payload');

    if (payload != null) {
      _goToPageNotify();
      // final FirebaseNotice item =
      //     FirebaseNotice.fromJson(json.decode(payload) as Map<String, dynamic>);
    }
  }

  /// Show badget
  void showNotification(RemoteMessage message) {
    flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? 'ACBS',
      message.notification?.body ?? 'ACBS BODY',
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channel.description,
        ),
      ),
      payload: jsonEncode(message.data),
    );
  }

  void _goToPageNotify() {
    Get.find<NotifyController>().setClearNewNotify();
    // Get.toNamed(AppRouter.routerNotification);
  }

  Future<void> _subscribeToTopic() async {
    await _firebaseMessaging.subscribeToTopic('general');
  }

  // Using zero duration to force fetching from remote server.
  // Duration.zero,
  Future<void> setupRemoteConfig(
      {Duration minimumFetchInterval = Duration.zero}) async {
    try {
      _remoteConfig = RemoteConfig.instance;

      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: minimumFetchInterval,
      ));

      RemoteConfigValue(null, ValueSource.valueStatic);

      await _remoteConfig.fetch().catchError((Object error) {
        AppLog.log.printError('_remoteConfig.fetch :$error');
      });
      await _remoteConfig.fetchAndActivate().catchError((Object error) {
        AppLog.log.printError('_remoteConfig.fetchAndActivate :$error');
      });

      // Get.find<GlobalDataController>().setupFirebseConfig(_remoteConfig);
    } catch (error) {
      AppLog.log.printError('Error setupRemoteConfig :$error');
    }
  }

  Future<void> _initializeCrashlytics() async {
    // enable when build release
    // kReleaseMode
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

    // Pass all uncaught errors to Crashlytics.
    final FlutterExceptionHandler? originalOnError = FlutterError.onError;

    FlutterError.onError = (FlutterErrorDetails errorDetails) async {
      await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
      // Forward to original handler.
      if (originalOnError != null) {
        originalOnError(errorDetails);
      }
    };

    setUserIdentifier();
  }

  Future<void> setUserIdentifier({String userID = 'N/A'}) async {
    // Register Device
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String nameDevice = '';

    if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      nameDevice = iosInfo.utsname.machine;
    } else {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      nameDevice = androidInfo.model;
    }

    FirebaseCrashlytics.instance.setUserIdentifier('$userID:$nameDevice');
  }
}
