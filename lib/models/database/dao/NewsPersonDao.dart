import 'package:floor/floor.dart';
import 'package:news_flutter/models/database/entities/newsPerson.dart';


@dao
abstract class NewsPersonDao {
  @Query('SELECT * FROM NewsPerson where idPerson= :idPerson')
  Future<List<NewsPerson>> findAllPersonNews(String idPerson);

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<NewsPerson> findPersonById(int id);

  @Query('SELECT News.* FROM News inner join News.title=PersonNews.idNews inner join :personId=PersonNews.idPerson ')
  Stream<NewsPerson> findPersonNewsById(String personId);

  @insert
  Future<void> insertPersonNews(NewsPerson newsPerson);
}