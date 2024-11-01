import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Map> fetchPeople() {
      return [
        {"first":"Jim", "last":"Halpert"},
        {"first":"Kelly", "last":"Kapoor"},
        {"first":"Creed", "last":"Bratton"},
        {"first":"Dwight", "last":"Schrute"},
        {"first":"Andy", "last":"Bernard"},
        {"first":"Pam", "last":"Beasley"},
        {"first":"Jim", "last":"Halpert"},
        {"first":"Robert", "last":"California"},
        {"first":"David", "last":"Wallace"},
        {"first":"Ryan", "last":"Howard"},
      ];
  @override
  Widget build(BuildContext context) {
    var _peoples = fetchPeople();
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
  
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
