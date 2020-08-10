import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:permission_handler/permission_handler.dart';

String url = "http://pragathiinfotech.com:9494/";

class WebViewPlugin extends StatefulWidget {
  @override
  WebViewPluginState createState() => WebViewPluginState();
}

class WebViewPluginState extends State<WebViewPlugin> {
  final webView = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    //webView.close();
  }

  @override
  void dispose() {
    webView.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebviewScaffold(
        url: url,
        withJavascript: true,
        withLocalStorage: true,
        withZoom: true,
        geolocationEnabled: true,
        initialChild: Container(
          color: Colors.white,
          child: const Center(
            child: Text('Loading...'),
          ),
        ),
        // bottomNavigationBar: Text("data"),
      ),
    );
  }
}
