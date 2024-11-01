import 'package:flutter/material.dart';
import 'package:navigator/pages/about.dart';
import 'package:navigator/pages/animated_baloon.dart';
import 'package:navigator/pages/birthdays.dart';
import 'package:navigator/pages/fly.dart';

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.cake),
          title: Text('Birthdays'),
          onTap: () => {
            Navigator.pop(context),
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Birthdays(),
              ),
            ),
          },
        ),
        ListTile(
          leading: Icon(Icons.face),
          title: Text('Animation'),
          onTap: () => {
            Navigator.pop(context),
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AnimationBaloonWidget(),
              ),
            ),
          },
        ),
        ListTile(
          leading: Icon(Icons.sentiment_satisfied),
          title: Text('Paint'),
          onTap: () => {
            Navigator.pop(context),
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Fly(),
              ),
            ),
          },
        ),
      ],
    );
  }
}
