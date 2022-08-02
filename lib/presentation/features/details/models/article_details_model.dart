class ArticleDetailsModel {
  ArticleDetailsModel({
    required this.title,
    required this.owner,
    required this.releaseDate,
    required this.picture,
    required this.sourceUrl,
  });

  final String title;

  final String owner;

  final DateTime releaseDate;

  final String picture;

  final String sourceUrl;
}
