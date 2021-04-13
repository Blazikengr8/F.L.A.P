import 'package:flap/constant.dart';
import 'package:flap/goals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: globals.isDark?darkcolor:lightcolor,
        title: Text("Fantasy Team",style: globals.plStyle.copyWith(color: Colors.white,fontSize: 25),),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pitch.jpg'),
          ),
        ),
        child: Container(
          height: 700,
          child: Column(
            children: [
              SizedBox(
                height: 85,
              ),
              Expanded(
                flex: 1,
                  child:
                 Container(
                   child: Center(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Padding(padding:EdgeInsets.all(10),child: PlayerIcon('Liverpool', 'Mo Salah')),
                         Padding(padding:EdgeInsets.all(10),child: PlayerIcon('Liverpool', 'Mo Salah')),
                         Padding(padding:EdgeInsets.all(10),child: PlayerIcon('Liverpool', 'Mo Salah')),
                       ],
                     ),
                   ),
                 ),
              ),
              Expanded(
                flex: 1,
                  child:
                  Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(padding:EdgeInsets.all(10),child: PlayerIcon('Liverpool', 'Mo Salah')),
                          Padding(padding:EdgeInsets.all(10),child: PlayerIcon('Liverpool', 'Mo Salah')),
                          Padding(padding:EdgeInsets.all(10),child: PlayerIcon('Liverpool', 'Mo Salah')),
                        ],
                      ),
                    ),
                  ),
              ),
              Expanded(
                flex: 1,
                child:
                Container(
                  child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(child: Padding(padding:EdgeInsets.all(10),child: PlayerIcon('Liverpool', 'Mo Salah'))),
                          Expanded(child: Padding(padding:EdgeInsets.all(10),child: PlayerIcon('Liverpool', 'Mo Salah'))),
                          Expanded(child: Padding(padding:EdgeInsets.all(10),child: PlayerIcon('Liverpool', 'Mo Salah'))),
                          Expanded(child: Padding(padding:EdgeInsets.all(10),child: PlayerIcon('Liverpool', 'Mo Salah'))),
                        ],
                      ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child:
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PlayerIcon('Liverpool', 'Mo Salah'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class PlayerIcon extends StatelessWidget
{
  String pname;
  String teamname;
  int teamcolor=0xFFC8102E;
  PlayerIcon(this.teamname,this.pname);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Stack(
        children:[
             Column(
              children: [
                Flexible(child: Icon(FontAwesomeIcons.tshirt,color:Color(teamcolor),size: 40,)),
                Flexible(child: Text('$pname',style: globals.plStyle.copyWith(fontSize: 20),textAlign: TextAlign.center,))
              ],
            ),
       ],
      );
  }

}