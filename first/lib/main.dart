import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  BuildContext scaffoldContext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
        actions: [
          IconButton(icon: Icon(Icons.open_in_browser), onPressed: null),
          IconButton(icon: Icon(Icons.settings), onPressed: null),
        ],
      ),
      body: new Padding(
        padding: const EdgeInsets.all(30.0),
        child: new Column(
          children: <Widget>[
            new SizedBox(
              height: 30.0,
              width: 50.0,
              child: new Container(
                color: Colors.redAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
