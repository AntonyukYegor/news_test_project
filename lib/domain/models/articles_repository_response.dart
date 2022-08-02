import 'package:news_test_project/domain/models/article.dart';

abstract class ArticlesRepositoryResponse {
  List<Article> get articles;
}
