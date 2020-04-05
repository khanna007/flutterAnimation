import 'package:flutter/material.dart';

import 'FadeAnimation.dart';

class Animated extends StatefulWidget {
  Animated({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<Animated> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _frontScale;
  Animation<double> _backScale;

  AnimationController _scaleController;
  AnimationController _scale2Controller;
  AnimationController _widthController;
  AnimationController _positionController;

  Animation<double> _scaleAnimation;
  Animation<double> _scale2Animation;
  Animation<double> _widthAnimation;
  Animation<double> _positionAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_scaleController)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                _widthController.forward();
              }
            },
          );

    _widthController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 600,
      ),
    );

    _widthAnimation =
        Tween<double>(begin: 80.0, end: 300.0).animate(_widthController)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                _positionController.forward();
              }
            },
          );

    _positionController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1000,
      ),
    );

    _positionAnimation =
        Tween<double>(begin: 0.0, end: 215.0).animate(_positionController)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                setState(
                  () {},
                );
                _scale2Controller.forward();
              }
            },
          );

    _scale2Controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );

    _scale2Animation =
        Tween<double>(begin: 1.0, end: 32.0).animate(_scale2Controller)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {}
            },
          );

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
    _frontScale = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.5,
          curve: Curves.easeIn,
        ),
      ),
    );
    _backScale = CurvedAnimation(
      parent: _controller,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FadeAnimation(
          3.2,
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 4.5,
            ),
          ),
        ),
//        Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            Stack(
//              alignment: Alignment.center,
//              children: <Widget>[
//                FadeAnimation(
//                  3.4,
//                  AnimatedBuilder(
//                    child: Container(
//                      alignment: Alignment.center,
//                      width: MediaQuery.of(context).size.width,
//                      padding: EdgeInsets.symmetric(
//                        vertical: 10.0,
//                        horizontal: 20.0,
//                      ),
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Container(
//                            child: AnimatedBuilder(
//                              animation: _scaleController,
//                              builder: (context, child) => Transform.scale(
//                                scale: _scaleAnimation.value,
//                                child: Center(
//                                  child: AnimatedBuilder(
//                                    animation: _widthController,
//                                    builder: (context, child) => Container(
//                                      width: _widthAnimation.value,
//                                      height: 80,
//                                      padding: EdgeInsets.all(
//                                        10,
//                                      ),
//                                      decoration: BoxDecoration(
//                                        borderRadius: BorderRadius.circular(
//                                          50,
//                                        ),
//                                        color: Color(0xFF3F48CC).withOpacity(
//                                          .4,
//                                        ),
//                                      ),
//                                      child: InkWell(
//                                        onTap: () {
//                                          _scaleController.forward();
//                                        },
//                                        child: Stack(
//                                          children: <Widget>[
//                                            AnimatedBuilder(
//                                              animation: _positionController,
//                                              builder: (context, child) =>
//                                                  Positioned(
//                                                left: _positionAnimation.value,
//                                                child: AnimatedBuilder(
//                                                  animation: _scale2Controller,
//                                                  builder: (context, child) =>
//                                                      Transform.scale(
//                                                    scale:
//                                                        _scale2Animation.value,
//                                                    child: Container(
//                                                        width: 60,
//                                                        height: 60,
//                                                        decoration:
//                                                            BoxDecoration(
//                                                          shape:
//                                                              BoxShape.circle,
//                                                          color:
//                                                              Color(0xFF3F48CC),
//                                                        ),
//                                                        child: Icon(
//                                                          Icons.arrow_forward,
//                                                          color: Colors.white,
//                                                        )),
//                                                  ),
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      ),
//                                    ),
//                                  ),
//                                ),
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ],
//        ),
      ],
    );
  }
}
