import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile/config/config.dart';
import 'package:flutter_mobile/import.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TradingViewExtend extends StatefulWidget {
  const TradingViewExtend({Key? key, required this.ticker}) : super(key: key);

  @override
  State<TradingViewExtend> createState() => _TradingViewExtendState();
  final String ticker;
}

class _TradingViewExtendState extends State<TradingViewExtend> with BaseMixin {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[DeviceOrientation.landscapeRight]);

    super.initState();
  }

  // final RxBool isFull = false.obs;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Stack(children: <Widget>[
          WebView(
              zoomEnabled: false,
              backgroundColor: color.grey100,
              onWebViewCreated: (WebViewController contr) async {
                await 1.seconds.delay();
                contr.reload();
              },
              initialUrl: Uri.encodeFull(
                  AppConfig.config.tradingViewUrl(widget.ticker)),
              javascriptMode: JavascriptMode.unrestricted,
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                Factory<OneSequenceGestureRecognizer>(
                    () => EagerGestureRecognizer())
              }),
          // _buildIconRotate
        ])),
      ),
    );
  }

  // Widget get _buildIconRotate => Positioned.fill(
  //       child: Align(
  //         alignment: Alignment.bottomRight,
  //         child: TextButton(
  //             style: TextButton.styleFrom(
  //               backgroundColor: color.primary.withOpacity(0.3),
  //               shape: CircleBorder(),
  //             ),
  //             child: iconSvg(
  //               path: AppPath.icRotateLeft,
  //               color: color.rotateColor,
  //             ),
  //             onPressed: () {
  //               // SystemChrome.setPreferredOrientations(
  //               //     [DeviceOrientation.portraitUp]);
  //               // 0.1.delay(() {
  //               //   Get.back();
  //               // });
  //               Get.back();

  //               // if (_isShowFull) {
  //               //   _isShowFull = false;
  //               //   floatingDropdown.remove();
  //               //   SystemChrome.setPreferredOrientations(
  //               //       <DeviceOrientation>[DeviceOrientation.portraitUp]);
  //               // } else {
  //               //   _isShowFull = true;
  //               //   Overlay.of(context)!.insert(floatingDropdown);
  //               //   SystemChrome.setPreferredOrientations(
  //               //       <DeviceOrientation>[DeviceOrientation.landscapeRight]);
  //               // }
  //             }).paddingOnly(bottom: 50),
  //       ),
  //     );
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[DeviceOrientation.portraitUp]);
    super.dispose();
  }
}
