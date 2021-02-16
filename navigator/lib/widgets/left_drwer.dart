import 'package:flutter/material.dart';
// import 'package:flutter/src/material/drawer.dart';
import 'package:navigator/pages/menu_list_item.dart';

class LeftDrawerWidget extends StatelessWidget {
  const LeftDrawerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(accountName: null, accountEmail: null),
          const MenuList(),
        ],
      ),
    );
  }
}
