import 'package:flutter/material.dart';

/**
 * 个 CSS 的 translate 一样，没有改变流的位置，所以下面的文字并没有上移
 */
class TransformDemo extends StatefulWidget {
  TransformDemo({Key key}) : super(key: key);

  @override
  _TransformDemoState createState() => _TransformDemoState();
}

class _TransformDemoState extends State<TransformDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        title: Text("TransformDemoPage"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Card(
          margin: EdgeInsets.all(10),
          child: Container(
            height: 150,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Transform.translate(
                  offset: Offset(0, -30),
                  child: Container(
                    width: 72.0,
                    height: 72.0,
                    decoration: BoxDecoration(
                      ///阴影
                      boxShadow: [
                        BoxShadow(color: Theme.of(context).cardColor, blurRadius: 4.0)
                      ],
                      ///形状
                      shape: BoxShape.circle,
                      ///图片
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/pic1.jpg",
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Flutter is Google's portable UI toolkit for crafting "
                      "beautiful, natively compiled applications for mobile, "
                      "web, and desktop from a single codebase. ",
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 3,
                  style: TextStyle(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
