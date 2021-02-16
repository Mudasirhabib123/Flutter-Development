import 'package:flutter/material.dart';
import 'package:list_view/widgets/header.dart';
import 'package:list_view/widgets/row.dart';
import 'package:list_view/widgets/row_with_card.dart';

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
      body: ListView.builder(
        itemCount: 25,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return HeaderWidget(index: index);
          } else if (index > 0 && index < 4) {
            return RowWithCardWidget(index: index);
          } else if (index > 3 && index < 10) {
            return RowWidget(index: index);
          } else {
            return Container(
              height: 250,
              color: Colors.lightBlue.shade200,
              padding: EdgeInsets.zero,
              child: Card(
                elevation: 8.0,
                child: Column(
                  children: [
                    
                    Text('in Container'),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
