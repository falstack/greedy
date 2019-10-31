import 'package:flutter/material.dart';

/**
 * TODO：TextEditing 怎么 blur？
 */
class TextEditingControllerDemo extends StatelessWidget {
  final TextEditingController controller = TextEditingController(text: "init Text");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ControllerDemoPage"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Center(
          child: TextField(
            controller: controller,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("current Text ${controller.text}");
          controller.text = "Changed By FloatingActionButton";
        },
        child: Text("C"),
      ),
    );
  }
}
