import 'package:json_annotation/json_annotation.dart';
import 'package:news_test_project/data/dtos/news_api/news_api_everything_response_article_dto.dart';

part 'news_api_everything_response_dto.g.dart';

@JsonSerializable()
class NewsApiEverythingResponseDTO {
  const NewsApiEverythingResponseDTO({
    required this.articles,
  });

  @JsonKey(name: 'articles', defaultValue: [])
  final List<NewsApiEverythingResponseArticleDTO> articles;

  factory NewsApiEverythingResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$NewsApiEverythingResponseDTOFromJson(json);
}
