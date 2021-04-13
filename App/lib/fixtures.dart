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
import 'globals.dart';
final String token = '7abba3fc968d4e1fb66a1b54c916d717';

class match {
  String homeTeam;
  String awayTeam;
  String matchDay;
  String matchTime;

  match(this.homeTeam, this.awayTeam, this.matchDay, this.matchTime);
}

class Fixtures extends StatefulWidget {

  createState() => FixtureState() ;
}

class FixtureState extends State<Fixtures> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: globals.isDark?Colors.black:lightcolor,
      body:
           FutureBuilder(
            future: getMatches(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: ImageRotate(),
                );
              } else {
                return Container(
                  height: size.height-200,
                  width: size.width,
                  child: Center(
                    child: Container(
                      child: ListView.builder(
                          itemCount: 8,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                color: globals.isDark?darkbackground:Colors.white,
                                child: Container(
                                  height: 100,
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  decoration: BoxDecoration(
                                      color: globals.isDark?darkbackground:Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child:  Row(
                                      children: <Widget>[
                                        //first part of match details
                                        Expanded(
                                          flex: 3 ,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            //crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                               Text(snapshot.data[i].homeTeam,
                                                        style: teamStyle),
                                              Text('VS',
                                                  style: teamStyle),
                                              Text(snapshot.data[i].awayTeam,
                                                        style: teamStyle),
                                            ],
                                          ),
                                        ),

                                        //second part of match details
                                        Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                FittedBox(
                                                    child: timeFormatter(snapshot.data[i]),
                                                    fit: BoxFit.fitWidth
                                                ),
                                                FittedBox(
                                                    child: dayFormatter(snapshot.data[i]),
                                                    fit: BoxFit.fitWidth
                                                ),
                                              ],
                                            )
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                            );
                          }),
                    ),
                  ),
                );
              }
            },
          )
    );
  }
}

Future<List<match>> getMatches() async {
  Response r = await get(
      Uri.encodeFull(
          'https://api.football-data.org/v2/competitions/PL/matches?status=SCHEDULED'),
      headers: {"X-Auth-Token": token});

  Map<String, dynamic> x = jsonDecode(r.body);
  List y = x['matches'];

  List<match> extractedMatches = [];

  print(x.keys);
  for (var i in y) {
    extractedMatches.add(new match(
        i['homeTeam']['name'],
        i['awayTeam']['name'],
        i['utcDate'].toString().substring(5, 10),
        DateTime.parse(i['utcDate'])
            .toLocal()
            .toIso8601String()
            .substring(11, 16)));
  }

  return extractedMatches;
}




timeFormatter(match m) {
  String convertedTime = m.matchTime;
  print(m.matchTime);
  int time = int.parse(m.matchTime.substring(0, 2));
  //print(m.matchTime);
  //print(time);
  if (time > 12) {
    time = time - 12;
    convertedTime = time.toString() + m.matchTime.substring(2) + ' PM';
  }
  else
    convertedTime = time.toString() + m.matchTime.substring(2) + ' AM';
  print(convertedTime);
  return Text(convertedTime,style: teamStyle,);
}

dayFormatter(match m){
  String d = m.matchDay;
  List splitD = d.split('-');
  if(splitD[0].toString().startsWith('0'))
    splitD[0] = splitD[0].toString().substring(1);

  if(splitD[1].toString().startsWith('0'))
    splitD[1] = splitD[1].toString().substring(1);

  d = splitD[0] + '/' + splitD[1];
  return Text(d,style: teamStyle,);
}
