import 'package:flutter/material.dart';
import 'package:news_flutter/models/database/database.dart';
import 'package:news_flutter/views/googleTab.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:news_flutter/views/homepage.dart';
import 'package:news_flutter/views/login/ui/signup.dart';
import 'package:news_flutter/views/tab.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final database = await $FloorAppDatabase
      .inMemoryDatabaseBuilder()
      .build();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Example(),
    );
  }
}
