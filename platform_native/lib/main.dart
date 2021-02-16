import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  static const _methodChannel =
      const MethodChannel('platformchannel.companyname.com/deviceinfo');
  String _deviceInfo = '';

  @override
  void initState() {
    super.initState();
    print('--------------------------in Device info');
    _getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListTile(
          title: Text(
            'Devive Info ',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            _deviceInfo,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          contentPadding: EdgeInsets.all(16.0),
        ),
      ),
    );
  }

  Future<void> _getDeviceInfo() async {
    String deviceInfo = '_getDeviceInfo';
    try {
      deviceInfo = await _methodChannel.invokeMethod('getDeviceInfo');
    } on PlatformException catch (e) {
      deviceInfo = 'failed to get Device Info ${e.message}';
    }
    setState(() {
      _deviceInfo = deviceInfo;
    });
  }
}
