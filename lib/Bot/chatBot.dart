import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BotpressChat extends StatefulWidget {
  final String botUrl;

  BotpressChat({required this.botUrl});

  @override
  _BotpressChatState createState() => _BotpressChatState();
}

class _BotpressChatState extends State<BotpressChat> {
  late WebViewController _controller;
  int loadingProgress = 0;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              loadingProgress = progress;
            });
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              loadingProgress = 100;
            });
          },
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.botUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FoodGenie'),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (loadingProgress < 100)
            LinearProgressIndicator(
              value: loadingProgress / 100.0,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
        ],
      ),
    );
  }
}