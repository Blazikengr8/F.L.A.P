import 'dart:convert';

import 'package:flap/constant.dart';
import 'package:flap/main.dart';
import 'package:flap/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'globals.dart' as globals;
class Standings extends StatefulWidget{

  @override
  StandingsState  createState() {
    // TODO: implement createState
    return StandingsState();
  }

}
final String token="7abba3fc968d4e1fb66a1b54c916d717";
class StandingsState extends State<Standings> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      backgroundColor: globals.isDark?Colors.black:Colors.white,
      body: FutureBuilder(
        future: getLeagueStandings(),
        builder: (context, snapshot){
          if(snapshot.hasData == false){
            return Center(child: ImageRotate());
          }
          else{
            return Container(
              height: size.height-200,
              width: size.width,
              child: Column(
                children: <Widget>[
                  Padding(child: rankingRow1(), padding: EdgeInsets.fromLTRB(0, 10, 0, 0),),
                  //Divider(
                  //  color: Colors.white,
                 // ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i){

                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          //padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: rankingRow(
                              snapshot.data[i].pos,
                              snapshot.data[i].teamInfo['name'],
                              snapshot.data[i].pts.toString(),
                              snapshot.data[i].playedGames.toString(),
                              snapshot.data[i].w.toString(),
                              snapshot.data[i].d.toString(),
                              snapshot.data[i].l.toString()
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
  }
  Color pos=globals.isDark?darkbackground:Colors.white;
  Widget rankingRow(
    int p , String t , String pts, String mp , String w , String d, String l ) {
    if(p==1)
      pos=Color(0xFFFFD700).withOpacity(0.4);
    else if(p==2)
      pos=Color(0xFFC0C0C0).withOpacity(0.4);
    else if(p==3)
      pos=Color(0xFFcd7f32).withOpacity(0.4);
    else if(p==4)
      pos=Colors.greenAccent.withOpacity(0.4);
    else if(p==18)
      pos=Colors.redAccent.withOpacity(0.4);
    else if(p==19)
      pos=Colors.redAccent.withOpacity(0.4);
    else if(p==20)
      pos=Colors.redAccent.withOpacity(0.4);
    else
      pos=globals.isDark?darkbackground:Colors.white;
  return Container(
    height: 100,
    child: Card(
      color: globals.isDark?pos:pos,
      child: Row(
        children: <Widget>[
          Expanded(child: Center(child: Text('$p', style: globals.plStyle),), flex: 1,),
          Expanded(child: Text(t, style: globals.plStyle), flex: 2,),
          Expanded(child: Text(mp, style: globals.plStyle), flex: 1,),
          Expanded(child: Text(w, style: globals.plStyle), flex: 1,),
          Expanded(child: Text(d, style: globals.plStyle), flex: 1,),
          Expanded(child: Text(l, style: globals.plStyle), flex: 1,),
          Expanded(child: Text(pts, style: globals.plStyle), flex: 1,)
        ],

      ),
    ),
  );
}
Widget rankingRow1() {
  return Container(
      child: Row(
        children: <Widget>[
          Expanded(child: Center(child: Text('Pos', style: globals.plStyle),), flex: 1,),
          Expanded(child:  Text('Team', style: globals.plStyle), flex: 2,),
          Expanded(child: Text('MP', style: globals.plStyle), flex: 1,),
          Expanded(child: Text('W', style: globals.plStyle), flex: 1,),
          Expanded(child: Text('D', style: globals.plStyle), flex: 1,),
          Expanded(child: Text('L', style: globals.plStyle), flex: 1,),
          Expanded(child: Text('Pts', style: globals.plStyle), flex: 1,)
        ],

      ),
  );
}
class teamPos{
  int pos;
  Map<String, dynamic> teamInfo;
  int playedGames;
  int w;
  int d;
  int l;
  int pts;

  teamPos(this.pos, this.teamInfo, this.playedGames, this.w, this.d, this.l, this.pts);

}

Future<List<teamPos>> getLeagueStandings() async{
  Response r = await get(Uri.encodeFull('https://api.football-data.org/v2/competitions/PL/standings?standingType=TOTAL'),
      headers: {
        "X-Auth-Token" : token
      }
  );
  Map<String, dynamic> x = jsonDecode(r.body);
  List y = x['standings'];

  List<teamPos> k = [];
  for(var i in y[0]['table']){
    k.add(new teamPos(i['position'], i['team'], i['playedGames'], i['won'], i['draw'], i['lost'], i['points']));
  }

  return k;
}
