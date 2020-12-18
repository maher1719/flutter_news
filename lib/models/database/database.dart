import 'dart:async';

import 'package:floor/floor.dart';
import 'package:news_flutter/models/database/dao/NewsDao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/NewsDao.dart';
import 'dao/SettingsDao.dart';
import 'dao/personDao.dart';
import 'entities/Settings.dart';
import 'entities/news.dart';
import 'entities/person.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 3, entities: [Person,News,Settings])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;
  NewsDao get newsDao;
  SettingsDao get settingsDao;
}