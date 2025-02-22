import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:greedy/components/FlowList.dart';
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
    return DefaultTabController(
      initialIndex: 1,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: App.color,
            tabs: tabs.map((item) {
              return Tab(
                  text: item
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: tabs.map((item) {
            return FlowList();
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: '发帖', // used by assistive technologies
          child: Icon(Icons.palette),
          backgroundColor: App.color,
          onPressed: () {
            App.router.navigateTo(context, '/webview?title=${Uri.encodeComponent('测试title')}&url=${Uri.encodeComponent('https://www.baidu.com')}', transition: TransitionType.native);
          },
        ),
      ),
    );
  }
}
