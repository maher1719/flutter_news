import 'package:flutter/material.dart';
import 'package:news_flutter/views/homepage.dart';
import 'package:news_flutter/views/settings.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;

  TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon,
  });

  static List<TabNavigationItem> get items => [
    TabNavigationItem(
      page: HomePage(),
      icon: Icon(Icons.home),
      title: Text("Home"),
    ),
    TabNavigationItem(
      page: SettingsScreen(),
      icon: Icon(Icons.settings),
      title: Text("Shop"),
    ),
    TabNavigationItem(
      page: SettingsScreen(),
      icon: Icon(Icons.settings),
      title: Text("Shop"),
    ),

  ];

}