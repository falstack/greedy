import 'package:flutter/material.dart';

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
    );
  }
}
