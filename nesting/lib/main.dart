import 'package:flutter/material.dart';
import 'utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: null,
                  child: Text('Button 1'),
                ),
                RaisedButton(
                  onPressed: null,
                  child: Text('Button 2'),
                ),
              ],
            ),
            PopupMenuButton<TodoMenuItem>(
              icon: Icon(
                Icons.view_list,
              ),
              onSelected: ((valueSelected) {
                print(valueSelected.title);
              }),
              itemBuilder: (BuildContext context) {
                return foodMenuList.map(
                  (TodoMenuItem todoMenuItem) {
                    return PopupMenuItem<TodoMenuItem>(
                      value: todoMenuItem,
                      child: Row(
                        children: <Widget>[
                          Icon(todoMenuItem.icon.icon),
                          Padding(
                            padding: EdgeInsets.all(16.0),
                          ),
                          Text(todoMenuItem.title),
                        ],
                      ),
                    );
                  },
                ).toList();
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.lightGreen,
        // foregroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomAppBar(
        // has
        color: Colors.lightGreen,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.pause,
              color: Colors.white,
            ),
            Icon(
              Icons.stop,
              color: Colors.white,
            ),
            Icon(
              Icons.access_time,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.all(32.0),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
