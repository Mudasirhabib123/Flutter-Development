import 'package:flutter/material.dart';
import 'package:drawer/widgets/menu_list_title.dart';

class LeftDrawerWidget extends StatefulWidget {
  const LeftDrawerWidget({
    Key key,
  }) : super(key: key);

  @override
  _LeftDrawerWidgetState createState() => _LeftDrawerWidgetState();
}

class _LeftDrawerWidgetState extends State<LeftDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: Icon(
              Icons.face,
              size: 48.0,
              color: Colors.white,
            ),
            accountName: Text('Mudasir Habib'),
            accountEmail: Text('Mudasirhebeb@gmail.com'),
            otherAccountsPictures: [
              Icon(
                Icons.bookmark_border,
                color: Colors.white,
              )
            ],
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/car.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          MenuListTitleWidget(),
        ],
      ),
    );
  }
}
