import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Titals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return new Row(
      children: <Widget>[
        Expanded(
          child: new Container(
            alignment: Alignment(3.5, 0),
            padding: new EdgeInsets.fromLTRB(0.0, ScreenUtil().setHeight(40), 0.0, ScreenUtil().setWidth(20)),
            child: Image.asset(
              "images/yellow.png",
              width: ScreenUtil().setWidth(40),
              height: ScreenUtil().setHeight(40),
            ),
          ),
        ),
        Expanded(
          child: new Container(
            alignment: Alignment(1, 0),
            padding: new EdgeInsets.fromLTRB(0.0, ScreenUtil().setHeight(40), 0.0, ScreenUtil().setWidth(20)),
            child: Image.asset(
              "images/orange.png",
              width: ScreenUtil().setWidth(40),
              height: ScreenUtil().setHeight(40),
            ),
          ),
        ),
        Expanded(
          child: new Container(
            alignment: Alignment.center,
            padding: new EdgeInsets.fromLTRB(0.0, ScreenUtil().setHeight(40), 0.0, ScreenUtil().setWidth(20)),
            child: new Text("精选好货", style: new TextStyle(
              fontSize: ScreenUtil().setSp(32),
              color: const Color(0xFFF47036),
            ),),
          ),
        ),
        Expanded(
          child: new Container(
            alignment: Alignment(-1, 0),
            padding: new EdgeInsets.fromLTRB(0.0, ScreenUtil().setHeight(40), 0.0, ScreenUtil().setWidth(20)),
            child: Image.asset(
              "images/orange.png",
              width: ScreenUtil().setWidth(40),
              height: ScreenUtil().setHeight(40),
            ),
          ),
        ),
        Expanded(
          child: new Container(
            alignment: Alignment(-3.5, 0),
            padding: new EdgeInsets.fromLTRB(0.0, ScreenUtil().setHeight(40), 0.0, ScreenUtil().setWidth(20)),
            child: Image.asset(
              "images/yellow.png",
              width: ScreenUtil().setWidth(40),
              height: ScreenUtil().setHeight(40),
            ),
          ),
        ),
      ],
    );
  }
}