import 'package:news_test_project/domain/models/article.dart';
import 'package:news_test_project/presentation/features/details/models/article_details_model.dart';

extension ArticleDomainToArticleDetailsModel on Article {
  ArticleDetailsModel toArticleDetailsModel() {
    return ArticleDetailsModel(
      title: title,
      owner: owner,
      releaseDate: releaseDate,
      picture: picture,
      sourceUrl: sourceUrl,
    );
  }
}
