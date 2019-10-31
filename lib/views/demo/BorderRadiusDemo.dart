import 'package:flutter/material.dart';

class BorderRadiusDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BorderRadiusDemo')
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("BoxDecoration 圆角"),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/pic0.jpg"),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50.0))
              ),
            ),
            Text("BoxDecoration 圆角对 child"),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(50.0))
              ),
              child: Image.asset(
                "assets/images/pic0.jpg",
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
            Text("ClipRRect 圆角对 child"),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              child: Image.asset(
                "assets/images/pic0.jpg",
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
