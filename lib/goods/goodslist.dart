import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../event.dart';
import '../goodsinfo/goodsinfo.dart';

class GoodList extends StatefulWidget {
  @override
  _GoodListState createState() {
    return _GoodListState();
  }
}

class _GoodListState extends State<GoodList> {
  var _goodList = [];
  var _page = 1;
  var _initUrl = "https://api.zhetaoke.com:10003/api/api_quanwang.ashx?appkey=f1c7c24c8e0c43a0860799a0448ff523&page_size=20&sort=sale_num_desc&q=";
  var _url = "https://api.zhetaoke.com:10001/api/api_shishi.ashx?appkey=f1c7c24c8e0c43a0860799a0448ff523&sort=sale_num_desc&today=1&page_size=20";
  var _nav = "综合";
  var _tianmaochaoshi = "https://api.zhetaoke.com:10001/api/api_all.ashx?appkey=f1c7c24c8e0c43a0860799a0448ff523&page_size=20&sort=sale_num_desc&tianmaochaoshi=1";
  var _daejuan = "https://api.zhetaoke.com:10001/api/api_all.ashx?appkey=f1c7c24c8e0c43a0860799a0448ff523&page_size=20&sort=sale_num_desc&coupon_amount_start=100";
  var _pinpai = "https://api.zhetaoke.com:10001/api/api_all.ashx?appkey=f1c7c24c8e0c43a0860799a0448ff523&page_size=20&sort=sale_num_desc&&cid=0&pinpai=1";
  var _loadingShow = true;

  _getGoodList () async {
    var url = "$_url&page=$_page";
    var httpClient = new HttpClient();
    List result;
    var totalArr = [];
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        result = data['content'];
      } else {
        print("server error");
      }
    } catch (exception) {
      print("server error");
    }

    if (result != null) {
      _goodList.addAll(result);
      if (!mounted) return;
      setState(() {
        _loadingShow = false;
        _goodList = _goodList;
      });
    } else {
      print(result);
    }
  }

  initState() {
    _getGoodList();
    bus.on("type", (text) {
      if (_nav != text) {
        _page = 1;
        _goodList = [];
        setState(() {
          _loadingShow = true;
        });
        _nav = text;
        _url = text == '综合' ? "https://api.zhetaoke.com:10001/api/api_shishi.ashx?appkey=f1c7c24c8e0c43a0860799a0448ff523&sort=sale_num_desc&today=1&page_size=20" : _initUrl + text;
        _getGoodList();
      }
    });

    bus.on("active", (text) {
      if (_nav != text) {
        _page = 1;
        _goodList = [];
        bus.emit("deleteNavClass", "-1");
        bus.emit("delectInputVlaue", "-1");
        if (text == "品牌精选") {
          _url = _pinpai;
        }
        if (text == "天猫超市") {
          _url = _tianmaochaoshi;
        }
        if (text == "大额优惠劵") {
          _url = _daejuan;
        }
        _nav = text;
        setState(() {
          _loadingShow = true;
        });
        _getGoodList();
      }
    });
  }

  void dispose () {
    bus.off("active");
    bus.off("type");
    bus.off("deleteNavClass");
    super.dispose();
  }

  Widget goodListWidget () {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    List<Widget> goodArrWidget = [];
    Widget content;

    for (var item in _goodList) {
      goodArrWidget.add(
        GestureDetector(
          child: new Container (
            constraints: new BoxConstraints.expand(
              height: ScreenUtil().setHeight(180),
            ),
            padding: new EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), ScreenUtil().setHeight(20), ScreenUtil().setWidth(20), ScreenUtil().setHeight(20)),
            margin: new EdgeInsets.fromLTRB(0.0, ScreenUtil().setHeight(20), 0.0, 0.0),
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(new Radius.circular(6.0)),
              color: Color(0xFFFFFFFF),
            ),
            child: new Row(
              children: <Widget>[
                new Row(
                    children: <Widget>[
                      Image.network(
                        item['pict_url'],
                        width: ScreenUtil().setWidth(160),
                        height: ScreenUtil().setHeight(160),
                      ),
                      new Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              Container(
                                margin: new EdgeInsets.fromLTRB(ScreenUtil().setWidth(10), 0.0, ScreenUtil().setWidth(10), 0.0),
                                child: Image.asset(
                                  item['user_type'] == 0 ? "images/tb.png" : "images/tm.png",
                                  width: ScreenUtil().setWidth(40),
                                  height: ScreenUtil().setHeight(40),
                                ),
                              ),
                              Container(
                                width: ScreenUtil().setWidth(466),
                                child: Text(
                                  item['title'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(28),
                                    color: Color(0xFF333333),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            width: ScreenUtil().setWidth(510),
                            margin: new EdgeInsets.fromLTRB(0.0, ScreenUtil().setHeight(16), 0.0, ScreenUtil().setHeight(18)),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  decoration: new BoxDecoration(
                                    border: new Border.all(width: 1.0, color: const Color(0xFFFC5032)),
                                  ),
                                  width: ScreenUtil().setWidth(240), // 240
                                  height: ScreenUtil().setHeight(34),
                                  child: new Row(
                                    children: <Widget>[
                                      Container(
                                        color: Color(0xFFFC5032),
                                        width: ScreenUtil().setWidth(50),
                                        height: ScreenUtil().setHeight(40),
                                        child: Text(
                                          "劵",
                                          style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontSize: ScreenUtil().setSp(28),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        width: ScreenUtil().setWidth(180),
                                        height: ScreenUtil().setHeight(40),
                                        child: new Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              item['coupon_info_money'],
                                              style: TextStyle(
                                                color: Color(0xFFFC5032),
                                                fontSize: ScreenUtil().setSp(32),
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                            Text(
                                              "元",
                                              style: TextStyle(
                                                color: Color(0xFFFC5032),
                                                fontSize: ScreenUtil().setSp(28),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "已售" + item['sellCount'] + "件",
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(28),
                                    color: Color(0xFFA1A1A1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: ScreenUtil().setWidth(510),
                            child: new Row(
                              children: <Widget>[
                                Text(
                                  '劵后 ￥ ',
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(24),
                                    color: Color(0xFFA1A1A1),
                                  ),
                                ),
                                Text(
                                  item['quanhou_jiage'] + " ",
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(32),
                                    color: Color(0xFF464646),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  " ￥ ",
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(24),
                                    color: Color(0xFFA1A1A1),
                                  ),
                                ),
                                Text(
                                  item['size'],
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(24),
                                    color: Color(0xFFA1A1A1),
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Color(0xFFA1A1A1),
                                    decorationStyle: TextDecorationStyle.solid,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
              ],
            ),
          ),
          onTap: () {
            Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
              return new Goodsinfo(
                name: "goods",
                value: item,
              );
            }));
          },
        )
      );
    }

    goodArrWidget.add(
      GestureDetector(
        child: Container(
          padding: new EdgeInsets.fromLTRB(0.0, ScreenUtil().setHeight(20), 0.0, 0.0),
          child: Text("加载更多"),
        ),
        onTap: () {
          _page += 1;
          _getGoodList();
        },
      ),
    );
    content = new Column(
      children: goodArrWidget,
    );
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return _loadingShow ? Container(
      padding: new EdgeInsets.fromLTRB(0.0, ScreenUtil().setHeight(20), 0.0, 0.0),
      alignment: Alignment.center,
      child: Text(
        "加载中...请稍后...",
        style: TextStyle(
          fontSize: ScreenUtil().setSp(24),
          color: Color(0xFFA1A1A1),
        ),
      ),
    ) : goodListWidget();
  }
}