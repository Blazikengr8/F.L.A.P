import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'globals.dart' as globals;
class ProjectInfo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(title: Text('API Information',style: globals.plStyle.copyWith(fontSize: 24,color: Colors.white),),backgroundColor: globals.isDark?darkcolor:lightcolor,)),
      backgroundColor: globals.isDark?darkbackground:lightbackground,
      body: SingleChildScrollView(
        child: Column(
         children: [
           SizedBox(
             height: 15,
           ),
           Text('Project Description',style: globals.plStyle.copyWith(fontSize: 24,),),
           SizedBox(height: 10,),
           Container(
             color: globals.isDark?darkbackground:lightbackground,
             height: 300,
             padding: EdgeInsets.all(10),
             child: Text('Fantasy Premier League is one of the most popular online fantasy games available.Our software will automate the data science process and try to give the optimum squads for each week.'
                 'This hopes to even the playing field and also gives the players a powerful engine to refer from for their own squads. Using flutter and python we will give results and also have extra features for the user to enjoy the app. ',
             style: globals.plStyle,),
           ),
           SizedBox(
             height: 40,
           ),
           Text('Tech Stack',style: globals.plStyle.copyWith(fontSize: 24,),),
           SizedBox(height: 30,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Text('○ Flutter',style: globals.plStyle.copyWith(fontSize: 24,),),
               Text('○ Python',style: globals.plStyle.copyWith(fontSize: 24,),),
             ],
           ),
           SizedBox(height: 30,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Text('○ Pandas',style: globals.plStyle.copyWith(fontSize: 24,),),
               Text('○ Flask',style: globals.plStyle.copyWith(fontSize: 24,),),
             ],
           ),
         ],
        ),
      ),
    );
  }

}