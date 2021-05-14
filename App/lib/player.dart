import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'constant.dart';

class PlayerInfo extends StatefulWidget
{
  String name;
  var form;
  var element;
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
  PlayerInfo(this.name,this.form,this.element,this.code,this.ppg,this.tin,this.selectpercent,this.tout,this.goals,this.saves,this.assists,this.cleansheet,this.ict,this.pos);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PlayerInfoState(name,form,element,code,ppg,tin,selectpercent,tout,goals,saves,assists,cleansheet,ict,pos);
  }

}

class PlayerInfoState extends State<PlayerInfo> {
  String name;
  var form;
  var element;
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
  Image image;
  String pos;
  PlayerInfoState(this.name,this.form,this.element,this.code,this.ppg,this.tin,this.selectpercent,this.tout,this.goals,this.saves,this.assists,this.cleansheet,this.ict,this.pos);
  @override
  Widget build(BuildContext context) {
    print(pos+'0');
    if(pos=='GK')
      {
        image=Image.asset('assets/keeper.jpg',);
        pos='Goalkeeper';
      }
     if(pos=='DEF')
       {
         image=Image.asset('assets/defender.jpg');
         pos='Defender';
       }
     if(pos=='MID')
       {
         image=Image.asset('assets/mid.jpg');
         pos='Midfielder';
       }
    if(pos=='ATT')
    {
      image=Image.asset('assets/striker.png');
      pos='Forward';
    }
    // TODO: implement build
    return Scaffold(
         backgroundColor: globals.isDark?darkbackground:Colors.white,
         appBar: PreferredSize(
             preferredSize: Size.fromHeight(70.0),
             child: AppBar(title: Text(name,style: globals.plStyle.copyWith(fontSize: 24,color: Colors.white),),backgroundColor: globals.isDark?darkcolor:lightcolor,)),
         body:SingleChildScrollView(
           child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,

             children: [
               SizedBox(
                 height: 20,
               ),
               Center(
                 child: Container(
                   height: 250,
                   width: 250,
                   child: image,
                 ),
               ),
               SizedBox(
                 height: 10,
               ),
               Text(pos,style: globals.plStyle.copyWith(fontSize: 24),),
               SizedBox(
                 height: 25,
               ),
               Row(
                 children: [
                   Expanded(flex:1,child: Padding(padding:EdgeInsets.fromLTRB(30, 0,0,0),child: Text('Form: $form',style: globals.plStyle.copyWith(fontSize: 20),))),
                   Expanded(flex:1,child: Text('Team Name: $code',style: globals.plStyle.copyWith(fontSize: 20),)),
                 ],
               ),
               SizedBox(
                 height: 25,
               ),
               Row(
                 children: [
                   Expanded(flex:1,child: Padding(padding:EdgeInsets.fromLTRB(30, 0,0,0),child: Text('Points per game: $ppg',style: globals.plStyle.copyWith(fontSize: 20),))),
                   Expanded(flex:1,child: Text('Transfers in: $tin',style: globals.plStyle.copyWith(fontSize: 20),)),
                 ],
               ),
               SizedBox(
                 height: 25,
               ),
               Row(
                 children: [
                   Expanded(flex:1,child: Padding(padding:EdgeInsets.fromLTRB(30, 0,0,0),child: Text('Selected By percentage: $selectpercent',style: globals.plStyle.copyWith(fontSize: 20),))),
                   Expanded(flex:1,child: Text('Transfer Out: $tout',style: globals.plStyle.copyWith(fontSize: 20),)),
                 ],
               ),
               SizedBox(
                 height: 25,
               ),
               Row(
                 children: [
                   Expanded(flex:1,child: Padding(padding:EdgeInsets.fromLTRB(30, 0,0,0),child:  pos=='Goalkeeper'?Text('Saves: $saves',style: globals.plStyle.copyWith(fontSize: 20),):Text('Goals: $goals',style: globals.plStyle.copyWith(fontSize: 20),))),
                   Expanded(flex:1,child: Text('Assists: $assists',style: globals.plStyle.copyWith(fontSize: 20),)),
                 ],
               ),
               SizedBox(
                 height: 25,
               ),
               Row(
                 children: [
                   Expanded(flex:1,child: Padding(padding:EdgeInsets.fromLTRB(30, 0,0,0),child: Text('ICT Index: $ict',style: globals.plStyle.copyWith(fontSize: 20),))),
                   Expanded(flex:1,child: Text('Clean Sheets: $cleansheet',style: globals.plStyle.copyWith(fontSize: 20),)),
                 ],
               ),
               SizedBox(
                 height: 25,
               ),
             ],
           ),
         ),
    );
  }
}