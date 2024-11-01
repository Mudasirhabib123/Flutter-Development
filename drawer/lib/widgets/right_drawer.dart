import 'package:flutter/material.dart';
import 'package:drawer/widgets/menu_list_title.dart';

class RightDrawerWidget extends StatefulWidget {
  const RightDrawerWidget({
    Key key,
  }) : super(key: key);
  @override
  _RightDrawerWidgetState createState() => _RightDrawerWidgetState();
}

class _RightDrawerWidgetState extends State<RightDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Image(
              image: AssetImage('assets/images/alarm.png'),
              fit: BoxFit.cover,
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          MenuListTitleWidget(),
        ],
      ),
    );
  }
}
