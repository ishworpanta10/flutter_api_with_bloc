class NewsSourceModel {
  final String id;
  final String name;

  const NewsSourceModel({
    required this.id,
    required this.name,
  });

  factory NewsSourceModel.fromMap(Map<String, dynamic> map) {
    return NewsSourceModel(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }
}
