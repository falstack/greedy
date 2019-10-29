import 'package:flutter/material.dart';

class MainNotice extends StatefulWidget {
  MainNotice({Key key}) : super(key: key);

  @override
  _MainNoticeState createState() => _MainNoticeState();
}

List<Container> _buildGridTileList(int count) {

  return new List<Container>.generate(
      count,
          (int index) =>
      new Container(child: new Image.asset('assets/images/pic${index}.jpg')));
}

Widget _buildGrid() {
  return new GridView.extent(
      maxCrossAxisExtent: 150.0,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: _buildGridTileList(10));
}

class _MainNoticeState extends State<MainNotice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('消息')
      ),
      body: new Center(
        child: _buildGrid(),
      ),
    );
  }
}
