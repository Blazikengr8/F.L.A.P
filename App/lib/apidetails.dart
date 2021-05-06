import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'constant.dart';
import 'globals.dart' as globals;
class ApiDetail extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(title: Text('API Information',style: globals.plStyle.copyWith(fontSize: 24,color: Colors.white),),backgroundColor: globals.isDark?darkcolor:lightcolor,)),
      backgroundColor: globals.isDark?darkbackground:Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text('News API',style: globals.plStyle.copyWith(fontSize: 24, ),),
            GestureDetector(
              onTap: _launchURL1,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  color: globals.isDark?darkcolor:lightcolor,
                  height: 70,
                  width:MediaQuery.of(context).size.width ,
                  child: Center(child: Text('Go to Website',style: globals.plStyle.copyWith(fontSize: 24,color: Colors.white),)),
                ),
              ),
            ),
            Text('Football Data API',style: globals.plStyle.copyWith(fontSize: 24, ),),
            GestureDetector(
              onTap: _launchURL,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  color: globals.isDark?darkcolor:lightcolor,
                  height: 70,
                  width:MediaQuery.of(context).size.width ,
                  child: Center(child: Text('Go to Website',style: globals.plStyle.copyWith(fontSize: 24,color: Colors.white),)),
                ),
              ),
            ),
            Text('Our Own API',style: globals.plStyle.copyWith(fontSize: 24, ),),
            GestureDetector(
              onTap: _launchURL2,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  color: globals.isDark?darkcolor:lightcolor,
                  height: 70,
                  width:MediaQuery.of(context).size.width ,
                  child: Center(child: Text('Go to API',style: globals.plStyle.copyWith(fontSize: 24,color: Colors.white),)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  _launchURL() async {
    const url='https://www.football-data.org/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL1() async {
    const url='https://newsapi.org/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL2() async {
    const url='https://flapapi.herokuapp.com/home';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}