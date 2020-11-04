import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatefulWidget {
  final brandName, brandUrl;

  // Constructor
  WebScreen({Key key, this.brandName, this.brandUrl}) : super(key: key);

  @override
  _WebScreenState createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.brandName} ${widget.brandUrl}")),
      body: SafeArea(
        child: WebView(
          initialUrl: widget.brandUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
