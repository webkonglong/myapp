import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './ajax.dart';

import './home/activity.dart';
import './home/title.dart';
import './home/bar.dart';
import './home/goodsbar.dart';
import './goods/goodslist.dart';

import './dialog.dart';

void main () => runApp(
  new MaterialApp(
    title: 'home页面',
    home: new HomePage(),
  ),
);

class HomePage extends StatefulWidget {
  @override
  HomePageState createState () {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;

  // var url = "https://api.zhetaoke.com:10001/api/open_gaoyongzhuanlian_tkl.ashx?appkey=f1c7c24c8e0c43a0860799a0448ff523&sid=%201804&pid=%20mm_114380434_13332882_53064493&tkl="+IdHCY9sQc8W+"&signurl=0";


  @override
  void initState () {
    _controller.addListener(() {
      if (_controller.offset < 500 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 500 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((callback) {
      analysisClipboard("https://item.taobao.com/item.htm?id=528445672970");
      // getClipboardDatas();
    });
  }

  @override
  void dispose () {
    _controller.dispose();
    super.dispose();
  }

  getClipboardDatas() async {
    var clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    if (clipboardData != null) {
      analysisClipboard(clipboardData.text);
    }
  }

  analysisClipboard (String text) {
    if (text.contains("http") && text.contains("id=") && text.contains("item.taobao.com")) {
      var id = text.split("id=")[1];
      ajax.get("api_detail.ashx", {
        "appkey": "f1c7c24c8e0c43a0860799a0448ff523",
        "tao_id": id.toString(),
      }, (goods) {
        getClipboardGoods(goods);
      });
    } else if (text.contains("\$") || text.contains("￥")) {
      var kl = "";
      if (text.contains("\$")) {
        kl = text.split("\$")[1];
      } else {
        kl = text.split("￥")[1];
      }
      ajax.get("open_shangpin_id.ashx", {
        "appkey": "f1c7c24c8e0c43a0860799a0448ff523",
        "sid": "1804",
        "content": kl,
        "type": "1",
      }, (info) {
        ajax.get("api_detail.ashx", {
          "appkey": "f1c7c24c8e0c43a0860799a0448ff523",
          "tao_id": info['item_id'],
        }, (goods) {
          getClipboardGoods(goods);
        });
      });
    }
  }

  getClipboardGoods (Map<String, dynamic> data) {
    dialog(context, data['content'][0]);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return  new Scaffold(
        appBar: AppBar(
          title: Container(
            child: new Bar(),
          )
        ),
        body: new Scrollbar(
          child: new Container(
            color: const Color(0xFFF1F1F1),
            padding: new EdgeInsets.fromLTRB(ScreenUtil().setWidth(12), ScreenUtil().setHeight(20), ScreenUtil().setWidth(12), ScreenUtil().setHeight(40)),
            child: new ListView(
              controller: _controller,
              children: <Widget>[
                Activity(),
                Titals(),
                Container(
                  child: new GoodsTypeBar()
                ),
                Container(
                  child: new GoodList(),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
        backgroundColor: Color(0xFFFC5032),
        mini: true,
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          _controller.animateTo(.0, duration: Duration(milliseconds: 200), curve: Curves.ease);
        },
      ),
    );
  }
}


    