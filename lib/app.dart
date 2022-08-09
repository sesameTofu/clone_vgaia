import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobile/core_support/lifecycle_event_handler.dart';
import 'package:flutter_mobile/data/source/firebase/firebase_manager.dart';
import 'package:flutter_mobile/utils/localization_service.dart';
import 'package:flutter_mobile/widgets/loading/header_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'global/app_router.dart';
import 'global/app_theme.dart';
import 'import.dart';
import 'widgets/loading_wrapper.dart';
import 'widgets/network_connect.dart';
import 'widgets/smart_load_list.dart';

final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with BaseMixin {
  final LifecycleEventHandler _lifecycleEventHandler = LifecycleEventHandler();
  late StreamSubscription<AppLifecycleState> _streamSubscriptionLifeCycle;

  @override
  void initState() {
    super.initState();
    _streamSubscriptionLifeCycle = _lifecycleEventHandler.streamNotifyLifecycle
        .listen(_listenerLifecycleEvent);
    analytics.logAppOpen();

    _bind();
  }

  @override
  void dispose() {
    _streamSubscriptionLifeCycle.cancel();
    super.dispose();
  }

  Future<void> _bind() async {
    FirebaseManager.share.init();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      footerTriggerDistance: 15,
      headerTriggerDistance: 20,
      enableScrollWhenRefreshCompleted: true,
      headerBuilder: () => HeaderRefresh(),
      footerBuilder: buildFooterSmartRefresh,
      dragSpeedRatio: 0.5,
      child: GetMaterialApp(
        enableLog: true,
        translations: LocalizationService(),
        translationsKeys: AppTranslation.translations,
        locale: LocalizationService.locale,
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          RefreshLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: LocalizationService.locales,
        fallbackLocale: LocalizationService.fallbackLocale,
        debugShowCheckedModeBanner: false,
        title: 'APP',
        theme: Get.find<AppThemeBase>().themeData,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: LoadingWrapper(child: NetWorkConnect(child: child)),
          );
        },
        initialRoute: AppRouter.routerSplash,
        getPages: AppRouter.getPages,
        navigatorObservers: <NavigatorObserver>[
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
      ),
    );
  }

  void _listenerLifecycleEvent(AppLifecycleState event) {}
}
