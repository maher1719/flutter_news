import 'package:floor/floor.dart';

@entity
class Person {
  @primaryKey
  final String id;
  final String email;
  final String name;

  Person(this.id, this.name,this.email);
}