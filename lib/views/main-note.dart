import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:greedy/config/app.dart';

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
      floatingActionButton: new FloatingActionButton(
        tooltip: '发帖', // used by assistive technologies
        child: new Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          App.router.navigateTo(context, '/webview', transition: TransitionType.native);
        },
      ),
    );
  }
}
