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
        primarySwatch: Colors.lightGreen,
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
  String _gestureDetector = '';
  Color _paintColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildGestureDetector(),
              Divider(
                color: Colors.black,
                height: 44.0,
              ),
              _buildDraggable(),
              Divider(
                height: 40.0,
              ),
              _buildDragTarget(),
              Divider(
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _buildGestureDetector() {
    return GestureDetector(
      onTap: () {
        print('onTap');
        setGesture('onTap');
      },
      onDoubleTap: () {
        print('onDoubleTap');
        setGesture('onDoubleTap');
      },
      onLongPress: () {
        setGesture('onlongPress');
        print('onLongPress');
      },
      onPanUpdate: (var detail) {
        setGesture('onPanUpdate');
        print('onPanUpdate $detail');
      },
      onHorizontalDragUpdate: (var detail) {
        print('drag down $detail');
        setGesture('onDraghorizental');
      },
      child: Container(
        color: Colors.lightGreen.shade100,
        width: double.infinity,
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.alarm,
              size: 98.0,
            ),
            Text('$_gestureDetector')
          ],
        ),
      ),
    );
  }

  Draggable<int> _buildDraggable() {
    return Draggable(
      child: Column(
        children: [
          Icon(
            Icons.palette,
            color: Colors.deepOrange,
            size: 48.0,
          ),
          Text('Dragme below to change color'),
        ],
      ),
      childWhenDragging: Icon(
        Icons.palette,
        color: Colors.grey,
        size: 48.0,
      ),
      feedback: Icon(
        Icons.brush,
        color: Colors.deepOrange,
        size: 80.0,
      ),
      data: Colors.deepOrange.value,
    );
  }

  DragTarget<int> _buildDragTarget() {
    return DragTarget(
      onAccept: (colorValue) {
        _paintColor = Color(colorValue);
      },
      builder: (BuildContext context, List<dynamic> acceptData,
              List<dynamic> rejectData) =>
          acceptData.isEmpty
              ? Text(
                  'Drag To And See Color Change',
                  style: TextStyle(color: _paintColor),
                )
              : Text('painting Color $acceptData',
                  style: TextStyle(
                      color: Color(acceptData[0]),
                      fontWeight: FontWeight.bold)),
    );
  }

  void setGesture(String msg) {
    setState(() {
      _gestureDetector = msg;
    });
  }
}
