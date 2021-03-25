import 'package:flap/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

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
    return Container(
      child: FutureBuilder(
        future: getScorers(),
        builder: (context, snapshot){
          if(snapshot.data == null)
            return Center(child: ImageRotate());
          else{
            return
               Container(
                child: Column(
                  children: <Widget>[
                    Padding(child: rankingRow1(), padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                    Divider(height: 15,),
                    Expanded(child:

                    ListView.separated(
                      itemCount: snapshot.data.length,
                      separatorBuilder: (context, i){
                        return Padding(
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                          child: Divider(color: Colors.grey,),
                        );
                      },

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
    pos1=Colors.white;
  return Card(
    color: pos1,
    child: Row(
      children: <Widget>[
        Expanded(child: Center(child:Text('$pos', style: plStyle,)), flex: 1),
        Expanded(child: Padding(child:Text(name, style: plStyle),padding: EdgeInsets.fromLTRB(5, 0, 5, 0),), flex: 4),
        Expanded(child: Padding(child:Text(team, style: plStyle),padding: EdgeInsets.fromLTRB(5, 0, 5, 0),), flex: 4),
        Expanded(child: Text(goalNum, style: plStyle), flex: 2,)
      ],
    ),
  );
}
Widget rankingRow1(){
  return Card(
    child: Row(
      children: <Widget>[
        Expanded(child: Center(child:Text("Pos", style: plStyle)), flex: 1),
        Expanded(child: Padding(child:Text('Player', style: plStyle),padding: EdgeInsets.fromLTRB(5, 0, 5, 0),), flex: 4),
        Expanded(child: Padding(child:Text("Team", style: plStyle),padding: EdgeInsets.fromLTRB(5, 0, 5, 0),), flex: 4),
        Expanded(child: Text("Goals", style: plStyle), flex: 2,)
      ],
    ),
  );
}
final plStyle=GoogleFonts.getFont('Didact Gothic',fontSize: 16,fontWeight: FontWeight.w600);