import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Offset _startLastOffset = Offset.zero;
  Offset _currentOffset = Offset.zero;
  Offset _lastOffset = Offset.zero;
  double _lastScale = 1.0;
  double _currentScale = 1.0;
  bool isZoomed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildBody(
          context), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildBody(BuildContext context) {
    return GestureDetector(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _transformScaleAndTranslate(),
          _transformMatrix4(),
          _positionedStatusBar(),
        ],
      ),
      onScaleStart: _onScaleStart,
      onScaleUpdate: _onScaleUpdate,
      onDoubleTap: _onDoubleTap,
      onLongPress: _onLongPress,
      // onPanUpdate: _onPanUpdate,
    );
  }

  Transform _transformScaleAndTranslate() {
    return Transform.scale(
      scale: _currentScale,
      child: Transform.translate(
        offset: _currentOffset,
        child: Image(
          image: AssetImage('assets/images/car.png'),
        ),
      ),
    );
  }

  Transform _transformMatrix4() {
    return Transform(
      transform: Matrix4.identity()
        ..scale(_currentScale, _currentScale)
        ..translate(_currentOffset.dx, _currentOffset.dy),
      alignment: FractionalOffset.center,
      child: Image(
        image: AssetImage('assets/images/car.png'),
      ),
    );
  }

  Positioned _positionedStatusBar() {
    return Positioned(
      top: 0.0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.white54,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Scale: ${_currentScale.toStringAsFixed(4)}',
            ),
            Text(
              'Current: $_currentOffset',
            ),
          ],
        ),
      ),
    );
  }

  Void _onScaleStart(ScaleStartDetails details) {
    print('ScaleStartDetail $details');
    _startLastOffset = details.focalPoint;
    _lastOffset = _currentOffset;
    _lastScale = _currentScale;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    print('ScaleUpdateDetails $details - Scale ${details.scale}');
    if (details.scale != 1.0) {
      // Scalling
      double currentScale = _currentScale * details.scale;
      if (currentScale < 0.5) {
        setState(() {
          _currentScale = currentScale;
        });
        print('_scale: $_currentScale - _lastScale: $_lastScale');
      } else if (details.scale == 1.0) {
        Offset offsetAdjustedForScale =
            (_startLastOffset - _lastOffset) / _lastScale;
        Offset currentOffset =
            details.focalPoint - (offsetAdjustedForScale * _currentScale);
        setState(() {
          _currentOffset = currentOffset;
        });
        print(
            'offsetAdjustedForScale: $offsetAdjustedForScale - _currentOffset:$_currentOffset');
      }
    }
  }

  Void _onDoubleTap() {
    print('in onDoubleTap');
    double currentScale;
    // if (currentScale > 16.0) {
    //   currentScale = 1.0;
    //   _resetToDefaultValues();
    // }

    if (isZoomed) {
      currentScale = 1.0;
      isZoomed = false;
      _resetToDefaultValues();
    } else {
      currentScale = _lastScale * 4.0;
      isZoomed = true;
    }
    _lastScale = _currentScale;
    setState(() {
      _currentScale = currentScale;
    });
  }

  void _onLongPress() {
    print('in onLongPress()');
    setState(() {
    _resetToDefaultValues();
    });
  }

  void _resetToDefaultValues() {
    _startLastOffset = Offset.zero;
    _lastOffset = Offset.zero;
    _currentOffset = Offset.zero;
    _lastScale = 1.0;
    _currentScale = 1.0;
  }
}
