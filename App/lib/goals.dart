import 'package:flap/constant.dart';
import 'package:flap/main.dart';
import 'package:flap/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'globals.dart' as globals;
final String token = '7abba3fc968d4e1fb66a1b54c916d717';

//Top scorers in league object and handling

class topScorer{
  String name;
  String teamName;
  String goalNum;
  topScorer(this.name, this.teamName, this.goalNum);
}

Future<List<topScorer>> getScorers() async{
  Response r = await get(Uri.encodeFull('https://api.football-data.org/v2/competitions/PL/scorers'),
      headers: {
        'X-Auth-Token' : token
      }
  );
  Map<String, dynamic> x = jsonDecode(r.body);
  List y = x['scorers'];
  List<topScorer> PlayersList = [];
  for(var i in y){
    PlayersList.add(new topScorer(i['player']['name'], i['team']['name'], i['numberOfGoals'].toString()));
  }

  return PlayersList;
}

class Players extends StatefulWidget{
  createState()
  {
    return  PlayersState();
  }
}

class PlayersState extends State<Players>{
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: globals.isDark?Colors.black:Colors.white,
      body: FutureBuilder(
          future: getScorers(),
          builder: (context, snapshot){
            if(snapshot.data == null)
              return Center(child: ImageRotate());
            else{
              return
                 Container(
                   height: size.height-200,
                   width: size.width,
                   color: globals.isDark?Colors.black:Colors.white,
                  child: Column(
                    children: <Widget>[
                      Padding(child: rankingRow1(), padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                      Expanded(child:

                      ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, i){
                          int playerRank = i +1;
                          return
                             Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                              ),
                              child: rankingRow(
                                  playerRank,
                                  snapshot.data[i].name,
                                  snapshot.data[i].teamName,
                                  snapshot.data[i].goalNum
                              ),
                          );
                        },
                      ))
                    ],
                  ),
              );
            }
          },
        ),
    );
  }
}
Color pos1;
Widget rankingRow([int pos, String name , String team ,String goalNum]){
  if(pos==1)
    pos1=Color(0xFFFFD700).withOpacity(0.4);
  else if(pos==2)
    pos1=Color(0xFFC0C0C0).withOpacity(0.4);
  else if(pos==3)
    pos1=Color(0xFFcd7f32).withOpacity(0.4);
  else
    pos1=globals.isDark?darkbackground:Colors.white;
  return Card(
    color: globals.isDark?pos1:pos1,
    child: Row(
      children: <Widget>[
        Expanded(child: Center(child:Text('$pos', style: globals.plStyle,)), flex: 1),
        Expanded(child: Padding(child:Text(name, style: globals.plStyle),padding: EdgeInsets.fromLTRB(5, 0, 5, 0),), flex: 4),
        Expanded(child: Padding(child:Text(team, style: globals.plStyle),padding: EdgeInsets.fromLTRB(5, 0, 5, 0),), flex: 4),
        Expanded(child: Text(goalNum, style: globals.plStyle), flex: 2,)
      ],
    ),
  );
}
Widget rankingRow1(){
  return Card(
      color:globals.isDark?darkbackground:Colors.white,
    child: Row(
      children: <Widget>[
        Expanded(child: Center(child:Text("Pos", style: globals.plStyle)), flex: 1),
        Expanded(child: Padding(child:Text('Player', style: globals.plStyle),padding: EdgeInsets.fromLTRB(5, 0, 5, 0),), flex: 4),
        Expanded(child: Padding(child:Text("Team", style: globals.plStyle),padding: EdgeInsets.fromLTRB(5, 0, 5, 0),), flex: 4),
        Expanded(child: Text("Goals", style: globals.plStyle), flex: 2,)
      ],
    ),
  );
}
