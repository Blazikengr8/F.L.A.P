import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'globals.dart' as globals;
class DevInfo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(title: Text('The Developers',style: globals.plStyle.copyWith(fontSize: 24,color: Colors.white),),backgroundColor: globals.isDark?darkcolor:lightcolor,)),
        backgroundColor: globals.isDark?Colors.black:Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(20),
                color: globals.isDark?darkbackground:Color(0xFFFFD700),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: darkbackground,
                      backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/60261112?s=400&u=2162485400ab03771599d1b60f78fc8ec87bba92&v=4'),
                    ),
                    Column(
                      children: [
                        Text('Abhigyan Singh',style: globals.plStyle.copyWith(fontSize: 24,color: Colors.white),),
                        Text('App Developer',style: globals.plStyle.copyWith(fontSize: 20,color: Colors.white),)
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(20),
                color: globals.isDark?darkcolor:lightcolor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Advaith Suresh',style: globals.plStyle.copyWith(fontSize: 24,color: Colors.white),),
                        Text('Backend Developer',style: globals.plStyle.copyWith(fontSize: 20,color: Colors.white),)
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: darkbackground,
                      radius: 50,
                      backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/56351354?v=4'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(20),
                color: globals.isDark?darkbackground:Color(0xFFFFD700),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: darkbackground,
                      backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/72648167?v=4'),
                    ),
                    Column(
                      children: [
                        Text('Suraj Mishra',style: globals.plStyle.copyWith(fontSize: 24,color: Colors.white),),
                        Text('Backend Developer',style: globals.plStyle.copyWith(fontSize: 20,color: Colors.white),)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}