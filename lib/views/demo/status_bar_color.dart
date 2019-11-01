import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarColorDemo extends StatefulWidget {
  StatusBarColorDemo({Key key}) : super(key: key);

  @override
  _StatusBarColorDemoState createState() => _StatusBarColorDemoState();
}

class _StatusBarColorDemoState extends State<StatusBarColorDemo> {
  bool customSystemUIOverlayStyle = false;

  @override
  Widget build(BuildContext context) {
    var body = getBody();
    ///如果手动设置过状态栏，就不可以用 AnnotatedRegion ，会影响
    if (customSystemUIOverlayStyle) {
      return body;
    }
    ///如果没有手动设置过状态栏，就可以用 AnnotatedRegion 直接嵌套显示
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: body,
    );
  }

  getBody() {
    return Scaffold(
      appBar: _ImageAppBar(),
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  ///手动修改
                  setState(() {
                    customSystemUIOverlayStyle = true;
                  });
                  SystemChrome.setSystemUIOverlayStyle(
                      SystemUiOverlayStyle.light);
                },
                child: Text("Light"),
                color: Colors.yellowAccent,
              ),
              SizedBox(
                width: 10,
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    customSystemUIOverlayStyle = true;
                  });
                  SystemChrome.setSystemUIOverlayStyle(
                      SystemUiOverlayStyle.dark);
                },
                child: Text("Dart"),
                color: Colors.greenAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImageAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/pic6.jpg",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: kToolbarHeight * 3,
          ),
          SafeArea(
            child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          )
        ],
      ),
    );
  }

  Size get preferredSize => Size.fromHeight(kToolbarHeight * 3);
}
