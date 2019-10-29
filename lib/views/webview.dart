import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Webview extends StatefulWidget {
  Webview({Key key, this.url, this.title}) : super(key: key);

  final String url;
  final String title;

  @override
  _WebviewState createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      print('url change:$url');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.title)
      ),
      body: WebviewScaffold(
        url: widget.url,
        withZoom: false,
        withLocalStorage: true,
        withJavascript: true,
      ),
    );
  }
}
