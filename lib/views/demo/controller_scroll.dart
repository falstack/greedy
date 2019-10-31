import 'package:flutter/material.dart';
import 'dart:math' as math;

class ScrollControllerDemo extends StatefulWidget {
  ScrollControllerDemo({Key key}) : super(key: key);

  @override
  _ScrollControllerDemoState createState() => _ScrollControllerDemoState();
}

class _ScrollControllerDemoState extends State<ScrollControllerDemo> {
  GlobalKey scrollKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  bool isEnd = false;

  List<_ItemModel> dataList = List();

  double offset = 0;

  String notify = '';

  _scrollToIndex() {
    var key = dataList[12];

    ///获取 renderBox
    RenderBox renderBox = key.globalKey.currentContext.findRenderObject();

    ///获取位置偏移，基于 ancestor: SingleChildScrollView 的 RenderObject()
    double dy = renderBox.localToGlobal(Offset.zero, ancestor: scrollKey.currentContext.findRenderObject()).dy;

    ///计算真实位移
    var offset = dy + _scrollController.offset;

    _scrollController.animateTo(offset, duration: Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  void initState() {
    dataList.clear();
    for (int i = 0; i < 100; i++) {
      dataList.add(_ItemModel(i));
    }
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        offset = _scrollController.offset;
        isEnd = _scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollListenerDemoPage"),
      ),
      body: Container(
        child: NotificationListener(
          onNotification: (notification) {
            String notify = "";
            if (notification is ScrollEndNotification) {
              notify = "ScrollEnd";
            } else if (notification is ScrollStartNotification) {
              notify = "ScrollStart";
            } else if (notification is UserScrollNotification) {
              notify = "UserScroll";
            } else if (notification is ScrollUpdateNotification) {
              notify = "ScrollUpdate";
            }
            setState(() {
              this.notify = notify;
            });
            return false;
          },
          child: SingleChildScrollView(
            key: scrollKey,
            controller: _scrollController,
            child: Column(
              children: dataList.map<Widget>((data) {
                return _CardItem(data, key: dataList[data.index].globalKey);
              }).toList(),
            ),
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        FlatButton(
          onPressed: () {
            _scrollController.animateTo(0, duration: Duration(seconds: 1), curve: Curves.bounceInOut);
          },
          child: Text("position: ${offset.floor()}"),
        ),
        Container(width: 0.3, height: 30.0),
        FlatButton(
          onPressed: () async {
            _scrollToIndex();
          },
          child: Text(notify),
        ),
        Visibility(
          visible: isEnd,
          child: FlatButton(
            onPressed: () {},
            child: Text("到达底部"),
          ),
        )
      ],
    );
  }
}

class _CardItem extends StatelessWidget {

  final random = math.Random();

  final _ItemModel data;

  _CardItem(this.data, {key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: data.height,
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.all(5),
          child: Text("Item ${data.index}"),
        ),
      ),
    );
  }
}

class _ItemModel {
  ///这个key是关键
  GlobalKey globalKey = GlobalKey();

  ///可以添加你的代码
  final int index;
  final double height = math.max(300 * math.Random().nextDouble(), 50.0);

  _ItemModel(this.index);
}
