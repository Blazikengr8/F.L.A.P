import 'dart:convert';
import 'package:flap/constant.dart';
import 'package:flap/player.dart';
import 'package:flap/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'globals.dart' as globals;
class FPLUIDart extends StatefulWidget{
  @override
   createState()=>FPLUIDartState();

}

class FPLUIDartState extends State<FPLUIDart>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: AppBar(title: Text('Ideal Team',style: globals.plStyle.copyWith(fontSize: 24,color: Colors.white),),backgroundColor: globals.isDark?darkcolor:lightcolor,)),
        backgroundColor: globals.isDark?Colors.black:Colors.white,
        body: FutureBuilder(
             future: getLeagueStandings(),
                builder: (context, snapshot){
              if(snapshot.hasData == false){
               return Center(
                 child: ImageRotate(),
                          );
           }
          else{
          return Center(
             child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(child: Playerlist1('Player Name','Position','Form'), padding: EdgeInsets.fromLTRB(0, 10, 0, 0),),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i){

                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerInfo(
                            snapshot.data[i].name,
                            snapshot.data[i].form,
                            snapshot.data[i].element,
                            snapshot.data[i].code,
                            snapshot.data[i].ppg,
                            snapshot.data[i].tin,
                            snapshot.data[i].selectpercent,
                            snapshot.data[i].tout,
                            snapshot.data[i].goals,
                            snapshot.data[i].saves,
                            snapshot.data[i].assists,
                            snapshot.data[i].cleansheet,
                            snapshot.data[i].ict,
                            snapshot.data[i].pos,
                          )));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          //padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Playerlist(
                              snapshot.data[i].name,
                              snapshot.data[i].element,
                              snapshot.data[i].form,
                          ),
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
  Widget Playerlist1(String name,var element,var form)
  {
    return Container(
        height: 20,
        child: Row(
          children: [
            Expanded(flex:2, child:Padding(padding:EdgeInsets.fromLTRB(20, 0, 0,0),child: Text(name,style: globals.plStyle,))),
            Expanded(flex:1,child: Text(element,style: globals.plStyle,)),
            Expanded(child: Text(form,style: globals.plStyle,)),
          ],
        ),
    );
  }
  }
  Widget Playerlist(String name,int element,var form)
  {
    String pos;
    if(element==1)
      {
        pos='GK';
      }
    if(element==2)
      {
        pos='DEF';
      }
    if(element==3)
      {
        pos='MID';
      }
    if(element==4)
      {
        pos='ATT';
      }
    return Container(
      height: 100,
      child: Card(
        color: globals.isDark?darkbackground:lightbackground,
        child: Row(

          children: [
            Expanded(flex:2,child: Padding(padding:EdgeInsets.all(20),child: Text(name,style: globals.plStyle,))),
            Expanded(flex:1,child: Text(pos,style: globals.plStyle,)),
            Expanded(child: Text(form,style: globals.plStyle,)),
          ],
        ),
      ),
    );
  }


class Player
{
String name;
var form;
int element;
var code;
var ppg;
var tin;
var selectpercent;
var tout;
var goals;
var saves;
var assists;
var cleansheet;
var ict;
String pos;
Player(this.name,this.form,this.element,this.code,this.ppg,this.tin,this.selectpercent,this.tout,this.goals,this.saves,this.assists,this.cleansheet,this.ict,this.pos);
}

Future<List<Player>> getLeagueStandings() async{
  Response r = await get('https://flapapi.herokuapp.com/home');
 // print(r.body);
  Map<String, dynamic> x = jsonDecode(r.body);
  print(x['element_type']);
  List<Player> k=[];
  for (int i=1;i<=15;i++)
    {
      print(x['second_name'][i.toString()]+" "+x['form'][i.toString()]);
      int element=x['element_type'][i.toString()];
      String pos;
      if(element==1)
      {
        pos='GK';
      }
      if(element==2)
      {
        pos='DEF';
      }
      if(element==3)
      {
        pos='MID';
      }
      if(element==4)
      {
        pos='ATT';
      }
      k.add(new Player(x['first_name'][i.toString()]+" "+x['second_name'][i.toString()], x['form'][i.toString()],x['element_type'][i.toString()],x['team_name'][i.toString()],x['points_per_game'][i.toString()],x['transfers_in'][i.toString()],x['selected_by_percent'][i.toString()],x['transfers_out'][i.toString()],x['goals_scored'][i.toString()],x['saves'][i.toString()],x['assists'][i.toString()],x['clean_sheets'][i.toString()],x['ict_index'][i.toString()],pos));
    }
  return k;
}
