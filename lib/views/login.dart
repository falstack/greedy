import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:greedy/config/app.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  static const tabs = [
    '登录',
    '注册'
  ];

  @override
  void initState() {
    super.initState();
    _tabController =  TabController(vsync: this, length: tabs.length);// 和下面的 TabBar.tabs 数量对应
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 50.0, bottom: 20.0, left: 20.0, right: 20.0),
            decoration: BoxDecoration(
              color: App.color
            ),
            child: Image.asset('assets/images/login_bg.png', fit: BoxFit.contain),
          ),
//          Column(
//            children: <Widget>[
//              TabBar(
//                controller: _tabController,
//                tabs: tabs.map((item) {
//                  return Tab(
//                    text: item
//                  );
//                }).toList(),
//              ),
//              TabBarView(
//                controller: _tabController,
//                children: tabs.map((item) {
//                  return Text('2333');
//                }).toList(),
//              )
//            ],
//          ),
          RaisedButton(
            child: Text("点击登录成功，跳转到主页"),
            onPressed: () {
              App.router.navigateTo(context, '/home', transition: TransitionType.fadeIn, replace: true, clearStack: true);
            },
          )
        ],
      ),
    );
  }
}
