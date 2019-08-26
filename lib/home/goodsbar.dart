import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../event.dart';

class GoodsTypeBar extends StatefulWidget {
  @override
  _GoodsTypeBarState createState() {
    return _GoodsTypeBarState();
  }
}

class _GoodsTypeBarState extends State<GoodsTypeBar> {
  int _index = 0;

  void _changeTab (int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  void initState () {
    bus.on("deleteNavClass", (text) {
      if (_index > -1) {
        setState(() {
          _index = -1;
        });
      }
    });
  }

  @override
  void dispose () {
    bus.off("type");
    bus.off("deleteNavClass");
    bus.off("delectInputVlaue");
    super.dispose();
  }

  @override
  Widget build (BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            child: GestureDetector(
              child: new Text("综合", style: new TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: Color(_index == 0 ? 0xFFF47036 : 0XFF484848),
              ),),
              onTap: () {
                _changeTab(0);
                bus.emit("type", "综合");
                bus.emit("delectInputVlaue", "-1");
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            child: GestureDetector(
              child: new Text("女装", style: new TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: Color(_index == 1 ? 0xFFF47036 : 0XFF484848),
              ),),
              onTap: () {
                _changeTab(1);
                bus.emit("type", "女装");
                bus.emit("delectInputVlaue", "-1");
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            child: GestureDetector(
              child: new Text("男装", style: new TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: Color(_index == 2 ? 0xFFF47036 : 0XFF484848),
              ),),
              onTap: () {
                _changeTab(2);
                bus.emit("type", "男装");
                bus.emit("delectInputVlaue", "-1");
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            child: GestureDetector(
              child: new Text("内衣", style: new TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: Color(_index == 3 ? 0xFFF47036 : 0XFF484848),
              ),),
              onTap: () {
                _changeTab(3);
                bus.emit("type", "内衣");
                bus.emit("delectInputVlaue", "-1");
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            child: GestureDetector(
              child: new Text("美妆", style: new TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: Color(_index == 4 ? 0xFFF47036 : 0XFF484848),
              ),),
              onTap: () {
                _changeTab(4);
                bus.emit("type", "化妆品");
                bus.emit("delectInputVlaue", "-1");
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            child: GestureDetector(
              child: new Text("鞋品", style: new TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: Color(_index == 5 ? 0xFFF47036 : 0XFF484848),
              ),),
              onTap: () {
                _changeTab(5);
                bus.emit("type", "鞋子");
                bus.emit("delectInputVlaue", "-1");
              },
            ),
          ),
        ),
      ],
    );
  }
}



