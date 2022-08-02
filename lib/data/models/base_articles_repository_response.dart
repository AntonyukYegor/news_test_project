import 'package:news_test_project/domain/models/article.dart';
import 'package:news_test_project/domain/models/articles_repository_response.dart';

class BaseArticlesRepositoryResponse implements ArticlesRepositoryResponse {
  BaseArticlesRepositoryResponse({
    required List<Article> articles,
  }) : _articles = articles;

  BaseArticlesRepositoryResponse.empty() : this(articles: []);

  @override
  List<Article> get articles => _articles;
  final List<Article> _articles;
}
