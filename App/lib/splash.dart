import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      duration: new Duration(milliseconds: 500),
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
      color: Color(0xFFf5f100),
      child: new AnimatedBuilder(
        animation: animationController,
        child: new Container(
          height: 150.0,
          width: 150.0,
          child: new Image.asset('assets/logo.png'),
        ),
        builder: (BuildContext context, Widget _widget) {
          return new Transform.rotate(
            angle: animationController.value * 6.3,
            child: _widget,
          );
        },
      ),
    );
  }
}