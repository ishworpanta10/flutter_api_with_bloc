import 'package:flutter_api_test/models/models.dart';

class NewsModel {
  final String title;
  final NewsSourceModel source;
  final String author;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  const NewsModel({
    required this.title,
    required this.source,
    required this.author,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    final newsSource = map['source'] as Map<String, dynamic>;
    return NewsModel(
      title: map['title'] as String,
      source: NewsSourceModel.fromMap(newsSource),
      author: map['author'] as String,
      description: map['description'] as String,
      url: map['url'] as String,
      urlToImage: map['urlToImage'] as String,
      publishedAt: map['publishedAt'] as String,
      content: map['content'] as String,
    );
  }

  @override
  String toString() {
    return title;
  }
}
