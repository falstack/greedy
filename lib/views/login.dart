import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:greedy/config/app.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text("这是登录界面"),
          new RaisedButton(
            child: new Text("点击登录成功，跳转到主页"),
            onPressed: () {
              App.router.navigateTo(context, '/home', transition: TransitionType.fadeIn, replace: true, clearStack: true);
            },
          )
        ],
      ),
    );
  }
}
