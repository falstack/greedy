import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:greedy/config/app.dart';

class MainUser extends StatefulWidget {
  MainUser({Key key}) : super(key: key);

  @override
  _MainUserState createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {

  void _handleLogout() {
    App.router.navigateTo(context, '/login', transition: TransitionType.fadeIn, replace: true, clearStack: true);
  }

  void _handleToLaunch() {
    App.router.navigateTo(context, '/launch', transition: TransitionType.fadeIn, replace: true, clearStack: true);
  }

  void _handleToDemo() {
    App.router.navigateTo(context, '/demo', transition: TransitionType.native);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的')
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(onPressed: _handleLogout, child: Text('退出登录')),
          RaisedButton(onPressed: _handleToLaunch, child: Text('去看开屏')),
          RaisedButton(onPressed: _handleToDemo, child: Text('demo列表'))
        ],
      ),
    );
  }
}
