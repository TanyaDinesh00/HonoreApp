import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

String url = "http://pragathiinfotech.com:9494/";

class InAppWebViewPage extends StatefulWidget {
  @override
  _InAppWebViewPageState createState() => new _InAppWebViewPageState();
}

class _InAppWebViewPageState extends State<InAppWebViewPage> {
  InAppWebViewController webView;
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (webView != null) {
          webView.goBack();
        }
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: InAppWebView(
                    initialUrl: url,
                    initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                        mediaPlaybackRequiresUserGesture: false,
                        debuggingEnabled: true,
                      ),
                    ),
                    onWebViewCreated: (InAppWebViewController controller) {
                      webView = controller;
                    },
                    onProgressChanged:
                        (InAppWebViewController controller, int progress) {
                      setState(() {
                        this.progress = progress / 100;
                      });
                    },
                    androidOnPermissionRequest:
                        (InAppWebViewController controller, String origin,
                            List<String> resources) async {
                      return PermissionRequestResponse(
                          resources: resources,
                          action: PermissionRequestResponseAction.GRANT);
                    },
//                  androidOnGeolocationPermissionsShowPrompt:
//                      (InAppWebViewController controller, String origin) {
//                    return Future<GeolocationPermissionShowPromptResponse>();
//                  },
                  ),
                ),
              ),
              Container(
                  //padding: EdgeInsets.all(10.0),
                  child: progress < 1.0
                      ? LinearProgressIndicator(value: progress)
                      : Container()),
            ],
          ),
        ),
//        floatingActionButton: FloatingActionButton(
//          backgroundColor: Colors.blue,
//          child: Icon(Icons.arrow_back),
//          onPressed: () {
//            if (webView != null) {
//              webView.goBack();
//            }
//          },
//        ),
      ),
    );
  }
}
