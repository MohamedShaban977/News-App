import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_flutter/screenView/Widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String url;

  ArticleView({this.url});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyAppBar(),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Icon(
              Icons.web,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: WebView(
          initialUrl: widget.url,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
