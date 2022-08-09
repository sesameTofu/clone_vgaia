import 'package:flutter_mobile/base/base_page.dart';
import 'package:flutter_mobile/global/app_router.dart';

import 'splash_controller.dart';

class SplashPage extends BaseScreen<SpalshController> {
  SplashPage({Key? key}) : super(key: key);

  @override
  String? screenName() => AppRouter.routerSplash;

  @override
  SpalshController putController() => SpalshController();

  @override
  Widget builder() {
    // return FutureBuilder<FirebaseApp>(
    //   // Initialize FlutterFire:
    //   future: FirebaseManager.share.init(),
    //   builder: (_, AsyncSnapshot<FirebaseApp> snapshot) {
    //     // Check for errors
    //     if (snapshot.hasError) {
    //       return Container(
    //         color: Colors.white,
    //         alignment: Alignment.center,
    //         child: Center(
    //           child: Text('SomethingWentWrong!'),
    //         ),
    //       );
    //     }

    //     // Once complete, show your application
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       controller.toLogin();
    //     }

    // Otherwise, show something whilst waiting for initialization to complete
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Text('Splash'),
    );
    //   },
    // );
  }
}
