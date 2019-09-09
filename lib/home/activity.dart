import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../event.dart';

class Activity extends StatefulWidget {
  @override
  _ActivityState createState() {
    return _ActivityState();
  }
}

class _ActivityState extends State<Activity> {

  @override
  Widget build (BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return new Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            padding: new EdgeInsets.fromLTRB(ScreenUtil().setWidth(5), ScreenUtil().setHeight(20), ScreenUtil().setWidth(5), 0.0),
            child: GestureDetector(
              child: Container(
                  height: ScreenUtil().setHeight(340),
                  padding: new EdgeInsets.fromLTRB(ScreenUtil().setWidth(16), ScreenUtil().setHeight(20), ScreenUtil().setWidth(16), 0.0),
                  decoration: new BoxDecoration(
                      color: const Color(0xFF949494),
                      borderRadius: BorderRadius.only(
                        topLeft: new Radius.circular(10.0),
                        topRight: new Radius.circular(10.0),
                        bottomLeft: new Radius.circular(10.0),
                        bottomRight: new Radius.circular(10.0),
                      ),
                      gradient: LinearGradient(colors: [const Color(0xFFF48364), const Color(0xFFF4546C)])
                  ),
                  child: new Column(
                    children: <Widget>[
                      new Text("品牌精选", style: new TextStyle(
                        fontSize: ScreenUtil().setSp(32),
                        color: const Color(0xFFFFFFFF),
                      ),),
                      new Text("爆单精选", style: new TextStyle(
                          fontSize: ScreenUtil().setSp(28),
                          color: const Color(0xFFFFFFFF)
                      ),),
                      Expanded(
                        child: Image.asset(
                          "images/222.jpg",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  )
              ),
              onTap: () {
                bus.emit("active", "品牌精选");
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: new EdgeInsets.fromLTRB(ScreenUtil().setWidth(5), ScreenUtil().setHeight(20), ScreenUtil().setWidth(5), 0.0),
            child: GestureDetector(
              child: Container(
                height: ScreenUtil().setHeight(340),
                padding: new EdgeInsets.fromLTRB(ScreenUtil().setWidth(16), ScreenUtil().setHeight(20), ScreenUtil().setWidth(16), 0.0),
                decoration: new BoxDecoration(
                    color: const Color(0xFF949494),
                    borderRadius: BorderRadius.only(
                      topLeft: new Radius.circular(10.0),
                      topRight: new Radius.circular(10.0),
                      bottomLeft: new Radius.circular(10.0),
                      bottomRight: new Radius.circular(10.0),
                    ),
                    gradient: LinearGradient(colors: [const Color(0xFFF4546C), const Color(0xFFF48364)])
                ),
                child: new Column(
                  children: <Widget>[
                    new Text("天猫超市", style: new TextStyle(
                      fontSize: ScreenUtil().setSp(32),
                      color: const Color(0XFFFFFFFF),
                    ),),
                    new Text("限时折扣", style: new TextStyle(
                        fontSize: ScreenUtil().setSp(28),
                        color: const Color(0xFFFFFFFF)
                    ),),
                    Expanded(
                      child: Image.asset(
                        "images/333.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                bus.emit("active", "天猫超市");
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            child: Container(
              padding: new EdgeInsets.fromLTRB(ScreenUtil().setWidth(5), ScreenUtil().setHeight(20), ScreenUtil().setWidth(5), 0.0),
              child: Container(
                height: ScreenUtil().setHeight(340),
                padding: new EdgeInsets.fromLTRB(ScreenUtil().setWidth(16), ScreenUtil().setHeight(20), ScreenUtil().setWidth(16), 0.0),
                decoration: new BoxDecoration(
                  color: const Color(0xFF949494),
                  borderRadius: BorderRadius.only(
                    topLeft: new Radius.circular(10.0),
                    topRight: new Radius.circular(10.0),
                    bottomLeft: new Radius.circular(10.0),
                    bottomRight: new Radius.circular(10.0),
                  ),
                  gradient: LinearGradient(colors: [const Color(0xFF5E56FA), const Color(0xFFF57AF7)]),
                ),
                child: new Column(
                  children: <Widget>[
                    new Text("大额优惠劵", style: new TextStyle(
                      fontSize: ScreenUtil().setSp(32),
                      color: const Color(0xFFFFFFFF),
                    ),),
                    new Text("挥泪甩卖", style: new TextStyle(
                        fontSize: ScreenUtil().setSp(28),
                        color: const Color(0xFFFFFFFF)
                    ),),
                    Expanded(
                      child: Image.asset(
                        "images/111.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              bus.emit("active", "大额优惠劵");
            },
          ),
        ),
      ],
    );
  }
}