import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:greedy/config/app.dart';
import 'package:greedy/views/index.dart';
import 'package:greedy/views/launch.dart';

void main() => runApp(createApp());

class createApp extends StatelessWidget {
  createApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    App.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '咔哩吧',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(App.color)
      ),
      onGenerateRoute: App.router.generator,
      home: new LaunchPage()
    );
  }
}
