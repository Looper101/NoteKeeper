import 'dart:async';

import 'package:crudoperation/notes/noteUi.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  AnimationController _animationControllerNote;
  AnimationController slideController;
  AnimationController bgColorController;

  Animation<Color> animation;
  Animation<Color> bgAnimation;
  Animation<double> shiftAnimation;
  Animation<double> noteContainerAnimation;

  int splashDelay = 3;
  double initialLocationFR = 30.0;
  double finalLocation = 85.0;

  double initLocationNoteContainer = 10;
  double finalLocationContainer = 109;

  @override
  void initState() {
    super.initState();
    _animationControllerNote =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _animationController =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);
    slideController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    bgColorController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    _animationControllerNote.addListener(() {
      setState(() {});
    });

    _animationController.addListener(() {
      setState(() {});
    });
    slideController.addListener(() {
      setState(() {});
    });

    slideController.addStatusListener((AnimationStatus status) {
      setState(() {
        print(status);
      });
    });

    bgColorController.addListener(() {
      setState(() {});
    });

    animation = ColorTween(begin: Colors.transparent, end: Colors.blue.shade900)
        .animate(_animationController);

    bgAnimation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(
        CurvedAnimation(
            parent: bgColorController, curve: Curves.fastOutSlowIn));

    shiftAnimation = Tween(begin: initialLocationFR, end: finalLocation)
        .animate(
            CurvedAnimation(parent: slideController, curve: Curves.bounceOut));
    noteContainerAnimation =
        Tween(begin: initLocationNoteContainer, end: finalLocationContainer)
            .animate(CurvedAnimation(
                parent: _animationControllerNote, curve: Curves.bounceOut));

    _animationController.forward();

    slideController.forward();
    _animationControllerNote.forward();
    bgColorController.forward();
    _loadWidget();
  }

  @override
  void dispose() {
    super.dispose();

    _animationController.dispose();
    slideController.dispose();
    _animationControllerNote.dispose();
    bgColorController.dispose();
  }

  void _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    Timer(_duration, navigateToPage);
  }

  Future<dynamic> navigateToPage() {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return NotesKeeper();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: bgAnimation.value,
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 300,
                right: shiftAnimation.value,
                child: Container(
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  height: 70,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(20)),
                  ),
                  child: Text(
                    'Keeper',
                    style: TextStyle(color: Colors.blue, fontSize: 25),
                  ),
                ),
              ),
              Positioned(
                top: 320,
                left: noteContainerAnimation.value,
                child: Container(
                  height: 70,
                  width: 100,
                  decoration: BoxDecoration(
                    color: animation.value,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(-2, 1),
                          blurRadius: 5,
                          spreadRadius: 2),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Note',
                      style: TextStyle(fontSize: 25, color: Colors.white),
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
