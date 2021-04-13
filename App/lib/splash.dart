import 'package:flap/constant.dart';
import 'package:flap/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;
class ImageRotate extends StatefulWidget {
  @override
  _ImageRotateState createState() => new _ImageRotateState();
}

class _ImageRotateState extends State<ImageRotate>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 1000),
    );

    animationController.repeat();
  }
  @override
  dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      color: globals.isDark?darkcolor:lightbackground,
      child: new AnimatedBuilder(
        animation: animationController,
        child: new CircleAvatar(
          radius: 50,
          child: globals.isDark?Image.asset('assets/logodark.png'):Image.asset('assets/logo.png'),
        ),
        builder: (BuildContext context, Widget _widget) {
          return new Transform.scale(
            scale: animationController.value*1.5,
            child: _widget,
          );
        },
      ),
    );
  }
}