class CatImage {
  final String id;
  final int width;
  final int height;
  final String url;

  CatImage({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  });

  factory CatImage.fromJson(Map<String, dynamic> json) => CatImage(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
      );
}
