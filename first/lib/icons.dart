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
          IconButton(
              icon: Icon(Icons.open_in_browser),
              onPressed:  null
          ),
          IconButton(icon: Icon(Icons.settings), onPressed: null),
        ],
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(8.0)),
          Icon(Icons.add),
          Padding(padding: const EdgeInsets.all(8.0)),
          Icon(Icons.exposure_minus_1),
          Padding(padding: const EdgeInsets.all(8.0)),
          Text('In One Row'),
          Padding(padding: const EdgeInsets.all(8.0)),
          Text('Also in one row')
        ],
      )),
    );
  }

  void _showToast(final String msg) {
    final snackBar = new SnackBar(
      content: new Text(msg),
    );
    Scaffold.of(scaffoldContext).showSnackBar(snackBar);
  }
}
