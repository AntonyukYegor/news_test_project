import 'package:news_test_project/domain/models/article.dart';
import 'package:news_test_project/presentation/features/main/widgets/models/article_card_model.dart';

extension ArticleDomainToArticleCardModel on Article {
  ArticleCardModel toArticleCardModel() {
    return ArticleCardModel(
      title: title,
      owner: owner,
      releaseDate: releaseDate,
    );
  }
}
