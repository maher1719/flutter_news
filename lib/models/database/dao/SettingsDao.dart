import 'package:floor/floor.dart';
import 'package:news_flutter/models/database/entities/Settings.dart';

@dao
abstract class SettingsDao {
  @Query('SELECT * FROM Person')
  Future<List<Settings>> findAllSetting();
  @insert
  Future<void> insertSetting(Settings settings);

  @update
  Future<void> updateSettings(Settings settings);
}