import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './goodsinfo/goodsinfo.dart';

dialog (BuildContext context, Map<String, dynamic> goods) async {
  ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

  await showDialog(
      context: context,
      builder: (_) {
        return Center(
          child: Container(
            margin: new EdgeInsets.fromLTRB(0.0, ScreenUtil().setHeight(366), 0.0, 0.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(614),
                  height: ScreenUtil().setHeight(250),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  padding: new EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), ScreenUtil().setHeight(10), ScreenUtil().setWidth(20), ScreenUtil().setHeight(10)),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            margin: new EdgeInsets.fromLTRB(0.0, 0.0, ScreenUtil().setWidth(10), 0.0),
                            child: Image.network(
                              goods['pict_url'],
                              width: ScreenUtil().setWidth(160),
                              height: ScreenUtil().setHeight(160),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                width: ScreenUtil().setWidth(400),
                                margin: new EdgeInsets.fromLTRB(0.0, ScreenUtil().setHeight(10), 0.0, 0.0),
                                child: Text(
                                  goods['title'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(28),
                                    color: Color(0xFF6d6969),
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Container(
                                width: ScreenUtil().setWidth(400),
                                margin: new EdgeInsets.fromLTRB(0.0, ScreenUtil().setHeight(40), 0.0, 0.0),
                                child: new Row(
                                  children: <Widget>[
                                    Text(
                                      '劵后 ￥ ',
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(24),
                                        color: Color(0xFFA1A1A1),
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      goods['quanhou_jiage'] +" ",
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(32),
                                        color: Color(0xFF464646),
                                        fontWeight: FontWeight.w800,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              width: ScreenUtil().setWidth(260),
                              height: ScreenUtil().setHeight(50),
                              margin: new EdgeInsets.fromLTRB(0.0, ScreenUtil().setHeight(10), ScreenUtil().setWidth(50), 0.0),
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                border: new Border.all(width: 1, color: Color(0xFFFC5032)),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "查看详情",
                                style: TextStyle(
                                  color: Color(0xFFFC5032),
                                  fontSize: ScreenUtil().setSp(28),
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
                                return new Goodsinfo(
                                  name: "dialog",
                                  value: goods,
                                );
                              }));
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              width: ScreenUtil().setWidth(260),
                              height: ScreenUtil().setHeight(50),
                              margin: new EdgeInsets.fromLTRB(0.0, ScreenUtil().setHeight(10), 0.0, 0.0),
                              decoration: new BoxDecoration(
                                color: Color(0xFFFC5032),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                border: new Border.all(width: 1, color: Color(0xFFFC5032)),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "去领劵",
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: ScreenUtil().setSp(28),
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            onTap: () {
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    margin: new EdgeInsets.fromLTRB(0.0, ScreenUtil().setHeight(60), 0.0, 0.0),
                    child: Image.asset(
                      "images/dialog_close.png",
                      width: ScreenUtil().setWidth(80),
                      height: ScreenUtil().setHeight(80),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      }
  );
}