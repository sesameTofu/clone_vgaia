import 'dart:async';
import 'dart:io';

import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_mobile/import.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewInApp extends StatefulWidget {
  const WebViewInApp({Key? key}) : super(key: key);

  @override
  _WebViewInAppState createState() => _WebViewInAppState();
}

class _WebViewInAppState extends State<WebViewInApp> {
  bool showPdfView = false;

  late final String url;
  late final String title;

  @override
  void initState() {
    super.initState();
    title = (Get.arguments as List<String>).tryGet(0) ?? '';
    url = (Get.arguments as List<String>).tryGet(1) ?? '';
    if (url.endsWith('pdf') || url.endsWith('PDF')) {
      setState(() => showPdfView = true);
    }
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('url: $url');
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        body: _buildContentView());
  }

  Widget _buildContentView() {
    return showPdfView
        ? _buildPdfView()
        : WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
          );
  }

  Widget _buildPdfView() {
    return url.contains('asset')
        ? PDFViewerFromAsset(pdfAssetPath: url)
        : PDFViewerFromUrl(url: url);
  }
}

class PDFViewerFromUrl extends StatelessWidget {
  const PDFViewerFromUrl({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const PDF().fromUrl(
        url,
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}

class PDFViewerFromAsset extends StatelessWidget with BaseMixin {
  PDFViewerFromAsset({Key? key, required this.pdfAssetPath}) : super(key: key);
  final String pdfAssetPath;
  final Completer<PDFViewController> _pdfViewController =
      Completer<PDFViewController>();
  final StreamController<String> _pageCountController =
      StreamController<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDF(
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: true,
        onPageChanged: (int? current, int? total) =>
            _pageCountController.add('${current! + 1} - $total'),
        onViewCreated: (PDFViewController pdfViewController) async {
          _pdfViewController.complete(pdfViewController);
          final int currentPage = await pdfViewController.getCurrentPage() ?? 0;
          final int? pageCount = await pdfViewController.getPageCount();
          _pageCountController.add('${currentPage + 1} - $pageCount');
        },
      ).fromAsset(
        pdfAssetPath,
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
      floatingActionButton: FutureBuilder<PDFViewController>(
        future: _pdfViewController.future,
        builder: (_, AsyncSnapshot<PDFViewController> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Padding(
              padding: EdgeInsets.only(left: 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () async {
                      final PDFViewController pdfController = snapshot.data!;
                      final int currentPage =
                          (await pdfController.getCurrentPage())! - 1;
                      if (currentPage >= 0) {
                        await pdfController.setPage(currentPage);
                      }
                    },
                  ),
                  StreamBuilder<String>(
                      stream: _pageCountController.stream,
                      builder: (_, AsyncSnapshot<String> snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: color.primary,
                            ),
                            child: Text(
                              snapshot.data!,
                              style: textStyle.custom(
                                  color: color.background1, size: 12),
                            ),
                          );
                        }
                        return const SizedBox();
                      }),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () async {
                      final PDFViewController pdfController = snapshot.data!;
                      final int currentPage =
                          (await pdfController.getCurrentPage())! + 1;
                      final int numberOfPages =
                          await pdfController.getPageCount() ?? 0;
                      if (numberOfPages > currentPage) {
                        await pdfController.setPage(currentPage);
                      }
                    },
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
