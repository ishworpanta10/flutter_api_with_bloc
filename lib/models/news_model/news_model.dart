class NewsModel {
  final String title;

  const NewsModel({
    required this.title,
  });

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      title: map['title'] as String,
    );
  }
}
