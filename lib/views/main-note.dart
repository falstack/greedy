import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:greedy/components/NoteItem.dart';
import 'package:greedy/config/app.dart';

class MainNote extends StatefulWidget {
  MainNote({Key key}) : super(key: key);

  @override
  _MainNoteState createState() => _MainNoteState();
}

class _MainNoteState extends State<MainNote> {
  static const tabs = [
    '关注',
    '发现',
    '动态',
    '热门',
    '漫友圈'
  ];

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      initialIndex: 1,
      length: tabs.length,
      child: new Scaffold(
        appBar: AppBar(
          bottom: new TabBar(
            isScrollable: true,
            indicatorColor: Theme.of(context).primaryColor,
            tabs: tabs.map((item) {
              return new Tab(
                  text: item
              );
            }).toList(),
          ),
        ),
        body: new TabBarView(
          children: tabs.map((item) {
            return new NoteItem({});
          }).toList(),
        ),
        floatingActionButton: new FloatingActionButton(
          tooltip: '发帖', // used by assistive technologies
          child: new Icon(Icons.palette),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            App.router.navigateTo(context, '/webview?title=${Uri.encodeComponent('测试title')}&url=${Uri.encodeComponent('https://www.baidu.com')}', transition: TransitionType.native);
          },
        ),
      ),
    );
  }
}
