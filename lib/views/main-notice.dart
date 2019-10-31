import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:greedy/config/app.dart';
import 'package:greedy/views/index.dart' show demoWidgets;

class MainNotice extends StatefulWidget {
  MainNotice({Key key}) : super(key: key);

  @override
  _MainNoticeState createState() => _MainNoticeState();
}

class _MainNoticeState extends State<MainNotice> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('消息')
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
