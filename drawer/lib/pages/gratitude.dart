import 'package:flutter/material.dart';

class Gratitude extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gratitude'),
      ),
      body: Center(
        child: Icon(
          Icons.sentiment_satisfied,
          color: Colors.purple,
          size: 120.0,
        ),
      ),
    );
  }
}