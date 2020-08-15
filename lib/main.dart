import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'webview_android.dart';
import 'webview_ios.dart';

String url = "http://pragathiinfotech.com:9494/";
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await Permission.camera.request();
  // await Permission.location.request();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Platform.isIOS ? InAppWebViewPage() : WebViewPlugin(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}
