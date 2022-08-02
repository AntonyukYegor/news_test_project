import 'package:news_test_project/data/dtos/news_api/news_api_everything_response_article_dto.dart';
import 'package:news_test_project/data/models/base_article.dart';
import 'package:news_test_project/domain/models/article.dart';

extension NewsApiEverythingResponseArticleDTOFromDTOToDomain
    on NewsApiEverythingResponseArticleDTO {
  Article toDomain() {
    return BaseArticle(
      title: title,
      owner: author,
      picture: urlToImage,
      sourceUrl: url,
      releaseDate: DateTime.parse(publishedAt),
    );
  }
}
