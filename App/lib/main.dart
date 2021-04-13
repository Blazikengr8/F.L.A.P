import 'package:flap/constant.dart';
import 'package:flap/fixtures.dart';
import 'package:flap/fpl_team_ui.dart';
import 'package:flap/standings.dart';
import 'package:flap/goals.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'globals.dart' as globals;
import 'news.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'F.L.A.P',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  String currentTitle;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
      if(index==0)
        currentTitle="News";
      else if(index==1)
        currentTitle="Standings";
      else if(index==2)
        currentTitle="Fixtures";
      else if(index==3)
        currentTitle="Top Scorers";
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final  List<Widget> _pages = <Widget>[
      NewsFeedPage(),
      Standings(),
      Fixtures(),
      Players(),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child:AppBar(
          backgroundColor: globals.isDark?darkcolor:lightcolor,
          elevation: 5,
          title: currentTitle==null?Text('News',style: GoogleFonts.getFont('Didact Gothic',color:Colors.white ,fontWeight: FontWeight.bold,fontSize: 26),):Text('$currentTitle',style: GoogleFonts.getFont('Didact Gothic',color:Colors.white ,fontWeight: FontWeight.bold,fontSize: 26),),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: globals.isDark?Icon(
                  FontAwesomeIcons.moon,
                  color:Colors.white,
                  size: 25,
                ):Icon(
                  Icons.wb_sunny,
                  color:Colors.white,
                  size: 30,
                ),
                onPressed: (){
                  setState(() {
                    if(globals.isDark) {
                      globals.isDark=false;
                      globals.plStyle =
                          globals.plStyle.copyWith(color: Colors.black);
                      globals.teamStyle =
                          globals.plStyle.copyWith(color: Colors.black);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                    }
                    else
                      {
                        globals.isDark=true;

                        globals.plStyle =
                            globals.plStyle.copyWith(color: Colors.white);
                        globals.teamStyle =
                            globals.plStyle.copyWith(color: Colors.white);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                      }
                  });
                },
              ),
            ),
          ],
      ),
      ),
      body: Stack(
        children: [
          Center(
            child: _pages[currentIndex],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Column(
                    children: [
                      Center(
                        heightFactor: 0.6,
                        child: FloatingActionButton( backgroundColor:globals.isDark?darkcolor:lightbackground,child: CircleAvatar(child: globals.isDark?Image.asset('assets/logodark.png',fit: BoxFit.fill,):Image.asset('assets/logo.png',fit: BoxFit.fill,)), elevation: 1, onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>FPLUIDart()));}),
                      ),
                      SizedBox(height: 26,),
                      Text('Fantasy Team',style: GoogleFonts.getFont('Didact Gothic',color:globals.isDark?darkbackground:lightbackground ,fontWeight: FontWeight.bold,fontSize: 14),),
                    ],
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                FontAwesomeIcons.newspaper,
                                color: currentIndex == 0 ? (globals.isDark?darkbackground:lightbackground) : Colors.white,
                                size: 25,
                              ),
                              onPressed: () {
                                setBottomBarIndex(0);
                              },
                              splashColor: Colors.white,
                            ),
                            Text('News',style: GoogleFonts.getFont('Didact Gothic',color: currentIndex == 0 ? (globals.isDark?darkbackground:lightbackground) : Colors.white,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.table,
                                  color: currentIndex == 1 ?  (globals.isDark?darkbackground:lightbackground) : Colors.white,
                                  size: 25,
                                ),
                                onPressed: () {
                                  setBottomBarIndex(1);
                                }),
                            Text('Standings',style: GoogleFonts.getFont('Didact Gothic',color: currentIndex == 1 ? (globals.isDark?darkbackground:lightbackground) : Colors.white,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Container(
                          width: size.width * 0.20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.solidFutbol,
                                  color: currentIndex == 2 ? (globals.isDark?darkbackground:lightbackground) : Colors.white,
                                  size: 25,
                                ),
                                onPressed: () {
                                  setBottomBarIndex(2);
                                }),
                            Text('Fixtures',style: GoogleFonts.getFont('Didact Gothic',color: currentIndex == 2 ? (globals.isDark?darkbackground:lightbackground) : Colors.white,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: Icon(
                                   FontAwesomeIcons.tshirt,
                                  color: currentIndex == 3 ?(globals.isDark?darkbackground:lightbackground) : Colors.white,
                                  size: 25,
                                ),
                                onPressed: () {
                                  setBottomBarIndex(3);
                                }),
                            Text('Scorers',style: GoogleFonts.getFont('Didact Gothic',color: currentIndex == 3 ? (globals.isDark?darkbackground:lightbackground) : Colors.white,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(

      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = globals.isDark?darkcolor:lightcolor
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20), radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
