import 'package:floor/floor.dart';
import 'package:news_flutter/models/database/entities/news.dart';

@dao
abstract class NewsDao {
  @Query('SELECT * FROM Person')
  Future<List<News>> findAllNews();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<News> findNewsById(String title);

  @delete
  Future<void> deleteTask(News news);

  @insert
  Future<void> insertNews(News news);
}