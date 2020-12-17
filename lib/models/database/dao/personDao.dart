import 'package:floor/floor.dart';
import 'package:news_flutter/models/database/entities/person.dart';

@dao
abstract class PersonDao {
  @Query('SELECT * FROM Person')
  Future<List<Person>> findAllPersons();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<Person> findPersonById(int id);

  @delete
  Future<void> deleteTask(Person news);

  @insert
  Future<void> insertPerson(Person person);
}