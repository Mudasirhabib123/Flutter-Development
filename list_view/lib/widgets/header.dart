import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: 120.0,
      child: Card(
        elevation: 8.0,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Barista',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48.0,
                color: Colors.orange,
              ),
            ),
            Text(
              'Travel Plans',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
