import 'package:floor/floor.dart';

@entity
class Settings {
  @PrimaryKey()
   final int id;
  final String country;
  final String lang;

  Settings(this.id,this.country,this.lang);
}