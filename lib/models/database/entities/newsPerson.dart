import 'package:floor/floor.dart';

@Entity(primaryKeys: ['idPerson', 'idNews'])
class NewsPerson {
  @primaryKey
  final String idNews;

  NewsPerson(this.idNews);
}