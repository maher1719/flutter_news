import 'package:floor/floor.dart';

@Entity(primaryKeys: ['idPerson', 'idNews'])
class NewsPerson {
  @primaryKey
  final String idPerson;
  final String idNews;

  NewsPerson(this.idPerson, this.idNews);
}