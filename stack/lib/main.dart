import 'package:flutter/material.dart';
import 'widgets/stack.dart';
import 'widgets/stack_favorite.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            if (index.isEven) {
              return StackWidget();
            }
            if (index == 5) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 120.0,
                color: Colors.white24,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 48.0,
                      backgroundImage: AssetImage('assets/images/self.png'),
                    ),
                    Text('Some Info'),
                  ],
                ),
              );
            } else {
              return StackFavoriteWidget();
            }
          },
        ),
      ),
    );
  }
}
