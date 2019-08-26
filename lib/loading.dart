import 'package:flutter/material.dart';

import './app.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingState createState() => new _LoadingState();
}

class _LoadingState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(Duration(seconds: 1), () {
      print("flutter 要跳转了");
      Navigator.of(context).pushReplacementNamed("app");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Stack(
        children: <Widget>[
          Image.asset("images/loading.jpg", fit: BoxFit.cover,),
        ],
      ),
    );
  }
}