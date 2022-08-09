import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile/config/config.dart';
import 'package:flutter_mobile/import.dart';
import 'package:flutter_mobile/pages/watch_list/sec_quote_detail/trading_view_extend.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TechnicalAnalysisView extends StatefulWidget {
  const TechnicalAnalysisView(this.ticker, {Key? key}) : super(key: key);
  final String ticker;

  @override
  _DetailSecAnalysisTabBlocState createState() =>
      _DetailSecAnalysisTabBlocState();
}

class _DetailSecAnalysisTabBlocState extends State<TechnicalAnalysisView>
    with AutomaticKeepAliveClientMixin<TechnicalAnalysisView>, BaseMixin {
  @override
  bool get wantKeepAlive => true;

  bool _isShowFull = false;
  late WebViewController? _webcontroller;
  late OverlayEntry floatingDropdown;

  @override
  void initState() {
    floatingDropdown = _createFloatingDropdown;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildChartWebView();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[DeviceOrientation.portraitUp]);
    super.dispose();
  }

  Widget _buildChartWebView() {
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setPreferredOrientations(
            <DeviceOrientation>[DeviceOrientation.portraitUp]);
        if (_isShowFull) {
          _isShowFull = false;
          floatingDropdown.remove();
          return false;
        }
        return true;
      },
      child: Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          WebView(
            zoomEnabled: false,
            backgroundColor: color.grey100,
            onWebViewCreated: (WebViewController contr) async {
              _webcontroller = contr;
            },
            initialUrl:
                Uri.encodeFull(AppConfig.config.tradingViewUrl(widget.ticker)),
            javascriptMode: JavascriptMode.unrestricted,
            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
              Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer(),
              ),
            },
          ),
          _buildIconRotate
        ],
      ),
    );
  }

  OverlayEntry get _createFloatingDropdown {
    return OverlayEntry(
      builder: (_) {
        return LayoutBuilder(
          builder: (_, __) {
            return SafeArea(
              child: Material(
                color: Colors.transparent,
                child: _buildChartWebView(),
              ),
            );
          },
        );
      },
    );
  }

  Widget get _buildIconRotate => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: color.primary.withOpacity(0.3),
                shape: CircleBorder(),
              ),
              // child: iconSvg(
              //   path:
              //       _isShowFull ? AppPath.icRotateLeft : AppPath.icRotateRight,
              //   color: color.rotateColor,
              // ),
              child: Container(),
              onPressed: () async {
                Get.to(
                        () => TradingViewExtend(
                              ticker: widget.ticker,
                            ),
                        transition: Transition.rightToLeft)
                    ?.whenComplete(() async {
                  await 0.5.seconds.delay();
                  _webcontroller?.reload();
                });
              }).paddingOnly(bottom: 50),
        ),
      );
}
