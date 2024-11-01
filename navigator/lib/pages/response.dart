import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Response Class'),
        actions: [
          IconButton(
              icon: Icon(Icons.check),
              onPressed: () => Navigator.pop(context, 'response by Response'))
        ],
      ),
      body: SafeArea(
        child: Text('In Response'),
      ),
    );
  }
}
