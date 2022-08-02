import 'package:json_annotation/json_annotation.dart';

part 'news_api_everything_response_article_dto.g.dart';

@JsonSerializable()
class NewsApiEverythingResponseArticleDTO {
  const NewsApiEverythingResponseArticleDTO({
    required this.author,
    required this.title,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  @JsonKey(name: 'author', defaultValue: '')
  final String author;

  @JsonKey(name: 'title', defaultValue: '')
  final String title;

  @JsonKey(name: 'url', defaultValue: '')
  final String url;

  @JsonKey(name: 'urlToImage', defaultValue: '')
  final String urlToImage;

  @JsonKey(name: 'publishedAt')
  final String publishedAt;

  factory NewsApiEverythingResponseArticleDTO.fromJson(
          Map<String, dynamic> json) =>
      _$NewsApiEverythingResponseArticleDTOFromJson(json);
}
