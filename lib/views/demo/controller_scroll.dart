import 'package:flutter/material.dart';

class ScrollControllerDemo extends StatefulWidget {
  ScrollControllerDemo({Key key}) : super(key: key);

  @override
  _ScrollControllerDemoState createState() => _ScrollControllerDemoState();
}

class _ScrollControllerDemoState extends State<ScrollControllerDemo> {
  final ScrollController _scrollController = ScrollController();

  bool isEnd = false;

  double offset = 0;

  String notify = '';

  @override
  void initState() {
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
          child: ListView.builder(
            controller: _scrollController,
            itemCount: 50,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  child: Text("Item $index"),
                ),
              );
            },
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
          onPressed: () {},
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
