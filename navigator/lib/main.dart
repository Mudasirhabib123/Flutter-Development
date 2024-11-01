import 'dart:ffi';

import 'package:flutter/material.dart';
import 'pages/about.dart';
import 'package:navigator/pages/animated_baloon.dart';
import 'pages/response.dart';
import 'pages/fly.dart';

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  String _howareyou = '...';
  int _currentIndex = 0;
  List _listPages = List();
  Widget _currentPage = About();

  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _listPages..add(About())..add(AnimationBaloonWidget())..add(Fly());
    print('init state');
    print(_listPages.length);
    _currentPage = About();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_tabChanged);
  }

  @override
  void dispose() {
    super.dispose();
    @override
    void dispose() {
      _tabController.dispose();
      super.dispose();
    }

    _tabController.dispose();
  }

  void _tabChanged() {
    if (_tabController.indexIsChanging) {
      print('Tab Changed ${_tabController.index}');
      _changePage(_tabController.index);
    }
  }

  Void _changePage(int selectedIndex) {
    print(selectedIndex);
    print(_listPages[selectedIndex]);
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[_currentIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () =>
                _openPageAbout(context: context, fullscreenDialogue: true),
          ),
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () =>
                _openPageForResult(context: context, fullscreenDialogue: true),
          ),
        ],
      ),
      body: SafeArea(
        child: _currentPage,
        // child: Padding(
        //   padding: EdgeInsets.all(16.0),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       _currentPage,
        //       // Text(
        //       //   'Gratefull for $_howareyou ',
        //       //   style: TextStyle(fontSize: 32.0),
        //       // ),
        //       // GestureDetector(
        //       //   child: Hero(
        //       //     tag: 'format Paint',
        //       //     child: Icon(
        //       //       Icons.format_paint,
        //       //       color: Colors.lightGreen,
        //       //       size: 120.0,
        //       //     ),
        //       //   ),
        //       //   onTap: () {
        //       //     Navigator.push(
        //       //       context,
        //       //       MaterialPageRoute(builder: (context) => Fly()),
        //       //     );
        //       //   },
        //       // ),
        //     ],
        //   ),
        // ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade200,
        onPressed: () =>
            _openPageGratitude(context: context, fullscreenDialogue: true),
        // onPressed: null,
        tooltip: 'About',
        child: Icon(Icons.sentiment_satisfied),
      ),
      bottomNavigationBar: TabBar(
        // currentIndex: _currentIndex,

        controller: _tabController,
        labelColor: Colors.black54,
        unselectedLabelColor: Colors.black38,
        tabs: [
          Tab(
            icon: Icon(Icons.cake),
            text: 'Birthdays',
          ),
          Tab(
            icon: Icon(Icons.sentiment_satisfied),
            text: 'Gratitude',
          ),
          Tab(
            icon: Icon(Icons.access_alarm),
            text: 'Reminders',
          ),
        ],
        onTap: (valye) => {
          print(valye),
          // _changePage(valye),
        },
        // items: [
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.info_outline),
        //     title: Text('About'),
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.face_sharp),
        //     title: Text('Baloon'),
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.format_paint),
        //     title: Text('Paint'),
        //   ),
        // ],
        // onTap: (selectedIndex) => {
        //   if (selectedIndex == 2)
        //     {
        //       Navigator.push(
        //           context, MaterialPageRoute(builder: (context) => Fly()))
        //     }
        //   else
        //     {_changePage(selectedIndex)}
        // },
      ),
    );
  }

  void _openPageAbout({BuildContext context, bool fullscreenDialogue = false}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialogue,
        builder: (context) => About(),
      ),
    );
  }

  void _openPageGratitude(
      {BuildContext context, bool fullscreenDialogue = false}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialogue,
        builder: (context) => AnimationBaloonWidget(),
      ),
    );
  }

  void _openPageForResult(
      {BuildContext context, bool fullscreenDialogue = false}) async {
    final String _response = await Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialogue,
        builder: (context) => Response(),
      ),
    );
    setState(() {
      _howareyou = _response ?? '';
    });
  }
}
