import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../managers/webview_bloc.dart';

class WebViewWidget extends StatefulWidget {
  const WebViewWidget({super.key});

  @override
  WebViewWidgetState createState() => WebViewWidgetState();
}

class WebViewWidgetState extends State<WebViewWidget> {
  late InAppWebViewController _webViewController;

  Future<bool> _onWillPop() async {
    if (await _webViewController.canGoBack()) {
      _webViewController.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: BlocBuilder<WebViewBloc, WebViewState>(
        builder: (context, state) {
          return Stack(
            children: <Widget>[
              InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(
                      'https://www.timeanddate.com/weather/ukraine/kyiv/ext'),
                ),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    mediaPlaybackRequiresUserGesture: false,
                  ),
                ),
                onWebViewCreated: (InAppWebViewController controller) {
                  _webViewController = controller;
                },
                onLoadStart: (InAppWebViewController controller, Uri? url) {
                  context.read<WebViewBloc>().add(StartLoading());
                },
                onLoadStop: (InAppWebViewController controller, Uri? url) {
                  context.read<WebViewBloc>().add(FinishLoading());
                },
              ),
              if (state.isProcess == true)
                Container(
                  color: Colors.white,
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          );
        },
      ),
    );
  }
}