import 'package:flutter/material.dart';

class UserShow extends StatefulWidget {
  UserShow(this.slug);

  final String slug;

  @override
  _UserShowState createState() => _UserShowState();
}

class _UserShowState extends State<UserShow> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('用户详情页')
      ),
      body: Center(
        child: new Text('${widget.slug}'),
      ),
    );
  }
}
