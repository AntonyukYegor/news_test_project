import 'package:news_test_project/domain/models/articles_repository_request.dart';
import 'package:news_test_project/domain/models/articles_repository_response.dart';

abstract class ArticlesRepository {
  Future<ArticlesRepositoryResponse> getArticles(
      ArticlesRepositoryRequest request);
}
