import 'package:flutter/material.dart';

class GestureDetectorFloatingTouchDemo extends StatefulWidget {
  GestureDetectorFloatingTouchDemo({Key key}) : super(key: key);

  @override
  _GestureDetectorFloatingTouchDemoState createState() => _GestureDetectorFloatingTouchDemoState();
}

class _GestureDetectorFloatingTouchDemoState extends State<GestureDetectorFloatingTouchDemo> {
  Offset offset = Offset(200, 200);

  final double height = 80;

  ///显示悬浮控件
  _showFloating() {
    var overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(builder: (context) {
      return Stack(
        children: <Widget>[
          Positioned(
            left: offset.dx,
            top: offset.dy,
            child: _buildFloating(overlayEntry),
          ),
        ],
      );
    });

    ///插入全局悬浮控件
    overlayState.insert(overlayEntry);
  }

  ///绘制悬浮控件
  _buildFloating(OverlayEntry overlayEntry) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onPanUpdate: (DragUpdateDetails details) {
        ///根据触摸修改悬浮控件偏移
        offset = offset + details.delta;
        overlayEntry.markNeedsBuild();
      },
      onPanEnd: (DragEndDetails details) {
        // TODO，把悬浮球吸附到左侧或右侧
      },
      onLongPress: () {
        overlayEntry.remove();
      },
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: height,
          width: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.all(Radius.circular(height / 2))),
          child: Text(
            "长按\n移除",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatingTouchDemoPage"),
      ),
      body: Container(
        child: Center(
          child: FlatButton(
              onPressed: () {
                _showFloating();
              },
              child: Text("显示悬浮")),
        ),
      ),
    );
  }
}
