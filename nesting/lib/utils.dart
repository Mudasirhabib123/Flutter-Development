import 'package:flutter/material.dart';

class TodoMenuItem {
  final String title;
  final Icon icon;
  TodoMenuItem({this.title, this.icon});
}

// Create a List of Menu Item for PopupMenuButton
List<TodoMenuItem> foodMenuList = [
TodoMenuItem(title: 'Fast Food', icon: Icon(Icons.fastfood)),
TodoMenuItem(title: 'Remind Me', icon: Icon(Icons.add_alarm)),
TodoMenuItem(title: 'Flight', icon: Icon(Icons.flight)),
TodoMenuItem(title: 'Music', icon: Icon(Icons.audiotrack)),
];