import 'package:flutter/material.dart';

class MainZone extends StatefulWidget {
  MainZone({Key key}) : super(key: key);

  @override
  _MainZoneState createState() => _MainZoneState();
}

class _MainZoneState extends State<MainZone> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分区')
      ),
    );
  }
}
