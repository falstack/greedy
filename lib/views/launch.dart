import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:greedy/config/app.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      App.router.navigateTo(context, '/login', transition: TransitionType.fadeIn, replace: true, clearStack: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: new Center(
        child: Image.asset(
          'assets/images/launch.jpeg',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width / 1.2
        ),
      ),
    );
  }
}
