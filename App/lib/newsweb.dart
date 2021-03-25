import 'package:flap/goals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class DescriptionPage extends StatelessWidget {
  static String tag = 'description-page';
  DescriptionPage(this.urlnews);
  final String urlnews;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Full Article",
          style: plStyle.copyWith(fontSize: 25),
        ),
        iconTheme: IconThemeData(color: CupertinoColors.white),
        backgroundColor: Color.fromRGBO(55, 0, 60, 1),
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: WebviewScaffold(
          url: urlnews,
        ),
      ),
    );
  }
}