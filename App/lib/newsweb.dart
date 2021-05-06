import 'package:flap/constant.dart';
import 'package:flap/goals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'globals.dart' as globals;
class DescriptionPage extends StatelessWidget {
  static String tag = 'description-page';
  DescriptionPage(this.urlnews);
  final String urlnews;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: new AppBar(
          leading: IconButton(
            icon:Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          backgroundColor: globals.isDark?darkcolor:lightcolor,
          title: new Text(
            "Full Article",
            style: GoogleFonts.getFont('Didact Gothic',color:Colors.white ,fontWeight: FontWeight.bold,fontSize: 26),
          ),
          iconTheme: IconThemeData(color: CupertinoColors.white),
        ),
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