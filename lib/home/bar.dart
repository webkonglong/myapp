import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../event.dart';

class Bar extends StatefulWidget {
  @override
  barState createState() {
    return barState();
  }
}

class barState extends State<Bar>  {
  final controller = TextEditingController();

  @override
  void initState () {
    bus.on("delectInputVlaue", (text) {
      if (controller.text != "") {
        controller.text = "";
      }
    });
  }

  @override
  void dispose () {
    bus.off("type");
    bus.off('deleteNavClass');
    bus.off('delectInputVlaue');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return new Container(
      constraints: new BoxConstraints.expand(
        height: ScreenUtil().setHeight(60),
      ),
      decoration: new BoxDecoration(
        border: new Border.all(width: 1.0, color: const Color(0xFFEDEDED)),
        borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
      ),
      padding: new EdgeInsets.fromLTRB(ScreenUtil().setWidth(24), 0.0, 0.0, 0.0),
      child: new Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: new TextField(
                controller: controller,
                style: new TextStyle(
                  color: const Color(0xFF949494),
                  fontSize: ScreenUtil().setSp(32),
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  hintText: '请输入关键词',
                  hintStyle: new TextStyle(
                    color: const Color(0xFF949494),
                    fontSize: ScreenUtil().setSp(28),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              margin: new EdgeInsets.fromLTRB(0.0, 0.0, ScreenUtil().setWidth(20), 0.0),
              child: Image.asset(
                "images/search_icon.png",
                width: ScreenUtil().setWidth(44),
                height: ScreenUtil().setHeight(44),
              ),
            ),
            onTap: () {
              bus.emit("type", controller.text);
              bus.emit("deleteNavClass", "-1");
            },
          ),
        ],
      ),
    );
  }
}