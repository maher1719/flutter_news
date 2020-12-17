import 'package:floor/floor.dart';

@entity
class News {
  @primaryKey
  final String title;
  final String author;
  final String description;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final String articleUrl;

  News(this.title, this.author, this.description, this.urlToImage,
      this.publishedAt, this.content, this.articleUrl);
}