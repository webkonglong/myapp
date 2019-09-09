import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ajax.dart';

class Goodsinfo extends StatefulWidget {
  final String name;
  final Map<String, dynamic> value;
  Goodsinfo({this.name, this.value});

  @override
  GoodsinfoState createState() {
    return GoodsinfoState();
  }
}

class GoodsinfoState extends State<Goodsinfo> {
  List<Widget> swiperImageList = List();
  List<Widget> pcDescContentWidget = List();
  var pcDescContent = "";

  var goodsP = 0;

  @override
  void initState() {
    renderSwiperWidget();
    if (widget.name == "dialog") {
      getGoodsPcDescContent(widget.value['tao_id']);
    } else {
      pcDescContent = widget.value['pcDescContent'];
      renderPcDescContentWidget();
    }
    super.initState();
  }

  renderSwiperWidget () {
    var small_images_list = widget.value['small_images'].split("|");
    for (var i = 0; i < small_images_list.length; i++) {
      if (small_images_list[i] != "") {
        swiperImageList.add(Image.network(
          small_images_list[i],
          fit: BoxFit.fill,
          // width: ScreenUtil().setWidth(750),
        ));
      }
    }
  }

  Widget renderPcDescContentWidget () {
    var pcDescContentImgList = pcDescContent.split("|");
    for (var i = 0; i < pcDescContentImgList.length; i++) {
      if (pcDescContentImgList[i] != "") {
        pcDescContentWidget.add(Image.network(
          "https:" + pcDescContentImgList[i],
          width: ScreenUtil().setWidth(750),
        ));
      }
    }

    var content = new Column(
      children: pcDescContentWidget,
    );
    return content;
  }

  getGoodsPcDescContent(String id) {
    ajax.get("https://api.m.taobao.com/h5/mtop.taobao.detail.getdesc/6.0/", {
      "data": '{"id":"$id"}',
    }, (resp) {
      goodsP = 100;
      var pcDescContentArr = resp['data']['pcDescContent'].split('src="');

      for (var i = 1; i < pcDescContentArr.length; i++) {
        pcDescContent = pcDescContent + pcDescContentArr[i].split('" size="')[0];
        pcDescContent = pcDescContent + "|";
      }

      setState(() {
        pcDescContent = pcDescContent;
      });
    }, error: (err) {
      if (goodsP < 50) {
        goodsP += 1;
        getGoodsPcDescContent(id);
      }
    });

  }

  _launchURL() async {
    print("open 手淘");
    // const url = 'https://apps.apple.com/cn/app/%E6%89%8B%E6%9C%BA%E6%B7%98%E5%AE%9D-%E6%B7%98%E5%88%B0%E4%BD%A0%E8%AF%B4%E5%A5%BD/id387682726';
    const url = "weixin://";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget swiperView () {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: ScreenUtil().setHeight(496),
      height: ScreenUtil().setHeight(536),
      child: Swiper(
        itemCount: widget.value['small_images'].split("|").length,
        autoplay: true,
        itemBuilder: _swiperBuilder,
        autoplayDisableOnInteraction: true,
        loop: true,
        scrollDirection: Axis.horizontal,
        pagination: SwiperPagination(
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.fromLTRB(0.0, 0.0, ScreenUtil().setWidth(20), ScreenUtil().setHeight(20)),
          builder: DotSwiperPaginationBuilder(
            color: Colors.black54,
            activeColor: Colors.black
          ),
        ),
        controller: SwiperController(),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return swiperImageList[index];
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('详情'),
      ),
      body: new ListView(
        children: <Widget>[
          swiperView(),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(
                    widget.value['user_type'] == 0 ? "images/tb.png" : "images/tm.png",
                    width: ScreenUtil().setWidth(88),
                    height: ScreenUtil().setHeight(88),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(602),
                    margin: new EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), ScreenUtil().setHeight(20), 0.0, ScreenUtil().setHeight(20)),
                    child: Text(
                      widget.value['tao_title'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(28),
                        color: Color(0xFF535353),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(90),
                    height: ScreenUtil().setHeight(36),
                    margin: new EdgeInsets.fromLTRB(ScreenUtil().setWidth(14), 0.0, 0.0, 0.0),
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      border: new Border.all(width: 1, color: Color(0xFFFC5032)),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "劵后价",
                      style: TextStyle(
                        color: Color(0xFFFC5032),
                        fontSize: ScreenUtil().setSp(24),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    " ￥ ",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(24),
                      color: Color(0xFFFC5032),
                    ),
                  ),
                  Text(
                    widget.value['quanhou_jiage'] + " ",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(32),
                      color: Color(0xFFFC5032),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Container(
                margin: new EdgeInsets.fromLTRB(0.0, ScreenUtil().setHeight(14), 0.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.fromLTRB(ScreenUtil().setWidth(14), 0.0, 0.0, 0.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "现价 ￥ ",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(28),
                              color: Color(0xFFA1A1A1),
                            ),
                          ),
                          Text(
                            widget.value['size'],
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(28),
                              color: Color(0xFFA1A1A1),
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Color(0xFFA1A1A1),
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: new EdgeInsets.fromLTRB(0.0, 0.0, ScreenUtil().setWidth(14), 0.0),
                      child: Text(
                        "已售" + widget.value['sellCount'] + "件",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(28),
                          color: Color(0xFFA1A1A1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: new EdgeInsets.fromLTRB(0.0, ScreenUtil().setHeight(20), 0.0, 0.0),
            child: renderPcDescContentWidget(),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        child: Container(
          width: ScreenUtil().setWidth(750),
          height: ScreenUtil().setHeight(100),
          alignment: Alignment.center,
          decoration: new BoxDecoration(
            color: Color(0xFFFC5032),
          ),
          child: Text(
            "去领劵",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(32),
              color: Colors.white,
            ),
          ),
        ),
        onTap: () {
          _launchURL();
        },
      ),
    );
  }
}