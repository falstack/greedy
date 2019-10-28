import 'package:flutter/material.dart';

class MainNote extends StatefulWidget {
  MainNote({Key key}) : super(key: key);

  @override
  _MainNoteState createState() => _MainNoteState();
}

class _MainNoteState extends State<MainNote> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发现')
      ),
    );
  }
}
