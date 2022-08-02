import 'package:news_test_project/data/mappers/dio/news_api/news_api_everything_response_dto_from_dto_to_domain.dart';
import 'package:news_test_project/data/services/news_api/dio_news_api_service.dart';
import 'package:news_test_project/domain/models/articles_repository_request.dart';
import 'package:news_test_project/domain/models/articles_repository_response.dart';
import 'package:news_test_project/domain/repositories/articles_repository.dart';

class DioArticlesRepository implements ArticlesRepository {
  DioArticlesRepository({
    required DioNewsApiService apiService,
  }) : _apiService = apiService;

  final DioNewsApiService _apiService;

  @override
  Future<ArticlesRepositoryResponse> getArticles(
      ArticlesRepositoryRequest request) async {
    final response = await _apiService.searchRepositories(
      searchQuery: request.search,
      publishDate: request.releaseDate,
    );

    return response.toDomain();
  }
}
