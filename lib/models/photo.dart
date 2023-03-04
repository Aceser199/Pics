class Photo {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> parsedJson) {
    return Photo(
      id: parsedJson['id'],
      title: parsedJson['title'],
      url: parsedJson['url'],
      thumbnailUrl: parsedJson['thumbnailUrl'],
    );
  }
}
