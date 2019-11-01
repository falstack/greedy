import 'package:flutter/material.dart';

class HeroImagePreviewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HonorDemoPage"),
      ),
      body: Container(
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => _HonorPage(),
                fullscreenDialog: true)
              );
            },
            /// Hero  tag 共享
            child: Hero(
              tag: "image",
              child: Image.asset(
                "assets/images/pic3.jpg",
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HonorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          alignment: Alignment.center,
          child: Hero(
            tag: "image",
            child: Image.asset(
              "assets/images/pic3.jpg",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
            ),
          ),
        ),
      ),
    );
  }
}
