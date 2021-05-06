import 'package:flap/apidetails.dart';
import 'package:flap/projectinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'devinfo.dart';
import 'globals.dart' as globals;
import 'constant.dart';

class DrawerPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       backgroundColor: globals.isDark?darkbackground:Colors.white,
       body: SingleChildScrollView(
         child: Column(
           children: [
            Container(
              height: 250,
              width:MediaQuery.of(context).size.width ,
              color: globals.isDark?darkcolor:lightcolor,
              child: Center(
                child: Text(
                  'F.L.A.P Project Overview',
                  style: globals.plStyle.copyWith(color: Colors.white,fontSize: 24),
                ),
              ),
            ),
             SizedBox(
               height: 15,
             ),
             GestureDetector(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>DevInfo()));
               },
               child: Container(
                 padding: EdgeInsets.all(10),
                 height: 120,
                 width:MediaQuery.of(context).size.width ,
                 child: Card(
                   color: globals.isDark?darkcolor:lightcolor,
                   child: Center(child: Text('Meet The Developers',style: globals.plStyle.copyWith(fontSize: 24,color: Colors.white),)),
                 ),
               ),
             ),
             GestureDetector(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ApiDetail()));
               },
               child: Container(
                 padding: EdgeInsets.all(10),
                 height: 120,
                 width:MediaQuery.of(context).size.width ,
                 child: Card(
                   color: globals.isDark?darkcolor:lightcolor,
                   child: Center(child: Text('API Details',style: globals.plStyle.copyWith(fontSize: 24,color: Colors.white),)),
                 ),
               ),
             ),
             GestureDetector(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ProjectInfo()));
               },
               child: Container(
                 padding: EdgeInsets.all(10),
                 height: 120,
                 width:MediaQuery.of(context).size.width ,
                 child: Card(
                   color: globals.isDark?darkcolor:lightcolor,
                   child: Center(child: Text('Project Information',style: globals.plStyle.copyWith(fontSize: 24,color: Colors.white),)),
                 ),
               ),
             ),
             SizedBox(
               height: 30,
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               Expanded(
                 flex: 1,
                 child: Column(
                   children: [
                     IconButton(
                       icon: Icon(FontAwesomeIcons.github,color: globals.isDark?Colors.white:darkbackground,),
                       iconSize: 75 ,
                       onPressed: _launchURL1,
                     ),
                     Text('Check out our repo!',style: globals.plStyle.copyWith(fontSize: 16,color: globals.isDark?Colors.white:Colors.black),)
                   ],
                 ),
               ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: _launchURL,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:globals.isDark?AssetImage('assets/logodark.png',):AssetImage('assets/logo.png'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('FPL Website!',style: globals.plStyle.copyWith(fontSize: 16,color: globals.isDark?Colors.white:Colors.black),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
           ],
         ),
       ),
      );
  }
  _launchURL() async {
    const url='https://fantasy.premierleague.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL1() async {
    const url='https://github.com/Blazikengr8/F.L.A.P';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}