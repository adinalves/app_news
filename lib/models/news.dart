class News {
  final String title;
  final String description;
  final String urlToImage;
  final String url;
  News(
      {required this.title,
      required this.description,
      required this.urlToImage,
      required this.url});
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        title: json['title'] ?? "Não informado",
        description: json['description'] ?? "Não informado",
        urlToImage: json['urlToImage'] ??
            "https://i.ibb.co/BVkfMSz/image-not-found.png",
        url: json['url'] ?? 'Não informado');
  }
}
