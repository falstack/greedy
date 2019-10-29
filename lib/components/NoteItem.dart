import 'package:flutter/material.dart';

class NoteItem extends StatefulWidget {
  NoteItem(this.note);

  final Map note;

  @override
  _NoteItemState createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('')
      ),
    );
  }
}
