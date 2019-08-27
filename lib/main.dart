import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import './app.dart';
import './goodsinfo/goodsinfo.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'app',
  theme: mDefaultTheme,
  initialRoute: '/',
  routes: <String, WidgetBuilder>{
    '/': (BuildContext context) => new HomePage(),
    '/goodsinfo': (BuildContext context) => new Goodsinfo(),
  },
  // home: new HomePage()
));

final ThemeData mDefaultTheme = new ThemeData(
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.white,
);