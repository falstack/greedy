import 'package:flutter/material.dart';

class MainZone extends StatefulWidget {
  MainZone({Key key}) : super(key: key);

  @override
  _MainZoneState createState() => _MainZoneState();
}

class _MainZoneState extends State<MainZone> {
  int _counter = 0;

  void _handleClick() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分区')
      ),
      body: Center(
        child: RaisedButton(onPressed: _handleClick, child: Text('$_counter' + '${_counter.isOdd ? '哈哈' : '呵呵'}')),
      )
    );
  }
}
