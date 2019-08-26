import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import './app.dart';
import './loading.dart';
import './search.dart';

import './home/goodsbar.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: '聊天室',
  theme: mDefaultTheme,
  routes: <String, WidgetBuilder>{
//    "app": (BuildContext context) => new App(),
//    "/friends": (_) => new WebviewScaffold(
//      url: 'https://www.baidu,com',
//      appBar: new AppBar(
//        title: new Text('baidu'),
//      ),
//      withZoom: true,
//      withlocalStorage: true,
//    ),
//    "search": (BuildContext context) => new Search(),
  },
  home: new HomePage()
));

final ThemeData mDefaultTheme = new ThemeData(
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.white,
);