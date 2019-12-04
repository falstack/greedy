import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:greedy/config/app.dart';
import 'package:greedy/views/index.dart' show demoWidgets;

class DemoPage extends StatefulWidget {
  DemoPage({Key key}) : super(key: key);

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('demo')
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                App.router.navigateTo(context, demoWidgets[index]['path'], transition: TransitionType.native);
              },
              child: Card(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: Text(demoWidgets[index]['name']),
                ),
              ),
            );
          },
          itemCount: demoWidgets.length,
        ),
      ), //
    );
  }
}
