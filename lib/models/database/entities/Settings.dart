import 'package:floor/floor.dart';

@entity
class Settings {
  @PrimaryKey(autoGenerate: true)
  final String id;
  final String country;
  final String lang;

  Settings(this.id,this.country,this.lang);
}