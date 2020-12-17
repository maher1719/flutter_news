import 'dart:async';
import 'package:floor/floor.dart';
import 'package:news_flutter/models/database/dao/NewsDao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/personDao.dart';
import 'dao/NewsDao.dart';
import 'dao/SettingsDao.dart';

import 'entities/person.dart';
import 'entities/news.dart';
import 'entities/Settings.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Person,News,Settings])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;
  NewsDao get newsDao;
  Settings get settingsDao;
}