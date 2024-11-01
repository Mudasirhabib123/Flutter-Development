import 'package:flutter/material.dart';

class AnimationBaloonWidget extends StatefulWidget {
  @override
  _AnimationBaloonWidgetState createState() => _AnimationBaloonWidgetState();
}

class _AnimationBaloonWidgetState extends State<AnimationBaloonWidget>
    with TickerProviderStateMixin {
  AnimationController _controllerFloatUp;
  AnimationController __controllerGrowSize;
  Animation<double> _animationFloatUp;
  Animation<double> _animationGrowSize;

  @override
  void initState() {
    super.initState();
    _controllerFloatUp =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
    __controllerGrowSize =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
  }

  @override
  void dispose() {
    _controllerFloatUp.dispose();
    __controllerGrowSize.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _baloonHeight = MediaQuery.of(context).size.height / 2;
    double _baloonWidth = MediaQuery.of(context).size.height / 3;
    double _baloonBottomLocation =
        MediaQuery.of(context).size.height - _baloonHeight;

    _animationFloatUp = Tween(begin: _baloonBottomLocation, end: 0.0).animate(
        CurvedAnimation(
            parent: _controllerFloatUp, curve: Curves.fastOutSlowIn));

    _animationGrowSize = Tween(begin: 50.0, end: _baloonWidth).animate(
        CurvedAnimation(
            parent: __controllerGrowSize, curve: Curves.elasticInOut));

    _controllerFloatUp.forward();
    __controllerGrowSize.forward();

    return AnimatedBuilder(
      animation: _animationFloatUp,
      builder: (context, child) {
        return Container(
          child: child,
          margin: EdgeInsets.only(top: _animationFloatUp.value),
          width: _animationGrowSize.value,
        );
      },
      child: GestureDetector(
        onTap: () {
          if (_controllerFloatUp.isCompleted) {
            _controllerFloatUp.reverse();
            __controllerGrowSize.reverse();
          } else {
            _controllerFloatUp.forward();
            __controllerGrowSize.forward();
          }
        },
        child: Image.asset(
          'assets/images/baloon.png',
          height: _baloonHeight,
          width: _baloonWidth,
        ),
      ),
    );
  }
}
