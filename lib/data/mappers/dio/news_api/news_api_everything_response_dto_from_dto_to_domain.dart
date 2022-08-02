import 'package:news_test_project/data/dtos/news_api/news_api_everything_response_dto.dart';
import 'package:news_test_project/data/mappers/dio/news_api/news_api_everything_response_article_dto_from_dto_to_domain.dart';
import 'package:news_test_project/data/models/base_articles_repository_response.dart';
import 'package:news_test_project/domain/models/articles_repository_response.dart';

extension NewsApiEverythingResponseDTOFromDTOToDomain
    on NewsApiEverythingResponseDTO {
  ArticlesRepositoryResponse toDomain() {
    return BaseArticlesRepositoryResponse(
      articles: articles
          .map(
            (a) => a.toDomain(),
          )
          .toList(),
    );
  }
}
