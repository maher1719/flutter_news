import 'package:floor/floor.dart';

@entity
class News {
  @primaryKey
  final String title;
  @ignore
  final String author;
  final String description;
  final String urlToImage;
  final String publshedAt;
  final String content;
  final String articleUrl;

  News(this.title, this.author, this.description, this.urlToImage,
      this.publshedAt, this.content, this.articleUrl);
}